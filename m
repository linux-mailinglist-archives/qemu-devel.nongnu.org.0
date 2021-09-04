Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA88F400DA8
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:08:35 +0200 (CEST)
Received: from localhost ([::1]:56538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfi6-0005KZ-Ug
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXm-0000gk-J0
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:54 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXl-0000Cu-06
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id e26so1896226wmk.2
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T4pI+gOIoQYZd9V+8CX82xC3q0nWNwipfLf26DxJ+o0=;
 b=mXRnsAjuAqm/gT+4wkjZXtF0DdDaULHnPfzz1dGRo/XmpdZ5E88KhVn6uZEmVEQEUZ
 vSemyVe+m6jDSUP1DEqSBMJZJUkwDup6USpAV4OSPh+3ZqtbfvwaoFUexZ2lhxRR7CPv
 uG5OnSQei2LsvTzrVsjnnL5qj2P8AMAkbhIL+PJaQASfHRQKhNPm+N1N6PHE+E2H41Iv
 6trQjzqS/yymzGhskZSvCQCE7xTAzOsPw1L6D4xLh7zGOUNMTBWp3+BryqfB0yZeUgBB
 EvDp8DsBRz6kRc4mUV31zWRj7i2tZpCqXursUoTEdIRcZvjFuool/hVwcRf8tPk84wfJ
 GtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T4pI+gOIoQYZd9V+8CX82xC3q0nWNwipfLf26DxJ+o0=;
 b=il55VJS4/p7GefTxE5y1ely/AA9WsPvurmuoKFd9G3o9Pcmuh4oiGVssfbMkWmPlxS
 eAkIct4dhHfPjpE4AqVyLoImoLCiIRxrup0OD+RmakfUilgrNMpJ6P7qoWVACjMGqU5Q
 48Q4nl3YoK0R5o7mGD8rtFkGoImwBFlnpPzvY0AkaQIbxcF64pV4AGDv3nOQdrt2vqTN
 ObpsxnpO/cKkciiMY9xF1oCzI3LOnXdVu3GTGeigNIhcnbfq/6JBAq0k/sM3DK/pA2Z7
 nO/R0DgUt/Y+cnrzAlmCfAJC0qlPT4DAhqfbiUYzg2I990Vpe3vRJ0/3Bojp/cWv81o+
 mE6g==
X-Gm-Message-State: AOAM533tZ0nt5q2v8uWAncdcFV6XYI/V9LrbeZEC67A4A6HUuN52p7nx
 VV1jecGhfyRHRVJZtSFZ1ebfZ1gFyco=
X-Google-Smtp-Source: ABdhPJzUZm2LVbjLZmE+YuJ1P3RafsFif54wS/sGvbQfkGQARS7TzrnlKF1WlosUCwKCiU15DFWa8w==
X-Received: by 2002:a1c:a9ce:: with SMTP id s197mr4867407wme.173.1630799871471; 
 Sat, 04 Sep 2021 16:57:51 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o7sm3103135wmq.36.2021.09.04.16.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:57:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/24] user: Remove cpu_get_pic_interrupt() stubs
Date: Sun,  5 Sep 2021 01:55:42 +0200
Message-Id: <20210904235542.1092641-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_get_pic_interrupt() is now unreachable from user-mode,
delete the unnecessary stubs.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index a6094563b6b..45bde4598d5 100644
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


