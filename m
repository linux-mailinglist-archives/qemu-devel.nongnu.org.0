Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A763780C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:52:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAlA-0004LC-4i; Thu, 24 Nov 2022 06:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAku-0003xz-TU
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:51:00 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkp-000526-Ey
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:51:00 -0500
Received: by mail-wm1-x336.google.com with SMTP id v7so1151089wmn.0
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJxN8OwLvz4RIGrwju4T4c5A0ASCmNoxWaI71mOwfMg=;
 b=WYCZu0FBoPLym6lgz2W4phD1L4vtnHcb9H8Jd2tcm2xIojsGTcWN0xG3UI2tfP+jle
 l9oT48HYjdf/xL48l5BQFqOS+i6ZmpnnVk3t1sE0KokrFOWeRFx+N9UmfwW4bqfcoomj
 rQgVoL/lgb27BNAvGD6SBVvhgDQM+CrqXxZ9zwqopKmWwODz1ouLzbhCase9ybioYvGZ
 vWWVrbupwi091AAcoQxPNckEynMUUEZ2W+gl9a3M1loa2nR8ZQN5ISu/PdHYXorelk/y
 MCRN6wz4P7F20jHbjnj7SxGCk9BvLP3qs/zRg8O09nCJKN60ig4WFV/CdaTqGId4yWmP
 SZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJxN8OwLvz4RIGrwju4T4c5A0ASCmNoxWaI71mOwfMg=;
 b=7edc9bMy7ZMVmyoYEEtHPjQp4q3uknkahk1g+XE4bcPXw4yJA8b5MUTOgmiVyMXCQ5
 Gu6hUXIkjl/1RldNk14z09lgmFsUY13bwzUgjHMSouc2swUBMDVbR/VjTtiy6vN8evz7
 XnitQaFBnFNK9oalfq0IQaHE+LpfyvTBGfxrnCM1CFRhzMWcvms2CxK5eQgj6B4Fv+1e
 QYPuf5YHXlLsrNMyxu4fQr3EKgwZjSpf7EnQoJRzbldLyaClRiyN3jJaRoQtwlZ1mSCW
 IUtrrs9KVwDKN6akvXd3W3bYpwAp68S9vGLNAF6C9HTWpG+WEx4oi1PD2t9kMfGMBGwW
 kC6Q==
X-Gm-Message-State: ANoB5pl68GiTa920x2FCMf9riIvvg0xHeZtvVCO/mgfOHUxZX7G8p+00
 HnuVOUm/83ec2FGeLykztuzMiccfAZlGfw==
X-Google-Smtp-Source: AA0mqf7EPxDZ/HGZK0wIFPJP8zrrYafw7pd0hNY0Y59CTlBvWAp0cbdpsR0dIYwfg60b9gBaI/zYNw==
X-Received: by 2002:a05:600c:18a1:b0:3cf:a9d5:36c7 with SMTP id
 x33-20020a05600c18a100b003cfa9d536c7mr9505500wmp.13.1669290654048; 
 Thu, 24 Nov 2022 03:50:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:53 -0800 (PST)
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
Subject: [PATCH for-8.0 19/19] target/xtensa: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:22 +0000
Message-Id: <20221124115023.2437291-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Convert the xtensa CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/xtensa/cpu-qom.h |  4 ++--
 target/xtensa/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
index 4fc35ee49b8..419c7d8e4a3 100644
--- a/target/xtensa/cpu-qom.h
+++ b/target/xtensa/cpu-qom.h
@@ -41,7 +41,7 @@ typedef struct XtensaConfig XtensaConfig;
 /**
  * XtensaCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  * @config: The CPU core configuration.
  *
  * An Xtensa CPU model.
@@ -52,7 +52,7 @@ struct XtensaCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 
     const XtensaConfig *config;
 };
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 09923301c40..2dc8f2d232f 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -85,16 +85,18 @@ bool xtensa_abi_call0(void)
 }
 #endif
 
-static void xtensa_cpu_reset(DeviceState *dev)
+static void xtensa_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     XtensaCPU *cpu = XTENSA_CPU(s);
     XtensaCPUClass *xcc = XTENSA_CPU_GET_CLASS(cpu);
     CPUXtensaState *env = &cpu->env;
     bool dfpu = xtensa_option_enabled(env->config,
                                       XTENSA_OPTION_DFP_COPROCESSOR);
 
-    xcc->parent_reset(dev);
+    if (xcc->parent_phases.hold) {
+        xcc->parent_phases.hold(obj);
+    }
 
     env->pc = env->config->exception_vector[EXC_RESET0 + env->static_vectors];
     env->sregs[LITBASE] &= ~1;
@@ -240,11 +242,13 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     XtensaCPUClass *xcc = XTENSA_CPU_CLASS(cc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, xtensa_cpu_realizefn,
                                     &xcc->parent_realize);
 
-    device_class_set_parent_reset(dc, xtensa_cpu_reset, &xcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, xtensa_cpu_reset_hold, NULL,
+                                       &xcc->parent_phases);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
     cc->has_work = xtensa_cpu_has_work;
-- 
2.25.1


