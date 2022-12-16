Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ACE64F34D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU4-00061L-Rj; Fri, 16 Dec 2022 16:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITw-0005wx-3z
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:06 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITu-0000fE-EE
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:03 -0500
Received: by mail-wm1-x32f.google.com with SMTP id v7so2786418wmn.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JHNhVzZ7q07vjZsQq3XKlgrS7g2PS5zs14Th7/Xr78I=;
 b=dHHcUfTEe3uzd7KDM0p+Bh7WAxnBRKrUCEiZcuVdJdse7QHSYJnwNkF27ItWWbRry4
 aW9ZNCGPzUgklzofxwPWylpw3OuCceMsg5MDtOZ3mdsx7vEiYkRk4kmydZfazwL/ijP5
 1fWqkwk3w9aVzvE8mlM7Q3YXtEORO9y53W83LcymuHJxO203li9Yzeti0VZ6nXBpRSdz
 7AUl/jsy01h/VB8T4yyu/2RDFqTyg2WRlsdSTidvlQkagczpMlGERcU76QRpYRNkUciv
 CszSUZSRKyt6Wf+6viMwqJC3cj2IDAZcQrNx/W8Ms4ibucJ4DlNNUKSF1CPh5Se4rHRu
 ODtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JHNhVzZ7q07vjZsQq3XKlgrS7g2PS5zs14Th7/Xr78I=;
 b=BI6JpMQKuBnUMJut2+fbMR/S3J/v2CMCPsl6NbLrpdDmmgWD0P7nZ0+56lLTro9/ch
 3wDhV9S0y+7mBWlDfGq0e7Rp8wIWsVw6kgnooubbSY7h+lzVhLAjAbFAzrrk4Xpv23pN
 SX+UfcZGChbKLJem7eAd3Tf4OIJ5AVG7Kha6bfuouIAKwx6QFW1eSd9hmEmrO/2wn+NL
 jZBkNRN9axrqSEhv3Vc77VDYwVh2AnOlBL9ZjavhzN67eY3gEGrFyDcBCjdKrQoqASAi
 tbP1UfoKbWF+2gwv3XlhafRiiOPgTcQ+C+Co8jKX49CbvexBOOKUggmCcCDb3aZaZstw
 K9dQ==
X-Gm-Message-State: ANoB5pk+Oy9rz9T3UsoazeovKGM/nmqQvAftynXVt6ygWEN3J4NN1SEL
 SLAql98oydBsJqpy72HWCwr/5eEVg1rSS34G
X-Google-Smtp-Source: AA0mqf5Crdku8840QY9x2xZYfK35ia5qaAQE/44/jBle5ZoGOK0j88Kgx8Sy30CQexLvpPwB6kclXg==
X-Received: by 2002:a05:600c:35c4:b0:3cf:85f7:bbc4 with SMTP id
 r4-20020a05600c35c400b003cf85f7bbc4mr27647692wmq.2.1671226980957; 
 Fri, 16 Dec 2022 13:43:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/36] target/i386: Convert to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:24 +0000
Message-Id: <20221216214244.1391647-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Convert the i386 CPU class to use 3-phase reset, so it doesn't
need to use device_class_set_parent_reset() any more.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-id: 20221124115023.2437291-7-peter.maydell@linaro.org
---
 target/i386/cpu-qom.h |  4 ++--
 target/i386/cpu.c     | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index c557a522e1e..2350f4ae609 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -42,7 +42,7 @@ typedef struct X86CPUModel X86CPUModel;
  * @migration_safe: See CpuDefinitionInfo::migration_safe
  * @static_model: See CpuDefinitionInfo::static
  * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
+ * @parent_phases: The parent class' reset phase handlers.
  *
  * An x86 CPU model or family.
  */
@@ -67,7 +67,7 @@ struct X86CPUClass {
 
     DeviceRealize parent_realize;
     DeviceUnrealize parent_unrealize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 };
 
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ae502f0bfea..3410e5e4702 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5877,9 +5877,9 @@ static void x86_cpu_set_sgxlepubkeyhash(CPUX86State *env)
 #endif
 }
 
-static void x86_cpu_reset(DeviceState *dev)
+static void x86_cpu_reset_hold(Object *obj)
 {
-    CPUState *s = CPU(dev);
+    CPUState *s = CPU(obj);
     X86CPU *cpu = X86_CPU(s);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
     CPUX86State *env = &cpu->env;
@@ -5887,7 +5887,9 @@ static void x86_cpu_reset(DeviceState *dev)
     uint64_t xcr0;
     int i;
 
-    xcc->parent_reset(dev);
+    if (xcc->parent_phases.hold) {
+        xcc->parent_phases.hold(obj);
+    }
 
     memset(env, 0, offsetof(CPUX86State, end_reset_fields));
 
@@ -7111,6 +7113,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     X86CPUClass *xcc = X86_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
     FeatureWord w;
 
     device_class_set_parent_realize(dc, x86_cpu_realizefn,
@@ -7119,7 +7122,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
                                       &xcc->parent_unrealize);
     device_class_set_props(dc, x86_cpu_properties);
 
-    device_class_set_parent_reset(dc, x86_cpu_reset, &xcc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, x86_cpu_reset_hold, NULL,
+                                       &xcc->parent_phases);
     cc->reset_dump_flags = CPU_DUMP_FPU | CPU_DUMP_CCOP;
 
     cc->class_by_name = x86_cpu_class_by_name;
-- 
2.25.1


