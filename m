Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D91370E16
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:56:20 +0200 (CEST)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFOF-0006XY-BS
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnA-0006dy-Db
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:00 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEn7-0007xc-7H
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:59 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z6so3100941wrm.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8raeOnbaaLR0eMWkBaEAhhPOlsDJQegVcWQXqveM4CA=;
 b=Bgc2RmU7u1IHufQTOWtu+Od43Tjy33IXPJOIulK2o1FgpJWYNljoOdOOyXxoIK6pEq
 k6gsKq7MGiFc1+LZjfRIyAQIc3CMiNQ+dAY5F8xkdGrrF6fj7gHKOYL+kyy1kjsuhtS0
 HzWo8hCZ8WPGlBo31bdE1gTHmcqSen2+WPWlVx9gDSvOP9H0OlOLK5ZVhdKMzoIJz8DJ
 ccE9+yyJE1w24d5E+KRptOJMzrA0rVzjamXZVKOYfeLAV7gO6DCF7DIPuKnmq+3pfSaH
 6eW9T+thrnCf3lf5NZJJE1PfDAHj6qUHei5Q/R6Iy+B+3U82uwp7nUuZa4wJHf9WiM3H
 nw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8raeOnbaaLR0eMWkBaEAhhPOlsDJQegVcWQXqveM4CA=;
 b=tEgsJwpAA0IHuBgqqO+Q7Ao4dpmMUsjgwWaIaOZCxtik8BU8JVLYLyxaA0hjdT1HPK
 QWLmNRihqudNjBWojdCejuUMlldXSYg0qagCn532H7BeUAVFx67x/gzQbV0qmq637P1V
 ttEd0hfx50RHymr/JAzk6793br9Qksoyr3+rA3idhJGuyLAHF4oWIhhadfblW1M62OJi
 A2FaKD+hYTu70mgHxM2/bUshisJ+uKcbt03LIjEl8sonRYg5u1VDAAsXAZA4nzUegv1L
 TOLLHmTMCylEEG9V8sBYtm5HDnEsCJ3d4YULcD86WLrFK86XyOdxMjGyaxTlV2+71mW4
 fwOw==
X-Gm-Message-State: AOAM532A8PLxc6BpC6J0rEjiOoK9CtawDfABcGsh3dImzq+2Z+yAhtoR
 W++KQExOKPyBauvgb1bfrWXeFK9swJr9JOeY
X-Google-Smtp-Source: ABdhPJx7XXC7qpiUVeb4pzWHZgAwG58R+7jJPHf4GwG58kPekd1KIj4Ql9DXzew3uCCTaCCHjGuHoQ==
X-Received: by 2002:a5d:654c:: with SMTP id z12mr19957786wrv.12.1619972275751; 
 Sun, 02 May 2021 09:17:55 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id a142sm19403862wmd.7.2021.05.02.09.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:17:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/36] target/mips: Restrict mmu_init() to TCG
Date: Sun,  2 May 2021 18:15:28 +0200
Message-Id: <20210502161538.534038-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mmu_init() is only required by TCG accelerator.
Restrict its declaration and call to TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-21-f4bug@amsat.org>
---
 target/mips/internal.h         | 3 ---
 target/mips/tcg/tcg-internal.h | 2 ++
 target/mips/cpu.c              | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 6bac8ef704a..2c9666905df 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -233,9 +233,6 @@ void cpu_mips_store_compare(CPUMIPSState *env, uint32_t value);
 void cpu_mips_start_count(CPUMIPSState *env);
 void cpu_mips_stop_count(CPUMIPSState *env);
 
-/* helper.c */
-void mmu_init(CPUMIPSState *env, const mips_def_t *def);
-
 static inline void mips_env_set_pc(CPUMIPSState *env, target_ulong value)
 {
     env->active_tc.PC = value & ~(target_ulong)1;
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index b65580af211..70655bab45c 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -20,6 +20,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #if !defined(CONFIG_USER_ONLY)
 
+void mmu_init(CPUMIPSState *env, const mips_def_t *def);
+
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
 uint32_t cpu_mips_get_random(CPUMIPSState *env);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index a751c958329..c3159e3d7f3 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -708,7 +708,7 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
 
     env->exception_base = (int32_t)0xBFC00000;
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     mmu_init(env, env->cpu_model);
 #endif
     fpu_init(env, env->cpu_model);
-- 
2.26.3


