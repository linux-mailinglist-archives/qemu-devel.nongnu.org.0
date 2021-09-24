Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E82E417030
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:17:52 +0200 (CEST)
Received: from localhost ([::1]:38376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTiH9-0005Tc-B2
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThi2-0006o1-TE
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:34 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThi0-00087c-JE
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:34 -0400
Received: by mail-wr1-x429.google.com with SMTP id g16so25542470wrb.3
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvtLk1KDYMk4Ooy/WV4tyGGjURyvQDa7DPky1rRpIYc=;
 b=O8O/BuCtEOsRv3EG/MV5m6RRBeFHeb/zYurn9WXZihmzcNZ/iE62/N7pPNJ2z6y/Lp
 OvR1k1hCbBL5obm6ba4zlW1+3Cvz4ACffwltL/w16wY0ZoK5wGt4EM6izo6H4JF0MkwV
 ebRDReS4A4kgKKnEUqU3eOvimx4hRDui1MNQQ5qimmzc+RLvkTNggbFqIuoobriBNotX
 xj0RzmC1/7Qe4zGicC9f21Wo+OBWaolvCwXuZDDvk/2/oKJ5T1KO4adVDfmomeSVee3w
 5MMzvGNETaB001uuaZneUr4f5XlK2PHq9+VQeCr+g+OE5qj+N+5sLj+bMgN8/7itb5WW
 SQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DvtLk1KDYMk4Ooy/WV4tyGGjURyvQDa7DPky1rRpIYc=;
 b=cUQA/0TWgERBR9MqOJx44EQ1VN8vGPZTmRf+bBvIh1R2GER2ci9YO4mj+yuNPDdZkn
 8JseJvPMaSZKurFo0a/2pkqvDhlnUX5wR987oom6WwAI0b/rCqu6OUCqlO1uUEZ7cFY+
 oQ6SA5s1z48CG0SJBN4UnJ+TqyC+7TLtqcShrZ9N1xmqtsb/w6TqmSL2/JsbgHiSQjQa
 fCckHjST+Zu7IkqpMwNiaIFj9dYmLAIEM3NxETmQVTXkjDEzQySnx8AI0LYE7WtDmeRX
 SGcrXs89ks3HhMDL6Mfw5Yvu9YTsZ+SqeLr5JgeRMxLblXzdFbmp81TSGNSajebIyoyE
 SsLA==
X-Gm-Message-State: AOAM530f4Bae1SCzU7vIUFSXt4orYgX3CEE/DvHLLZvsuH7v4r4RFfdy
 8pMKQOgFjtc2OmEW4Xbk2mZU09eVNLc=
X-Google-Smtp-Source: ABdhPJzNrU7LHvpCwWrtC7PGQEwHa0fyXmkhMcJnN4oz9SYBg7CWOoOkQE4RE77NglLogY3xpike3w==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr1035859wmh.188.1632476490917; 
 Fri, 24 Sep 2021 02:41:30 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 l26sm11746319wmi.25.2021.09.24.02.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 34/40] target/sh4: Restrict has_work() handler to sysemu
Date: Fri, 24 Sep 2021 11:38:41 +0200
Message-Id: <20210924093847.1014331-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sh4/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 2047742d03c..fb2116dc52e 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -58,13 +58,14 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
     }
     return false;
 }
-#endif
 
 static bool superh_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 static void superh_cpu_reset(DeviceState *dev)
 {
     CPUState *s = CPU(dev);
@@ -239,6 +240,7 @@ static const struct TCGCPUOps superh_tcg_ops = {
     .tlb_fill = superh_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = superh_cpu_has_work,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
@@ -258,7 +260,6 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, superh_cpu_reset, &scc->parent_reset);
 
     cc->class_by_name = superh_cpu_class_by_name;
-    cc->has_work = superh_cpu_has_work;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
-- 
2.31.1


