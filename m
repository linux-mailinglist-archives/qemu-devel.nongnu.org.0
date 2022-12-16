Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B798E64F3BF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:10:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU4-000613-0H; Fri, 16 Dec 2022 16:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITs-0005wc-Ly
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:05 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITp-0000cM-Dn
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:00 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 o5-20020a05600c510500b003d21f02fbaaso4980547wms.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=21r9CxWzALIMyBFcFfX8uwReEH2XuTI7G3xkkaCFq6A=;
 b=crP/TfttSK1H9ClAZxV2e+sRHm+opVPbaC/rcihlXWVYIPxl/bblQDGQ3rgiG12Soa
 dc4U17rO2ch32duTgbBJSoCEpfhEg+9h1EuXsZDP4JLEfyfrz+KwBQwDpyX5/5ZHoGUS
 iSchmil9dzQaPF7xSfgfg0lNJB/9jxCGMGndY/WmpF0XMrGMyy8MI7w7yaXkR4GgANLJ
 D6fIiOs/fpDVGkr/R0N4cIC7GVDvN71WPQ9TzwQZGwLUJaNy+PFtC4Bv+55Ekan0rQrl
 vTKdGmUFfTH5A5k0BXEM3RQATQyPw0dOBUALFs4CTxEcBtRmEWxoFZOzwZ4CB49xhRIS
 a90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21r9CxWzALIMyBFcFfX8uwReEH2XuTI7G3xkkaCFq6A=;
 b=5mnhMycq+zlVEoyO0RrFgFcttKTXwfpNPLB+WsagXe2+qB3BcgVt/+aY2Jdkknh9I0
 4yCvOTE7zyz8jbbiQSQhZ/SNrIdwjja9g1NzsTr106t3eMC/SfUdWrmWrbLDcY5eB25h
 bXdYfBndPoNU9puSsFfVqqezl3RA3h6nsqmqhAAxprNjrBaqwrW4osywlZGqWAs2TD7B
 wT32Foy4pNAyIk8hoCjTVdqFhJVED5U8zDV2sXEO1Q1umDNpJl0ojqc6zlQXNqI9G4W5
 abE9diIkUnq5dfZlp8zfzuF1l4y0LlDLswmKY9XPaskFXCTsipAekw/UwLVehtqNd6RB
 5qGQ==
X-Gm-Message-State: ANoB5pklbEx6rWqD8ZHNF2ZZdnVLLvm2jmP0jTGVF/QQiAwRYUThLVR3
 40nZcpqrICQNNy0q23I1w+q+MBYm2ccm6aH8
X-Google-Smtp-Source: AA0mqf4IW9GwYIgVb/XUH0a9dAJC9BghPIODPxcMktZrVLRujTksFkRKgCp3tybdUaDJS1LF6eDQ9Q==
X-Received: by 2002:a05:600c:3b8e:b0:3cf:d428:21d6 with SMTP id
 n14-20020a05600c3b8e00b003cfd42821d6mr27388700wms.3.1671226975217; 
 Fri, 16 Dec 2022 13:42:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/36] hw/misc: Convert TYPE_MOS6522 subclasses to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:18 +0000
Message-Id: <20221216214244.1391647-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Convert the various subclasses of TYPE_MOS6522 to 3-phase reset.
This removes some uses of device_class_set_parent_reset(), which we
would eventually like to be able to get rid of.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221110143459.3833425-3-peter.maydell@linaro.org
---
 include/hw/misc/mos6522.h |  2 +-
 hw/misc/mac_via.c         | 26 ++++++++++++++++----------
 hw/misc/macio/cuda.c      | 14 ++++++++------
 hw/misc/macio/pmu.c       | 14 ++++++++------
 4 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index 0bc22a83957..05872fffc92 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -157,7 +157,7 @@ OBJECT_DECLARE_TYPE(MOS6522State, MOS6522DeviceClass, MOS6522)
 struct MOS6522DeviceClass {
     DeviceClass parent_class;
 
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
     void (*portB_write)(MOS6522State *dev);
     void (*portA_write)(MOS6522State *dev);
     /* These are used to influence the CUDA MacOS timebase calibration */
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index f42c12755a9..076d18e5fd9 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -975,14 +975,16 @@ static int via1_post_load(void *opaque, int version_id)
 }
 
 /* VIA 1 */
