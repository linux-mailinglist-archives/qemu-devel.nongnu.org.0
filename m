Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A498B4128DA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:25:59 +0200 (CEST)
Received: from localhost ([::1]:48004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRjZ-0002WU-Ii
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6z-0004VB-HA
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:05 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6x-0002V4-Nm
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:05 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t8so26589142wri.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2wVO/8lNTdglwVP+4rQ9px8jTQizKXJBfsXgcLc7jls=;
 b=CdhLOGGk9wcYBoA1ic6uC2i7S4/qwzYgdwY3e7Iih1vK12nBhUrCUVblAH+HZEGmpt
 oTw0kgEl7jn1xcRF65K9ayqSsEMQeBLBRI+tnS8cxOHFsDiw3bmcUwuhJCoEEhil6LZd
 dVL+jz+MJ+vGHIUDvPdQjYxJcsEqg8XZ8xBzM5A0uCiRUERKolMv9epy1yhtBmGyMQHw
 iNebkhBmMj4+auptcIhpYeFF4KaEJZ8QB9G/kXiX2cU9wT60LXmoynE+A1gr6JjbAzGg
 lbF5wsoGab9+aQkKB8OyZYXrg/y5LBQPxFBKjV5k8LN81hmwMtUR/22ASXjZO9C0EIzZ
 1Niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2wVO/8lNTdglwVP+4rQ9px8jTQizKXJBfsXgcLc7jls=;
 b=ihoRIVapVkaIZCeVxRqPemkWMbnsFAzBGOHffmwRm2HxW1NV8S912sxMTk+WIPm+Ef
 UUCe/6qun7Pw8yOUv9ZewQiuZT8RSyRTWQcReLXffSHnU4HTqP/V8jAap7XRFBIemVKA
 GfLKbMKgSSmFvnOu4tBRAlZR4jC+pVYgXln1HM1Hw5fO0E9UL3Y7MoD+CTbfeYybDD2D
 lWHwJFYnPceymVI6NZ2UZUqmmw9Mo1GzP/VK/dBoNcdIal7zaqQJCNPybgxaOUJ3k1tA
 4+Q28jYwgBIrpGNBEZV4yMVHIiFYGJqdqthch1VJFftb+g+Owle9ek6xw05HwGkT++8h
 Gxkw==
X-Gm-Message-State: AOAM532UOk8Zbnv6U9hoRIQhxH+lS/5x8I+HazHsEPcB4O+OBKx36CzI
 Jy8mQ8kTP6Jeq8Eu2qDirbrFfmTMa+o=
X-Google-Smtp-Source: ABdhPJxUDcePurXZf1ITLaut7qiBIof3ld86cwxFRy70Y+rKW1r6cxoft/bQRkU0rlz/xIXVgGzuUQ==
X-Received: by 2002:adf:fb89:: with SMTP id a9mr472774wrr.164.1632174361984;
 Mon, 20 Sep 2021 14:46:01 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i187sm756289wma.0.2021.09.20.14.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:46:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/31] target/m68k: Restrict has_work() handler to sysemu
Date: Mon, 20 Sep 2021 23:44:32 +0200
Message-Id: <20210920214447.2998623-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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


