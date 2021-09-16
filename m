Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF96240DE56
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:45:01 +0200 (CEST)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtZM-00026A-Rc
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLT-0001KS-Q6
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:39 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLP-0002S0-EW
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:37 -0400
Received: by mail-pl1-x634.google.com with SMTP id v2so4089297plp.8
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gP5Ac48Ygfft0H1EsMdA6mk0u3/jlbxiZGs/HX9oV80=;
 b=reRTrn4YS09XgwIqmIE5sE98aKB3UCDjos5N0DV+fGXi5UbkooZpUCpGT/DVAqjaHv
 uAbxYFOAaZ0uVMSks9KwJdvfHna1TKk0KutR+6wcZi15ZVSmB+blM4s6S20CntmCHFzW
 +8oeARJtDhzDTJtFqx9wdKEVfd981jTwx3+jJ1Mn8iluVLIXEpP73HfTKlED3fiSD26T
 MGdxgbiiFtzn834NK4/fhxAU0oIL41G+9wIpBCa5UQ/tz8rrVL0fM4nqC+nXLpezZh+z
 Mgbhu5lEtqfFNHnlFwEkKfZDVp2KLbV446/I761f62qE90hLyzybi4DKqUcxL41qVxjl
 fYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gP5Ac48Ygfft0H1EsMdA6mk0u3/jlbxiZGs/HX9oV80=;
 b=yh215zoFz/oHIfS6wE6oAgzfmrkjlAP2TAw/BX4WSdISxjnurEbGQOzNr5h7hg+h7P
 FidFSEGnDMRtj5ZC3vq4H4uflZPSq+/j1Xl8Bc9/kUix6NU7CucWxMrJgqoFp/shCd8v
 8F7MtBkWcLDLHrLT6jZ55xwCbceGEMzhgBHuM5a2F+PGL1pXpJ2wFDnsw/rCg4wVKrBi
 IJDQf2AXyfmmzXVTx+3UWkhQjwtFZwp3m7ko7PVp1ZSYKCdl36r82GdLjfBw8YaHkXZ+
 Pgp5+jP+PJtmxm8Ao8vzBxsmoR0vEIflUhepTgZgC0DR3y0I3poKy3+egCQa7akwuXk4
 wleQ==
X-Gm-Message-State: AOAM533kufZs/oU6VO50mQ7N+U2fxdJKDf1qcoVTQ9h0QIhmhpd61sYM
 a+vWfbX0ioBv2bBGhmjZSO/y3SHGZLJ+XA==
X-Google-Smtp-Source: ABdhPJxQfJ1aZaZSQhXGc3os7lisS2XUXPuCHr1evdplTwCHACHcih9H2OJEo64aQGgZrHU0xHQVeA==
X-Received: by 2002:a17:90a:578e:: with SMTP id
 g14mr15720522pji.184.1631806233275; 
 Thu, 16 Sep 2021 08:30:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/35] target/arm: Restrict has_work() handler to sysemu and TCG
Date: Thu, 16 Sep 2021 08:30:00 -0700
Message-Id: <20210916153025.1944763-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-10-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ba0741b20e..e11aa625a5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -73,8 +73,8 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
         env->regs[15] = tb->pc;
     }
 }
-#endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
 static bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -85,6 +85,9 @@ static bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
 }
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* CONFIG_TCG */
 
 void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
@@ -2017,6 +2020,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = arm_cpu_has_work,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
@@ -2041,7 +2045,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
 
     cc->class_by_name = arm_cpu_class_by_name;
-    cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
-- 
2.25.1


