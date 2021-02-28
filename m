Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399432756B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:57:13 +0100 (CET)
Received: from localhost ([::1]:60632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVw0-0001di-FX
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQW-0006mn-39
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:42 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQP-00085C-Rg
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:39 -0500
Received: by mail-pj1-x1036.google.com with SMTP id e9so7197654pjs.2
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4S8m8N7s2HOAfQjI8XBQsFuiSb3zv00OfgJ2XjQ8M7U=;
 b=J6AplQNSNOgG4RjomMyhGYIfJsCY3jcyI5a8m0+QpgVI7u3qYwr5acWOEoh8ecav19
 HdEGzv4N+QYYclxmCblct1bCWsuz1QPeonhsEfSIRsdG6SjIpI36HS/M6m/zLUVfImk8
 W/K1nGJmNxN4v3Zrlo6TMseM2zkTGGlrabmART+czmLsiKADW/tNZ76z7Xw+oxyvWVJF
 DlttqU2dnHsetKRCdqwDygmDvU6mRWsu7EutK7pbUZth+GUIvJP1+KHuKvLpiDwylW+N
 8IQ78s0rNl7JloFDhhm/fDa+5VcMn0+7UzI2t9CyHYla/D67q8WO6CsJZm2b0cd8V4dm
 c9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4S8m8N7s2HOAfQjI8XBQsFuiSb3zv00OfgJ2XjQ8M7U=;
 b=KKMb/wHNFzJ4hHJLFDivbxqrQG9RqDrrMjx+/inmaAYL1szPyR4IVQZagbzfZlaT/G
 duZoQN1NNr/gHxlxBXtC3cuKE3N7+EEFqHGR8cwp6wbk7+dUdV2vgdPk3lGZroZxVwHZ
 QbqnUQ8b/jgBkYh0YYGndsWeCubBUuVT0bzM2SX3fihol1q1o0MpLgsNSRB2dxAlSxGU
 /RObGC82UprQIyTcOs8RFcqSo8+DG6mzlRt9FvZ4MDPsiqOUTMJooLlyikuAgjipyHnL
 OFapoIjsmOFKgVCQi35HHx31K+JN/jD2/J+KFdPYRhliRLYzblVCoJARZ6eSHtd1bgQn
 nS6g==
X-Gm-Message-State: AOAM533gdoX+bTYa/Cn5OSeWVowOdSehXj3Rxwi/MG913BreihLkSiOd
 NsZCnuoZfIBE9nN1qJlJtnEQW4fzda4tBQ==
X-Google-Smtp-Source: ABdhPJzGlemXGSO1MCnfGuLVkvKRLpdEgA5vVb11YOedeqLoWGYPbeDQ4wNz5nlx/JRaB7fRVBqCvg==
X-Received: by 2002:a17:902:344:b029:e4:a7ab:2e55 with SMTP id
 62-20020a1709020344b02900e4a7ab2e55mr3596802pld.63.1614554672563; 
 Sun, 28 Feb 2021 15:24:32 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b10sm14164049pgm.76.2021.02.28.15.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:24:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 50/50] target/i386: Remove user-only i/o stubs
Date: Sun, 28 Feb 2021 15:23:21 -0800
Message-Id: <20210228232321.322053-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

With the previous patch for check_io, we now have enough for
the compiler to dead-code eliminate all of the i/o helpers.

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
index 2276e75d92..1d08e10f38 100644
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
index 16a0be1ae6..2b059d0baf 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -1,6 +1,5 @@
 i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'excp_helper.c',
-  'misc_stubs.c',
   'fpu_helper.c',
   'seg_helper.c',
 ))
-- 
2.25.1


