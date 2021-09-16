Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D6940DE50
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:43:29 +0200 (CEST)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtXs-0006zm-8g
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLd-0001T0-6l
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:50 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLU-0002WM-7U
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:48 -0400
Received: by mail-pg1-x52b.google.com with SMTP id w7so6442282pgk.13
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lL5fiNGlIY2Cx7URLhUqVO158bdYKQAqHd9ebRpcjXE=;
 b=I482VBxoG22zQJUKBn36XsjhMlvJJnNyCt6ohJnf0IoWDBMdY2z7Nqeg9CVk8xnZQE
 lxHZ+swCm6oohdN/yj2OWibCjdQo5E780T/I5XDq/ma/Ww3Jv0QBtBnKUd7qgWefNz2M
 sMMR834R1mfpd45TvtXZGgYTxTu2j2OUq4fgG3mr25Z/Dm5XMNsqV6etTXNJc5RzlLM1
 PONUkt5f9f4JzUZ53Yq3Fp+xHxK64P5SXKIFsQFNdjLm0UPNabtI20xEwufj5hf5qXO6
 pNkIrLU3cWzR6tKcrjQHIqkKdv/e319pXwrdvr3UWm8Nss4YJto58cm2ZyP+WFA9y8Nk
 PxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lL5fiNGlIY2Cx7URLhUqVO158bdYKQAqHd9ebRpcjXE=;
 b=HJr5OFWfJW4eGEgrsNJ0bBzJAkofASKkRuo5rQWRqEu724oFQmWXE/xtIoLuvdBh/p
 kIst5gCixSNUWHPbGvA/jgj+TzcLxLIdSaWEBDNAKwna9/r0phR95KP9SuVy59gGmbBS
 WrfGClhcAYvpu0GelQzE9iGD+hUY1n6fBTt8z7US1YhykpTZ/Yqs3FcEBPcQIyFXxq+v
 ez8XyOhWrorvIFCWpUQXLBUhT6jc955uvd+gbwLItkQ2QnmFcR8jj7w/AN31x6Zs+xdS
 hbpiSNjUT30YmNXtrCb+aQUPge7aazAL2br2dtfFRYOQx9q/90j5z7fuJwQ/XEA6f8hq
 UEHQ==
X-Gm-Message-State: AOAM5310ho05y6DOZD//Rlcl1gT2obdTODGoBee8F6t8HtKuAETulueX
 zhxLBtVKrdlGSpIvwmKZ3vFBo3EfObE4TQ==
X-Google-Smtp-Source: ABdhPJzcAi8eSI0NqBNk7X/911jaIUZDtRqa5GmgD9zO0WYHxdZYGkWa5dPgfD3D0jU5xvX3Lw7w5g==
X-Received: by 2002:aa7:9542:0:b0:434:5a64:bc8 with SMTP id
 w2-20020aa79542000000b004345a640bc8mr5666157pfq.30.1631806238594; 
 Thu, 16 Sep 2021 08:30:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/35] target/mips: Restrict has_work() handler to sysemu and
 TCG
Date: Thu, 16 Sep 2021 08:30:08 -0700
Message-Id: <20210916153025.1944763-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-18-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 00e0c55d0e..3639c03f8e 100644
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
2.25.1


