Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D64079C7
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:12:55 +0200 (CEST)
Received: from localhost ([::1]:48802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6Yg-0007Al-MK
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Iz-0001Bj-AZ
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Iw-0003O4-4O
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:40 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g16so7524618wrb.3
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nAFz6uvNO4/9EYWu5DXduJISoPxs8WbCdajWsYkTN9U=;
 b=FC9yc79mpkX9Z48izAMhm2ukvfK95DoTM20mE2x/WD0DMdj4fD1Bl0eomnNdiZH9Xh
 FqRpxUjMC128ef0fNdt+RLiLouA7ll7RGzvqgF67Y5y8MOjRclQhcz3Gtt0J2KjLDp0Z
 IyEV3gBbH/ZMqrNTOz+0aoN3oBItEu6MuSIWYE5Bp41jmNtIJU58VaRLmfXK7s+FDjXk
 yJc9W0a+Lq1Clj9K47IYsgsqErCcxTXgsu5a4vhwAQjnToJS+2FD6iafng8V7aBlYGOR
 XF/Nmyei5ij0gpDoVRdlpgxsLWI3QaqAdovh6SPhckl25PnEujGC2Vsv/2cF1ytY/XX5
 Z/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nAFz6uvNO4/9EYWu5DXduJISoPxs8WbCdajWsYkTN9U=;
 b=s30jrM+fpHkqJP/WzmqcBSjw1HC2G/O3VQN4CNt1dQLs1Lhr8EFd47Pju5qdw6F6ZI
 MtqbJWihnvKXiPkZ8Cubzog2ogJDWlyIY8j///WX5e3YIW1Ex7M8hcJS5e2PXqiZUkU0
 O4/o+ezz4FynJrdBFIEaUpQ5BAImR9pl81ybszJ6Y/Xt0TfFh1RpeQeCvPCloOGdwux+
 EmIB9pb1qVz+LafUbGPtzSSgKEI0+hyIBU59/knFLAeKgUKOG+f9Mnq6CpyLwJ3SIgNq
 GOA+5v04E99teiAYNn8TZx+7twuSavUhogS45T0YmDr/4WR7u51x0YjqhfyG2Acy7RZW
 W3xQ==
X-Gm-Message-State: AOAM531bXWJet81vLujn5QRFx+6mKU9pNJzlZMUt8Y5SwmgOCdwCv5Hz
 a1N0KMau5eMA1fQIGngkGCrsMxePn7g=
X-Google-Smtp-Source: ABdhPJwsvGd/4V668UVQkVkX2A7YUCQ8PYUz5Lq9qq+qk3q/kvyKZJb72zlYXRx0zOghI8/i00xqlQ==
X-Received: by 2002:adf:b789:: with SMTP id s9mr3870061wre.315.1631379396644; 
 Sat, 11 Sep 2021 09:56:36 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l3sm1977278wms.4.2021.09.11.09.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:56:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/24] user: Remove cpu_get_pic_interrupt() stubs
Date: Sat, 11 Sep 2021 18:54:34 +0200
Message-Id: <20210911165434.531552-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_get_pic_interrupt() is now unreachable from user-mode,
delete the unnecessary stubs.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.h                 | 2 +-
 bsd-user/i386/target_arch_cpu.c   | 5 -----
 bsd-user/x86_64/target_arch_cpu.c | 5 -----
 linux-user/main.c                 | 7 -------
 4 files changed, 1 insertion(+), 18 deletions(-)

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
diff --git a/bsd-user/i386/target_arch_cpu.c b/bsd-user/i386/target_arch_cpu.c
index 71998e5ba56..d349e452997 100644
--- a/bsd-user/i386/target_arch_cpu.c
+++ b/bsd-user/i386/target_arch_cpu.c
@@ -33,11 +33,6 @@ uint64_t cpu_get_tsc(CPUX86State *env)
     return cpu_get_host_ticks();
 }
 
-int cpu_get_pic_interrupt(CPUX86State *env)
-{
-    return -1;
-}
-
 void bsd_i386_write_dt(void *ptr, unsigned long addr, unsigned long limit,
                      int flags)
 {
diff --git a/bsd-user/x86_64/target_arch_cpu.c b/bsd-user/x86_64/target_arch_cpu.c
index db822e54c66..be7bd107200 100644
--- a/bsd-user/x86_64/target_arch_cpu.c
+++ b/bsd-user/x86_64/target_arch_cpu.c
@@ -33,11 +33,6 @@ uint64_t cpu_get_tsc(CPUX86State *env)
     return cpu_get_host_ticks();
 }
 
-int cpu_get_pic_interrupt(CPUX86State *env)
-{
-    return -1;
-}
-
 void bsd_x86_64_write_dt(void *ptr, unsigned long addr,
         unsigned long limit, int flags)
 {
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


