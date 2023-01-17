Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F330E670B31
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:06:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu5Q-0003eJ-VE; Tue, 17 Jan 2023 17:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5K-0003d4-Be; Tue, 17 Jan 2023 17:05:40 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5H-0006sY-1R; Tue, 17 Jan 2023 17:05:37 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id E7C0420E09E5;
 Tue, 17 Jan 2023 14:05:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E7C0420E09E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673993133;
 bh=9TKsC6maeKp1zioEdXA9ySTOmT+xAgkJ3WU17vpuzeo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pEMhK14xP8LBx4sIozuD4Ek44Qc5tNjiR2g0KQSEMUSEiOJoHnnkpik8qJ7kXRVZS
 33N8ai23b4CwC25o9zVTf21lrfde9RS2zPor0f9+3/vpW2x7HcmVM0byQ6vYBUxS/F
 D2qrk5mrQpWCBMVJguiVL4knBLsbTOVqu7N1nlb8=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 3/4] hw/char/pl011: better handling of FIFO flags on LCR
 reset
Date: Tue, 17 Jan 2023 23:05:22 +0100
Message-Id: <20230117220523.20911-4-eiakovlev@linux.microsoft.com>
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

Current FIFO handling code does not reset RXFE/RXFF flags when guest
resets FIFO by writing to UARTLCR register, although internal FIFO state
is reset to 0 read count. Actual guest-visible flag update will happen
only on next data read or write attempt. As a result of that any guest
that expects RXFE flag to be set (and RXFF to be cleared) after resetting
FIFO will never see that happen.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 hw/char/pl011.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 404d52a3b8..3184949d69 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -87,6 +87,13 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
     return s->lcr & 0x10 ? PL011_FIFO_DEPTH : 1;
 }
 
+static inline void pl011_reset_pipe(PL011State *s)
+{
+    s->read_count = 0;
+    s->read_pos = 0;
+    s->flags = PL011_FLAG_RXFE | PL011_FLAG_TXFE;
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -234,8 +241,7 @@ static void pl011_write(void *opaque, hwaddr offset,
     case 11: /* UARTLCR_H */
         /* Reset the FIFO state on FIFO enable or disable */
         if ((s->lcr ^ value) & 0x10) {
-            s->read_count = 0;
-            s->read_pos = 0;
+            pl011_reset_pipe(s);
         }
         if ((s->lcr ^ value) & 0x1) {
             int break_enable = value & 0x1;
@@ -421,12 +427,10 @@ static void pl011_reset(DeviceState *dev)
     s->ilpr = 0;
     s->ibrd = 0;
     s->fbrd = 0;
-    s->read_pos = 0;
-    s->read_count = 0;
     s->read_trigger = 1;
     s->ifl = 0x12;
     s->cr = 0x300;
-    s->flags = 0x90;
+    pl011_reset_pipe(s);
 
     for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
         qemu_irq_lower(s->irq[i]);
-- 
2.34.1


