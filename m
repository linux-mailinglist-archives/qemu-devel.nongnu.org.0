Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72E064F427
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV5-0006l9-Pc; Fri, 16 Dec 2022 16:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU6-00062W-98
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:14 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IU4-0000ar-Hk
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:14 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso4974785wme.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bDUcrxHwLGbcB7ISY+JnEmJS7iSG+RW4z/scHWZ7amo=;
 b=fHgppYctibrgC9kBXxpWHycUGJgik4bz1uqWS1gG/kMhtP8dIU/D/FGIoVhHNAOz8u
 QAaR2CwOGQWrhxXgoY4gWY9DGdm3OiCzvEdqkeDFa+qIgML3fbcKpDz/ZBoFNQV26aRK
 ooRy2xtq46Z6DhefNxOln2LdlJ7RN3Ttm0pWn51vckBHg68TmlyVPT3f9E2OVGo6Kk8+
 pT+HC2Ars7/y6lRmlKRXyuxRSlskALLAm6j4XJ67KavNip6j3rsd33HC78oVk1j8IojC
 49/JvW+4Zg/JJwi9SgMNaG7cIrJBCfCTgWUqYhWVwrPFwm0qWUr2u6dYCQNjXIW63y8J
 wsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDUcrxHwLGbcB7ISY+JnEmJS7iSG+RW4z/scHWZ7amo=;
 b=Y9sphAUjzw3LM7rFLkbWRUuxJYtj7bnajG7ASjRVPSutly9iFn15Yhg067exRR+GTi
 xQUo+Ug2cYV9ttp2TKOcCQnF+7ewLeO6yBT1k14mcuTcCTVsv5bYs2LhJlF1uHf37Ub7
 XLBI4ry4CXVC2GUEQPKIzQGOW84HmF2fmgGVTPdcFzWebjorU4w5kObw2Iz68czqg+YA
 vZrpIbtJCv9qMUoXDhdNKCwGlvfBTwoTO2ECfSdZ2ozPaWNVR5NFM6G99GlFZhLEWZa2
 rl7/M3g06u3IC/v0XQy6uYZMGLN2YmNf1hfe9WrVXRjII8UEgVQ16C8quGA5yZrVjItR
 6mmw==
X-Gm-Message-State: ANoB5pnU5f9JgZh1t1CS2lJkNGVTx6NfgMMfnNHFHwml/x/w5GtbA0gr
 UbqBv3tgrxrjwXWRIM0V2P24yAunzZSGqdMz
X-Google-Smtp-Source: AA0mqf6imw9rUGczwz80Qf37ViJD8C9veThp0xWGtutq8Tvz8/qyiQVh1Heq9ofxsF40QMAtyZ2xXA==
X-Received: by 2002:a05:600c:5120:b0:3d2:5e4e:6fa with SMTP id
 o32-20020a05600c512000b003d25e4e06famr6898775wms.34.1671226991745; 
 Fri, 16 Dec 2022 13:43:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/36] target/sparc: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:35 +0000
Message-Id: <20221216214244.1391647-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Convert the sparc CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-id: 20221124115023.2437291-18-peter.maydell@linaro.org
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


