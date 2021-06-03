Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3139A56F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:09:52 +0200 (CEST)
Received: from localhost ([::1]:52174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopup-0004Xr-DC
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkb-000880-E8
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:17 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:56110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkY-0006pE-Ae
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:17 -0400
Received: by mail-wm1-x332.google.com with SMTP id g204so3704798wmf.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=erORTaUTqeqMhwB2aGcjyyec1Pu49DLWWyr6aCbHmnI=;
 b=Oh+orNjnPbWseWFlWLlFwTHPpoR7Mxs1Mg+VTm3cybpvUMWEyfoyRbw/25di0sPoba
 NMpfvT83AgzOK8uVi5mS+jLM2WZqhY8GE6GnAcs5JeZtH9R8ZQWzNOMGvrfN4qGRh2hC
 YRLKGz8zjFPGjKg921lFslxESzyMylfcwjAJcpUm7asl0CWXzH/pBrSoprAsc25dnUzY
 w9Jbn37lRd+d5T6xsDjKOx10H8dIS6nfD3FAbFZQRGuSavtvLKQUJe42oGbHH5xorM78
 Y6yNWZSqoiLxH998MwUGSq7rDrzCuPGffr6wuj4rkXek05etczHsZ0v5fKc1TGs/oaPg
 zrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=erORTaUTqeqMhwB2aGcjyyec1Pu49DLWWyr6aCbHmnI=;
 b=BR2kE/8gZXKtkYcOIYU5BzgpTuM930Xlh+8rn58yna9O7nlvcoNupM5iJBpSFj/Qfs
 /4+c+vl3YPwBqFb03UzTdc1Bm0BNDqRKdGBr3fac52Ly8X4WqlfHmaSrLcaD6zqxZQk+
 kZeeGHRNXEikDjeSjbO0M2JuCHtmMDALNq6B98wb8nnUjujfwUOmFdVitW2EsiP4wzMI
 4qABZSaPQoT3AnvrwBe1WviVhY1DFJkSyDclLlsITvR518CSy8X+yN4Pwedg9yqnzlcd
 xapL2oLy0jjnTuxYojwGzK0xC0jEZA2Lx5VPT1qAdXwWGRFFRbI/bIcYbiEHLJrwKNgq
 af5A==
X-Gm-Message-State: AOAM531w0m9pbNkhS+5OFP3BJaK3xofyi62WnC/FQVdC7cVM5rks74kr
 GentAru045DvEOMaP1qG7A9asANJWjCQxbDW
X-Google-Smtp-Source: ABdhPJwbUQKT1ilExgeonIFYhpuNkGLBY5ecUvehBRD6TAZUDzuyKXwSBw5oRFybFi7B1Da4MpLkFg==
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr20376402wmk.181.1622735952816; 
 Thu, 03 Jun 2021 08:59:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/45] target/arm: Allow board models to specify initial NS VTOR
Date: Thu,  3 Jun 2021 16:58:27 +0100
Message-Id: <20210603155904.26021-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we allow board models to specify the initial value of the
Secure VTOR register, using an init-svtor property on the TYPE_ARMV7M
object which is plumbed through to the CPU.  Allow board models to
also specify the initial value of the Non-secure VTOR via a similar
init-nsvtor property.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210520152840.24453-10-peter.maydell@linaro.org
---
 include/hw/arm/armv7m.h |  2 ++
 target/arm/cpu.h        |  2 ++
 hw/arm/armv7m.c         |  7 +++++++
 target/arm/cpu.c        | 10 ++++++++++
 4 files changed, 21 insertions(+)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 189b23a8ceb..bc6733c5184 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -46,6 +46,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(ARMv7MState, ARMV7M)
  *   devices will be automatically layered on top of this view.)
  * + Property "idau": IDAU interface (forwarded to CPU object)
  * + Property "init-svtor": secure VTOR reset value (forwarded to CPU object)
+ * + Property "init-nsvtor": non-secure VTOR reset value (forwarded to CPU object)
  * + Property "vfp": enable VFP (forwarded to CPU object)
  * + Property "dsp": enable DSP (forwarded to CPU object)
  * + Property "enable-bitband": expose bitbanded IO
@@ -69,6 +70,7 @@ struct ARMv7MState {
     MemoryRegion *board_memory;
     Object *idau;
     uint32_t init_svtor;
+    uint32_t init_nsvtor;
     bool enable_bitband;
     bool start_powered_off;
     bool vfp;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c389b1e9691..5f234834c0d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -869,6 +869,8 @@ struct ARMCPU {
 
     /* For v8M, initial value of the Secure VTOR */
     uint32_t init_svtor;
+    /* For v8M, initial value of the Non-secure VTOR */
+    uint32_t init_nsvtor;
 
     /* [QEMU_]KVM_ARM_TARGET_* constant for this CPU, or
      * QEMU_KVM_ARM_TARGET_NONE if the kernel doesn't support this CPU type.
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index af0d935bf78..9ce5c30cd5c 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -176,6 +176,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
+    if (object_property_find(OBJECT(s->cpu), "init-nsvtor")) {
+        if (!object_property_set_uint(OBJECT(s->cpu), "init-nsvtor",
+                                      s->init_nsvtor, errp)) {
+            return;
+        }
+    }
     if (object_property_find(OBJECT(s->cpu), "start-powered-off")) {
         if (!object_property_set_bool(OBJECT(s->cpu), "start-powered-off",
                                       s->start_powered_off, errp)) {
@@ -254,6 +260,7 @@ static Property armv7m_properties[] = {
                      MemoryRegion *),
     DEFINE_PROP_LINK("idau", ARMv7MState, idau, TYPE_IDAU_INTERFACE, Object *),
     DEFINE_PROP_UINT32("init-svtor", ARMv7MState, init_svtor, 0),
+    DEFINE_PROP_UINT32("init-nsvtor", ARMv7MState, init_nsvtor, 0),
     DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, false),
     DEFINE_PROP_BOOL("start-powered-off", ARMv7MState, start_powered_off,
                      false),
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ad65b60b043..9ad6f5911b6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -327,6 +327,7 @@ static void arm_cpu_reset(DeviceState *dev)
         env->regs[14] = 0xffffffff;
 
         env->v7m.vecbase[M_REG_S] = cpu->init_svtor & 0xffffff80;
+        env->v7m.vecbase[M_REG_NS] = cpu->init_nsvtor & 0xffffff80;
 
         /* Load the initial SP and PC from offset 0 and 4 in the vector table */
         vecbase = env->v7m.vecbase[env->v7m.secure];
@@ -1272,6 +1273,15 @@ void arm_cpu_post_init(Object *obj)
                                        &cpu->init_svtor,
                                        OBJ_PROP_FLAG_READWRITE);
     }
+    if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
+        /*
+         * Initial value of the NS VTOR (for cores without the Security
+         * extension, this is the only VTOR)
+         */
+        object_property_add_uint32_ptr(obj, "init-nsvtor",
+                                       &cpu->init_nsvtor,
+                                       OBJ_PROP_FLAG_READWRITE);
+    }
 
     qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property);
 
-- 
2.20.1


