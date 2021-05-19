Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5B1389628
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:06:42 +0200 (CEST)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRWi-0000RA-Iu
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1p-0003Ac-Vt
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:46 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:42765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1n-0007WG-GW
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:45 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so4785188otg.9
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GoaUZegljsvDJfRohRECaMQH5QJK/M1GVc1IxmvKhBI=;
 b=zdMfo6By8V0AtxRbYG74VsfaRhtWl/d58Oj/kndtbdsYTnr2u8RpwK/Kk0DuMDc4aE
 m2LE9sf1Ljtz7CQecGMX7n3F7eSmIMuxoYhMxmWQ3afxeP/+2DzrgfBwg9hPEST6YNOV
 6ubsWJqew186EsIb9G5jyl1DD+if1f6adQxGC6lgC66B8wslvpSYBEMCsx7KcCleUJgX
 Na/BUe9jut+Sw4cLtSVBYOgipMyvY5fcWNieOIOGRjwyadZc75p0cuTY36ziCDlqsW+N
 d9wbldLe6lNkpBE/pWIMkXK+DENt7SFeWmpcQsyld44u8aPEUP4pxXdZxHtVQ9Hgztfp
 158w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GoaUZegljsvDJfRohRECaMQH5QJK/M1GVc1IxmvKhBI=;
 b=K5zU7a3i5f7Su2idSlAghuRyDssKUyd4g8VFlqtvX3fBQaj2e/nM+TD6Ev0/rvudNp
 QPYiLACJyTCcg/qJqwRmnm6lVD/q28n/HQjiAVXwR5mIcaMurL6JJZN3CS2zolpjPfi4
 qRQdJwimyURoq/XOHQi4HzOQRr1hFr4zFx9vyDY+5m1EvX3GTk2jfUNy+wRYfm50eW/S
 VUmW5o2gOr4Vxq+/iFE30vdGee7/hYfYrKlZD5op7tiA3F8Mmpgg/vTHOzvITx3K/CIf
 1ZNkBWN0gcVIZLbLQpIy3JnZK7czoqywQNnOPhTH0TthmdBTFMaLLCeOAhnFZep5qEZu
 yARA==
X-Gm-Message-State: AOAM530kZWB7wS0fzDSCT9DIkesWDJYGtA2k6MSvdfr7vqZBdE0f0ExP
 JLLgSyY9kM8gHGBxsD5IWjNx5xY426+vTAgR
X-Google-Smtp-Source: ABdhPJz+g+40/n4qD1aWInwVFPTX+mN9ue0elOtyE8rh2P+fvi5aX1raEMNy0z1qCNVJt8IB8yq71w==
X-Received: by 2002:a05:6830:18fb:: with SMTP id
 d27mr637157otf.235.1621449282385; 
 Wed, 19 May 2021 11:34:42 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id i9sm38642oog.17.2021.05.19.11.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 50/50] target/i386: Remove user-only i/o stubs
Date: Wed, 19 May 2021 13:30:50 -0500
Message-Id: <20210519183050.875453-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the previous patch for check_io, we now have enough for
the compiler to dead-code eliminate all of the i/o helpers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-51-richard.henderson@linaro.org>
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
index 86b93a010d..051b6dff18 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -196,8 +196,14 @@ typedef struct DisasContext {
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


