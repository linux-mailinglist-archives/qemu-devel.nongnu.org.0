Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED9637820
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:54:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAku-0003sS-3X; Thu, 24 Nov 2022 06:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkk-0003b2-TW
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:51 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkd-0004wE-8F
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:48 -0500
Received: by mail-wr1-x434.google.com with SMTP id b12so2148379wrn.2
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hsda7Zq3jpyzptb9XynNFoMbGolRoFCYCg8lAZ1ErIY=;
 b=idcImeyGPJcbrfK80jQE5KdO0ppMXgOCpgoGsyDlc0mbIS5e906iZvS8oWRxdmjWWw
 INBIjkBKlsQ8SGXP15u7ME3hXSKa0Sn9gx9C5RP8rQi19r0JoS9bLY9kQIbZtMQek/ep
 4W7s/NWFM8qY54k/O6wiieiaSAMz2L+pUgtWJoNXJD9VnaVz5X6PQul286voFwFsJe1o
 KjPiUdAWXQqC1ICGdlXVo3fOl1/EbgoGID4hda7K8TF3pSwvqNDxvTllpnc8PZ0MlWtw
 RfowLrCRx8aGBNe23g843Vu4YolLbyBOIDs2ofrZVFH2stAx1FnueWINyGGUV7UmwOQq
 Jfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hsda7Zq3jpyzptb9XynNFoMbGolRoFCYCg8lAZ1ErIY=;
 b=vPPo5S6fO051RLT8b/0DWtHWVLLJWo4XcPKdufYUCyqk1jAMdAmk9FKumHUCRyGZEs
 WUJNo85TxY/IAMbolawaQ+59LXme8SlLwEsHO6SKt3od3jvvpSiReyC4OUNU+pMJGzRQ
 zWI7/nKvUtuyKTLw4Xq3CQu2ArdPHtEKxSMQHUz6YPKs7nX6Tmj5L0BY7zuPHDY6PmFc
 1M7U7wqrFVQsOJxOx0+rzN9EE4u1xRDP7mCDSfM0WI3k558ie/UyrAIJGospuSwMkbCn
 c7NP0vp+wikuYE2Dcq9X1q5Cw/Nu6LQnDr1kuI3YVsINrezQDGv9vbyf+prOADdWdVvi
 uohQ==
X-Gm-Message-State: ANoB5pmt/b7eC75pfkEJSH/ievTTLWeEU8JI2mCsTtO6FvR5UDKxpRXG
 iPPriSszYbu//4tusBU6YcNxjmZeBQ4WRg==
X-Google-Smtp-Source: AA0mqf6ey5ZPdpQbpXVy+hxj0i+WKQpNNkI5xaWiG3YViikjRUKOCMwtzrTKEecD6wATpO+LO/Ihlw==
X-Received: by 2002:a5d:4533:0:b0:241:d13a:1d52 with SMTP id
 j19-20020a5d4533000000b00241d13a1d52mr13278689wra.270.1669290641533; 
 Thu, 24 Nov 2022 03:50:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:40 -0800 (PST)
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
Subject: [PATCH for-8.0 10/19] target/mips: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:13 +0000
Message-Id: <20221124115023.2437291-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Convert the mips CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/mips/cpu-qom.h |  4 ++--
 target/mips/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index e28b5296073..0dffab453b2 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -34,7 +34,7 @@ OBJECT_DECLARE_CPU_TYPE(MIPSCPU, MIPSCPUClass, MIPS_CPU)
 /**
  * MIPSCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A MIPS CPU model.
  */
@@ -44,7 +44,7 @@ struct MIPSCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
     const struct mips_def_t *cpu_def;
 
     /* Used for the jazz board to modify mips_cpu_do_transaction_failed. */
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 7a565466cb3..c614b04607a 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -182,14 +182,16 @@ static bool mips_cpu_has_work(CPUState *cs)
 
 #include "cpu-defs.c.inc"
 
-static void mips_cpu_reset(DeviceState *dev)
+static void mips_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     MIPSCPU *cpu = MIPS_CPU(cs);
     MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(cpu);
     CPUMIPSState *env = &cpu->env;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUMIPSState, end_reset_fields));
 
@@ -562,10 +564,12 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     MIPSCPUClass *mcc = MIPS_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, mips_cpu_realizefn,
                                     &mcc->parent_realize);
-    device_class_set_parent_reset(dc, mips_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, mips_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
-- 
2.25.1


