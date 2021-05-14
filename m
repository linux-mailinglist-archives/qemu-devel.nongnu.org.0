Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B9380DC0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:05:18 +0200 (CEST)
Received: from localhost ([::1]:35592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaJR-0005m2-J9
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZF-0003nm-Pn
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:33 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:34731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZC-0000GY-DO
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:33 -0400
Received: by mail-qt1-x82a.google.com with SMTP id v4so13614683qtp.1
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDQnNxkAMYUbsYhxUmiudchcyp2GknnJa9xVe1rbkdQ=;
 b=YhUqHc+QaVxQkEOmTmua9MeMo7p3TqTUhQoeIY+sDOOFUv6iu28nbqoaZSPCRE9PxK
 S/d5EwKZi8/CFFIkq+npxEwQbcN5oGqxRSkCW4aYO6eDaNNDTh6nsC7YfeqOgaRXG4m/
 UBJKH1swK8cX9kc2uF/joSYClPpNxd5+AGs0DLQfNCPrwW99pvfvaLZxm4x7i8SDOxgv
 P09pLmSRnHZ+Gxswg/dtk1z7Iduvfx8mFyhfxFWxCVeND6uL2rr8MDSC3lTI/3V98Kwj
 xFBHGCWyivgDIBwC/J8zDYR0/Ypi/EgZ0zKGEoS7sHplcvTv1OxrV3UFLcKge+D8kFB/
 Uhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDQnNxkAMYUbsYhxUmiudchcyp2GknnJa9xVe1rbkdQ=;
 b=Dbk0ajT6F4TQLn9AveomwoXtpqgaIzimmiAacIhPVi2kV66bnX362QqI9ztrxuFcC2
 bW1nDoQzSC41W8xeCdiAU0n9eazzGMxYZNuQmwNgLXdbQMguA1cW208ZTn3zDprlaaKA
 AK41ZCUNbuj/7+KIE9ynDex/IYC8mtTX8tGfJyAgevkllNQWN8p2mSY9X1j3YW3S5k9t
 9F/Ig9XkDgFiZkULtfmEY+aWtZUdIyox+mN5veu67YuGP9KNRpw0S3BsPzorzlrCrs2s
 Y31YbDzzLEIgBhynEzCahWxDuJFpf9qHlKflDx3QEPjXL144bIvt7qJvCC6Q47/jcuLU
 HY7g==
X-Gm-Message-State: AOAM533awq49w3e62bAAM6TPPkNQWlCHHEgDfcV6MFccP0i8UTfeKnDH
 OlaNMotIMnxp9FZZhAYPNcyEUAS39pWIGYYJT8k=
X-Google-Smtp-Source: ABdhPJwEL3QQbO3ux60x8Aw75VxpbaG+dJOKvLoHYVKQej23dqTEtF9c+Qbw8CRCTSKQoBoqMvgIZw==
X-Received: by 2002:ac8:5ac5:: with SMTP id d5mr12808488qtd.53.1621005449468; 
 Fri, 14 May 2021 08:17:29 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm5181972qke.13.2021.05.14.08.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:17:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 48/50] target/i386: Create helper_check_io
Date: Fri, 14 May 2021 10:13:40 -0500
Message-Id: <20210514151342.384376-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop helper_check_io[bwl] and expose their common
subroutine to tcg directly.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 19bfdbd0a3..860c75c2b1 100644
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


