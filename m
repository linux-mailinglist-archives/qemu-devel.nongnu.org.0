Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19F6637816
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:53:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAl2-00049B-JM; Thu, 24 Nov 2022 06:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkt-0003sQ-3i
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:59 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkm-00050T-QK
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:58 -0500
Received: by mail-wr1-x431.google.com with SMTP id n7so2094314wrr.13
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZpPOhWgTJeRtGlJ/Bb9mJkWWu83x48fPXZ9qUrHHGz0=;
 b=RBQx5v8NdoZVOHTk82/TeT0jLfN8OFur+hGOOdDp70zHx09Vu9fTBYXEo6BblxdzQp
 X6nxWJ0CYHaAIy0KTq8U5BV226hVzPVgAXLbqqPGqM3h2PxCp6eMmgdRCHm9jt/JHgXB
 exIFC+goYjYzJTs6MvAjq2/U0TuT9uYDx72PaF+PyVMusn4XcnkdCGD9DZsgZVn804PC
 8jkrJKKFzBHMelvclFxnLPJAGkBd1Kk0kM6MC9/Ib8bRKP4x29tAVxcnPnp7BSUEUqLy
 BYRqGyC7q0WPWJOVe0rC3qJUbOOqYoQnCeHXxrdVSk7eME1nnfjISaaqy/RVR4uWEXZq
 Q61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZpPOhWgTJeRtGlJ/Bb9mJkWWu83x48fPXZ9qUrHHGz0=;
 b=ethUxYMBP5Xx72fKSJdNnvmFs4q0AIbYAXq73fO0BDrace2ujl6RwX5+HjgF1+PWJ8
 QbC536O1C5RyBhDMtMYznSbIa0B7gRStawHNw9vUV7SF/A9Igu+aVBYL5VsCOSRTNFqq
 EUHKYZqEXTE/LlqbfjVIrYxpto/WtLhk3CRwZd9of6Hvsmbmx6rEa8rlXASIera/jcpZ
 5dSM5wMLppO9xnQrIa9ZhTnyoQ9zBc60/w2SiMEqrSmpvZsI3B17i2B/QP/FU2bsmymL
 1W9rlKy76QXXmc/3m3l8aWEydukDqACxVivL4xFGKZASErRQrJg7jKuuXGgJstdIzI6W
 Tlxw==
X-Gm-Message-State: ANoB5pnfFzjHAEORoPfBHNCbTKp2fRW6fE0ALpKPORQSRt6Z/Rnu83Kq
 /2Q+Hal+57a6zZ+13xU4AnLTmiFldwplUA==
X-Google-Smtp-Source: AA0mqf6XRo+GAoVTDQtA0kJgkPOysOHUUpgDac0yrZz2SESn5hIgZPdLOqq/OPY/xtboiujMF0deXw==
X-Received: by 2002:a05:6000:78d:b0:22e:3d63:80bc with SMTP id
 bu13-20020a056000078d00b0022e3d6380bcmr20933017wrb.30.1669290651334; 
 Thu, 24 Nov 2022 03:50:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:50 -0800 (PST)
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
Subject: [PATCH for-8.0 17/19] target/sparc: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:20 +0000
Message-Id: <20221124115023.2437291-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Convert the sparc CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sparc/cpu-qom.h |  4 ++--
 target/sparc/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index 86ed37d9333..78bf00b9a23 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -35,7 +35,7 @@ typedef struct sparc_def_t sparc_def_t;
 /**
  * SPARCCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A SPARC CPU model.
  */
@@ -45,7 +45,7 @@ struct SPARCCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
     sparc_def_t *cpu_def;
 };
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 4c3d08a8751..1734ef8dc6b 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -28,14 +28,16 @@
 
 //#define DEBUG_FEATURES
 
-static void sparc_cpu_reset(DeviceState *dev)
+static void sparc_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     SPARCCPU *cpu = SPARC_CPU(s);
     SPARCCPUClass *scc = SPARC_CPU_GET_CLASS(cpu);
     CPUSPARCState *env = &cpu->env;
 
-    scc->parent_reset(dev);
+    if (scc->parent_phases.hold) {
+        scc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUSPARCState, end_reset_fields));
     env->cwp = 0;
@@ -889,12 +891,14 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     SPARCCPUClass *scc = SPARC_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, sparc_cpu_realizefn,
                                     &scc->parent_realize);
     device_class_set_props(dc, sparc_cpu_properties);
 
-    device_class_set_parent_reset(dc, sparc_cpu_reset, &scc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, sparc_cpu_reset_hold, NULL,
+                                       &scc->parent_phases);
 
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
-- 
2.25.1


