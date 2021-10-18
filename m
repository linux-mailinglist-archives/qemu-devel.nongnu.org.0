Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7221432381
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:08:38 +0200 (CEST)
Received: from localhost ([::1]:38594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVBl-0004P3-Pa
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8i-0007fA-5N
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:31 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8c-0007ts-GU
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:26 -0400
Received: by mail-io1-xd2d.google.com with SMTP id z69so13762434iof.9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3+hkcIrPIEq/hVOR/fQcllD286AqVcvMxGgF/eXAbnk=;
 b=fUxFfMdU4oNYq4DuNlcflQhIK3nKkbCfxA2kG2Sm3K76DIkyJLi63QIbgp/6lVWWWt
 HDWrq5qlKOgtY8Xa3gz7Bm+smvGIyqKxE+FNeAvqhf9C8ggIyzkRNLcPBaos7O5i2huL
 916Oo2Age9vhhj0u4f/eqDqBltS4JXxjZPb2lN3UibyqM87UcZilsONeJVVPmUtvDibU
 DFH3jCDiVq9YlEsh49kG/Zl+JSDwd8ZM2/XOSppfCXOUWxPTmuKtN+dctjJupudHKqp0
 upHNXQyxv+JBXBR3RQuXRFSi4wR3mxAHxV9WLdHD70JAKGIxxa3u1SUvKq5myXu107l6
 rpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3+hkcIrPIEq/hVOR/fQcllD286AqVcvMxGgF/eXAbnk=;
 b=TZp4CYT1wlno++oFQonwX5xEJOVX2nxrvgzsJopEnze66ZJtYy+m4hhAdPAT3gVg7X
 cYpobF8AeB+bTP9aoblfDojBW0B27426LId4IJsgjx2Z9Jlf+RVaOOq4Yrl416JXvpqx
 Bstm7dpYifgRzgc/GusSAWbaUM02G41ikUkP4GZVHbnT5roVMwADGyRBq10SuKA0TeoR
 Dm2c2Z3ITEHmtOudxNwH7odeuQUuH7zTYSaAH1a44JQssnMUCFuiEJh2GGLyKtCA8giD
 blrEq+yCVBDsJmBc3LKVwp7RDCU6aOHKcMtkK/IXRSACJtRKw502QH2o4ejIDeL4xahY
 pX1A==
X-Gm-Message-State: AOAM532wGhLsn1kt+moQTZXh/JoybuMEMb27T/3D/xTj1yYZouyUeWI5
 0CYknCaov3m5QDO78wy4sXBknzqxcAzFYg==
X-Google-Smtp-Source: ABdhPJySrXtxrdF2ntBmouaHUbpvqOlASqaFBCCJ5qG6YoRhcxIPLuwnCmFSq8MINtTmYOe+lzHK6w==
X-Received: by 2002:a05:6602:27ce:: with SMTP id
 l14mr14601168ios.193.1634573121102; 
 Mon, 18 Oct 2021 09:05:21 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/23] bsd-user/mmap.c: Convert to qemu_log logging for mmap
 debugging
Date: Mon, 18 Oct 2021 10:04:41 -0600
Message-Id: <20211018160458.1976-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert DEBUG_MMAP to qemu_log CPU_LOG_PAGE.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/mmap.c | 53 +++++++++++++++++++++----------------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 301108ed25..face98573f 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -21,8 +21,6 @@
 #include "qemu.h"
 #include "qemu-common.h"
 
-//#define DEBUG_MMAP
-
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
 
@@ -67,14 +65,11 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
     abi_ulong end, host_start, host_end, addr;
     int prot1, ret;
 
-#ifdef DEBUG_MMAP
-    printf("mprotect: start=0x" TARGET_ABI_FMT_lx
-           "len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c\n", start, len,
-           prot & PROT_READ ? 'r' : '-',
-           prot & PROT_WRITE ? 'w' : '-',
-           prot & PROT_EXEC ? 'x' : '-');
-#endif
-
+    qemu_log_mask(CPU_LOG_PAGE, "mprotect: start=0x" TARGET_ABI_FMT_lx
+                  " len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c\n", start, len,
+                  prot & PROT_READ ? 'r' : '-',
+                  prot & PROT_WRITE ? 'w' : '-',
+                  prot & PROT_EXEC ? 'x' : '-');
     if ((start & ~TARGET_PAGE_MASK) != 0)
         return -EINVAL;
     len = TARGET_PAGE_ALIGN(len);
@@ -391,45 +386,43 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
 
     mmap_lock();
-#ifdef DEBUG_MMAP
-    {
-        printf("mmap: start=0x" TARGET_ABI_FMT_lx
-               " len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c flags=",
-               start, len,
-               prot & PROT_READ ? 'r' : '-',
-               prot & PROT_WRITE ? 'w' : '-',
-               prot & PROT_EXEC ? 'x' : '-');
+    if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
+        qemu_log("mmap: start=0x" TARGET_ABI_FMT_lx
+                 " len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c flags=",
+                 start, len,
+                 prot & PROT_READ ? 'r' : '-',
+                 prot & PROT_WRITE ? 'w' : '-',
+                 prot & PROT_EXEC ? 'x' : '-');
         if (flags & MAP_ALIGNMENT_MASK) {
-            printf("MAP_ALIGNED(%u) ", (flags & MAP_ALIGNMENT_MASK)
-                    >> MAP_ALIGNMENT_SHIFT);
+            qemu_log("MAP_ALIGNED(%u) ",
+                     (flags & MAP_ALIGNMENT_MASK) >> MAP_ALIGNMENT_SHIFT);
         }
         if (flags & MAP_GUARD) {
-            printf("MAP_GUARD ");
+            qemu_log("MAP_GUARD ");
         }
         if (flags & MAP_FIXED) {
-            printf("MAP_FIXED ");
+            qemu_log("MAP_FIXED ");
         }
         if (flags & MAP_ANON) {
-            printf("MAP_ANON ");
+            qemu_log("MAP_ANON ");
         }
         if (flags & MAP_EXCL) {
-            printf("MAP_EXCL ");
+            qemu_log("MAP_EXCL ");
         }
         if (flags & MAP_PRIVATE) {
-            printf("MAP_PRIVATE ");
+            qemu_log("MAP_PRIVATE ");
         }
         if (flags & MAP_SHARED) {
-            printf("MAP_SHARED ");
+            qemu_log("MAP_SHARED ");
         }
         if (flags & MAP_NOCORE) {
-            printf("MAP_NOCORE ");
+            qemu_log("MAP_NOCORE ");
         }
         if (flags & MAP_STACK) {
-            printf("MAP_STACK ");
+            qemu_log("MAP_STACK ");
         }
-        printf("fd=%d offset=0x%llx\n", fd, offset);
+        qemu_log("fd=%d offset=0x%lx\n", fd, offset);
     }
-#endif
 
     if ((flags & MAP_ANON) && fd != -1) {
         errno = EINVAL;
-- 
2.32.0


