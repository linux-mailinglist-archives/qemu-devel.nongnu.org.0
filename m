Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5300689C5C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxUr-0004oS-Kc; Fri, 03 Feb 2023 09:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUp-0004ft-Sq
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:59 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUm-00064g-Ig
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso4054732wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWk/17AxotpO2OiTLMBjakLfcxFYdT89H87fwCpt4bM=;
 b=V6lPwP4mC1QInCRGj5307s5pjCiA3lKNJkUvWVx8fuaigPxk6PbhynIY4EZDMGToJ5
 Mbh5RPJZOYY1D3M1Xmq72e2vUUh2MJvYkUrl4vE7Tk7DiZEJHZ0M/aadotqv6B/KKNjT
 RK8vkFsmTXOaMED8fAdbQxODS1T3EiGxu2bGq0SCeKAnk5Mf0dCQjbn6Y4YjBU4XU3Pn
 +6Voic1JIfNOM0QPPQN8qhznpyCj7VxrSCvxiTD8e/tTXeKrPq48mc0sN8a3/vmaCtO0
 zAz1tD7vIuaMIonMzXasOoTBFPphFNCXj610evAkNbgA/V744waaweh5LIltdFJ+3KQI
 UpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWk/17AxotpO2OiTLMBjakLfcxFYdT89H87fwCpt4bM=;
 b=DRGOG+wiCdVZlgFrf1wpmxm7OpPScZ5FvGTtXn74znyX2Kx1Tti7LbLtMpMbYLk4yA
 XTRNB02xUoMWRYd2elKDxTZBzIHPxO9v37cKvFLQH5/4rny+9S2CL2gRk3F6+hIg0kW2
 yQrfRh5B4K84oRZjpqbNkT3qFcY+U/9DF+IPN2NI6ZepiwyAYQ6iCpfgJmq/7aSYpkW8
 T0ED+viYtSYtqwUrp4aOfYh41abTr6beCi+qOEIi4NT2Twzwgz1/cYrkvC8Ug+lNihpL
 icTKmY1wwDdm41r/rf7SmEgRdERPvnPCz9tvHoYN1H5uFLfTFnKVR4eppxneFfepas1y
 GYlg==
X-Gm-Message-State: AO0yUKXbciUbPkgt8+MDTVoCozLDIV2yGkmYhYS1fuyQowWe6SqhCQqt
 MTcZyfk2/knc5V96OgYJPzyQo/97zJErlQoN
X-Google-Smtp-Source: AK7set83omHuhvDngmlsQw3r/AHFyoXLVLkZGwdKRzBPShnV1/RwCYxKCB5QnsFwJRb4sBQLlGQpJw==
X-Received: by 2002:a05:600c:3ba5:b0:3d3:4007:9c88 with SMTP id
 n37-20020a05600c3ba500b003d340079c88mr12435443wms.18.1675436215514; 
 Fri, 03 Feb 2023 06:56:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c1d1500b003dc59d6f2f8sm3268871wms.17.2023.02.03.06.56.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [RFC PATCH v2 15/15] hw/mips/itu: Pass SAAR using QOM link property
Date: Fri,  3 Feb 2023 15:55:36 +0100
Message-Id: <20230203145536.17585-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

QOM objects shouldn't access each other internals fields
except using the QOM API.

mips_cps_realize() instantiates a TYPE_MIPS_ITU object, and
directly sets the 'saar' pointer:

   if (saar_present) {
       s->itu.saar = &env->CP0_SAAR;
   }

In order to avoid that, pass the MIPS_CPU object via a QOM
link property, and set the 'saar' pointer in mips_itu_realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC because not tested.
---
 hw/mips/cps.c              | 23 ++++++-----------------
 hw/misc/mips_itu.c         | 26 ++++++++++++++++++--------
 include/hw/misc/mips_itu.h |  5 ++---
 3 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 38acc57468..2b5269ebf1 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -66,20 +66,17 @@ static bool cpu_mips_itu_supported(CPUMIPSState *env)
 static void mips_cps_realize(DeviceState *dev, Error **errp)
 {
     MIPSCPSState *s = MIPS_CPS(dev);
-    CPUMIPSState *env;
-    MIPSCPU *cpu;
-    int i;
     target_ulong gcr_base;
     bool itu_present = false;
-    bool saar_present = false;
 
     if (!clock_get(s->clock)) {
         error_setg(errp, "CPS input clock is not connected to an output clock");
         return;
     }
 
-    for (i = 0; i < s->num_vp; i++) {
-        cpu = MIPS_CPU(object_new(s->cpu_type));
+    for (int i = 0; i < s->num_vp; i++) {
+        MIPSCPU *cpu = MIPS_CPU(object_new(s->cpu_type));
+        CPUMIPSState *env = &cpu->env;
 
         /* All VPs are halted on reset. Leave powering up to CPC. */
         if (!object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
@@ -97,7 +94,6 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
         cpu_mips_irq_init_cpu(cpu);
         cpu_mips_clock_init(cpu);
 
-        env = &cpu->env;
         if (cpu_mips_itu_supported(env)) {
             itu_present = true;
             /* Attach ITC Tag to the VP */
@@ -107,22 +103,15 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
         qemu_register_reset(main_cpu_reset, cpu);
     }
 
-    cpu = MIPS_CPU(first_cpu);
-    env = &cpu->env;
-    saar_present = (bool)env->saarp;
-
     /* Inter-Thread Communication Unit */
     if (itu_present) {
         object_initialize_child(OBJECT(dev), "itu", &s->itu, TYPE_MIPS_ITU);
+        object_property_set_link(OBJECT(&s->itu), "cpu[0]",
+                                 OBJECT(first_cpu), &error_abort);
         object_property_set_uint(OBJECT(&s->itu), "num-fifo", 16,
                                 &error_abort);
         object_property_set_uint(OBJECT(&s->itu), "num-semaphores", 16,
                                 &error_abort);
-        object_property_set_bool(OBJECT(&s->itu), "saar-present", saar_present,
-                                 &error_abort);
-        if (saar_present) {
-            s->itu.saar = &env->CP0_SAAR;
-        }
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->itu), errp)) {
             return;
         }
@@ -158,7 +147,7 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gic), 0));
 
     /* Global Configuration Registers */
