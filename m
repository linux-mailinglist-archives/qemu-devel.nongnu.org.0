Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDFE669BE4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:24:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnN-0001cM-Uz; Fri, 13 Jan 2023 09:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmo-00015G-SM
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:03 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmi-0003pc-9a
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:02 -0500
Received: by mail-wm1-x329.google.com with SMTP id q8so3554853wmo.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/mW9HpUCcthbdZB5sduQCQbBVJGhP4Uz6vBQL11RdbI=;
 b=Yw4+/brWLhLOxfgnWOzK6mRmONYVvehTRbNejznMQ2ixGfLS1wjK0OSCx4UHeum7Pc
 z3R6pJoufLqcqfoEttNpgh4BH5/EXFr2sewoMSs6opFWbkTAF3tdqKsbhsCUGlzJP+LZ
 nIqMKO/09XUiqFZpSe9rGDC4RhktGUbic6j++dM43701Vsu8kEu6ZSOIi3uCiGucEq9l
 xlqwdHwoGzjuemBF4ah0q3phzEXXkV+jdmvTcV2jtO5jQWHgb4SFY0mdoRVy0V/XWdzX
 5YT1Ix4qQQXPa5Y0r2GFljd9Yy0jTJzVpPM3zUW5rJB7GOPDjwPrhnqWUeoRtMkzCgEr
 3YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/mW9HpUCcthbdZB5sduQCQbBVJGhP4Uz6vBQL11RdbI=;
 b=BW52SSGoobL3K4b1OaaeU26W4dgYmY5260hfvRSWtRt9xaSU4QdozLs0c8t1sfsk+K
 phzLGgXhSAxZIvyoAUI1BGMRvzB8quhiL0lH0I0FamundYASlVJyZv9B6i8E4w1sPwtg
 Ma4FwBzXXDy8UWvrGksJwkvzGmNqdsKnYpVPCCtqRjAsDxI0UrkmVnphYFo2OMBQnG4b
 WXFBqRUOp0bxHoNfAobJofiYOSbSXCNy4AA1zx2Dul3rtMOMdla8md+Vcv67OGwgNNWG
 KQplbgKsZlPfn16Cyg/XoHTHmW2ko8l+AwiCxFNTwYIps09sQbEK0/IWRHHzh0rCVEgA
 8YfA==
X-Gm-Message-State: AFqh2kr/RkwthemnqXey/vd5m2P3pM3tUIi3uBc5ux8ymSw6RZFJ2jxH
 kCgvar9uUGB2eR2wyH2zOvxYWS0WidzqXSFv
X-Google-Smtp-Source: AMrXdXv8Ckt6zzIV6MFCm31InvK4LPiUKKQ0fwftar45/zilXueZZogPchrx3PDIzIQ4MMcdtzVVcQ==
X-Received: by 2002:a05:600c:3502:b0:3d9:e75c:756c with SMTP id
 h2-20020a05600c350200b003d9e75c756cmr18961254wmq.12.1673619114528; 
 Fri, 13 Jan 2023 06:11:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/38] hw/arm/stellaris: Use CamelCase for STELLARIS_ADC type
 name
Date: Fri, 13 Jan 2023 14:11:19 +0000
Message-Id: <20230113141126.535646-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Following docs/devel/style.rst guidelines, rename
stellaris_adc_state -> StellarisADCState. This also remove a
use of 'struct' in the DECLARE_INSTANCE_CHECKER() macro call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109140306.23161-9-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 73 +++++++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 051c242e9d6..67a2293d35f 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -674,9 +674,8 @@ static void stellaris_i2c_init(Object *obj)
 #define STELLARIS_ADC_FIFO_FULL     0x1000
 
 #define TYPE_STELLARIS_ADC "stellaris-adc"
