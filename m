Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02944407F19
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:58:40 +0200 (CEST)
Received: from localhost ([::1]:47212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTkV-0007U7-4I
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIi-0001qg-Dh
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:57 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIg-0005dp-Vq
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso4977831wmc.1
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6iT0mYKdizTZwY+Alp0nWU9C8rVfDyZdw7MbXpCAAA=;
 b=JhLTXoCqn17oNOLyPMo1ml6TixwxjYOBTgo15glCNDXNsRTaCwr+P7P8QBjR/J23HG
 QWD0k/PG+VV1A925SO0bVdIgs4UnwiHOmlpPYAFryzls6O6fC/1lakKTmez/DbsXWLh8
 f0ij+sfeT722cDzxvF+c6nGuwSF34mACoWwXeytiuKO/OCtp7qQf80EvbnFexnLCUfoH
 HZU9ejpj1UghPyTj4CWDGaGUtHxIOn4P0yZng0psFrLzkNRTqMbeaTfUNcVZwCidstz1
 cg38gSk7RyvwxC9caO91u22JLC8CsDu2zQzbSVyR73mymEFjWaFfuT/VMjEh8pCjFYeM
 FHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F6iT0mYKdizTZwY+Alp0nWU9C8rVfDyZdw7MbXpCAAA=;
 b=nuj6BbCX6MLHRYyZUM3whsOrumRIVqkdr/+GcGZcz+wgx2ZhIUH6TVl5Q9FmbHJbXU
 iP2nuatEyvOv/1V9grlkKvXaQBHDbtlju3VdiKF1DU3INOuYdSQ7NkXAr9/s9iIj14zV
 EcpudF/cdZnqcC3hZ+fdzwUAyqUckxT87MroRl0ajacS8VjsC0U04uW8D0wtYkv7TTWj
 YC37ocUrrKWGUgA6SMuSO87ALjzjot1ffvLloM7UMVk7rnKdmQJxmDYUEFqpDXO7SiKP
 kXh7+GIDeTwYKnttokkE3i35JIZh1CAZkIV6detWR9V+rfsUV1Ejhn4Q5oc3vYPQqTcx
 Nw7w==
X-Gm-Message-State: AOAM530Tw82ZSED+SiVgH0nPlju2aRIXyYM1GsAMy8D1+DaAAkntTNUt
 p+zcnNhcNBnbA97O8xt2/VgvpyMT11U=
X-Google-Smtp-Source: ABdhPJzoErEhv2Uj351OA1TWcZDrIFMarqslKLkUplt9vbyRW7yhVuTgIJb0DHAEiBFMWsh+CDmk6w==
X-Received: by 2002:a05:600c:35cd:: with SMTP id
 r13mr7514359wmq.24.1631467793517; 
 Sun, 12 Sep 2021 10:29:53 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l187sm4591213wml.39.2021.09.12.10.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:29:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/30] target/xtensa: Restrict has_work() handler to sysemu
Date: Sun, 12 Sep 2021 19:27:30 +0200
Message-Id: <20210912172731.789788-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/cpu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index c1cbd03595e..5cb19a88819 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -43,18 +43,17 @@ static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static bool xtensa_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     XtensaCPU *cpu = XTENSA_CPU(cs);
 
     return !cpu->env.runstall && cpu->env.pending_irq_level;
-#else
-    return true;
-#endif
 }
 
-#ifdef CONFIG_USER_ONLY
+#else /* CONFIG_USER_ONLY*/
+
 static bool abi_call0;
 
 void xtensa_set_abi_call0(void)
@@ -66,7 +65,8 @@ bool xtensa_abi_call0(void)
 {
     return abi_call0;
 }
-#endif
+
+#endif /* CONFIG_USER_ONLY */
 
 static void xtensa_cpu_reset(DeviceState *dev)
 {
@@ -196,6 +196,7 @@ static const struct TCGCPUOps xtensa_tcg_ops = {
     .debug_excp_handler = xtensa_breakpoint_handler,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = xtensa_cpu_has_work,
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
@@ -215,7 +216,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, xtensa_cpu_reset, &xcc->parent_reset);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
-    cc->has_work = xtensa_cpu_has_work;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
-- 
2.31.1


