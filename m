Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD444182F0
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:56:03 +0200 (CEST)
Received: from localhost ([::1]:44620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU95u-0005qM-4Q
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92m-00019v-9S
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92k-00064W-RT
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:48 -0400
Received: by mail-wr1-x429.google.com with SMTP id r23so11143042wra.6
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bWsdPZ7x9Zv9ulmzVLDInqOVNAhrwd+vJJnOs6jG4pU=;
 b=Cksq2yuCp6td/OuLyG8ccivNvp1+E6LGgQDMV3lBxOCaAt4FiO8W/XTKzPZF2RHCIL
 kKACF6W0ZBRZ82yi6vgoWIgbn2nsQucr/Gp9wHgBbHA++KvqT+1WdaMctbl0syEkoA/K
 GNQWvGOGAZtZiC1E38gA0StwFfTga/mKHQGqtuobXN17ICje1mNw/xt8eTq3FphG4I6z
 IrigtgQ8uKy4koexICQwVktxIoSB5q2l2xUUBK8dtSw6YT2xOBMghKum3h7PtrjvisXe
 oLjBNL5py6MlAtezv1xzSW+Nb+xx6uVq83absR6Y+jUiQ6RLyvxG7/zEIbxbxnZ2GVXp
 5k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bWsdPZ7x9Zv9ulmzVLDInqOVNAhrwd+vJJnOs6jG4pU=;
 b=ocUKx+sRX8lXm5+OKB7cZuSheFQDBTFueFFA/nhfOXzhSa/j5Xl7FkrcDsh+jQ6Z87
 GWtq/TrLtLAIpDrPnmW2bN5gr3Ekt8CWb4uum/1iIXZDry9QdfGNqRCNyGlu+ndycztE
 JS/V4IekZPk4ns8kK9rMqYc8xAQMOnRJMmdGk7pq+J89aZNfqIKVRPDOcfWJjfYAGQ67
 n006SsWaeteBSuTR1iWbzjLMIMW1/Yqpgo429LNpEenQEXP6qDhJeLfbhf9a4fyiB3Wx
 /bmTD4oMNAjzAVsTimRi3SaKIGNvqFuckZVCTIhRxK7j9JA76Kwfl9T7CxRCBeQk+CL5
 cGWw==
X-Gm-Message-State: AOAM530WX5KuOlVtLd7C16mP/4CgqDAULXVNFbzcXEkpB5wDWrepa2rx
 DmB7N5fiGoWRbgSyBbSneD200qB42bo=
X-Google-Smtp-Source: ABdhPJz9lINzrUuspP9ImzmXh+Qif2eKXDfMUELYDmGVulvpCpqzY/hh9drkQpcYHEER3qwNtueWvQ==
X-Received: by 2002:adf:ce89:: with SMTP id r9mr17367551wrn.238.1632581565365; 
 Sat, 25 Sep 2021 07:52:45 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 135sm16635464wma.32.2021.09.25.07.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 18/40] target/alpha: Restrict has_work() handler to sysemu
Date: Sat, 25 Sep 2021 16:50:56 +0200
Message-Id: <20210925145118.1361230-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/alpha/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 93e16a2ffb4..1ca601cac5b 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -33,6 +33,7 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool alpha_cpu_has_work(CPUState *cs)
 {
     /* Here we are checking to see if the CPU should wake up from HALT.
@@ -47,6 +48,7 @@ static bool alpha_cpu_has_work(CPUState *cs)
                                     | CPU_INTERRUPT_SMP
                                     | CPU_INTERRUPT_MCHK);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void alpha_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -221,6 +223,7 @@ static const struct TCGCPUOps alpha_tcg_ops = {
     .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = alpha_cpu_has_work,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
@@ -238,7 +241,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = alpha_cpu_class_by_name;
-    cc->has_work = alpha_cpu_has_work;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
-- 
2.31.1


