Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9C869ECA0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:01:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUeRB-0003Cl-FE; Tue, 21 Feb 2023 21:00:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeR0-00037J-7X
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:43 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQy-00015S-EX
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:41 -0500
Received: by mail-pj1-x102b.google.com with SMTP id c23so2310361pjo.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=65HRmCDkLuuur1UpqMIRZDfCJCF1ZUxrkWbM7vUK1aI=;
 b=pjrQaHseri1q4CL5gVJIWmZ1kBqPVGiL5DWP18cRyHRB8oviGCOGoXwgypU2JP4BgH
 sB9SgVwaC2N3hfT+CPykUjJOeTX8kxSk2IJ5q+LrKoXXB1x41iG1c3uHJwMI35VCxxKn
 A+pHGZjSfnewj22J8YXmhDL7ANbiffzV7Fw7xSagWl5mr0Eo94qNG71v+SrO/of0RBdh
 Wcx7H3+PV8zBCdPoaMWnwz0r1soKm1RJIJCKbXVPwYKXVVQevd9Mmo+BEze+JUcc2xD8
 E3J++vHO0oLhbMHkELcdOb8rKTZRa3dJJzgjBLfdge4C2zOmB0T4DhSoHhwwci1RgrBV
 gjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=65HRmCDkLuuur1UpqMIRZDfCJCF1ZUxrkWbM7vUK1aI=;
 b=2zdlP8qmbVc16oi5V7gfF91ZW86/eF7FfSkG0O7t27exhn8elOL5TWpdkxmQhTlNu7
 UoWrnjSc9PZa/HTs04OVYnC3B1kbw7Xs4la/mMhvFgdNBELGhNXEvHa8z6wxadAbpzmp
 ZnsTj5G6Ta7h8Vok8dO72WA0Fg/LiYXtIx8n6tGI6lMylBRWZf/I7rY4QKG+YJBOTPn2
 OHnNst+g0LfQo6u3aqPih5eqKuc46B4ff9z89uS5sVNnlDMmOQkpgMTAxJOzC4R59wrN
 DJPNa84weYR2eUk/WFRyY2mK/oX6FYmbJpFEoRXvwHPvHLfSbG3peUbWV4EHgRrDT9ko
 NRfA==
X-Gm-Message-State: AO0yUKUeQD+r9RmNNgP0UIzLVYdVkE/NNmXmVMy4es0cztQRnvCoDYNw
 x5O15ZQQfFAmxoisQqnYaoSwDf6TQ3MT8C+gsys=
X-Google-Smtp-Source: AK7set+P65eQDVR10CbQYxxLvZfrmpF8OJ1rr89ONw0m/OB4R3Vz3dOIbwXcdRKUUaxwAPyi7NbPJg==
X-Received: by 2002:a17:902:76c9:b0:19c:a6d6:7d25 with SMTP id
 j9-20020a17090276c900b0019ca6d67d25mr1031515plt.37.1677031239018; 
 Tue, 21 Feb 2023 18:00:39 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c10200b00189743ed3b6sm91468pli.64.2023.02.21.18.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:00:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 8/8] sysemu/os-win32: fix setjmp/longjmp on windows-arm64
Date: Tue, 21 Feb 2023 16:00:23 -1000
Message-Id: <20230222020023.904232-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222020023.904232-1-richard.henderson@linaro.org>
References: <20230222020023.904232-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Windows implementation of setjmp/longjmp is done in
C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
perform stack unwinding, which crashes from generated code.

By using alternative implementation built in mingw, we avoid doing stack
unwinding and this fixes crash when calling longjmp.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230221153006.20300-3-pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index bc7e5b1d15..6a139e7085 100644
--- a/meson.build
+++ b/meson.build
@@ -2466,6 +2466,27 @@ if targetos == 'windows'
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
2.34.1


