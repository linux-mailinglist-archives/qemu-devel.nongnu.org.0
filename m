Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE838B365
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:39:59 +0200 (CEST)
Received: from localhost ([::1]:37698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkmE-0007zd-3I
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbV-00089y-AF
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbS-0000iA-Us
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:53 -0400
Received: by mail-wm1-x330.google.com with SMTP id t206so9468265wmf.0
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PEqMXhVTCuRe0JtaB2Xv9j94Ph2CmIe5jNctvMp+E7g=;
 b=AChR9As+LwNxnJJGr+XOWQPoitDm0bQlsGZYsOwUzApt24opiHBW1dMs741cO/9UxG
 +DQr8cNUprZh1apLUJfKgz67TS8/BBFvI2B7yvSju813MqD06d9FCCRVfIDpHoZyV/+8
 XPXSK+fccKRKwTyXRmsuai5HxwNMzhaYfyXyEVckkN+PZv8YWLFUAec312xCkmRN6C4u
 e2vXJMPeaW5ZGe6/ljHzHft/0Q5UV9xdBGNzim4Wbwn3M+BUcP0pgqcTitxMEAzH6XkR
 dFcStwIknjQkpwd4zz4I/LirQ4+si8XX+pTi8b8C3GBzoGltOMYRE2Evx0d2c0y3jKNK
 oZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PEqMXhVTCuRe0JtaB2Xv9j94Ph2CmIe5jNctvMp+E7g=;
 b=ZkIJaBXaPUypkyVq2kKBOavieSqOgvPR3wEv4kstb2XCRNqbgRQtEK8/sIG1nwOTJ6
 0g/4y98/3iibbnK88uXWONDKbQyVj23dsHfTkE9FMp6kUi3U9pqwiFvmr8T6QVPA5rbj
 exDoUOnBGwjxvvJbBhDaQx6qOf6ToXwBTOyE4pjzmgorO9nxHrW4RZA5WyybqrQvW+4s
 vHCgW67cjY7E4LLzjJ3KR7FD4i1ajHHQaj0CFD2UX7UeUZx6UTrRXTeyIG/XNmB+AMao
 x6pktnQyMRcMPPttvzzGHMEklrR3UdIId413t2pRB9CSdFLGgwmbGlg0nJuB3lOWMm/O
 IUyg==
X-Gm-Message-State: AOAM531keCq0guhZKyEvUYpeKuJoh264fkkP9zWf8kZK4g2/d3I7viH7
 s4QLOxW1+O1KTlzjWmp8LvObwg==
X-Google-Smtp-Source: ABdhPJylCAaiRgXLNA/239zTwY4brz/qttEpSMGGyNwCmG/SFslwsie6kLl1yfqFxpvwfcmtZw9yfQ==
X-Received: by 2002:a1c:4482:: with SMTP id r124mr4722902wma.42.1621524529333; 
 Thu, 20 May 2021 08:28:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 9/9] target/arm: Allow board models to specify initial NS VTOR
Date: Thu, 20 May 2021 16:28:40 +0100
Message-Id: <20210520152840.24453-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
I admit to not having a publicly-visible use for this yet, but
it does bring the NSVTOR into line with both our handling of the
SVTOR and also with the hardware, which allows both to be set
via reset-time config signal inputs, as seen eg on the Cortex-M55:
https://developer.arm.com/documentation/101051/0002/Signal-descriptions/Reset-configuration-signals?lang=en
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
index 0e33db88240..af67e2bf2e3 100644
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
index 4eb0d2f85c4..167c4feee4b 100644
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


