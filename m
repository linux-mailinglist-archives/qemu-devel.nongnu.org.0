Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BF3670B37
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:06:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu5Q-0003eK-Sq; Tue, 17 Jan 2023 17:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5J-0003d3-Kn; Tue, 17 Jan 2023 17:05:40 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5F-0006qr-0s; Tue, 17 Jan 2023 17:05:35 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5CF6420E09E3;
 Tue, 17 Jan 2023 14:05:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5CF6420E09E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673993131;
 bh=tOFYsve5o6d8zTAgtdtirQp+zyHt7PERoMWWbpIlYIw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KVFH5fSL8Du2JleVnKPWn+VxA1MEwJd2IhCsf6fLewVMFRKt8wY3bHsevh3HeepEy
 nJ+HUGAdrJSM3L4PyESjIAo280Nn13rJC29tn1diQ8cdZnGuiMgRwcoofPAO04bbnK
 +wfnivom0oKaqxinS4EN8NhIq6iNk0hICv+5PdWw=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 1/4] hw/char/pl011: refactor FIFO depth handling code
Date: Tue, 17 Jan 2023 23:05:20 +0100
Message-Id: <20230117220523.20911-2-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PL011 can be in either of 2 modes depending guest config: FIFO and
single register. The last mode could be viewed as a 1-element-deep FIFO.

Current code open-codes a bunch of depth-dependent logic. Refactor FIFO
depth handling code to isolate calculating current FIFO depth.

One functional (albeit guest-invisible) side-effect of this change is
that previously we would always increment s->read_pos in UARTDR read
handler even if FIFO was disabled, now we are limiting read_pos to not
exceed FIFO depth (read_pos itself is reset to 0 if user disables FIFO).

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 hw/char/pl011.c         | 25 +++++++++++++------------
 include/hw/char/pl011.h |  5 ++++-
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c076813423..329cc6926d 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -81,6 +81,12 @@ static void pl011_update(PL011State *s)
     }
 }
 
+static inline unsigned pl011_get_fifo_depth(PL011State *s)
+{
+    /* Note: FIFO depth is expected to be power-of-2 */
+    return s->lcr & 0x10 ? PL011_FIFO_DEPTH : 1;
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -94,8 +100,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
         c = s->read_fifo[s->read_pos];
         if (s->read_count > 0) {
             s->read_count--;
-            if (++s->read_pos == 16)
-                s->read_pos = 0;
+            s->read_pos = (s->read_pos + 1) & (pl011_get_fifo_depth(s) - 1);
         }
         if (s->read_count == 0) {
             s->flags |= PL011_FLAG_RXFE;
@@ -273,11 +278,7 @@ static int pl011_can_receive(void *opaque)
     PL011State *s = (PL011State *)opaque;
     int r;
 
-    if (s->lcr & 0x10) {
-        r = s->read_count < 16;
-    } else {
-        r = s->read_count < 1;
-    }
+    r = s->read_count < pl011_get_fifo_depth(s);
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
@@ -286,15 +287,15 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
 {
     PL011State *s = (PL011State *)opaque;
     int slot;
+    unsigned pipe_depth;
 
-    slot = s->read_pos + s->read_count;
-    if (slot >= 16)
-        slot -= 16;
+    pipe_depth = pl011_get_fifo_depth(s);
+    slot = (s->read_pos + s->read_count) & (pipe_depth - 1);
     s->read_fifo[slot] = value;
     s->read_count++;
     s->flags &= ~PL011_FLAG_RXFE;
     trace_pl011_put_fifo(value, s->read_count);
-    if (!(s->lcr & 0x10) || s->read_count == 16) {
+    if (s->read_count == pipe_depth) {
         trace_pl011_put_fifo_full();
         s->flags |= PL011_FLAG_RXFF;
     }
@@ -359,7 +360,7 @@ static const VMStateDescription vmstate_pl011 = {
         VMSTATE_UINT32(dmacr, PL011State),
         VMSTATE_UINT32(int_enabled, PL011State),
         VMSTATE_UINT32(int_level, PL011State),
-        VMSTATE_UINT32_ARRAY(read_fifo, PL011State, 16),
+        VMSTATE_UINT32_ARRAY(read_fifo, PL011State, PL011_FIFO_DEPTH),
         VMSTATE_UINT32(ilpr, PL011State),
         VMSTATE_UINT32(ibrd, PL011State),
         VMSTATE_UINT32(fbrd, PL011State),
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index dc2c90eedc..926322e242 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -27,6 +27,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PL011State, PL011)
 /* This shares the same struct (and cast macro) as the base pl011 device */
 #define TYPE_PL011_LUMINARY "pl011_luminary"
 
+/* Depth of UART FIFO in bytes, when FIFO mode is enabled (else depth == 1) */
+#define PL011_FIFO_DEPTH 16
+
 struct PL011State {
     SysBusDevice parent_obj;
 
@@ -39,7 +42,7 @@ struct PL011State {
     uint32_t dmacr;
     uint32_t int_enabled;
     uint32_t int_level;
-    uint32_t read_fifo[16];
+    uint32_t read_fifo[PL011_FIFO_DEPTH];
     uint32_t ilpr;
     uint32_t ibrd;
     uint32_t fbrd;
-- 
2.34.1


