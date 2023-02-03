Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF78C689BA3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4V-0006fM-Gg; Fri, 03 Feb 2023 09:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4J-0006d3-DC
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:35 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4H-000545-DM
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:34 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so4002262wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dl2CfwC4j/0AnqvEmuWD2f4Vi2U4yq85CQrdrzm1Em8=;
 b=p59wWQO866sLgxt/UIMwhf6fFMGO5jiMxdiazwnw5dhkgM9wQy/uTcjDvtA7zF38mn
 s6osZszOW5nrHr7Zz3j9dLRwVOW7puO5IGlfM3ycF15osziz7GvAZBqZMdVI3MQv4IVM
 CNJ6ajYjZtjKeHKNcIpEIOvx3lI86baz1ei8e4OWzToviMtonevA5FzGl+LLQMGFUqyy
 /eXP1aIG/O4hVDk936rHDmoJxgCqHvqLgtA4wuDnglFdGj0FIMefhxlMx+0KQRN2guYx
 NNWeoxH/m/gptdm/eVvM4egHOOVEDZCJlGFFG9EaIHvzyfy9XsBUipcz5c+JQS4CiDfX
 W2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dl2CfwC4j/0AnqvEmuWD2f4Vi2U4yq85CQrdrzm1Em8=;
 b=gOk+nDVzNoIi2HWzIbQrKt1GwgWeUN2mdyPiOuaFwuyvUMrp2YNF4qJW14XvmhwfYM
 e9pmuNwOci4pfsBo98OxGCxX+zPgCiweVuzk7cs1Fggd+f0lqzUFOEhaHfDhI8/djcNu
 2zhsYzLxoFU/hDMKI1ITJ0UAeGh8uWAp9et9IApzcq62z54qxWNpZE1v2OnJUoiaJTPT
 CGaKoqAIZ+GYaT3PI4DAicrL8rTdOEsnhkF4j9aQl2/esQ9/hoL+1zNO69NqFz+O0Ls1
 o0AkB4aB0yeHsfL4u4oVwP2m8ofGy+9dgmlbJTHbDiKzIftHaTtmtKF5wvgSzu5yi5Nf
 tjMA==
X-Gm-Message-State: AO0yUKUwhH76CQR3IcJIhiH2zull0trcHZon21CPPDV3WT/FW/dE/wCB
 yDOoy6fDGfgPc5iIZQN0tnA1Oas0ZtlHUyvG
X-Google-Smtp-Source: AK7set99Rdub/uTII9i3qlvnqSCQeBYJPGcfI10t+5TCalEDrIr93zc+x3HTO85mwEOFtpKLSpxEcg==
X-Received: by 2002:a05:600c:4447:b0:3d8:e0d3:ee24 with SMTP id
 v7-20020a05600c444700b003d8e0d3ee24mr12219695wmn.37.1675434571825; 
 Fri, 03 Feb 2023 06:29:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/33] hw/char/pl011: refactor FIFO depth handling code
Date: Fri,  3 Feb 2023 14:28:57 +0000
Message-Id: <20230203142927.834793-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>

PL011 can be in either of 2 modes depending guest config: FIFO and
single register. The last mode could be viewed as a 1-element-deep FIFO.

Current code open-codes a bunch of depth-dependent logic. Refactor FIFO
depth handling code to isolate calculating current FIFO depth.

One functional (albeit guest-invisible) side-effect of this change is
that previously we would always increment s->read_pos in UARTDR read
handler even if FIFO was disabled, now we are limiting read_pos to not
exceed FIFO depth (read_pos itself is reset to 0 if user disables FIFO).

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230123162304.26254-2-eiakovlev@linux.microsoft.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/pl011.h |  5 ++++-
 hw/char/pl011.c         | 30 ++++++++++++++++++------------
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index dc2c90eedca..926322e242d 100644
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
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c076813423f..3fa3b75d042 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -81,6 +81,17 @@ static void pl011_update(PL011State *s)
     }
 }
 
+static bool pl011_is_fifo_enabled(PL011State *s)
+{
+    return (s->lcr & 0x10) != 0;
+}
+
+static inline unsigned pl011_get_fifo_depth(PL011State *s)
+{
+    /* Note: FIFO depth is expected to be power-of-2 */
+    return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -94,8 +105,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
         c = s->read_fifo[s->read_pos];
         if (s->read_count > 0) {
             s->read_count--;
-            if (++s->read_pos == 16)
-                s->read_pos = 0;
+            s->read_pos = (s->read_pos + 1) & (pl011_get_fifo_depth(s) - 1);
         }
         if (s->read_count == 0) {
             s->flags |= PL011_FLAG_RXFE;
@@ -273,11 +283,7 @@ static int pl011_can_receive(void *opaque)
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
@@ -286,15 +292,15 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
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
@@ -359,7 +365,7 @@ static const VMStateDescription vmstate_pl011 = {
         VMSTATE_UINT32(dmacr, PL011State),
         VMSTATE_UINT32(int_enabled, PL011State),
         VMSTATE_UINT32(int_level, PL011State),
-        VMSTATE_UINT32_ARRAY(read_fifo, PL011State, 16),
+        VMSTATE_UINT32_ARRAY(read_fifo, PL011State, PL011_FIFO_DEPTH),
         VMSTATE_UINT32(ilpr, PL011State),
         VMSTATE_UINT32(ibrd, PL011State),
         VMSTATE_UINT32(fbrd, PL011State),
-- 
2.34.1


