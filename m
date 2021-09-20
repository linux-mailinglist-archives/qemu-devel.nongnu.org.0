Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAC6412886
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:53:49 +0200 (CEST)
Received: from localhost ([::1]:55528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRES-0000Te-4m
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6g-0003fJ-Od
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:46 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6f-0002Fj-E4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:46 -0400
Received: by mail-wr1-x433.google.com with SMTP id d21so33517789wra.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=515hkau0jAwCNUY0b60zTLP6vtr2DuE4L4jJT+1axZ8=;
 b=fog9mSRk6oA4t721LaVRibVJUuKqBMtQ1MN45+qwdEv6n48svcjDzuAX5N/PydEznc
 u0PQX8UsFUiOsr8zB6jUor74VgiJpzDGIo8XmNpJVXVw9JXYmw63mY8kF9VGO43/z4If
 Ut9aeib+qSJQ4CzmSm30NzMqep7FmJC+An/mF8Yu6gJcpEVonjPiaHDr1nD4OmhCXtAg
 WO7eN9PbWgXT8d9c+GP8Gh2AxPLJgQVodDHiOAyp+ZEiuRv9GR7ufhQI/loT2yFRzjb7
 vQuIGa6RuNhzWlpTeQBXVMOC36A83zhEexb72t2UsTY2eKIPGHhDrBJYRFfsIUGjXjci
 rGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=515hkau0jAwCNUY0b60zTLP6vtr2DuE4L4jJT+1axZ8=;
 b=2B1i+4VT1ba28Vr4OL0zXA/ncbElJ+peD2Rv+QkJ7VSHhxO0ssqOAxVaOiuu6YKlHz
 KujBIkChTDgrSY7XxDrm1sRLwMWSndmMctVCjCLPsFpGYWZ7TsWrhBRUzWqoH1WU40KP
 5HN0KXkPU1tADDT+LG4CUkf7yV68fi51xRPdwdekHx+7pqHXchi+ZMkvHzI8TDS8ogr0
 ahrs81OjIO4HncoWD3DIaKdZI7rG54WE7OGN7UwGwNkTkNdx4cLBxyAELjJRfBSD8zNw
 nw5LRzMPL/a3EjVlspSooznpRSykykZ1GTrq5UBEWF4A30du02r1yl0/X/7r45RHrEnv
 RUZA==
X-Gm-Message-State: AOAM533AxOTJ7m8S5768kjpMKSJiZghbs6YQNxu7oXvNwgGsBDjAhzYj
 wu4C9UMOZ667ECWgvg0yMX0/Mq6I8NM=
X-Google-Smtp-Source: ABdhPJw+98ntD47EnCMN8zLH/vNXz5K23OdplBrNTJZBOMF5b2M0D+vJZvec8jXM7F0NuRF9wnV7Fw==
X-Received: by 2002:a7b:c92f:: with SMTP id h15mr1173537wml.60.1632174343985; 
 Mon, 20 Sep 2021 14:45:43 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 r25sm18515908wrc.26.2021.09.20.14.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:45:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/31] target/cris: Restrict has_work() handler to sysemu
Date: Mon, 20 Sep 2021 23:44:28 +0200
Message-Id: <20210920214447.2998623-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/cris/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index c2e7483f5bd..b2761f8b110 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -35,10 +35,12 @@ static void cris_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool cris_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void cris_cpu_reset(DeviceState *dev)
 {
@@ -208,6 +210,7 @@ static const struct TCGCPUOps crisv10_tcg_ops = {
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = cris_cpu_has_work,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -218,6 +221,7 @@ static const struct TCGCPUOps crisv32_tcg_ops = {
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = cris_cpu_has_work,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = cris_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -294,7 +298,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset);
 
     cc->class_by_name = cris_cpu_class_by_name;
-    cc->has_work = cris_cpu_has_work;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
-- 
2.31.1


