Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889AA624474
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 15:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot8eM-0001Pq-04; Thu, 10 Nov 2022 09:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot8eG-0001PV-Pm
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:35:20 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot8e2-0003eh-VA
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:35:13 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso1260039wmp.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 06:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8C8vvEsGnHci6G0b2uCW9lNCRb924RsDFkFCBVRQ1RY=;
 b=lI78HYzzzWEsW9dgC/GSFMnjSvdiXrOXceeqwoYy3zqGPXxqzGrL/bhePN16VBdoOx
 t2bvz5EPvIk8DH1acedXQE9bIXHKSIXERoZiQ58jBwv4IiJRVWLj953PQOuMP8x5h5VA
 sCRMbcCuCA6P68EmI/Pi1+9+tRGUtgEJy/9bq71Rd02+qQXfH4PPkufG9JPzIF6oRV1b
 nOwbMP2gmWUkd85ssK0Cf8g9N+NB+MXgbumjHLoTeEItzUxT4MpdsSNwBH6qNFySncya
 vBPNJUGDvCRYJ5ncfH6b4Tk1seZsOa0vXuj0KLQDmtql83ji3/R1NiZdiuKihr2WlKRK
 8ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8C8vvEsGnHci6G0b2uCW9lNCRb924RsDFkFCBVRQ1RY=;
 b=Y5VGzHHkgMDpBVWs3r1mQMCb+ZxzZZKdbM8Iz1sDN0euDDkCPcKWPidtawv97297Ze
 K/HizH346qdQgUf8+UGMQo+xDwbj9zzlKb1EyWcnbG60Y0s9jywqF/nzUTiPLQg29DtQ
 6ZGNHbP6g743MdWpJ4MJMmWFmpWyRuDodMER1tl7aBc+niOwxC2A5wZ4r04/sp1rYrg7
 1KChEbXS74Hu5moYjeQ7cMoFIl4ghw6m7LLe6wDp/iwImmRciGZ6WQW+ay/zpc31te2d
 xV8Rj3+DzipHcK8RVVdst2ANjblJ1nEUH6/yS4Qwdx3lr37ZFWQqckI8bfoV1OIPZw8L
 FWxw==
X-Gm-Message-State: ANoB5pmQfil4zw8EMjhTHnbNXgEd3Z3eHBQSV/1Qyg5S/y7thhNI/JWU
 IvIOGTWxHKTCQfHf2rbztsPGjL5dGOokxA==
X-Google-Smtp-Source: AA0mqf6aDCBC76EsLIGd7okDwFKmeK+P/nJi9431/upEUeNqXJkmDUwudS69URQqF8pR+jHogGM33w==
X-Received: by 2002:a7b:c301:0:b0:3cf:a85d:2ab2 with SMTP id
 k1-20020a7bc301000000b003cfa85d2ab2mr624253wmj.43.1668090905027; 
 Thu, 10 Nov 2022 06:35:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bq21-20020a5d5a15000000b00231ed902a4esm16666803wrb.5.2022.11.10.06.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 06:35:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH for-8.0 2/2] hw/misc: Convert TYPE_MOS6522 subclasses to
 3-phase reset
Date: Thu, 10 Nov 2022 14:34:59 +0000
Message-Id: <20221110143459.3833425-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110143459.3833425-1-peter.maydell@linaro.org>
References: <20221110143459.3833425-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


