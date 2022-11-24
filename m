Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C89637803
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:52:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAkm-0003cK-UZ; Thu, 24 Nov 2022 06:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkZ-0003WJ-C9
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:41 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkW-0004rH-Qo
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:39 -0500
Received: by mail-wr1-x432.google.com with SMTP id x17so2123941wrn.6
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8mxI4ivXjFrhpxeBS9ygU13x3SQQqiJhdqLWHoUm8QU=;
 b=NiasfTLUj6R0ILetnNaQFDhcmn8BLZ5KahZq6IP/1F4JfOdsyMSIxKh7ncBJDyZdrd
 +f99c7dlUkKEFfD0pIc/204D3z5/FB+xlvRhswSZNvxBkneq5JnWA3pmaE4Xqm1lp0Au
 BnU32llCRXM52DlAgfkcN/UE9Rkn0ub7qjxfdivCjCgVnzWEheYU9MENF+74okqdH5xo
 rYwcHeDTG0hYzMxHnGldYevHiJlylLf0ZAH83UkGYxmoI8dTXYWT5sjIts9+6xCRcFEQ
 MiWo+031VJZNs0Vjj1uysHb21gTgOr27dWsHlGyQoAXARV8Agqu1UyYhstY2bstwQqHL
 5ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8mxI4ivXjFrhpxeBS9ygU13x3SQQqiJhdqLWHoUm8QU=;
 b=jQFVc/NW4i1b14mjBmsusnthlVcu7weo1hRvXDaorUQtFgkIbK6S7DxpyYYUigl0mx
 01P9BkgokpUOx+aRAcjklfROTY2A3ptFlkbCHIMDJea8SCC2ZSGEKErwcSeTkaK8owBB
 dB3xGFZ4XeRXfDg7uQ16URXux3UB1U734s+rhEhk5xHP0zrix0By6YLcRUNAQsZyNbOI
 BKHrK58Ww7J/zkYudlP6PFWMVAyutuj7lJH1u5uzQx/1FTF0wy1cWoQLpA0R/SXnC+9J
 KFwBXb1ZZ6qAmATDFxCWd10bvXQ0R4tDTH3u1/i5QMV6G60NCkYGNzevwBDFCKyOjfYS
 iu4A==
X-Gm-Message-State: ANoB5pnyHwdjD1OBzUlOsIux6X6+uOX48VqPxdfpLK8XkiMXTELmMkYD
 IQ+i8a79jdu5Jhfcik3ivXD086wwbu32Rw==
X-Google-Smtp-Source: AA0mqf7ybPPJW+1mEV6sJggnxUKWkD56BWhMjjQtGDmeMoidcKUl0lKzVmM6kAFnQSmTkw5OMGJ//A==
X-Received: by 2002:adf:df09:0:b0:236:885e:ef4b with SMTP id
 y9-20020adfdf09000000b00236885eef4bmr19984484wrl.13.1669290632095; 
 Thu, 24 Nov 2022 03:50:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:31 -0800 (PST)
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
Subject: [PATCH for-8.0 04/19] target/cris: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:07 +0000
Message-Id: <20221124115023.2437291-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Convert the cris CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/cris/cpu-qom.h |  4 ++--
 target/cris/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
index 71e8af0e70a..431a1d536a9 100644
--- a/target/cris/cpu-qom.h
+++ b/target/cris/cpu-qom.h
@@ -30,7 +30,7 @@ OBJECT_DECLARE_CPU_TYPE(CRISCPU, CRISCPUClass, CRIS_CPU)
 /**
  * CRISCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  * @vr: Version Register value.
  *
  * A CRIS CPU model.
@@ -41,7 +41,7 @@ struct CRISCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 
     uint32_t vr;
 };
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index fb05dc6f9ab..a6a93c23595 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -56,15 +56,17 @@ static bool cris_cpu_has_work(CPUState *cs)
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
 
-static void cris_cpu_reset(DeviceState *dev)
+static void cris_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     CRISCPU *cpu = CRIS_CPU(s);
     CRISCPUClass *ccc = CRIS_CPU_GET_CLASS(cpu);
     CPUCRISState *env = &cpu->env;
     uint32_t vr;
 
-    ccc->parent_reset(dev);
+    if (ccc->parent_phases.hold) {
+        ccc->parent_phases.hold(obj);
+    }
 
     vr = env->pregs[PR_VR];
     memset(env, 0, offsetof(CPUCRISState, end_reset_fields));
@@ -305,11 +307,13 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, cris_cpu_realizefn,
                                     &ccc->parent_realize);
 
-    device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, cris_cpu_reset_hold, NULL,
+                                       &ccc->parent_phases);
 
     cc->class_by_name = cris_cpu_class_by_name;
     cc->has_work = cris_cpu_has_work;
-- 
2.25.1


