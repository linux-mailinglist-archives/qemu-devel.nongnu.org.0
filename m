Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439812CF6B9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:29:07 +0100 (CET)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJZa-0004Cg-AW
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJX7-0002Ub-Ad
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:26:33 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:41089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJX5-0007uU-Oc
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:26:32 -0500
Received: by mail-ed1-x542.google.com with SMTP id ck29so7427880edb.8
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 14:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JGlIiXLZJkT4GiPWL5pmDBgkId7TCXyztkSEPETsoi4=;
 b=DFk79CltjsKdhEIvMgOg+QcNzNhGu6ffDSNsM5SZSPpGhjCrpJiIM0D37AdmNdJ+oI
 gm5xQAHdWZEiNCJhdTRpqjoy9ECjC6N+SyDqTRZ7whMwWSS0KD4OEZmTKJNz/zXC9fRQ
 By9ZW3M2V6qQqnePuwdPxpbOX81kyY5q9UUAkYZdi9dQXqwXbC6gkQT0gIuMcoTsm9X7
 xEOcLJjI+pj7vVaX+0LfALoAdStq8DoYrrj2oqsGFujtMBYb3HGpz12POEBRcJmFHRS6
 1JGrTupLS1GsuuMueUWfEqCDPk2UX9ikyzszqTtHA0r2KxoTcY0XX771klRC18GDjFWl
 J0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JGlIiXLZJkT4GiPWL5pmDBgkId7TCXyztkSEPETsoi4=;
 b=E6ToJfsSHq0SHuGe1N4lOO6Xg9Iq9sa0KSjS23vtwxa30lfUMu6W4bgtvI2F6TIBx9
 0JrEzyalO+N/9jh5uWD+2pGS63vqs8Ku/DbhDnSJuLhopgyTfsI/NalG9u9s88OvHNvr
 lwScoyBg94KsEHpiSqaVUHbiaihG+hK1DnFt1ZNihMJaPflX3UeN1XCWhoLxqEQQEmpV
 /EV3LqdFd5IdOHgqSixDDdfa1vZHofWxD0VYMDxdeT3RBByOydP9Pg3ymL73CavUtBOo
 FMHPa8UPhCAOwArUrrjN0sHLVi/WD6wiuaIlzp+LNL75Oo/6pBern1BCK2fZDxtc3xWQ
 6vew==
X-Gm-Message-State: AOAM533pKUDtoLrT6FLKqrvaduJWN0qUm2Ag22AGNPMQ4AnmhjwrAAV3
 BEx2KG7aVG7DC50tt7ZnFoQ=
X-Google-Smtp-Source: ABdhPJylbM4m8HxpleqxYEO3eboSL/U+VdadWcQh3NMuaQX/XYYHVGMncb+T414b5FHbpJ8pPi3iyQ==
X-Received: by 2002:aa7:cf8f:: with SMTP id z15mr6343705edx.17.1607120790374; 
 Fri, 04 Dec 2020 14:26:30 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id ch30sm4318562edb.8.2020.12.04.14.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 14:26:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 1/5] target/mips: Remove mips_def_t unused argument from
 mvp_init()
Date: Fri,  4 Dec 2020 23:26:18 +0100
Message-Id: <20201204222622.2743175-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204222622.2743175-1-f4bug@amsat.org>
References: <20201204222622.2743175-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mvp_init() doesn't require any CPU definition (beside the
information accessible via CPUMIPSState). Remove the unused
argument.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c          | 2 +-
 target/mips/translate_init.c.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index c64a1bc42e1..0db032fc5fb 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31767,7 +31767,7 @@ void cpu_mips_realize_env(CPUMIPSState *env)
     mmu_init(env, env->cpu_model);
 #endif
     fpu_init(env, env->cpu_model);
-    mvp_init(env, env->cpu_model);
+    mvp_init(env);
 }
 
 bool cpu_supports_cps_smp(const char *cpu_type)
diff --git a/target/mips/translate_init.c.inc b/target/mips/translate_init.c.inc
index 79f75ed863c..5a926bc6df3 100644
--- a/target/mips/translate_init.c.inc
+++ b/target/mips/translate_init.c.inc
@@ -989,7 +989,7 @@ static void fpu_init (CPUMIPSState *env, const mips_def_t *def)
     memcpy(&env->active_fpu, &env->fpus[0], sizeof(env->active_fpu));
 }
 
-static void mvp_init (CPUMIPSState *env, const mips_def_t *def)
+static void mvp_init(CPUMIPSState *env)
 {
     env->mvp = g_malloc0(sizeof(CPUMIPSMVPContext));
 
-- 
2.26.2