-typedef struct StellarisADCState stellaris_adc_state;
-DECLARE_INSTANCE_CHECKER(stellaris_adc_state, STELLARIS_ADC,
-                         TYPE_STELLARIS_ADC)
+typedef struct StellarisADCState StellarisADCState;
+DECLARE_INSTANCE_CHECKER(StellarisADCState, STELLARIS_ADC, TYPE_STELLARIS_ADC)
 
 struct StellarisADCState {
     SysBusDevice parent_obj;
@@ -700,7 +699,7 @@ struct StellarisADCState {
     qemu_irq irq[4];
 };
 
-static uint32_t stellaris_adc_fifo_read(stellaris_adc_state *s, int n)
+static uint32_t stellaris_adc_fifo_read(StellarisADCState *s, int n)
 {
     int tail;
 
@@ -716,7 +715,7 @@ static uint32_t stellaris_adc_fifo_read(stellaris_adc_state *s, int n)
     return s->fifo[n].data[tail];
 }
 
-static void stellaris_adc_fifo_write(stellaris_adc_state *s, int n,
+static void stellaris_adc_fifo_write(StellarisADCState *s, int n,
                                      uint32_t value)
 {
     int head;
@@ -736,7 +735,7 @@ static void stellaris_adc_fifo_write(stellaris_adc_state *s, int n,
         s->fifo[n].state |= STELLARIS_ADC_FIFO_FULL;
 }
 
-static void stellaris_adc_update(stellaris_adc_state *s)
+static void stellaris_adc_update(StellarisADCState *s)
 {
     int level;
     int n;
@@ -749,7 +748,7 @@ static void stellaris_adc_update(stellaris_adc_state *s)
 
 static void stellaris_adc_trigger(void *opaque, int irq, int level)
 {
-    stellaris_adc_state *s = opaque;
+    StellarisADCState *s = opaque;
     int n;
 
     for (n = 0; n < 4; n++) {
@@ -771,7 +770,7 @@ static void stellaris_adc_trigger(void *opaque, int irq, int level)
     }
 }
 
-static void stellaris_adc_reset(stellaris_adc_state *s)
+static void stellaris_adc_reset(StellarisADCState *s)
 {
     int n;
 
@@ -785,7 +784,7 @@ static void stellaris_adc_reset(stellaris_adc_state *s)
 static uint64_t stellaris_adc_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
-    stellaris_adc_state *s = opaque;
+    StellarisADCState *s = opaque;
 
     /* TODO: Implement this.  */
     if (offset >= 0x40 && offset < 0xc0) {
@@ -833,7 +832,7 @@ static uint64_t stellaris_adc_read(void *opaque, hwaddr offset,
 static void stellaris_adc_write(void *opaque, hwaddr offset,
                                 uint64_t value, unsigned size)
 {
-    stellaris_adc_state *s = opaque;
+    StellarisADCState *s = opaque;
 
     /* TODO: Implement this.  */
     if (offset >= 0x40 && offset < 0xc0) {
@@ -901,31 +900,31 @@ static const VMStateDescription vmstate_stellaris_adc = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32(actss, stellaris_adc_state),
-        VMSTATE_UINT32(ris, stellaris_adc_state),
-        VMSTATE_UINT32(im, stellaris_adc_state),
-        VMSTATE_UINT32(emux, stellaris_adc_state),
-        VMSTATE_UINT32(ostat, stellaris_adc_state),
-        VMSTATE_UINT32(ustat, stellaris_adc_state),
-        VMSTATE_UINT32(sspri, stellaris_adc_state),
-        VMSTATE_UINT32(sac, stellaris_adc_state),
-        VMSTATE_UINT32(fifo[0].state, stellaris_adc_state),
-        VMSTATE_UINT32_ARRAY(fifo[0].data, stellaris_adc_state, 16),
-        VMSTATE_UINT32(ssmux[0], stellaris_adc_state),
-        VMSTATE_UINT32(ssctl[0], stellaris_adc_state),
-        VMSTATE_UINT32(fifo[1].state, stellaris_adc_state),
-        VMSTATE_UINT32_ARRAY(fifo[1].data, stellaris_adc_state, 16),
-        VMSTATE_UINT32(ssmux[1], stellaris_adc_state),
-        VMSTATE_UINT32(ssctl[1], stellaris_adc_state),
-        VMSTATE_UINT32(fifo[2].state, stellaris_adc_state),
-        VMSTATE_UINT32_ARRAY(fifo[2].data, stellaris_adc_state, 16),
-        VMSTATE_UINT32(ssmux[2], stellaris_adc_state),
-        VMSTATE_UINT32(ssctl[2], stellaris_adc_state),
-        VMSTATE_UINT32(fifo[3].state, stellaris_adc_state),
-        VMSTATE_UINT32_ARRAY(fifo[3].data, stellaris_adc_state, 16),
-        VMSTATE_UINT32(ssmux[3], stellaris_adc_state),
-        VMSTATE_UINT32(ssctl[3], stellaris_adc_state),
-        VMSTATE_UINT32(noise, stellaris_adc_state),
+        VMSTATE_UINT32(actss, StellarisADCState),
+        VMSTATE_UINT32(ris, StellarisADCState),
+        VMSTATE_UINT32(im, StellarisADCState),
+        VMSTATE_UINT32(emux, StellarisADCState),
+        VMSTATE_UINT32(ostat, StellarisADCState),
+        VMSTATE_UINT32(ustat, StellarisADCState),
+        VMSTATE_UINT32(sspri, StellarisADCState),
+        VMSTATE_UINT32(sac, StellarisADCState),
+        VMSTATE_UINT32(fifo[0].state, StellarisADCState),
+        VMSTATE_UINT32_ARRAY(fifo[0].data, StellarisADCState, 16),
+        VMSTATE_UINT32(ssmux[0], StellarisADCState),
+        VMSTATE_UINT32(ssctl[0], StellarisADCState),
+        VMSTATE_UINT32(fifo[1].state, StellarisADCState),
+        VMSTATE_UINT32_ARRAY(fifo[1].data, StellarisADCState, 16),
+        VMSTATE_UINT32(ssmux[1], StellarisADCState),
+        VMSTATE_UINT32(ssctl[1], StellarisADCState),
+        VMSTATE_UINT32(fifo[2].state, StellarisADCState),
+        VMSTATE_UINT32_ARRAY(fifo[2].data, StellarisADCState, 16),
+        VMSTATE_UINT32(ssmux[2], StellarisADCState),
+        VMSTATE_UINT32(ssctl[2], StellarisADCState),
+        VMSTATE_UINT32(fifo[3].state, StellarisADCState),
+        VMSTATE_UINT32_ARRAY(fifo[3].data, StellarisADCState, 16),
+        VMSTATE_UINT32(ssmux[3], StellarisADCState),
+        VMSTATE_UINT32(ssctl[3], StellarisADCState),
+        VMSTATE_UINT32(noise, StellarisADCState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -933,7 +932,7 @@ static const VMStateDescription vmstate_stellaris_adc = {
 static void stellaris_adc_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-    stellaris_adc_state *s = STELLARIS_ADC(obj);
+    StellarisADCState *s = STELLARIS_ADC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     int n;
 
@@ -1381,7 +1380,7 @@ static void stellaris_adc_class_init(ObjectClass *klass, void *data)
 static const TypeInfo stellaris_adc_info = {
     .name          = TYPE_STELLARIS_ADC,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(stellaris_adc_state),
+    .instance_size = sizeof(StellarisADCState),
     .instance_init = stellaris_adc_init,
     .class_init    = stellaris_adc_class_init,
 };
-- 
2.34.1