-static void mos6522_q800_via1_reset(DeviceState *dev)
+static void mos6522_q800_via1_reset_hold(Object *obj)
 {
-    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(dev);
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(obj);
     MOS6522State *ms = MOS6522(v1s);
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(ms);
     ADBBusState *adb_bus = &v1s->adb_bus;
 
-    mdc->parent_reset(dev);
+    if (mdc->parent_phases.hold) {
+        mdc->parent_phases.hold(obj);
+    }
 
     ms->timers[0].frequency = VIA_TIMER_FREQ;
     ms->timers[1].frequency = VIA_TIMER_FREQ;
@@ -1097,11 +1099,12 @@ static Property mos6522_q800_via1_properties[] = {
 static void mos6522_q800_via1_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
     MOS6522DeviceClass *mdc = MOS6522_CLASS(oc);
 
     dc->realize = mos6522_q800_via1_realize;
-    device_class_set_parent_reset(dc, mos6522_q800_via1_reset,
-                                  &mdc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, mos6522_q800_via1_reset_hold,
+                                       NULL, &mdc->parent_phases);
     dc->vmsd = &vmstate_q800_via1;
     device_class_set_props(dc, mos6522_q800_via1_properties);
 }
@@ -1123,12 +1126,14 @@ static void mos6522_q800_via2_portB_write(MOS6522State *s)
     }
 }
 
-static void mos6522_q800_via2_reset(DeviceState *dev)
+static void mos6522_q800_via2_reset_hold(Object *obj)
 {
-    MOS6522State *ms = MOS6522(dev);
+    MOS6522State *ms = MOS6522(obj);
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(ms);
 
-    mdc->parent_reset(dev);
+    if (mdc->parent_phases.hold) {
+        mdc->parent_phases.hold(obj);
+    }
 
     ms->timers[0].frequency = VIA_TIMER_FREQ;
     ms->timers[1].frequency = VIA_TIMER_FREQ;
@@ -1183,10 +1188,11 @@ static const VMStateDescription vmstate_q800_via2 = {
 static void mos6522_q800_via2_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
     MOS6522DeviceClass *mdc = MOS6522_CLASS(oc);
 
-    device_class_set_parent_reset(dc, mos6522_q800_via2_reset,
-                                  &mdc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, mos6522_q800_via2_reset_hold,
+                                       NULL, &mdc->parent_phases);
     dc->vmsd = &vmstate_q800_via2;
     mdc->portB_write = mos6522_q800_via2_portB_write;
 }
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index 0d4c13319a8..853e88bfedd 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -589,12 +589,14 @@ static void mos6522_cuda_portB_write(MOS6522State *s)
     cuda_update(cs);
 }
 
-static void mos6522_cuda_reset(DeviceState *dev)
+static void mos6522_cuda_reset_hold(Object *obj)
 {
-    MOS6522State *ms = MOS6522(dev);
+    MOS6522State *ms = MOS6522(obj);
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(ms);
 
-    mdc->parent_reset(dev);
+    if (mdc->parent_phases.hold) {
+        mdc->parent_phases.hold(obj);
+    }
 
     ms->timers[0].frequency = CUDA_TIMER_FREQ;
     ms->timers[1].frequency = (SCALE_US * 6000) / 4700;
@@ -602,11 +604,11 @@ static void mos6522_cuda_reset(DeviceState *dev)
 
 static void mos6522_cuda_class_init(ObjectClass *oc, void *data)
 {
-    DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
     MOS6522DeviceClass *mdc = MOS6522_CLASS(oc);
 
-    device_class_set_parent_reset(dc, mos6522_cuda_reset,
-                                  &mdc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, mos6522_cuda_reset_hold,
+                                       NULL, &mdc->parent_phases);
     mdc->portB_write = mos6522_cuda_portB_write;
     mdc->get_timer1_counter_value = cuda_get_counter_value;
     mdc->get_timer2_counter_value = cuda_get_counter_value;
diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index 70562ed8d07..97ef8c771b6 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -797,14 +797,16 @@ static void mos6522_pmu_portB_write(MOS6522State *s)
     pmu_update(ps);
 }
 
-static void mos6522_pmu_reset(DeviceState *dev)
+static void mos6522_pmu_reset_hold(Object *obj)
 {
-    MOS6522State *ms = MOS6522(dev);
+    MOS6522State *ms = MOS6522(obj);
     MOS6522PMUState *mps = container_of(ms, MOS6522PMUState, parent_obj);
     PMUState *s = container_of(mps, PMUState, mos6522_pmu);
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(ms);
 
-    mdc->parent_reset(dev);
+    if (mdc->parent_phases.hold) {
+        mdc->parent_phases.hold(obj);
+    }
 
     ms->timers[0].frequency = VIA_TIMER_FREQ;
     ms->timers[1].frequency = (SCALE_US * 6000) / 4700;
@@ -814,11 +816,11 @@ static void mos6522_pmu_reset(DeviceState *dev)
 
 static void mos6522_pmu_class_init(ObjectClass *oc, void *data)
 {
-    DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
     MOS6522DeviceClass *mdc = MOS6522_CLASS(oc);
 
-    device_class_set_parent_reset(dc, mos6522_pmu_reset,
-                                  &mdc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, mos6522_pmu_reset_hold,
+                                       NULL, &mdc->parent_phases);
     mdc->portB_write = mos6522_pmu_portB_write;
 }
 
-- 
2.25.1


