Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D882B418CDE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:46:11 +0200 (CEST)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcuQ-0003LP-UP
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdQ-0002Pr-KL
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdP-00063B-3r
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:36 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d21so46370603wra.12
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UE09P3+95R7azQiB3uAxKhFAUsJxXecPBFCz3ofDdJY=;
 b=nyWcoBadZ+pH8SsaCmOG3BSiKXQ9Y8mLrCl9+3L4g/sb1zi9YMV28pIRff0rp8phHk
 eLc0W159AE7lSRfU5YIXzl9CBy3eJioguy+5OptiG+7IefldrtL22EPWYvwO6KLI6nWI
 XW1oRpHwCLNif7xoKba0U5/rRsEjO2D1yP8+DcJ5sVP3FeI/sFgqJ/9uVl/OHpVJW0LE
 azccRPncLDsrSN43VFaDT7/nJJ/WhMz2NZZtucUqplFPXt4qfIHogmLiLYJOtLILbPUu
 WFUwVITszeRQ7v3pst12V9T7KwWspV5vYKDrnbgYmjvrgKBJpqSF3LDdXFykenafLUPJ
 hTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UE09P3+95R7azQiB3uAxKhFAUsJxXecPBFCz3ofDdJY=;
 b=Kg1LQX4BzygvZneGrCEqfXqzJZJA8G4HOZzNCar+ZZ66PiL1adjiF89TXCBdX/2GZq
 PaFegbAcft9Bfp02gi66zoiPMooTWIFjI6GiS+N19dzIij/rkc45CArL0f/pnePKGJaX
 /o+IqlsjKTZhkEGsspVyfXMBrkDAxDJdlEhRu4ifXXOy+cInOjVt/lEM5GVhwz4R0n4R
 iLIMRdh4h/6RNJoXoRLzlQZGWJQdPyaZzkUf80IfBewSOeAtEJxoiOMehgx8WHS1v4N3
 LqL/FaHFP1HIP6rJQj3vTd09vqHI68RqQwUUJQY8yyXXudwE41eBD0T29sOHUUQaPQva
 hDug==
X-Gm-Message-State: AOAM531gkjHW1paEn18YVRlvfyle9aBhbtcTiY1vE0eDLTaOwYp5WH5Y
 xJT4Z+v1bK2dV9S9+n8WPSkNSFZxsP0=
X-Google-Smtp-Source: ABdhPJwBdEZejMQzggbxY5t2LnMSIVuiO1V5gP6pPawrOr3W53f5ggIwRq5/DTr9GjO0tSMuzsqggw==
X-Received: by 2002:a05:600c:2312:: with SMTP id
 18mr11916668wmo.192.1632695313610; 
 Sun, 26 Sep 2021 15:28:33 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 g12sm1871783wmh.36.2021.09.26.15.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 16/40] target/arm: Explicit v7M cores use arm_cpu_has_work
 as CPUClass:has_work
Date: Mon, 27 Sep 2021 00:26:52 +0200
Message-Id: <20210926222716.1732932-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARM v7M cores inherit TYPE_ARM_CPU, so TYPE_ARM_CPU's class_init runs
first and sets up most of the class fields, setting in particular the
has_work handler to the generic arm_cpu_has_work(). Thus M-profile
and A-profile share the same arm_cpu_has_work() function. Some of the
checks the code there does are perhaps unnecessary for M-profile, but
they're harmless.

Since we want to move the has_work handler from CPUClass to TCGCPUOps,
the next commit will be more explicit if we already register this
handler in arm_v7m_class_init(). Since arm_cpu_has_work() is static to
target/arm/cpu.c, we have to declare it in "internals.h" to be able to
use it in target/arm/cpu_tcg.c.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 2 ++
 target/arm/cpu.c       | 2 +-
 target/arm/cpu_tcg.c   | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9fbb3649682..f20aeb97fa0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -177,6 +177,8 @@ void arm_translate_init(void);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
+bool arm_cpu_has_work(CPUState *cs);
+
 /**
  * aarch64_sve_zcr_get_valid_len:
  * @cpu: cpu context
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 641a8c2d3d3..4b08f717f64 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -76,7 +76,7 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
 }
 #endif /* CONFIG_TCG */
 
-static bool arm_cpu_has_work(CPUState *cs)
+bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 0d5adccf1a7..9a0927ad5d0 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -920,6 +920,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 
     acc->info = data;
 #ifdef CONFIG_TCG
+    cc->has_work = arm_cpu_has_work;
     cc->tcg_ops = &arm_v7m_tcg_ops;
 #endif /* CONFIG_TCG */
 
-- 
2.31.1


