Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832BE637844
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 13:00:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAky-00045O-TN; Thu, 24 Nov 2022 06:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkq-0003kq-4j
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:56 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkl-0004yP-KO
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:55 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so3765215wmb.2
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+pngmMhNFNeQ+gXXcDsfqo/V6FiO7zBgzlTDG8C44Z4=;
 b=Cex4TJEi+yfXPgI+YyoSTGHPzvlkW4KQ5iwZdCIdf7+PQRewWEeefhvSxNYd2nz1h6
 R9M2QKi7HYywjLabejqKSylkDjaW2wOLeZY3RXzkhnkTVA8WfuBxdFi/bn4MB16C3s1G
 7G+CZHEqBcG+Tk/TKUz5I1sEY47dYCMKrfUtAlLQy000n9fJQRJJGVdY2oeJVD3l9HZx
 7hLokGlo+Kr4dDRHiETpRiR8RaZaVE6v1pgS2yB6BZECqmlGutZv+J4hZS1Oj6maXA+0
 1H+MB/CWQWfGIoAXdp9M6CpZx2lxZ5gIVzcCYLoQkwil5RYeDsVL55cFqKtnZX2qehXW
 ZV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+pngmMhNFNeQ+gXXcDsfqo/V6FiO7zBgzlTDG8C44Z4=;
 b=Qa2Zom685IqJzDuPskmaVM0t0nHLp55lnOkVHkr7ESuO+4/Dy1lejVQE22eL404VTe
 hs/vu6AX+19NlNdqYzCXELiIA2OjARnIMfB4oLaggDa7VgTYuTXoLSHmr5jvDV9V981B
 eK+KaoqLzrbx4SVHnoXqQ+k+DNgmDCF+UycKLLnv0+T9XxXghW6UoxiQ+k99hcBx+uFG
 qcE1Kd1zNbnuQPlqdnw2FblRY5nisIwiN38+B+c5tpvvbZVCRiudkET5dhlWmca0DKSn
 dLM4522u97N5dTsvDSNSqmYbDsPbG3Yp3uC/cX8n8lpn5yGwqnFyQR63EL2fbZgZYXuH
 ILiQ==
X-Gm-Message-State: ANoB5pnwJ/rYuG8kTMhmGcQSFXf0U8Yrw3N+CsSp65qLOV9hsb8Osv5s
 Y7YThnmqcf8o4aronX0E3f+1mm6zWgyjTA==
X-Google-Smtp-Source: AA0mqf4t3GYAQ6ZlFIuVIBYU595pzm+h+/ghf04WCH5F7K5HGXGZAErCqoqgUXwlbgNy2/BasFVM9g==
X-Received: by 2002:a05:600c:19d1:b0:3cf:ca1a:332a with SMTP id
 u17-20020a05600c19d100b003cfca1a332amr27246324wmq.118.1669290647083; 
 Thu, 24 Nov 2022 03:50:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:46 -0800 (PST)
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
Subject: [PATCH for-8.0 14/19] target/riscv: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:17 +0000
Message-Id: <20221124115023.2437291-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
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

Convert the riscv CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/riscv/cpu.h |  4 ++--
 target/riscv/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3a9e25053f8..443d15a47c0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -395,7 +395,7 @@ OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
 /**
  * RISCVCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A RISCV CPU model.
  */
@@ -404,7 +404,7 @@ struct RISCVCPUClass {
     CPUClass parent_class;
     /*< public >*/
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 struct RISCVCPUConfig {
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d14e95c9dc1..6fe176e4833 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -519,18 +519,20 @@ static void riscv_restore_state_to_opc(CPUState *cs,
     env->bins = data[1];
 }
 
-static void riscv_cpu_reset(DeviceState *dev)
+static void riscv_cpu_reset_hold(Object *obj)
 {
 #ifndef CONFIG_USER_ONLY
     uint8_t iprio;
     int i, irq, rdzero;
 #endif
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     RISCVCPU *cpu = RISCV_CPU(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
     CPURISCVState *env = &cpu->env;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 #ifndef CONFIG_USER_ONLY
     env->misa_mxl = env->misa_mxl_max;
     env->priv = PRV_M;
@@ -1161,11 +1163,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, riscv_cpu_realize,
                                     &mcc->parent_realize);
 
-    device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, riscv_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
-- 
2.25.1


