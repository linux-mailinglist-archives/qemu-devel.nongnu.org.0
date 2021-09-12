Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13880407F03
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:37:55 +0200 (CEST)
Received: from localhost ([::1]:60058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTQQ-0002rt-39
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHY-0007nK-ML
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:44 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHX-0004t5-3F
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:44 -0400
Received: by mail-wr1-x435.google.com with SMTP id d21so3222071wra.12
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GXaRvDEZfehzg2dwPUmloJ/v3Sj8mJXi/7oJdo4QA54=;
 b=YTsHfl8xbPHY8fodo5DePZVX1BnTCN3SmEngJ1/Yjet/ndaNfxSqcxXHLZ8sLy8Rim
 FtfpRGFkpVvSCbxavlR5gq1BV3g4kHYLPJkqPQNeR43yPyLo3i6edqXjpvUjvtgSZlEE
 GLnHB0l2yEGJB6lom2CAmulu9R/lYCPawHD3IW2FpEoHNLshdzU+w2DBIjWN09CPndbi
 MHBUz7TT+VDXVecUS5FjTns4Zn7uouabHTmVlM7WvRhljQ/OnkhNXjzSlJqAoSGPApXy
 UziLrsxU7u7b4n9N7yaUGGO6NFyzWfSDQ1xeasJtCdHa4l2xLqiiqXGg43+23DqKGpdZ
 04CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GXaRvDEZfehzg2dwPUmloJ/v3Sj8mJXi/7oJdo4QA54=;
 b=QT326AF5sFyjUri4zdiO9C580uajMS/9qI0bDruCIiywMBsCPHkLS2iSiLhVTWxjNC
 cfrh4cGC1p0LDpYUA5y0twUBJGoTc0mQspqsSpCmZhcYWRkEn7q8k2NEwD2n4FAgW1q5
 nmZF91cYvNswMEfncLA+yiYNtVC20Nz33dRxi5R/1b3HhlupgJKcKh2b22Xie8PxaBB3
 hCiC066mocCx3GAOG1FAPLlwYvZhov6wZh5H9YYfjPOL+tdvjrFNLNR/yNr9xOpAwvOd
 8GJsOF2xjGZmwGrh0TsCfVenQJaYvdIUkH8ZpDWwD/ASg7YwMARCyq3RbDrejCPPzdCA
 Zogw==
X-Gm-Message-State: AOAM5322rdJQ1bg0Id7EzKNKnvzRo5VFF+fdRUBMsThHvdskAzP7S2sn
 bRCumSgEPalhgnYSJ7bEkwXqFa6cDfQ=
X-Google-Smtp-Source: ABdhPJxtlbhu2LWgwe2onvXUrcgfdQocbF1B8h5COPu9ZgxNGbtZCDp1n9qVwf+SUnBgiddmWjHOOg==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr8362608wrq.59.1631467721530; 
 Sun, 12 Sep 2021 10:28:41 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l2sm4733220wmi.1.2021.09.12.10.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/30] target/i386: Restrict has_work() handler to sysemu
 and TCG
Date: Sun, 12 Sep 2021 19:27:15 +0200
Message-Id: <20210912172731.789788-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c         | 6 ------
 target/i386/tcg/tcg-cpu.c | 8 +++++++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 04f59043804..b7417d29f44 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6548,11 +6548,6 @@ int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
     return 0;
 }
 
-static bool x86_cpu_has_work(CPUState *cs)
-{
-    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
-}
-
 static void x86_disas_set_info(CPUState *cs, disassemble_info *info)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -6757,7 +6752,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
-    cc->has_work = x86_cpu_has_work;
     cc->dump_state = x86_cpu_dump_state;
     cc->set_pc = x86_cpu_set_pc;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 3ecfae34cb5..aef050d0898 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -55,6 +55,11 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
+static bool x86_cpu_has_work(CPUState *cs)
+{
+    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
+}
+
 static bool x86_debug_check_breakpoint(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -63,7 +68,7 @@ static bool x86_debug_check_breakpoint(CPUState *cs)
     /* RF disables all architectural breakpoints. */
     return !(env->eflags & RF_MASK);
 }
-#endif
+#endif /* CONFIG_USER_ONLY */
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -76,6 +81,7 @@ static const struct TCGCPUOps x86_tcg_ops = {
 #ifdef CONFIG_USER_ONLY
     .fake_user_interrupt = x86_cpu_do_interrupt,
 #else
+    .has_work = x86_cpu_has_work,
     .do_interrupt = x86_cpu_do_interrupt,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .debug_excp_handler = breakpoint_handler,
-- 
2.31.1


