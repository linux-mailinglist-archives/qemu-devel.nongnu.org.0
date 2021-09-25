Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C841830E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:09:51 +0200 (CEST)
Received: from localhost ([::1]:50294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9JG-0004Aj-7K
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93N-00023P-Vz
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93M-0006Z8-F0
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id t8so36614823wri.1
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iR+hhecIhVQbqLgRtJRf7TAYJMYyVJckrOxOor2tvDk=;
 b=HNAlGShUBaXIHHNJ1tvDQ76+jvimHjnU+l1JquArWaP7lDWkPvlRPusz84wT9kIUhi
 tW/VEQgYTq3trLFG3vYk4EekXUfyN7v9aVZptCX5jEhMOHbLg8DbZu55eI7uLwX+T3an
 Ad5xEMjgSQfaI7NNL8ca9R8bvmI2OGXHILsFQJQ12L7DYS53ruI2sagNx46owkIDnyi2
 dJomFVxgfYIyJt5bzBWa6Jnsk2j+oyVQVY6TCVT0KvzCSxECaqo/GUYiG/wmPiDxjemu
 nifwqS+njyavNuLabIanhfKTj5ckxzR8iDqCqUx1gcsrMBBtwoJzO8pSZ2SyA14aig7G
 6S+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iR+hhecIhVQbqLgRtJRf7TAYJMYyVJckrOxOor2tvDk=;
 b=A/cpJM789/JId2LKymRGIGybSvdlDO9SGqWIGvcXN8XlNRRX3nKoVZvYZrlSE4n0L6
 fqy3cOUHs8mGE3PrdNdbtU0eTQ46f8OlwBYi611JdNYn0lMVz70jncqx2itpeNN65ptb
 i88A3X0BEwmX2Tz/TqSIsH+0pZKb2ctggm3nrVfMfWh4+IMdFuJWZGvJzNOM8qFAMKEb
 HwjZFifBEWdpGaSIQvpcK9OCHuNZAhOu+ni5AF0hVICO4z2XmS36EqrhxFA5ua0T5BmV
 BsQ+IvST24uNKKzP/fFpbnxXH4H3Wz+ALfQld/C0NvRJ5Et9DhaiXy4Mt3A5HSvR4PoM
 F3Bg==
X-Gm-Message-State: AOAM530ctNmTn6Y9YOqpI4GVUux6AvF8z87iD5p6vQAh0Fs1P+LQZnJ7
 rVdrb28u6ERZ9kai2+bUqHcLkriCK7g=
X-Google-Smtp-Source: ABdhPJxi2Q3mMbzzfO0gtkBajSb+mnjc07GQQOja/IL0tLlvFzUvACr4d4LcesVmyPUVgv6qatOpwQ==
X-Received: by 2002:a1c:48c:: with SMTP id 134mr6289159wme.137.1632581602985; 
 Sat, 25 Sep 2021 07:53:22 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 x17sm11722568wrc.51.2021.09.25.07.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 26/40] target/mips: Restrict has_work() handler to sysemu
 and TCG
Date: Sat, 25 Sep 2021 16:51:04 +0200
Message-Id: <20210925145118.1361230-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 00e0c55d0e4..3639c03f8ea 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -128,6 +128,7 @@ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
     mips_env_set_pc(&cpu->env, value);
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool mips_cpu_has_work(CPUState *cs)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -172,6 +173,7 @@ static bool mips_cpu_has_work(CPUState *cs)
     }
     return has_work;
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 #include "cpu-defs.c.inc"
 
@@ -542,6 +544,7 @@ static const struct TCGCPUOps mips_tcg_ops = {
     .tlb_fill = mips_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = mips_cpu_has_work,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
@@ -563,7 +566,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, mips_cpu_properties);
 
     cc->class_by_name = mips_cpu_class_by_name;
-    cc->has_work = mips_cpu_has_work;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
-- 
2.31.1


