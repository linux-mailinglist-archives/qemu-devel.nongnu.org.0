Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90F407F02
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:37:39 +0200 (CEST)
Received: from localhost ([::1]:58428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTQA-0001nV-3s
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIK-00018a-D8
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:32 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTII-0005OF-Tb
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:32 -0400
Received: by mail-wr1-x431.google.com with SMTP id w29so10165107wra.8
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oUBogEzePDVOMR5F40RC1OgAVa089kvAJx/8ALSm6vg=;
 b=j3Zw0VmhO28r0SwLdm988TgKKk8+hC6XCQ1H4jW/OJN/UUAUfVEm9rCmvS6faiASe1
 HPqFfDPvdq8yNMUsiZy5+nU1l7X7dQgFjPCA5hBbHYLKoON+m9/PhLJfsqwWReCPTNKw
 g/eHfrif39Pp5befi6QHE7wgh3a6ulcM6fU/LIbY8IP1cmB+GT7V7tJFNpo0Zv0l/xyH
 Cduhdr7oh/E5AxAjQYZUMcqPldO67FHe42p3QxrJNH75ObATHvk/uAscO5h2AWpKJVdc
 gf6F9MQpmxnVe1b17gVN+MUATUqkwKJJj2FQ1abAjU3kAJhS4Vgz+p2voR5WP6XxiIca
 D25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oUBogEzePDVOMR5F40RC1OgAVa089kvAJx/8ALSm6vg=;
 b=lte9BEbZW4EqXSQ7+XqwjvAY1eSzUUyMlY1e/QbX/DnDPSnl9j2LZQLg8x4p3xeAmk
 muEn5X5DgQk68yYSl0VtjOt8bp/eDOqUMmuX42Evh8dJwHGgARpZTqCalGGTIIHbmihu
 +DMxhejR8orBq8cFkg+bMU7Ug1ND23ZRuowGYlnlWXnJqhudiCTkhrUGCnA/f+kHQQRL
 7EHPS80usaEDTF7CkeR3ksyFL3YSQZoM2OX2oIU7twSfOPkS162K+MP/52CvCjrgjsl1
 uTm/W0JE7Ggg6ju9CxjsPD5a3jXCYsde3kM6QehRmRZkXM76Y/PJcFJJUMJyaUzYoPLl
 0ucg==
X-Gm-Message-State: AOAM530R0TIgOWOoyrHV36CoiyWsJd5nFEWorOkYb2ocr+i2bZDqdj+5
 UU3NjE0kuUjdojuJ2cI6jouQ7Q6UX5c=
X-Google-Smtp-Source: ABdhPJw59tRy9+G/t5LY2Z2uIjUVsDhXe01mmYrmWTypExF05ov/T1eJbEpcccPlOV9sW3thahr+Vw==
X-Received: by 2002:adf:e387:: with SMTP id e7mr8517635wrm.199.1631467769563; 
 Sun, 12 Sep 2021 10:29:29 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t126sm4637171wma.4.2021.09.12.10.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:29:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/30] target/s390x: Restrict has_work() handler to sysemu
 and TCG
Date: Sun, 12 Sep 2021 19:27:25 +0200
Message-Id: <20210912172731.789788-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
 target/s390x/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3a..df8ade9021d 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -88,6 +88,7 @@ static void s390_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.psw.addr = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool s390_cpu_has_work(CPUState *cs)
 {
     S390CPU *cpu = S390_CPU(cs);
@@ -104,6 +105,7 @@ static bool s390_cpu_has_work(CPUState *cs)
 
     return s390_cpu_has_int(cpu);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 /* S390CPUClass::reset() */
 static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
@@ -269,6 +271,7 @@ static const struct TCGCPUOps s390_tcg_ops = {
     .tlb_fill = s390_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = s390_cpu_has_work,
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
     .do_interrupt = s390_cpu_do_interrupt,
     .debug_excp_handler = s390x_cpu_debug_excp_handler,
@@ -292,7 +295,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 
     scc->reset = s390_cpu_reset;
     cc->class_by_name = s390_cpu_class_by_name,
-    cc->has_work = s390_cpu_has_work;
     cc->dump_state = s390_cpu_dump_state;
     cc->set_pc = s390_cpu_set_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
-- 
2.31.1


