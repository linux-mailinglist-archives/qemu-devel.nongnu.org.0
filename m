Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C41662820
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:11:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEskn-0001iX-ER; Mon, 09 Jan 2023 09:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEski-0001hO-6P
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:55 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskg-0006Uw-3I
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:51 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so9096466wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=at2rPrXos7OhXzrKy6FKQhkvRO9+YPfQmyazxY/f4vY=;
 b=YbMvkcbzDvBLuVCKjauNTN6m4KvgJHiESOqYR/LwgEt1KCh/FbhXTzJVGg83WuQ7U5
 CHGHbflZu7s4OgUis42rH2C2G/W/+Bv3KYw2tmV1qQHWIVL2bhSIIo1kwPshVGBi0GHq
 Y98Mhh0LOSzYjsWQrloHQxKV9WAQ0gR8wfQbGw2xVREbfGXSOpmF5poSnduLEtipSCCx
 xvpZcpAdZXMPW8HUgRgs0ahNsjnBFAh16pSXiPDojDjuFaHe/frGgw1Bzh1sulDnM6jf
 O6QARHLXgrBITxcXR02xTW6Qry/3uFyF4zhpGwsGGf/XwU2dSGEHUGm+x3POXZMkI0rb
 gOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=at2rPrXos7OhXzrKy6FKQhkvRO9+YPfQmyazxY/f4vY=;
 b=plzK4+t8gLdGevGKJPsb8KD7H6YLn6h5TZiEa5gJ6eigVTj8cKWa28RzEoSvjLwVlF
 ADqt/R9s6lPqO6kyEqsIDtJ7D6h52Vg+Z2CmFGpzl2ZL4E4Lp+XFD9B2MKR53jzot/OT
 tvsRSTjGxZ5etMQbMad1SOZQ6GmvCuD6iXEPMQdgb7IrHnp5bElnqhLfPGlavsYTX+Oc
 YzF5tsFb4frkSP0jX91iz/eokp8smN4Mrne5H8OVxCPNp7I421cVHy4TW1mhqQ7eqvOi
 UmTWu6PUXBCOeIiuL4tb93q/Df4HILMWEmbJOGZK39DgqDCPg5/v0/dqslGawGDoNQUw
 VdFg==
X-Gm-Message-State: AFqh2konKRAFrMfjd2GmctTO8uvfQ9C6Tdupv5Q9z5yoQoEgta2R3lvb
 lPbkQIv0NyKQNQ6vrz+fWOjd9zcdi0MEd5zC
X-Google-Smtp-Source: AMrXdXugVTj9YZ1HLJWPFNUjuH3efWCsehWBPuN5W5emedICa/QO9JbNTL+M0swzEu3AL3abNRWqtQ==
X-Received: by 2002:a05:600c:34ce:b0:3cf:614e:b587 with SMTP id
 d14-20020a05600c34ce00b003cf614eb587mr49711410wmq.26.1673273028431; 
 Mon, 09 Jan 2023 06:03:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003cfd4e6400csm12332793wmo.19.2023.01.09.06.03.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 08/14] hw/arm/stellaris: Use CamelCase for STELLARIS_ADC type
 name
Date: Mon,  9 Jan 2023 15:03:00 +0100
Message-Id: <20230109140306.23161-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Following docs/devel/style.rst guidelines, rename
stellaris_adc_state -> StellarisADCState. This also remove a
use of 'struct' in the DECLARE_INSTANCE_CHECKER() macro call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 73 +++++++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 051c242e9d..67a2293d35 100644
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
2.38.1


