Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4F416FE7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:05:38 +0200 (CEST)
Received: from localhost ([::1]:34896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTi5J-0008Se-2x
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhZ-0006A1-3D
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:08 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhW-0007jg-Ps
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id t7so25382557wrw.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h26pMLEnUsWrxMoqQtHQ2NCzZkcdqUGqN4k/9eCW+zM=;
 b=i2jgb4SG15wpDl0VMAQFSr1Uk8/q1R/C2bAbK7nfz1wKoH3oEdUogCeB8kPpkkrFg5
 fGwyFShCM54hUtUN5B26AzbrwEYxh+SrxNF7GIfDFAZUihESACkqIFwmKZ+aCxnhm+JN
 lzIXiK9gfSAVpsM2gX+dktjvdpajJ8HQcMKdeL2vzzOSd2NOQplJ+t379ort07PznYLW
 RwDcjvroIHR+n2TGnllT1MGz2Hzr2DHyC+dmA2vpUdP0bXnpBBf3RkrogWIEntkfVCNe
 4ANDPpecf+ym3d9ID+dg/yzvQTxwq/E+Wnm25Me2GYx4s+Odi3yDZs5CVH9Fd9AcYJOY
 3bZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h26pMLEnUsWrxMoqQtHQ2NCzZkcdqUGqN4k/9eCW+zM=;
 b=ApPbe6XRnznXX2GcK8NldourglLO1ClZKBmtxNSNUr3VzoHtcAeqeTCvFy//XCeW2O
 Ia4JqbCccgCgzs3Co1pJtU9oUtc9XDhjX+ytXYeKjQWHRuRCrg7sGY4gohBGt14I05dH
 LEFZCGgvR2eZY+kqufnpB2762w4U//t2toZ/zaE/OYXNInpNq8WXmHUBfWHmk3EJ0piJ
 COPOjC3zIMtahENzfJl9FTIAPGCmzm0GNgrEx1uOKIz0Gd35N3zgI96v5N5D/UT5cPBh
 jppud0CO6MNG2ybyz8Gj8Jk7m4twXq8dPDiJCkgIMVE1vrGv6pXIQn7B4Rjxp8rVuGgQ
 tVGg==
X-Gm-Message-State: AOAM532ulZNsR0G3ELwnL9QeBGAl7UgebHk95yKzox/W9v50tfonVe9U
 vlW3GRbwvvFE1iEzyf4XMnggvVvJPoY=
X-Google-Smtp-Source: ABdhPJxPBqdq6C+OkU1AIPNDoICIzsm27N4kVsjTxh+NKpZ4u90T5oKFLdfLyIPpAUxSCCkKYx3Vvw==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr10264279wri.62.1632476461266; 
 Fri, 24 Sep 2021 02:41:01 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 h125sm8123691wmh.9.2021.09.24.02.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 28/40] target/openrisc: Restrict has_work() handler to
 sysemu
Date: Fri, 24 Sep 2021 11:38:35 +0200
Message-Id: <20210924093847.1014331-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/openrisc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 27cb04152f9..3c368a1bde7 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -30,11 +30,13 @@ static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.dflag = 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool openrisc_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD |
                                     CPU_INTERRUPT_TIMER);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void openrisc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -189,6 +191,7 @@ static const struct TCGCPUOps openrisc_tcg_ops = {
     .tlb_fill = openrisc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = openrisc_cpu_has_work,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .do_interrupt = openrisc_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -205,7 +208,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, openrisc_cpu_reset, &occ->parent_reset);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
-    cc->has_work = openrisc_cpu_has_work;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
-- 
2.31.1


