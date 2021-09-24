Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DFA416FFF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:07:50 +0200 (CEST)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTi7R-000488-RA
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhF-0005cv-4e
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhD-0007SO-OG
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:44 -0400
Received: by mail-wr1-x433.google.com with SMTP id t28so12107788wra.7
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2wVO/8lNTdglwVP+4rQ9px8jTQizKXJBfsXgcLc7jls=;
 b=FgN+bzODD3/vzEgURNAkBOlFqtH0gPJBUL248NhSx2xNQIZYxJbTmst8H0ZzsPi2Si
 hxo1/lPk+VVUNQkUscAKHO3f0aMaSqCyEwi6EK+nWFD7adZFBiSzzp3lATJxV46Lo9tC
 TxgEE9ZlfNbjCkbN2c/GGP3XnZesPiTMlUHZ38+IZ3s7vQvt5E3z7HwTVyG+1gkj+IKl
 BaXGUNKXxWiD1s0oFAjL4zbo+JTciYA/oxxeUUTtYL9x/ZuOPAEifpiGI283VMn1MrEe
 F5gASGt4MTPjfsvhGsHy4SQWnTO54I7wmjhCunRhBPIj2YCJ7aaffi2HAmBNUdI6RVVV
 opcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2wVO/8lNTdglwVP+4rQ9px8jTQizKXJBfsXgcLc7jls=;
 b=kpl5EWM00bGXcMWNXseT/3RYT2Fd6JF09fX9lf9AoDbzm5TEh5v5xXPQsixVQxCVnd
 xhrBhNBS8Izt2liHR/TD5SNPz108Qg1hRoZw8ondTva38uvcdymwWWPZUqN92RxZAw++
 3rzaoNaAhEDfZj7FSAAcWLMskuUoLYTWVxW3hDl7kxWP8m80HNy4ftM72IzKbeSTvmFT
 a36Hoo1YYBed4VIYwG4cAKGZ5rIWTwHZUoCngO71p+AAudimopHESi29U5Hh0uz2VpFg
 Q1+YqFq0P4p/p+FoHl2JvYVgt0tyMx239dkIh+Lm1UC6gPm/SdB3C9oDESVtpYHbj6xW
 05rQ==
X-Gm-Message-State: AOAM532GrvRYsFvZuZk5LzKHdLwJRWHUK+J/blcyrz6cBSIcfbfWOz59
 1K71pFIrazx83bcFnelZL3aW8hoQlkY=
X-Google-Smtp-Source: ABdhPJwoMYy0gpKYQ/1CTpDbgpZ2qrGlFUwIVBPLDcWyjY8RwvmwKJ9g+LFxUJVipkH/eM8ljaSVtg==
X-Received: by 2002:a5d:64c1:: with SMTP id f1mr10274123wri.422.1632476442059; 
 Fri, 24 Sep 2021 02:40:42 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 k6sm11192127wmo.37.2021.09.24.02.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 24/40] target/m68k: Restrict has_work() handler to sysemu
Date: Fri, 24 Sep 2021 11:38:31 +0200
Message-Id: <20210924093847.1014331-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
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
 Laurent Vivier <laurent@vivier.eu>
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


