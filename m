Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DDF389615
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:02:47 +0200 (CEST)
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRSw-0003Ri-OF
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1p-0003AM-DL
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:45 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:45890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1l-0007Uz-Fd
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:45 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so12598047otc.12
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vrBlr05OPyOsTxUcBIownyAACzTpgn59yE8tdL4D5Hs=;
 b=UfvTlxwp+Ccmg+lvKKBZhUfQhnFHQIZ5ZjNDNbuj2XvrmAJ91X4mD7nHLfK3FnfJlT
 Cwdez5OBeYqCfHPYByprKAV6pJHZrEt5g+JPQCiZdf3xkWuIu25auymkbEhnWLb6vyBr
 DzYWRR9CvGt/pFmTbz8LivGGlGYPR88MHoRxJfa/LYQO0pIuga4aJj9XkxZ7crJQ12fY
 +TbC0hDMqpTmAjghFMU4N29SsXLtL62j1wwu1pLiM4XaBjQ+UTGHCOc8DfYgYw5MWgwk
 odkAsbX7p1Zzch9xIUvQuZtoO+zFYsmWwd1rLQ43Mw4lp8ip2AvKBvM7+HjwcOTv9+Bt
 zsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vrBlr05OPyOsTxUcBIownyAACzTpgn59yE8tdL4D5Hs=;
 b=LbLyw+3i8OyVJ+v2dEEHwuvzS4JjxFORCSVx4vASLl+EjSTHHYkymvV7gG1ZsVBem+
 jAbAe0S0tGuKqvuWJ4elrFvZcTIwmNE9NmcZm99YTigtVDC10AEyM2EZbdKL7aAuMWOY
 veInmDivC1PsZY1UZ54R+/7nsYCcjhhIn7deVcPSFdufeo1nR9JcRN1QgbcaESbo18pf
 2pHgAwNHcZZU4O+y2q439VRemLzIwbay23mDJEf83RDg7/uaEfvwHRq4qrTNXrdmAXSB
 J3czPGiXIiVgfvoi0XZhM8I7c8Gw155SVNMbl22R2jPSXuWSyk3r6sMYfrrGB6a2Fmsc
 TRTA==
X-Gm-Message-State: AOAM531yfkKlInbL6zACkeBxjVi5UMq3xSzRUoEZd3ZSkesaPNz39AX/
 vGtl9c0UAgyTCe3q6EQ5HxokDhamDKtSxlk5
X-Google-Smtp-Source: ABdhPJwIYZCVy5i3ytxmtS/Y2uZz/Yp26VbH/vxbUAHtPX6tfaW3Jh0T5hsYK2hGgfS29r5N+Bnf9g==
X-Received: by 2002:a9d:61cb:: with SMTP id h11mr638072otk.19.1621449280393;
 Wed, 19 May 2021 11:34:40 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id i9sm38642oog.17.2021.05.19.11.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:34:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 48/50] target/i386: Create helper_check_io
Date: Wed, 19 May 2021 13:30:48 -0500
Message-Id: <20210519183050.875453-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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

Drop helper_check_io[bwl] and expose their common
subroutine to tcg directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210514151342.384376-49-richard.henderson@linaro.org>
---
 target/i386/helper.h         |  4 +---
 target/i386/tcg/seg_helper.c | 21 +++------------------
 target/i386/tcg/translate.c  | 14 +-------------
 3 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 1d85f033df..47d0d67699 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -86,9 +86,7 @@ DEF_HELPER_1(rdtsc, void, env)
 DEF_HELPER_1(rdtscp, void, env)
 DEF_HELPER_FLAGS_1(rdpmc, TCG_CALL_NO_WG, noreturn, env)
 
-DEF_HELPER_2(check_iob, void, env, i32)
-DEF_HELPER_2(check_iow, void, env, i32)
-DEF_HELPER_2(check_iol, void, env, i32)
+DEF_HELPER_FLAGS_3(check_io, TCG_CALL_NO_WG, void, env, i32, i32)
 DEF_HELPER_3(outb, void, env, i32, i32)
 DEF_HELPER_2(inb, tl, env, i32)
 DEF_HELPER_3(outw, void, env, i32, i32)
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index cf3f051524..69d6e8f602 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -2418,10 +2418,10 @@ void helper_verw(CPUX86State *env, target_ulong selector1)
 }
 
 /* check if Port I/O is allowed in TSS */
-static inline void check_io(CPUX86State *env, int addr, int size,
-                            uintptr_t retaddr)
+void helper_check_io(CPUX86State *env, uint32_t addr, uint32_t size)
 {
-    int io_offset, val, mask;
+    uintptr_t retaddr = GETPC();
+    uint32_t io_offset, val, mask;
 
     /* TSS must be a valid 32 bit one */
     if (!(env->tr.flags & DESC_P_MASK) ||
@@ -2444,18 +2444,3 @@ static inline void check_io(CPUX86State *env, int addr, int size,
         raise_exception_err_ra(env, EXCP0D_GPF, 0, retaddr);
     }
 }
-
-void helper_check_iob(CPUX86State *env, uint32_t t0)
-{
-    check_io(env, t0, 1, GETPC());
-}
-
-void helper_check_iow(CPUX86State *env, uint32_t t0)
-{
-    check_io(env, t0, 2, GETPC());
-}
-
-void helper_check_iol(CPUX86State *env, uint32_t t0)
-{
-    check_io(env, t0, 4, GETPC());
-}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 94193a8e00..68ae9b0798 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -682,19 +682,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
                          uint32_t svm_flags)
 {
     if (PE(s) && (CPL(s) > IOPL(s) || VM86(s))) {
-        switch (ot) {
-        case MO_8:
-            gen_helper_check_iob(cpu_env, port);
-            break;
-        case MO_16:
-            gen_helper_check_iow(cpu_env, port);
-            break;
-        case MO_32:
-            gen_helper_check_iol(cpu_env, port);
-            break;
-        default:
-            tcg_abort();
-        }
+        gen_helper_check_io(cpu_env, port, tcg_constant_i32(1 << ot));
     }
     if (GUEST(s)) {
         target_ulong cur_eip = s->base.pc_next - s->cs_base;
-- 
2.25.1


