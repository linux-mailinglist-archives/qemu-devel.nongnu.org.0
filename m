Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05A1380DB4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:01:36 +0200 (CEST)
Received: from localhost ([::1]:55384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaFr-0008AT-QM
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZG-0003pl-CV
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:34 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:44007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZE-0000HT-EW
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:34 -0400
Received: by mail-qk1-x735.google.com with SMTP id a22so28454714qkl.10
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBYpGSuhiQ1BXzwgQO5bdVH+Kw1cz4/vQ9RgUJpZ3gs=;
 b=eiT6hcRQZQsT7DjPQrdFLHxYcTHiAODUXO/Ut82g2lmmJW50GoMTKcFyBnn++wL4PH
 ZiW7Qsedmz3+gV7SvTpb9iWJ1COBW+F5PC6zHBH1dgTiOseXMGRwMeWFiyqxSJeTrQWt
 O3TK5dCsJJ49bhDEydDvaQ+E5F4UoIQjWQboFx2PGaXFBZnYYYeYBEmrPMQyPttfBNMX
 9rEO+vAEZivA/ZYEg/2Ph1fOaHjrLqQG/B00RcgIZJmfRIlGLTc+BS8U4dtN3c5a/JgI
 ua6+TPpC3I/otU/608GYD4xFrr2suuN7mrECsenIJV+l29djkL0dybO1okdZBgpnodsJ
 E+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBYpGSuhiQ1BXzwgQO5bdVH+Kw1cz4/vQ9RgUJpZ3gs=;
 b=I+Mvvgf42oHAsID4U1mmM07eZ+QkFLuGj/MK3TGwC0ItxzYEsoCA3ixFN9H50tRcx4
 0qhvm48QZC6OiUXTOfDBzswKqGarkPZRsEcbdK/zxdW3ufSu6E95V96Y0u7oMQye/Xne
 DU8X2J94WJ2tLBI1L5fHT3t6Vn4uy0n01zAPWJ7mKFeEYAiOdoFUdNcq1NwDatDdyUNi
 XWkmsNpPu+huQ2XgaGYiEO+rZybsynNSjuq8zr74D38b9zbUAPzxUMOM7YgSfSALEYfC
 KFLJ8Uqrc6oKcfdsT5sfefP9AjpQ/OxaLRbnb3pKSAJgJEPwqzg2X7SY6qSCAOTYs1v0
 jsfg==
X-Gm-Message-State: AOAM5333SM5qD43rP96tQV/Arh9hbtIiSDnX3qkr3u8mmvqfs+QeUbdH
 WrPjecIAdzvIdkDXzP6984LGW6RKRUGWXi45Tnk=
X-Google-Smtp-Source: ABdhPJx8reckgXGhzaPDWpZ9zatmIjFpJiBmqGavQ17SZifmi4nS8VdvDUy5FAEhC4AdhTTHUk+CeA==
X-Received: by 2002:a05:620a:2188:: with SMTP id
 g8mr8408271qka.79.1621005451277; 
 Fri, 14 May 2021 08:17:31 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm5181972qke.13.2021.05.14.08.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:17:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 50/50] target/i386: Remove user-only i/o stubs
Date: Fri, 14 May 2021 10:13:42 -0500
Message-Id: <20210514151342.384376-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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

With the previous patch for check_io, we now have enough for
the compiler to dead-code eliminate all of the i/o helpers.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h              |  3 +-
 target/i386/tcg/translate.c       |  6 ++++
 target/i386/tcg/user/misc_stubs.c | 55 -------------------------------
 target/i386/tcg/user/meson.build  |  1 -
 4 files changed, 7 insertions(+), 58 deletions(-)
 delete mode 100644 target/i386/tcg/user/misc_stubs.c

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 3fd0253298..f3d8c3f949 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -86,14 +86,13 @@ DEF_HELPER_1(rdtsc, void, env)
 DEF_HELPER_1(rdtscp, void, env)
 DEF_HELPER_FLAGS_1(rdpmc, TCG_CALL_NO_WG, noreturn, env)
 
+#ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(outb, void, env, i32, i32)
 DEF_HELPER_2(inb, tl, env, i32)
 DEF_HELPER_3(outw, void, env, i32, i32)
 DEF_HELPER_2(inw, tl, env, i32)
 DEF_HELPER_3(outl, void, env, i32, i32)
 DEF_HELPER_2(inl, tl, env, i32)
-
-#ifndef CONFIG_USER_ONLY
 DEF_HELPER_FLAGS_3(check_io, TCG_CALL_NO_WG, void, env, i32, i32)
 DEF_HELPER_FLAGS_4(bpt_io, TCG_CALL_NO_WG, void, env, i32, i32, tl)
 DEF_HELPER_2(svm_check_intercept, void, env, i32)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index bcc642bf6e..08ff3fe232 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -197,8 +197,14 @@ STUB_HELPER(check_io, TCGv_env env, TCGv_i32 port, TCGv_i32 size)
 STUB_HELPER(clgi, TCGv_env env)
 STUB_HELPER(flush_page, TCGv_env env, TCGv addr)
 STUB_HELPER(hlt, TCGv_env env, TCGv_i32 pc_ofs)
+STUB_HELPER(inb, TCGv ret, TCGv_env env, TCGv_i32 port)
+STUB_HELPER(inw, TCGv ret, TCGv_env env, TCGv_i32 port)
+STUB_HELPER(inl, TCGv ret, TCGv_env env, TCGv_i32 port)
 STUB_HELPER(monitor, TCGv_env env, TCGv addr)
 STUB_HELPER(mwait, TCGv_env env, TCGv_i32 pc_ofs)
+STUB_HELPER(outb, TCGv_env env, TCGv_i32 port, TCGv_i32 val)
+STUB_HELPER(outw, TCGv_env env, TCGv_i32 port, TCGv_i32 val)
+STUB_HELPER(outl, TCGv_env env, TCGv_i32 port, TCGv_i32 val)
 STUB_HELPER(rdmsr, TCGv_env env)
 STUB_HELPER(read_crN, TCGv ret, TCGv_env env, TCGv_i32 reg)
 STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
diff --git a/target/i386/tcg/user/misc_stubs.c b/target/i386/tcg/user/misc_stubs.c
deleted file mode 100644
index df38b44d6e..0000000000
--- a/target/i386/tcg/user/misc_stubs.c
+++ /dev/null
@@ -1,55 +0,0 @@
-/*
- *  x86 misc helpers
- *
- *  Copyright (c) 2003 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/helper-proto.h"
-
-void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
-{
-    g_assert_not_reached();
-}
-
-target_ulong helper_inb(CPUX86State *env, uint32_t port)
-{
-    g_assert_not_reached();
-    return 0;
-}
-
-void helper_outw(CPUX86State *env, uint32_t port, uint32_t data)
-{
-    g_assert_not_reached();
-}
-
-target_ulong helper_inw(CPUX86State *env, uint32_t port)
-{
-    g_assert_not_reached();
-    return 0;
-}
-
-void helper_outl(CPUX86State *env, uint32_t port, uint32_t data)
-{
-    g_assert_not_reached();
-}
-
-target_ulong helper_inl(CPUX86State *env, uint32_t port)
-{
-    g_assert_not_reached();
-    return 0;
-}
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index 3555b15bdd..1df6bc4343 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -1,5 +1,4 @@
 i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'excp_helper.c',
-  'misc_stubs.c',
   'seg_helper.c',
 ))
-- 
2.25.1