-    gcr_base = env->CP0_CMGCRBase << 4;
+    gcr_base = MIPS_CPU(first_cpu)->env.CP0_CMGCRBase << 4;
 
     object_initialize_child(OBJECT(dev), "gcr", &s->gcr, TYPE_MIPS_GCR);
     object_property_set_uint(OBJECT(&s->gcr), "num-vp", s->num_vp,
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index a06cdd10ea..0eda302db4 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -93,10 +93,10 @@ void itc_reconfigure(MIPSITUState *tag)
     uint64_t size = (1 * KiB) + (am[1] & ITC_AM1_ADDR_MASK_MASK);
     bool is_enabled = (am[0] & ITC_AM0_EN_MASK) != 0;
 
-    if (tag->saar_present) {
-        address = ((*(uint64_t *) tag->saar) & 0xFFFFFFFFE000ULL) << 4;
-        size = 1ULL << ((*(uint64_t *) tag->saar >> 1) & 0x1f);
-        is_enabled = *(uint64_t *) tag->saar & 1;
+    if (tag->saar) {
+        address = (tag->saar[0] & 0xFFFFFFFFE000ULL) << 4;
+        size = 1ULL << ((tag->saar[0] >> 1) & 0x1f);
+        is_enabled = tag->saar[0] & 1;
     }
 
     memory_region_transaction_begin();
@@ -157,7 +157,7 @@ static inline ITCView get_itc_view(hwaddr addr)
 static inline int get_cell_stride_shift(const MIPSITUState *s)
 {
     /* Minimum interval (for EntryGain = 0) is 128 B */
-    if (s->saar_present) {
+    if (s->saar) {
         return 7 + ((s->icr0 >> ITC_ICR0_BLK_GRAIN) &
                     ITC_ICR0_BLK_GRAIN_MASK);
     } else {
@@ -515,6 +515,7 @@ static void mips_itu_init(Object *obj)
 static void mips_itu_realize(DeviceState *dev, Error **errp)
 {
     MIPSITUState *s = MIPS_ITU(dev);
+    CPUMIPSState *env;
 
     if (s->num_fifo > ITC_FIFO_NUM_MAX) {
         error_setg(errp, "Exceed maximum number of FIFO cells: %d",
@@ -526,6 +527,15 @@ static void mips_itu_realize(DeviceState *dev, Error **errp)
                    s->num_semaphores);
         return;
     }
+    if (!s->cpu0) {
+        error_setg(errp, "Missing 'cpu[0]' property");
+        return;
+    }
+
+    env = &s->cpu0->env;
+    if (env->saarp) {
+        s->saar = env->CP0_SAAR;
+    }
 
     s->cell = g_new(ITCStorageCell, get_num_cells(s));
 }
@@ -534,8 +544,8 @@ static void mips_itu_reset(DeviceState *dev)
 {
     MIPSITUState *s = MIPS_ITU(dev);
 
-    if (s->saar_present) {
-        *(uint64_t *) s->saar = 0x11 << 1;
+    if (s->saar) {
+        s->saar[0] = 0x11 << 1;
         s->icr0 = get_num_cells(s) << ITC_ICR0_CELL_NUM;
     } else {
         s->ITCAddressMap[0] = 0;
@@ -553,7 +563,7 @@ static Property mips_itu_properties[] = {
                       ITC_FIFO_NUM_MAX),
     DEFINE_PROP_UINT32("num-semaphores", MIPSITUState, num_semaphores,
                       ITC_SEMAPH_NUM_MAX),
-    DEFINE_PROP_BOOL("saar-present", MIPSITUState, saar_present, false),
+    DEFINE_PROP_LINK("cpu[0]", MIPSITUState, cpu0, TYPE_MIPS_CPU, MIPSCPU *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index ab6d286c38..35218b2d14 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -72,9 +72,8 @@ struct MIPSITUState {
     uint64_t icr0;
 
     /* SAAR */
-    bool saar_present;
-    void *saar;
-
+    uint64_t *saar;
+    MIPSCPU *cpu0;
 };
 
 /* Get ITC Configuration Tag memory region. */
-- 
2.38.1


