Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057BB637804
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:52:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAkq-0003kV-4a; Thu, 24 Nov 2022 06:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkf-0003XL-SG
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:47 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAka-0004qF-RM
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p16so1123715wmc.3
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YH5A0XgSQ+x7lqY+JmUugpzZ5SHd9m7aavem37GWINU=;
 b=uysoE+ljouGnQ5ASsQhEK0UBx1Xru4DBOsbetk0ixTQF5fGYKtqYw7YO1upKLRGXfp
 3lekh1OyKhtMXg4GmIrgJGWi3lbcqmW6oq6oc3N9rtrk1x5z3W3f+6obEnPC8i6SWxt6
 YAcE+Q83VF+ks3p1FGqwr3aK2Dy7JssibAsN42gyI/rgyJHKyt/XgnRwcdwisY7Z4zEF
 lkJJf1aO8lWtHbf+izUuvlvv3uww/BXroyDyZnrdsKyJhPay70He3NlwGYSvXAtPqJtH
 1wjebi9bqHMk8yDoKpZH5JUrbulkTWpz32Y1lLC3dxqFR1jBQkKx86lhu4fVnMB95wAF
 /WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YH5A0XgSQ+x7lqY+JmUugpzZ5SHd9m7aavem37GWINU=;
 b=QLKW7CoAy+BFZox501pCFZhPSO1vNyAHZC1ysAnphec2j+vsnOhNO7G91YQyBND0Jh
 fyK6dqzQvbUu6hKOZSYkb5JnQtq03csL6SQK4YyAkkoAQsKCFYecZ6jIbqZVvcIBArUF
 9ChGEAkJZxHL3QocbqdkY94Ie+EyzeYo0Ol3OoyWwt5jTmi5osz9U6D+vsD2m6HIAuBj
 DKBSFmo4k2TMp0EPy6VgCb+B0e/dIxbHfHAUF3K7YaHhmlsWvhhioZFs7ezkmlW1Evsp
 oYABmZ9c3hE2IdjEJTDPz0wKjJ/pH3b1PkEzz8vp2RVHwMJK7+0hTW+bhChDldxEeM+j
 JTkA==
X-Gm-Message-State: ANoB5pkQux4ExILuEaa12msItwAsip5IaiUKy8MUFiUJvVDy5K/ra70v
 aJ4fWx6uOOjXoZB5qD74jGYkm5PpZyKstw==
X-Google-Smtp-Source: AA0mqf71DwbHt5cW/l1+eEggiP1m+7BT0oZX+XrsPjB4HwciNFz8awwvaz9vZKDY/b43CKyBNgP41A==
X-Received: by 2002:a05:600c:4e0b:b0:3cf:e850:4437 with SMTP id
 b11-20020a05600c4e0b00b003cfe8504437mr12993161wmq.51.1669290640170; 
 Thu, 24 Nov 2022 03:50:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:39 -0800 (PST)
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
Subject: [PATCH for-8.0 09/19] target/microblaze: Convert to 3-phase reset
Date: Thu, 24 Nov 2022 11:50:12 +0000
Message-Id: <20221124115023.2437291-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Convert the microblaze CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/microblaze/cpu-qom.h |  4 ++--
 target/microblaze/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index 255b39a45df..cda9220fa99 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -30,7 +30,7 @@ OBJECT_DECLARE_CPU_TYPE(MicroBlazeCPU, MicroBlazeCPUClass, MICROBLAZE_CPU)
 /**
  * MicroBlazeCPUClass:
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * A MicroBlaze CPU model.
  */
@@ -40,7 +40,7 @@ struct MicroBlazeCPUClass {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 89e493f3ff7..817681f9b21 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -162,14 +162,16 @@ static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
 }
 #endif
 
-static void mb_cpu_reset(DeviceState *dev)
+static void mb_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(s);
     MicroBlazeCPUClass *mcc = MICROBLAZE_CPU_GET_CLASS(cpu);
     CPUMBState *env = &cpu->env;
 
-    mcc->parent_reset(dev);
+    if (mcc->parent_phases.hold) {
+        mcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUMBState, end_reset_fields));
     env->res_addr = RES_ADDR_NONE;
@@ -399,10 +401,12 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     MicroBlazeCPUClass *mcc = MICROBLAZE_CPU_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
 
     device_class_set_parent_realize(dc, mb_cpu_realizefn,
                                     &mcc->parent_realize);
-    device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, mb_cpu_reset_hold, NULL,
+                                       &mcc->parent_phases);
 
     cc->class_by_name = mb_cpu_class_by_name;
     cc->has_work = mb_cpu_has_work;
-- 
2.25.1


