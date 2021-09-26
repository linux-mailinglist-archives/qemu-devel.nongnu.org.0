Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45344418B95
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:41:40 +0200 (CEST)
Received: from localhost ([::1]:55880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcq3-000314-BI
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUce2-0004D0-Dp
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUce0-0006Wn-Un
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:14 -0400
Received: by mail-wr1-x434.google.com with SMTP id d6so46341330wrc.11
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2wVO/8lNTdglwVP+4rQ9px8jTQizKXJBfsXgcLc7jls=;
 b=MZ+YNdm+PPVCfa0H+PUCGt5o3W7MxmPlymM/4l1jkbLlyMs+g2/kLTd4PIdUHpi+YZ
 RSSQP9jXfiulCWqIa90EvJ1RSJl0o8ZUwJnFLkLxzX1FgPUyQ7V/myg52xuw7OH5ddCT
 oojF//rAWHjEhrNetc8/j9O4xSCcss/9P69byZa3akuJ0+64exRVh7V0DZcbas5Dj2fo
 XnaJI8wxjSO/c3jvnHsIqhoO46suRm8EzACD+tE9VSQWH2DW7JAf7qdUJ84NW2tsfDQN
 9ZirBew5UdiG1Uv3CRT1jboahNm626thBBw0MnRHapSzweRmseq48mypMEByuf/k2De0
 tuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2wVO/8lNTdglwVP+4rQ9px8jTQizKXJBfsXgcLc7jls=;
 b=fZ4iLGHEq+3XD9MjZwuOZayfF91Lk3KINgqybUhnyWduEuJcxVGgcrVQzXS9SsK2Vm
 pdX6QI2OMzJIdATJg4w2RLHvD9lZcjbqkMC2u9H1lQEV83NgtdEcKrpB5QuMHfB37RiL
 3QE2fupl5DD/+plZ4SWJt5LsXsezjpfhA4QRoTszsbEsyhyS6eETBNH7OBAtznQpN3kW
 +ZV1T2n+9efRsBwP91Hj6AL+WnG8+wIbPKdilboZEqBa+gJix8Kt0B/K3EvRAg2wApM1
 EaHD02eZvPNqxpqI1DiJ6CxG9/kwxTfj7dviCxRIRVusKHQMHEM5xnzTdd69BlVxqDGi
 I+CQ==
X-Gm-Message-State: AOAM531/dmSnFkzULv0qROeBrAs6UQnMNGs5iycCL+tlzRmaLL6NRwuW
 Qw679Wm/yY1GdfSB1WrwNUXxwTD+/AM=
X-Google-Smtp-Source: ABdhPJz59Y48FUCOG1rvt7ODG0HO9JPAEY8fF5bjMDnfEhPoTVqkLnwC/KBxjkmaJCudzJQe7e1hJg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr732304wmk.180.1632695351581; 
 Sun, 26 Sep 2021 15:29:11 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 s10sm15013558wrg.42.2021.09.26.15.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:29:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 24/40] target/m68k: Restrict has_work() handler to sysemu
Date: Mon, 27 Sep 2021 00:27:00 +0200
Message-Id: <20210926222716.1732932-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/m68k/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 66d22d11895..ad5d26b5c9e 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -31,10 +31,12 @@ static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool m68k_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void m68k_set_feature(CPUM68KState *env, int feature)
 {
@@ -518,6 +520,7 @@ static const struct TCGCPUOps m68k_tcg_ops = {
     .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = m68k_cpu_has_work,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
@@ -535,7 +538,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = m68k_cpu_class_by_name;
-    cc->has_work = m68k_cpu_has_work;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
-- 
2.31.1


