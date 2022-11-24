Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE38637843
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:59:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAks-0003qh-N2; Thu, 24 Nov 2022 06:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkf-0003XO-SZ
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:47 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAka-0004uu-6Z
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:44 -0500
Received: by mail-wr1-x433.google.com with SMTP id i12so2186842wrb.0
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tSG1Pvc6m8SnTYZhtJnHT4zBC5AegvUy/RzVsBJxFvM=;
 b=HisP1vEH09VESx7i8+MbNnveYSd6zREVfrB87gWzdyqhrcGoByZnE9EdQESORV2LVx
 y1/L69WKqJ8Y1S6NXzQyEAIeVs6UNdaq1C4MPWrkhq9Dw8vqaFcV2XjYSxKKpC28vLkH
 Khae5lsZKAheohs8dvRZcakjj3xMndKdpbIy3/S4cUQtiIKlLxFY2QMoj7rFfpJ//vjs
 SN1lIQRTpIPivuvQpfnNL5le3OoQCBqb7eZLzdYlJwv1wFM9zzLlrW0wVEjnEVrGr5cx
 7OUo1TFI1YUb7mCYNRmQUfwfv/0XFkPaJSKz4u07YNhv9bPoEA0kGxpRYGeql0dXUTyU
 0igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSG1Pvc6m8SnTYZhtJnHT4zBC5AegvUy/RzVsBJxFvM=;
 b=D4V7OWgD3zB97GDD/Gh8NYyh5mGwSM46n+DGzpWJqqSu30FHampA4Sa+sUWwnJYzk1
 Wn0t5o6U0q9iJqF3TCt5D4i00uTlvrer7cDdm1tiGkOw4v2JzE2TtF7nxJMrAuiubFMP
 DfuMuXIRiDNRxIpL1wDK7zmNxYOPyo9H2CboJGCbErcv3yXq2VcscpxKI09awlR3zUY2
 H201IPEp8hkcOtMji+D9nYAuwnqK4IP5k6MCTuBEhshcmghuyPuqfqEba+Cv3z8M8CkI
 z+QMQkm+81zqSjXAk8G89cyJQhQZlRWug5oL1FDai0nKX5aSOpmdLpeH4q4DTt+keDb9
 tTsA==
X-Gm-Message-State: ANoB5plZaV96nP5eYt7mLlkuJrLZr5Pq5vw7mQ01IptcN+jgxMk1Q6RH
 Hi3Cj8ZLh3IPLx9ZOei1KtU91G7LUFBl7g==
X-Google-Smtp-Source: AA0mqf475frrQw4TOF0CDBS6Naz4c2Z3TxwU3ZDvJZ5pbCg1Z2BCFqNgEWrUCdXhc1hj0S+hXS23OQ==
X-Received: by 2002:adf:e3d2:0:b0:241:d676:a787 with SMTP id
 k18-20020adfe3d2000000b00241d676a787mr12028072wrm.694.1669290638551; 
 Thu, 24 Nov 2022 03:50:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:37 -0800 (PST)
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
Subject: [PATCH for-8.0 08/19] target/m68k: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:11 +0000
Message-Id: <20221124115023.2437291-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Convert the m68k CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/m68k/cpu-qom.h |  4 ++--
 target/m68k/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index cd9687192cd..0ec7750a926 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -30,7 +30,7 @@ OBJECT_DECLARE_CPU_TYPE(M68kCPU, M68kCPUClass, M68K_CPU)
 /*
  * M68kCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A Motorola 68k CPU model.
  */
@@ -40,7 +40,7 @@ struct M68kCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index b67ddea2aee..99af1ab541a 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -66,16 +66,18 @@ static void m68k_unset_feature(CPUM68KState *env, int feature)
     env->features &= ~BIT_ULL(feature);
 }
 
-static void m68k_cpu_reset(DeviceState *dev)
+static void m68k_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     M68kCPU *cpu = M68K_CPU(s);
     M68kCPUClass *mcc = M68K_CPU_GET_CLASS(cpu);
     CPUM68KState *env = &cpu->env;
     floatx80 nan = floatx80_default_nan(NULL);
     int i;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUM68KState, end_reset_fields));
 #ifdef CONFIG_SOFTMMU
@@ -552,10 +554,12 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     M68kCPUClass *mcc = M68K_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, m68k_cpu_realizefn,
                                     &mcc->parent_realize);
-    device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, m68k_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
-- 
2.25.1


