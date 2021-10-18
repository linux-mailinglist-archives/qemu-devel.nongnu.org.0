Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3843432745
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:11:28 +0200 (CEST)
Received: from localhost ([::1]:40818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcY2h-0005St-O4
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtJ-0007xx-Hv
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:46 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtG-0001ZL-Bn
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:45 -0400
Received: by mail-il1-x12a.google.com with SMTP id h10so15989152ilq.3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3+hkcIrPIEq/hVOR/fQcllD286AqVcvMxGgF/eXAbnk=;
 b=Vsc73SFBaBcCxRMOLsP3z8gVzjPGDKpoTQiPkGP2E7+T3hEO78yb1IbF/VlPLb49M8
 9whdpbM8/WT+e9vHcC5yfHKfMeVy6qF+NiblgTsFurQLM6YRMUJcyttVnD1FpqAGKR+T
 eDzimNP0o6DafAzsKC7wqdGRKarS7Ao+HO9nhyubh6ivCGmgYUqjuO8ErWAdzZoqJga0
 q6Uab9THf5wjQXuoZE6LdM4oRKFlWxzWrySfGwwGOrS7/dj/RCMRQhfu4IYj1eE7nFXb
 b/xIaGvfKkc/Mm2jQzT+lXr5v2X3/LHQ0gS+hNhpdtktsObUzrJwzS3yJ3o/+rBKjQEI
 UOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3+hkcIrPIEq/hVOR/fQcllD286AqVcvMxGgF/eXAbnk=;
 b=rTeDM6B+2AFPLONZUqhHf8o8pvpnh65uwnjM6NGFKTLNWVdhliqeIekWdzKPqvnQ0+
 0AePFihkucNIRYUKlRkeqnUbJ4Tott5YIkcxqoHz4menHbL15sz3K3pt9NQIyJ5kmHTq
 hhm9vFAim+shOrkzubW7R/BS55zgpBjKSCPei1SpIUjp6jo+p2C0L6+h1PAtGTJiArWU
 YP80YAQbPqzlAbF+28PsOhdxGyGczMN+Gee4n00VoeJzEbPx10gHVBA4csMZnu3QSTEV
 jkvLwPnJAmvMBIi3tpirihhS35Gdq9pV49i3F8VrV77TwjYTujSUYLiy3O3t0zN/Ldvp
 19jg==
X-Gm-Message-State: AOAM533PvEB8lqCMRNVMtlkeMXwJqzZ7weDqvuNUy9UYyvxFNLKzeMbY
 WwPjtyJRxTGtzMP6tT+vf94UmFwlt4Jl9w==
X-Google-Smtp-Source: ABdhPJydlWhf6fFlZIkTpplsdSYZfI1CigXGFlLr1nubBi8EPVdRNW04dcvWycaV1abmJIyStaU84w==
X-Received: by 2002:a05:6e02:1c48:: with SMTP id
 d8mr15581498ilg.114.1634583701071; 
 Mon, 18 Oct 2021 12:01:41 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:40 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/23] bsd-user/mmap.c: Convert to qemu_log logging for mmap
 debugging
Date: Mon, 18 Oct 2021 13:00:58 -0600
Message-Id: <20211018190115.5365-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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


