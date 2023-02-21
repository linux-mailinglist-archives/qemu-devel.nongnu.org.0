Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517E169E36E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:31:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUbV-0002qh-4d; Tue, 21 Feb 2023 10:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUUb6-0002Hk-Ic
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:37 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUUb4-0000Vi-ND
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:28 -0500
Received: by mail-wr1-x431.google.com with SMTP id l25so4465338wrb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uZPnixULi6oi31J0KFtxJqQtIdv2DOflsZD/AW7cSSI=;
 b=BxQqYzIBpxFR3ZXJGVnQQk4r13ifC2dVus/Q3MNOxr0reLbWBR68Oy/obt4HWOWQ3m
 rsBWuiYgK7eVyH3Vmkvb+eC0V7YiqQBqsi+UsP5MSfSTsOEhtzu9RbjXFxgE6HPOa9S6
 BwpBSN3NgUADsJBTc3CePNlIY9ApVIu+SD/LFXONecaIvgNHSsMlneENRwfd1Nh8gCuT
 WGlsoZP9xH3xEKAJd1Q9Kx/Lv2wHxfPJhKRfJCwHsxIYxQQkPL0Qzzc200UIfMdNqz2z
 9/UDTXNJRM+mesA0AKp81BQsW/bYnQp9UFSJOrbFU9Ykg7Jt56Gey6TQcMvgJT6xCcZc
 dwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uZPnixULi6oi31J0KFtxJqQtIdv2DOflsZD/AW7cSSI=;
 b=28BkHpnD3iQfozlCmokSETImn5+m2OMaXWOMxlKmCpkuNtNduHRYJ4iJDI2D78Ji9f
 86XtbU3snEqPc8bGXqNnuXGRabof6eYM/Z79lF63r0HXN6/zSS0AJ9Ay33I1L/4fEEdU
 3sT5SHGDKsyvNVA7+xNQ90bOsg/Z0ZsuGIru94O/STkejb33tUw5LA+YEuWwImpHQFH3
 BfnC7R5cZxSTDnZdh0GVM1w8F/kFwSG6xW/ospyPK4iFSBDF12EUautNyj3WLlz0y0S+
 lS5YiXWyIwvweYlLs+vqq8nMAucjQF0o9a/2XF2OuvigKU8TcLxrK1B+Q/olztFqHUcl
 D5Rw==
X-Gm-Message-State: AO0yUKUd5GGtgNEW49ZbxDUc0F1uR5juUDHJDrjk5+GvncR6Zi/cWysY
 MnQbc7K/WDAGDFAyMXqfNxTBPVL40b2gcZCMraY=
X-Google-Smtp-Source: AK7set9rqdB0MnV22Q2Bue0sxXYXGs7LHS94B0dzCC/TddUkfaEBtp2nbFGLxhoOZJDKycQ/HQbKgA==
X-Received: by 2002:adf:ce11:0:b0:2c5:4d17:f688 with SMTP id
 p17-20020adfce11000000b002c54d17f688mr5560650wrn.15.1676993423962; 
 Tue, 21 Feb 2023 07:30:23 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 r1-20020adfdc81000000b002c5503a8d21sm2803417wrj.70.2023.02.21.07.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 07:30:23 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 2/4] sysemu/os-win32: fix setjmp/longjmp on windows-arm64
Date: Tue, 21 Feb 2023 16:30:04 +0100
Message-Id: <20230221153006.20300-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Windows implementation of setjmp/longjmp is done in
C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
perform stack unwinding, which crashes from generated code.

By using alternative implementation built in mingw, we avoid doing stack
unwinding and this fixes crash when calling longjmp.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/sysemu/os-win32.h | 28 ++++++++++++++++++++++++----
 meson.build               | 21 +++++++++++++++++++++
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 5b38c7bd04..97d0243aee 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -51,14 +51,34 @@ typedef struct sockaddr_un {
 extern "C" {
 #endif
 
-#if defined(_WIN64)
-/* On w64, setjmp is implemented by _setjmp which needs a second parameter.
+#if defined(__aarch64__)
+/*
+ * On windows-arm64, setjmp is available in only one variant, and longjmp always
+ * does stack unwinding. This crash with generated code.
+ * Thus, we use another implementation of setjmp (not windows one), coming from
+ * mingw, which never performs stack unwinding.
+ */
+#undef setjmp
+#undef longjmp
+/*
+ * These functions are not declared in setjmp.h because __aarch64__ defines
+ * setjmp to _setjmpex instead. However, they are still defined in libmingwex.a,
+ * which gets linked automatically.
+ */
+extern int __mingw_setjmp(jmp_buf);
+extern void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
+#define setjmp(env) __mingw_setjmp(env)
+#define longjmp(env, val) __mingw_longjmp(env, val)
+#elif defined(_WIN64)
+/*
+ * On windows-x64, setjmp is implemented by _setjmp which needs a second parameter.
  * If this parameter is NULL, longjump does no stack unwinding.
  * That is what we need for QEMU. Passing the value of register rsp (default)
- * lets longjmp try a stack unwinding which will crash with generated code. */
+ * lets longjmp try a stack unwinding which will crash with generated code.
+ */
 # undef setjmp
 # define setjmp(env) _setjmp(env, NULL)
-#endif
+#endif /* __aarch64__ */
 /* QEMU uses sigsetjmp()/siglongjmp() as the portable way to specify
  * "longjmp and don't touch the signal masks". Since we know that the
  * savemask parameter will always be zero we can safely define these
diff --git a/meson.build b/meson.build
index a76c855312..b676c831b3 100644
--- a/meson.build
+++ b/meson.build
@@ -2470,6 +2470,27 @@ if targetos == 'windows'
     }''', name: '_lock_file and _unlock_file'))
 endif
 
+if targetos == 'windows'
+  mingw_has_setjmp_longjmp = cc.links('''
+    #include <setjmp.h>
+    int main(void) {
+      /*
+       * These functions are not available in setjmp header, but may be
+       * available at link time, from libmingwex.a.
+       */
+      extern int __mingw_setjmp(jmp_buf);
+      extern void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
+      jmp_buf env;
+      __mingw_setjmp(env);
+      __mingw_longjmp(env, 0);
+    }
+  ''', name: 'mingw setjmp and longjmp')
+
+  if cpu == 'aarch64' and not mingw_has_setjmp_longjmp
+    error('mingw must provide setjmp/longjmp for windows-arm64')
+  endif
+endif
+
 ########################
 # Target configuration #
 ########################
-- 
2.30.2


