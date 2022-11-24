Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917B363783A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:58:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAko-0003hZ-TA; Thu, 24 Nov 2022 06:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkd-0003Wr-FW
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:45 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkX-0004rJ-Tp
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:42 -0500
Received: by mail-wr1-x434.google.com with SMTP id cl5so2106793wrb.9
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ZF6j0QSh9sYA2HgkILcyWukmhzzkxCNhgIX/8WMk28=;
 b=NAT4FHh2y5rfoCsN2LOyaBHUjKRRBGr4i2n+kh6KKWC9FTpJO2uKeVXKlXd67RYKfP
 1OcT1jIORmWT+rkZaYG4r9ZM2pMa75XvwYxq4h2d5Js4HqalHq4Dy3f7Kp91qEBiaVex
 hlc+82YG/1xfezhc/951gCNyri7JysQt4mpLodDf+8gGXagB5G+wnRrNXq4Cj5jrn/4V
 XGO0xAHBZRDm4JAjovVfnk1Ln4iic7UR+VoiwK7kh6b2lLsJFHWmqKQ4M3yIuTeGuG9A
 3CTA2in20ok/RxmkqYkVC/t7NMgwNqHrA/FrEWkeJS+MilCaJtjPjWeByuGIfuxM7o9x
 XWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ZF6j0QSh9sYA2HgkILcyWukmhzzkxCNhgIX/8WMk28=;
 b=ANEuDB15aPmPH1TdgQ3Kdpiv+gN0sTpE1CRFDVsaoBkkUb3lqPqJo1fzN2/ccsDKHP
 ZJsaaFNfmINIthsgxFKTgLqryZGg4qaBlhtc84+OxWtcRXXZRyB9IyTFh3ExccCXkwni
 QScjBiMgX2/PeWwwskPKAZM5hxCGUKeqLBQEpTHiBNijTCoftBqGLYNvUHtmC4Wezvmv
 bpmTslnMFAyDNRW0dRLG8hZaEYczkloDuGuPFu3ZTD0z18E2H6/A/D/mz1jSGv8tg/R0
 gAmWnIZCfs8mPsKz+Qo8tkesgo69Q0lQt+cNRDsYt/3natPT7oPDXac9zDAxghEaTOzI
 vKFQ==
X-Gm-Message-State: ANoB5pmr/cZ+9WB57Bf9+QJXl7x+gZkY0q9GyQyvtNYwKQoRtySn+W5j
 PgTvdrPC35OWTVr2UvAv3LCnxAr4GwzeoQ==
X-Google-Smtp-Source: AA0mqf7y3HAlyjrUnoy5KKdKEnubU9vlYS0e+UWj1AMCjANf18MWxcGzbeb1b1j3hJG5h0rLKV158g==
X-Received: by 2002:a05:6000:12c7:b0:241:c876:773c with SMTP id
 l7-20020a05600012c700b00241c876773cmr14540856wrx.95.1669290637064; 
 Thu, 24 Nov 2022 03:50:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:36 -0800 (PST)
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
Subject: [PATCH for-8.0 07/19] target/loongarch: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:10 +0000
Message-Id: <20221124115023.2437291-8-peter.maydell@linaro.org>
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

Convert the loongarch CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/loongarch/cpu.h |  4 ++--
 target/loongarch/cpu.c | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index e15c633b0bf..e35cf655975 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -356,7 +356,7 @@ OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
 /**
  * LoongArchCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A LoongArch CPU model.
  */
@@ -366,7 +366,7 @@ struct LoongArchCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 /*
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 46b04cbdad1..e8c42f17a54 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -452,14 +452,16 @@ void loongarch_cpu_list(void)
     g_slist_free(list);
 }
 
-static void loongarch_cpu_reset(DeviceState *dev)
+static void loongarch_cpu_reset_hold(Object *obj)
 {
-    CPUState *cs = CPU(dev);
+    CPUState *cs = CPU(obj);
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(cpu);
     CPULoongArchState *env = &cpu->env;
 
-    lacc->parent_reset(dev);
+    if (lacc->parent_phases.hold) {
+        lacc->parent_phases.hold(obj);
+    }
 
     env->fcsr0_mask = FCSR0_M1 | FCSR0_M2 | FCSR0_M3;
     env->fcsr0 = 0x0;
@@ -696,10 +698,12 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
+    ResettableClass *rc = RESETTABLE_CLASS(c);
 
     device_class_set_parent_realize(dc, loongarch_cpu_realizefn,
                                     &lacc->parent_realize);
-    device_class_set_parent_reset(dc, loongarch_cpu_reset, &lacc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, loongarch_cpu_reset_hold, NULL,
+                                       &lacc->parent_phases);
 
     cc->class_by_name = loongarch_cpu_class_by_name;
     cc->has_work = loongarch_cpu_has_work;
-- 
2.25.1


