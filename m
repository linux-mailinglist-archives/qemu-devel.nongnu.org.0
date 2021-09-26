Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115EA418B83
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:35:58 +0200 (CEST)
Received: from localhost ([::1]:37548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUckX-0007Gf-2h
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUceb-0005Q2-5S
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:49 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUceY-0006xD-NX
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id x20so1796097wrg.10
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfwVihGSy9lOGZEBuM9IdCHEDMq8ZD4Rne15ZYj/c70=;
 b=afeNVEQ6/xv8f96LyPIQNxPc4JquMWzJe+gKm30pdQyZDgucr4ZyS+o1h3KwcoL3OR
 6o2rO04twhAImniaI6MubQ4dW1zYYR8rvwznfRf0sC6WKhGUUY9rWDXUHtqL6eAwnius
 8SWjYksQ0SblM9QDx+Ht0sYpqHszxnOZXELQACQWrdZSmU9zkPL+ktLd8HOElOfkPlYJ
 2j1FoSmK0jUB9uN//pqLqFAs7yXCQ/DbvzJBCqMXPhFa6WmlspSNOCQSLCY48/pMD/YJ
 H91wOU6e+mryYGSwqzgS6OnazJ57fNZ0yp+KtjraT/aTcrVxtr1qN4ymcMNENWJpTCSk
 QyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KfwVihGSy9lOGZEBuM9IdCHEDMq8ZD4Rne15ZYj/c70=;
 b=ERTUbfUcdELCQ27SF8edE5uJ0exxelYujLVXQqRJjHHDpFfcpDlhyxFBGcYrNxPay6
 BxIlrGxzS4B27Et7XTCzAVjY6Cgyuyc8gGv2HJUqIsaeJdaDrJoI9JLUl3rG/j6y/c4I
 b88zc5J2+4WxnYe7kSFv8p7T5P672MEVnqC+6SoPC7AiWCL3b3bgehDcWWCb/+9IYJO6
 S0Img/RfLV6+ULZRHOgNUEgAeDhm7U01hsGRYiwR2mFhT34B2zFuqLYOyqycEOXFgpVf
 CnHIDrQHo6hWmooxYRltc/WaIcnQiBrcIhiOczxs85+7ctmHeDFxZv7xLh3xiDAK0Gq3
 XIuA==
X-Gm-Message-State: AOAM531lNSxntDgyI6Y6GlCzgHI2E8d/ozCj5xQ/c0MECAwqQKH4yhOv
 e/oz7iRE3vddGFDQOfU1JGZVobUgy70=
X-Google-Smtp-Source: ABdhPJxWdmHzw3ThFvNEOG75CUKPNCriHiIdJNiEBbViGothiXzeZjBS6z1KY4ct+i4aMd4PY4omjg==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr24157375wrn.83.1632695383982; 
 Sun, 26 Sep 2021 15:29:43 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o12sm14276600wms.15.2021.09.26.15.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:29:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 31/40] target/riscv: Restrict has_work() handler to sysemu
 and TCG
Date: Mon, 27 Sep 2021 00:27:07 +0200
Message-Id: <20210926222716.1732932-32-f4bug@amsat.org>
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

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/riscv/cpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7c626d89cd7..ca76bc34d9b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -335,9 +335,9 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
     env->pc = tb->pc;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool riscv_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     /*
@@ -345,10 +345,8 @@ static bool riscv_cpu_has_work(CPUState *cs)
      * mode and delegation registers, but respect individual enables
      */
     return (env->mip & env->mie) != 0;
-#else
-    return true;
-#endif
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
                           target_ulong *data)
@@ -678,6 +676,7 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .tlb_fill = riscv_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = riscv_cpu_has_work,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
@@ -697,7 +696,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = riscv_cpu_class_by_name;
-    cc->has_work = riscv_cpu_has_work;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
-- 
2.31.1


