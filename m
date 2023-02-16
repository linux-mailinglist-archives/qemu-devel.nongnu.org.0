Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEA769964A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:50:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSedV-0001eg-2d; Thu, 16 Feb 2023 08:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSedT-0001YZ-HS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:49:19 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSedR-0001aK-Mh
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:49:19 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso1691204wmo.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OmRSGsOLRR4SdMYF46j6nl7BWaAZNtQ19hvx9YK2z9A=;
 b=EHuUmuwedH1kFD/MC9J4nW8K4T+HDmmWh7yNfdfG99bvLzuU0jeBf2II8nXtUhj8pZ
 idO2kOFBczCsTu3ipHVkzQRmU2q6uzLy7V+PFKjR0UnO2Wdw3QBoK5DUoetCnshS89Kc
 XI3e/TjIx0H27FRF3YflXb3MG1hPHhtiUHsHxHRTLPC77yXX6dyl1ngg+pXMzcMnY71C
 EPd6pt4CLTkEdo92UWcQHVW3DwcrQupWFsZxn8Y3XvjIoLJSaCz3WE1SngXGNXdKhd5e
 NKmcPfRhZYlorkZmr+2JUF6cg6dhd3Av7QVLYde5jQ6t/N3n3aVXMOfiA20liFtsNRuz
 aN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OmRSGsOLRR4SdMYF46j6nl7BWaAZNtQ19hvx9YK2z9A=;
 b=YPJwYOOyiusNsH24tv4XxMi6vHf65Wruf3GOMOsCSCjS25mnI1TDjP+YaYl/4HJR9H
 AKF0w7NHgbb1G6DRBdeOHQVP5eAJL+uDcu0c9/SoeaqDn3RvenfHnFeVZIqh5dmR1v/9
 7NQHLxzmkwOszO79BB6fpabWYf8pEmT26lSLAVF1LJadkdqUt1Net2jBBcHnBLJ7WfDy
 8RI0JxMXjCvBLwKrtBbjYW05BFREBor/5fyMbDO41pTIYbKmyxQ86QlrPKr4ZxRxHNWD
 R8feSlgOd0Km9uS3B1fj4ViH87SWNVxMkhPgJtxUDVzHahYsOibTfTMmh1VM4ik8Ev3t
 D6tA==
X-Gm-Message-State: AO0yUKXBDUjpCdpDrm8S35W3Gg9VQxX/G5iXVh3p/KHNFEnQePm10L9e
 PdYPpdF2F7yn613Da/UADEyQdH4dKG+tpnfRP9E=
X-Google-Smtp-Source: AK7set8LX13K3ERQbxnQMJ56umCCJymRXBJe8Ox3xXMdWYqAgGRZ5psmutyyr0RtKcHa7laGlBLNmA==
X-Received: by 2002:a05:600c:1c10:b0:3dc:3f51:c697 with SMTP id
 j16-20020a05600c1c1000b003dc3f51c697mr1934793wms.18.1676555355652; 
 Thu, 16 Feb 2023 05:49:15 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05600c364b00b003dc0cb5e3f1sm1557933wmq.46.2023.02.16.05.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:49:15 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 2/4] sysemu/os-win32: fix setjmp/longjmp on windows-arm64
Date: Thu, 16 Feb 2023 14:49:09 +0100
Message-Id: <20230216134911.6803-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x332.google.com
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
 include/sysemu/os-win32.h | 21 +++++++++++++++++++--
 meson.build               | 22 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 5b38c7bd04..634931a387 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -51,14 +51,31 @@ typedef struct sockaddr_un {
 extern "C" {
 #endif
 
-#if defined(_WIN64)
+#if defined(__aarch64__)
+#ifndef CONFIG_MINGW64_HAS_SETJMP_LONGJMP
+#error mingw must provide setjmp/longjmp for windows-arm64
+#endif
+/* On windows-arm64, setjmp is available in only one variant, and longjmp always
+ * does stack unwinding. This crash with generated code.
+ * Thus, we use another implementation of setjmp (not windows one), coming from
+ * mingw, which never performs stack unwinding. */
+#undef setjmp
+#undef longjmp
+/* These functions are not declared in setjmp.h because __aarch64__ defines
+ * setjmp to _setjmpex instead. However, they are still defined in libmingwex.a,
+ * which gets linked automatically. */
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
index 4ba3bf3431..7f55205437 100644
--- a/meson.build
+++ b/meson.build
@@ -2450,6 +2450,28 @@ if targetos == 'windows'
     }''', name: '_lock_file and _unlock_file'))
 endif
 
+if targetos == 'windows'
+  mingw_has_setjmp_longjmp = cc.links('''
+    #include <setjmp.h>
+    int main(void) {
+      // these functions are not available in setjmp header, but may be
+      // available at link time, from libmingwex.a
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


