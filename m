Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA3C63781D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:54:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAkw-0003zL-J6; Thu, 24 Nov 2022 06:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkm-0003cg-4V
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:52 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkf-0004wb-Fb
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:51 -0500
Received: by mail-wr1-x429.google.com with SMTP id n7so2093783wrr.13
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwpZITjHgQ8cOpxT8gQYzyXjPVENzbqAFCPuHxyLkQ8=;
 b=YSQmtuXfYmEMyAZJQQx+sMhkzkfMFBPjsg9Pck+3XE3HU+6t0j/AlUltMb6n7+C8pC
 dLGyyLj+ugYh1v5AQ6O+lBduwFbV7kjIQI8flwycMuqWCDa8SsShqH2fI7lnpAaT4zYs
 XGvfIj1Y75A1gIcfXeZDfhI6Gosxvvt4tZK9c4itdlC/lXatRR6+mlDRMKpw3zqx085M
 q6pF/ux9lcNk4X1zjjI0DrkHP72OEqrnnEGyvjRu8rYKLaaMlMUGNGbYmn5qpQorcGqn
 PWCB6LTMcxLiKjNUcblCYWFW2qRuwjrcfBR5aeaWSIDG0ibgnSY6BqHzezSJryqW8S2s
 dPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwpZITjHgQ8cOpxT8gQYzyXjPVENzbqAFCPuHxyLkQ8=;
 b=s6VUduPAPAXBUI6YcP0KQT/YNYVGl75/KijDmoj018RvXvast3NUmsiw4rxrHVGpvk
 Dc9NZmml7m5MwvY/H/nr98+knVn/0FaoqfsK9dgahFIthRE/3/N9UkaGDac9l0Zh+tbP
 6ZiI0Ld43x3hjLLL+CCsxP6KwtHyTZSb/CLP2bP370d3Y6a1lHyCnG+7hiDY9CUurc4p
 MprCdInN2R1ZspviJ/mjXFRhAo5MZzvr5B0apqyQbCnIjutEtlOYWhfgihpsw8Gnn+4A
 u7rHlGBkfv7f0dJWBmlnJpF62OCWXunBTohlehFoNZb6omjV2H9/pOam9Mt2DR6M3GkP
 RdQA==
X-Gm-Message-State: ANoB5pluJ8JmwrFF4v+vYgWIYVbfwEZyMD377VsO76s3dkk48vDEwJiO
 lyrkBWcp3yAQP7ab+ExUJ/cFCmQWRy+GYA==
X-Google-Smtp-Source: AA0mqf4+cbYCBnf5xToYwVN2in68msjw4bswxPTNWXxWpShznlbY3IVUeprSuPmofHA4Cc+6lZZiAA==
X-Received: by 2002:adf:c64e:0:b0:236:78cd:f3d2 with SMTP id
 u14-20020adfc64e000000b0023678cdf3d2mr20645442wrg.719.1669290642870; 
 Thu, 24 Nov 2022 03:50:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:42 -0800 (PST)
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
Subject: [PATCH for-8.0 11/19] target/nios2: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:14 +0000
Message-Id: <20221124115023.2437291-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Convert the nios2 CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/nios2/cpu.h |  4 ++--
 target/nios2/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index f85581ee560..b1a55490747 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -37,7 +37,7 @@ OBJECT_DECLARE_CPU_TYPE(Nios2CPU, Nios2CPUClass, NIOS2_CPU)
 
 /**
  * Nios2CPUClass:
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A Nios2 CPU model.
  */
@@ -47,7 +47,7 @@ struct Nios2CPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #define TARGET_HAS_ICE 1
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 9a5351bc81d..cff30823dad 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -57,14 +57,16 @@ static bool nios2_cpu_has_work(CPUState *cs)
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
-static void nios2_cpu_reset(DeviceState *dev)
+static void nios2_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     Nios2CPU *cpu = NIOS2_CPU(cs);
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(cpu);
     CPUNios2State *env = &cpu->env;
 
-    ncc->parent_reset(dev);
+    if (ncc->parent_phases.hold) {
+        ncc->parent_phases.hold(obj);
+    }
 
     memset(env->ctrl, 0, sizeof(env->ctrl));
     env->pc = cpu->reset_addr;
@@ -371,11 +373,13 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     Nios2CPUClass *ncc = NIOS2_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, nios2_cpu_realizefn,
                                     &ncc->parent_realize);
     device_class_set_props(dc, nios2_properties);
-    device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, nios2_cpu_reset_hold, NULL,
+                                       &ncc->parent_phases);
 
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
-- 
2.25.1


