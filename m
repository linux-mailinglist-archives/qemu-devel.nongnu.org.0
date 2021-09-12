Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0442F407F01
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:37:05 +0200 (CEST)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTPc-0008Ks-2Z
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTH5-00068q-LJ
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:15 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTH4-0004bg-6r
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:15 -0400
Received: by mail-wr1-x434.google.com with SMTP id d6so10901344wrc.11
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oPh/K3P8lnOCu8w0iWaCapa14gPkR6lDKFebYBGUl3I=;
 b=dXJ4QYAvPZQbdHB4twjNThmx7FnJYGb3ffCVR7wYiISSF8+ue2qj3fRkWyM9ZXSEcQ
 WAfVNRF6DLFKdDJFJCctnySwM4Pe6QZe4H3nosbypAK+uiU8FxJoZ8qYzHTF/ZLWgMYy
 wMbEc7wvJZchCB6UDkFFl3t6dTz/newsCar0O6eCWZdAfE+LJPuZ4UMHWAziG/JRJu7E
 lvduJf5yIlPBtuRen4rgWFSj64Wm75QSaZcEhSEmr9By7CUoT24XrKvMLANN2wwNEAuq
 FS/GX47ipf++ijIxmfW8mUW5SPXlfFhm6gRxuPLz/XdpwBFc3nRRd+Oqf12byzRnF0q5
 FWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oPh/K3P8lnOCu8w0iWaCapa14gPkR6lDKFebYBGUl3I=;
 b=trZ1t5nueE8CfEB7ubyX1pN/hOvoQpLTuY6Fb7nRxSCZXcavRSpg0dblMOaddttl6W
 btndusd9nQWwLbOhhqtzTozeABC43lN32V4RT3XJiRo8GP64fglrZh8+JQghfUL04cMO
 tOGvW193GrqgmK0Xle2yqw/Yqgv/+DshxUj4UblgWk621Y5CmmPDovOgNOaeqdrAmQIA
 En2qmfj1JUmjiwFroFHpsMla6xkaImzcDhrgZvwOJ93F3Q2oMN65MPs1Zv69BNgvb+h4
 x+BRR/ZaDEDZX3LEmxNgsTeugRbgaSzgB9UE6NoZD/X/gE+GhJAfQLSYfii7PW81jdCs
 XMwQ==
X-Gm-Message-State: AOAM533VdmfwqNrgSEQU5Sq0PtLqJi7Kxk1J1hMyNbxUouSSwnVXxSu6
 BQW+suQg87kmXeB3dZlLTlVGo3r3TIA=
X-Google-Smtp-Source: ABdhPJxNRbH90H0I3CBE9cwVoCPxnsiiq/r935CJfxgwk82/8UcByK7xhi5NGN5U5Jeylo5eFXnzdA==
X-Received: by 2002:adf:e408:: with SMTP id g8mr8433095wrm.138.1631467692734; 
 Sun, 12 Sep 2021 10:28:12 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o17sm4980427wrj.96.2021.09.12.10.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/30] target/alpha: Restrict has_work() handler to sysemu
Date: Sun, 12 Sep 2021 19:27:09 +0200
Message-Id: <20210912172731.789788-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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


