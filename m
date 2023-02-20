Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE22169C957
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU465-0004Ym-R8; Mon, 20 Feb 2023 06:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU45l-0004SK-NF
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:12:21 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU45j-0006SB-LK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:12:21 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v3so663660wrp.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8LrzaSz6ElJrxd4cI99a7LkIk5CnLxRYnoODRf0SCQ=;
 b=kktg3pof6D9jzO2enrL0zdIChx0k8bN1VGg2liwzyO74kpFH94Zvo0W+pPXkP6IP4k
 T7y/UeXIXoWTNRJrTxGFyLDQtMSWPDzSsB8WOaW3AWy1CfO9R8o+IAbtm6hkRpkBbMkQ
 AzfMAjZuQcLkjJCr0I8IIPuRQIKa9vxmFYlyKsvxvN0DXeXDEvRp7pPrYv5dDxdteru2
 i0CFG6CQKb4Jwb3RHu9erZLNl2Z+OXj9vouvpRJmPmD/pg2onJQUxq1T1KnzYtNSCeEv
 OGHRyjnn8UshEsr7g/hwMLs/h963LrTAwcEKTqrA2AFpdulmGKbsMCtyuRvyURfd2k6/
 0EWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8LrzaSz6ElJrxd4cI99a7LkIk5CnLxRYnoODRf0SCQ=;
 b=1PJ3icngeAJjr0Q3DlltaM/bGTyamPjE6B9QGT/9qYGslJSTJK3PlPQ8aHPe7vx3bu
 cIIPuulBtP6RkooYwkGfzTjy+2z0J12T1rLdCkTzzIVRviSR6cUBMrt2arNjk5DZE+ai
 5YX18CFI2jLD7I5S64MVkKQH6txmbuPn/ZgGngMcss08tCACo/RnxhiJTgin2m948GDj
 6Iv8OaDY9h2vakIO9Yc/Ni9k6XBpmoeofHlq5xFCyhVAB2Biv+eknsvn5/vD5P7k5/eF
 BZVtIXMDH20+3eCpXg0qpT8R3bv3dcJm0j3jk78g7qieQql9bd8dr7Ee1CxUR3AX4WD8
 VxeA==
X-Gm-Message-State: AO0yUKXvgVp29Jm+8VriFiMttPAQNNaQuM+OGG4wacfBpO9F2OF7tmTX
 beiNSexnRy5HdmpEOAXkDgdf2/yQfVyRg31gYvQ=
X-Google-Smtp-Source: AK7set+o0gYiRQIL/fvSR/xeSfHfOdmUeqQp1MFUx2hnvt5e66grqbhWtaKnqZFBBCGErwklrCZG8A==
X-Received: by 2002:adf:e241:0:b0:2c5:4e77:62d with SMTP id
 bl1-20020adfe241000000b002c54e77062dmr1710832wrb.58.1676891537630; 
 Mon, 20 Feb 2023 03:12:17 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adff942000000b002c573778432sm5046656wrr.102.2023.02.20.03.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 03:12:17 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 2/4] sysemu/os-win32: fix setjmp/longjmp on windows-arm64
Date: Mon, 20 Feb 2023 12:12:13 +0100
Message-Id: <20230220111215.27471-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x42b.google.com
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
---
 include/sysemu/os-win32.h | 25 +++++++++++++++++++++++--
 meson.build               | 24 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 5b38c7bd04..1f6c141d39 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -51,14 +51,35 @@ typedef struct sockaddr_un {
 extern "C" {
 #endif
 
-#if defined(_WIN64)
+#if defined(__aarch64__)
+#ifndef CONFIG_MINGW64_HAS_SETJMP_LONGJMP
+#error mingw must provide setjmp/longjmp for windows-arm64
+#endif
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
 /* On w64, setjmp is implemented by _setjmp which needs a second parameter.
  * If this parameter is NULL, longjump does no stack unwinding.
  * That is what we need for QEMU. Passing the value of register rsp (default)
  * lets longjmp try a stack unwinding which will crash with generated code. */
 # undef setjmp
 # define setjmp(env) _setjmp(env, NULL)
-#endif
+#endif /* __aarch64__ */
 /* QEMU uses sigsetjmp()/siglongjmp() as the portable way to specify
  * "longjmp and don't touch the signal masks". Since we know that the
  * savemask parameter will always be zero we can safely define these
diff --git a/meson.build b/meson.build
index 4ba3bf3431..e968ed9e7a 100644
--- a/meson.build
+++ b/meson.build
@@ -2450,6 +2450,30 @@ if targetos == 'windows'
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
+  config_host_data.set('CONFIG_MINGW64_HAS_SETJMP_LONGJMP',
+                       mingw_has_setjmp_longjmp)
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


