Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FEB32755F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:51:44 +0100 (CET)
Received: from localhost ([::1]:44130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVqh-0003HV-Ll
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQT-0006mQ-3J
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:38 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQO-000849-H7
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:36 -0500
Received: by mail-pj1-x1030.google.com with SMTP id e9so10494632pjj.0
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gutltnWyK55QxNx/fNlUeXYFxcXe0QnaxkNm916We5M=;
 b=Ho+KTzNY+dOfNJ63AqFit49YCTW0T0Y9oBabaSegN/Z/Gkq6/NeXvWRsE0+3VcHoDh
 b8bfglLF+0qSzT+fb5t4gHRBCpWDwua91US6kechhI/P4mP00rgZoMiRBexCFgIf6NYr
 hRJfwHlJuEvYKxpThnaCDPq9Nx/lWpTo6bi7fPoKX9vBg+FBKsh4UUgABEulMVy497B3
 Oh5Obo6zE7G2DhZXAwEspWBznxjT5ewLjfMpwEIFBJBbx3Z9dJ+NezozSzdYEYbKe90r
 P7KDcvLn+JUQ3+nlOxWSFT26D1m803QNm0JcsykA5VakbEQPmBswdKTzi5e4rNwVahkg
 Sfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gutltnWyK55QxNx/fNlUeXYFxcXe0QnaxkNm916We5M=;
 b=rDKJzNkjZCO/XNbIJ9VVcZy8Xs6HmEnZU9HUv8PiSrMncSFy54IfAwAbxt9PYd5z+Y
 yo6nK0Mhy/hCiK2rNm+auR02Cl6axJ+mKoDi6Qt2/SgDw0EDk6i3sVOUoyHWIpYVANHd
 bjEYwEoDB6qIU0Gzr6J1JP//FqByCOHHBxREjCsxtbHhMvWjtW201PMx13nE2pQIBAhU
 2dR12p2RMrZdaRGBFjiHOflGXhQgXdNEJISF/cMV0SfI2ttkYhMztr8spTU8A2EHTUex
 sjgDBgtX77/DQ/4rzWlTuCfHC1qJa/6k87asjBFJUVL3u3KcYVFhb6kmX5oXC2fr8kpy
 wRfw==
X-Gm-Message-State: AOAM5339SK0icDiVJpAFRoTvzizmTW6BzbSU3AbE67AOKTdL1BSSQvP5
 +X3F7Ype5O1iPj1Oy6n5hvPz8953rNDT8g==
X-Google-Smtp-Source: ABdhPJxZkspcp0qVDtzxPbJq17+TL2H7eUe8oAK8asKtYoeecfufxq2VX7sOek730nTdoTF5BDmPUw==
X-Received: by 2002:a17:90a:f28d:: with SMTP id
 fs13mr6526965pjb.220.1614554671300; 
 Sun, 28 Feb 2021 15:24:31 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b10sm14164049pgm.76.2021.02.28.15.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:24:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 48/50] target/i386: Create helper_check_io
Date: Sun, 28 Feb 2021 15:23:19 -0800
Message-Id: <20210228232321.322053-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop helper_check_io[bwl] and expose their common
subroutine to tcg directly.

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
index 0937c136ff..d395ae090e 100644
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


