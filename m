Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872783FF086
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:52:43 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLp18-0003ts-97
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoVG-0006A3-Gj; Thu, 02 Sep 2021 11:19:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoV1-0003Tr-Lc; Thu, 02 Sep 2021 11:19:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so1631503wms.2; 
 Thu, 02 Sep 2021 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vwS6/PSiFfORBC8iBDJIdxzHLNrE+ZV4b02jLjMiM6Q=;
 b=qWE4fzBgWDNeyBRMwXb2DFthONkFk5E98iEerGQs32XoE/SqlksBPajM5cV7HOgMxK
 /NJCUFuN5ALKhHyRuHL8lpCNVVSvS3H9YyrX2yuGMR0DfbVjw0LqZpIUv1dp3hO1LrIF
 Z5G+E5Pk7bMWNGICP03wAO9geV0KChMLUM3cDgRUcREcnvPQdK+loUhQlw16a9Eo9TkN
 /PtMIxiU41A6GWGKR2Isz1nfV2i6+XcXLrv7JZ+PCyjVoCQrYWr/nKjfHzDpGq+hwzRa
 tiZk0rD8lQwu+cIYJTtB50sdK6m3IKWxrqxE0s8zkqBN6Q1CPR4nJawxAa5awG7ENeu6
 ZJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vwS6/PSiFfORBC8iBDJIdxzHLNrE+ZV4b02jLjMiM6Q=;
 b=TyJGthrkllFC13xx4HrMLLzzueEC3hJWeZBgF/zFgQ2Geb6LMycqRWQRyQd9VSqzuN
 i+1IKFyHqVTZ/8JPGymHExA4n1wtXaHLorv0c8d/3ThZacezaoP6i3yyR1MaRLW4eQWo
 US2/vR/lZtRWHKSEFdV5nPd/pdMwPebnmIJnhSCpbGFh62rqK+xEmJX6bFHMl6XxfFGA
 611oEy5vsHV+zOoGSxK9OlVgc6of8UxAs5aC7Qy2wIEsjtYzrMFooqTlhTHciyd7lC93
 s+yxOyCVaLDR9T0QQz2jbm/aBDcebAYgBb+Pw2zWpqxPVSaVFPVjMy/YbvsWSY5RqG+W
 7xcg==
X-Gm-Message-State: AOAM532d91U0xJO6u1NVY3pLyV6l5QeivfwFys8xsrRK+C3OdvAo1F0k
 Cazz6zs8U3nGd54Ku+MrUESp40Ami4Q=
X-Google-Smtp-Source: ABdhPJwzQ14s0Ij9I8mn0ssyV2BdS8ifvRZmOham9iGtGc52aWPbbK7QIbF7Q+CwcDT9nFL7DjyS5w==
X-Received: by 2002:a05:600c:3795:: with SMTP id
 o21mr3720284wmr.130.1630595967457; 
 Thu, 02 Sep 2021 08:19:27 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 o18sm2589844wrg.23.2021.09.02.08.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:19:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/24] user: Remove cpu_get_pic_interrupt() stubs
Date: Thu,  2 Sep 2021 17:17:15 +0200
Message-Id: <20210902151715.383678-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_get_pic_interrupt() is now unreachable from user-mode,
delete the unnecessary stubs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.h | 2 +-
 bsd-user/main.c   | 7 -------
 linux-user/main.c | 7 -------
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c241bc183d2..c7cc65e92d5 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1832,9 +1832,9 @@ int x86_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void x86_cpu_list(void);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
+#ifndef CONFIG_USER_ONLY
 int cpu_get_pic_interrupt(CPUX86State *s);
 
-#ifndef CONFIG_USER_ONLY
 /* MSDOS compatibility mode FPU exception support */
 void x86_register_ferr_irq(qemu_irq irq);
 void fpu_check_raise_ferr_irq(CPUX86State *s);
diff --git a/bsd-user/main.c b/bsd-user/main.c
index fe66204b6b7..e358c38c353 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -66,13 +66,6 @@ void gemu_log(const char *fmt, ...)
     va_end(ap);
 }
 
-#if defined(TARGET_I386)
-int cpu_get_pic_interrupt(CPUX86State *env)
-{
-    return -1;
-}
-#endif
-
 void fork_start(void)
 {
 }
diff --git a/linux-user/main.c b/linux-user/main.c
index 37ed50d98e2..f5c0a82427b 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -120,13 +120,6 @@ const char *qemu_uname_release;
    by remapping the process stack directly at the right place */
 unsigned long guest_stack_size = 8 * 1024 * 1024UL;
 
-#if defined(TARGET_I386)
-int cpu_get_pic_interrupt(CPUX86State *env)
-{
-    return -1;
-}
-#endif
-
 /***********************************************************/
 /* Helper routines for implementing atomic operations.  */
 
-- 
2.31.1


