Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2A563781E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:54:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAkq-0003kj-HQ; Thu, 24 Nov 2022 06:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkV-0003TN-At
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkR-0004q9-Ls
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:34 -0500
Received: by mail-wm1-x333.google.com with SMTP id 5so1131247wmo.1
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gIYjvXcQb6sHTWomcsrQkP1J8MqtcGNuimz+TJGwZxU=;
 b=mHXx6uT6wKM9UVPy7jNKt76M4YZ6wLyLVEqZgE3UyC/+O1vl/mMDsB3PnLF7vqkvZJ
 0d5ea0xA4g9tVJLanjDhDCKpcxkdaXzzvkQw85yITbZZqYe3ai8B5Hb+LtQxtK9h4327
 ASEAmpLkHWLAkKz3hq37WNJ9T8XH4eNe27cli0m4YvEuAUjALlzY4wbctsKrZwxv1rIx
 RUsoyQEppixkzpRP5oN+PHGIOVlRo7/l4dmfTfk1BQWjxFbybC3AOrMOqLulCI10/DBT
 jkZHN76Ka6VSwAX1wvwyRXE02KdVqYn5bRMwW4Jr8WiF38INeypFal9aJJlm6kkAAkdK
 zE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gIYjvXcQb6sHTWomcsrQkP1J8MqtcGNuimz+TJGwZxU=;
 b=YE6p7lMjUq/BV1ClKm//mWEaH3LWgjch/o1LheAi3CobwpMBB78B2NS+/VXtzAi+q0
 V0RiG9Xvi+buru9l6h0i31vVHhmlA7GOnq7Qrz6De97IfVYxxbD5FRgH71cppB3utMh8
 mkgSP03IDeagyWnVvLHDfgAKDD8citcC+SiUGTLVwLNGakxMB7+HXdjxfFoQKomXvFqQ
 LkmThXGgXeKUOofy9zhJP+XcTPkW1hh+jFRkLR5clCmAWExOnaLpPNJBTL4JQ3j1sIcl
 2nE5Ciovsgu28ZuZNh0Vxj4A+wVbcocR/8nlXb8S1N6/puvrbnBs2RjbvXEGlYF0I6id
 uVLg==
X-Gm-Message-State: ANoB5pltgKtAkKGx359XMtTcBQSMO+/ZmYoYJ0P7pdorjSI6brnfll14
 HG/zQhNXp3bsbcTbhhN3Ifck7KeQ4Lsiqw==
X-Google-Smtp-Source: AA0mqf4STiHNmwnn82MgPdVdtI95LowqUtMnrF5fvmfQtxTJCeA2FWv6jyqDl0e5VOBMgDp1HaNQRA==
X-Received: by 2002:a1c:7214:0:b0:3cf:7b65:76c5 with SMTP id
 n20-20020a1c7214000000b003cf7b6576c5mr23334105wmc.166.1669290629391; 
 Thu, 24 Nov 2022 03:50:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH for-8.0 02/19] target/arm: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:05 +0000
Message-Id: <20221124115023.2437291-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Convert the Arm CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-qom.h |  4 ++--
 target/arm/cpu.c     | 13 +++++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 64c44cef2dd..514c22ced9b 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -43,7 +43,7 @@ void aarch64_cpu_register(const ARMCPUInfo *info);
 /**
  * ARMCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * An ARM CPU model.
  */
@@ -54,7 +54,7 @@ struct ARMCPUClass {
 
     const ARMCPUInfo *info;
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a021df9e9e8..5bad065579f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -202,14 +202,16 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
     assert(oldvalue == newvalue);
 }
 
-static void arm_cpu_reset(DeviceState *dev)
+static void arm_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     ARMCPU *cpu = ARM_CPU(s);
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(cpu);
     CPUARMState *env = &cpu->env;
 
-    acc->parent_reset(dev);
+    if (acc->parent_phases.hold) {
+        acc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUARMState, end_reset_fields));
 
@@ -2210,12 +2212,15 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(acc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, arm_cpu_realizefn,
                                     &acc->parent_realize);
 
     device_class_set_props(dc, arm_cpu_properties);
-    device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
+
+    resettable_class_set_parent_phases(rc, NULL, arm_cpu_reset_hold, NULL,
+                                       &acc->parent_phases);
 
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
-- 
2.25.1


