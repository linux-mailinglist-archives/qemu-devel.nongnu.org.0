Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF14030E0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:23:56 +0200 (CEST)
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjVS-0003Rq-Bd
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2h-0006Cx-R0
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:11 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:46596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2f-000159-EK
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:11 -0400
Received: by mail-io1-xd2b.google.com with SMTP id b200so431518iof.13
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDD16qQzNSsAOOrAI+aSsqOe63HjiHPP2KkxWUxig74=;
 b=m1PpUbi25v7YSrSR1EKHuisLLI8nlDJA6Pf/nLyY7coMg+8AfM8nEwCUq1Ea8vnqT4
 IYrwvfyj8Nv8PyjBnci0KJmtW1hlZ29J/YJ3H+kJUC9WROwEebcx1wg08SshsNthmcL8
 jou6FS/RyS+WOpksd235lqTvvbzosb7KL0U2akeWiLBkbkLGXPuUJnaDtmrhvmlsu0SS
 rY6Slyciv/Tz1lFJs+twIzRxl/ml57djHp/0IEaV71IItnVrY3popEwG9s5S32uAcjYY
 jLrea/PFSjcClq47oS0YyOlPMa735iNFu3rmGMFHQX7gdz5V5fiaH6mUVmoQidNSHjRg
 /B4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDD16qQzNSsAOOrAI+aSsqOe63HjiHPP2KkxWUxig74=;
 b=i2K2CiQZczpIjAnm4nIaovTqqPwvp+9c6Vxb3cAE9/YfBW+mLMiHyy/N1qWC9kr7ex
 4P2tg9A/OONEGSsvrcE79A38QLnS9OCmcoaOIEFXvcNNiP5lZ4oVySP5NJnIKd2wTEco
 Y5aoieGTbivONU7+5MZ71ZCk0igd6spkgsbu2j12XXqoi4hE3344/yraWlWbPZzJe4Bp
 mPWIfJndap4oUxawY0PJth4Tnw6KKrFVhsPCPdCXC3q1Pr4yoa0hlRjd1aZkyeLpHS0Z
 vBnFFChvf4B9ujvksJuHoMCwy9YjRlckSwNvDbpGZp8mdhO+IIzmM9WXtgPnxMmtM3oT
 kzGw==
X-Gm-Message-State: AOAM531Eu2kXDFb8mZ53+DV+rPho0nCaFFsIa7PdXwjaa+Yb2BlkxFgR
 1eld2KzTZXUBitCQJP3k4vx5DYQpk5cpQHCyec8=
X-Google-Smtp-Source: ABdhPJxPiBFQL9lGYMGDfEiWnC9GKdCDBQyKEfauBfqCidiHu1atdDnlfsb95Rj1jHoO/pJG3b0uGA==
X-Received: by 2002:a05:6602:2219:: with SMTP id
 n25mr269574ion.185.1631051648049; 
 Tue, 07 Sep 2021 14:54:08 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:54:07 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 33/42] bsd-user: update debugging in mmap.c
Date: Tue,  7 Sep 2021 15:53:23 -0600
Message-Id: <20210907215332.30737-34-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
 Sean Bruno <sbruno@FreeBSD.org>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Update the debugging code for new features and different targets.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/mmap.c | 55 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 03119b1f20..8918c4ae68 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -68,8 +68,8 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
     int prot1, ret;
 
 #ifdef DEBUG_MMAP
-    printf("mprotect: start=0x" TARGET_FMT_lx
-           " len=0x" TARGET_FMT_lx " prot=%c%c%c\n", start, len,
+    printf("mprotect: start=0x" TARGET_ABI_FMT_lx
+           "len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c\n", start, len,
            prot & PROT_READ ? 'r' : '-',
            prot & PROT_WRITE ? 'w' : '-',
            prot & PROT_EXEC ? 'x' : '-');
@@ -250,28 +250,47 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     mmap_lock();
 #ifdef DEBUG_MMAP
     {
-        printf("mmap: start=0x" TARGET_FMT_lx
-               " len=0x" TARGET_FMT_lx " prot=%c%c%c flags=",
+        printf("mmap: start=0x" TARGET_ABI_FMT_lx
+               " len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c flags=",
                start, len,
                prot & PROT_READ ? 'r' : '-',
                prot & PROT_WRITE ? 'w' : '-',
                prot & PROT_EXEC ? 'x' : '-');
-        if (flags & MAP_FIXED)
+        if (flags & MAP_ALIGNMENT_MASK) {
+            printf("MAP_ALIGNED(%u) ", (flags & MAP_ALIGNMENT_MASK)
+                    >> MAP_ALIGNMENT_SHIFT);
+        }
+#if MAP_GUARD
+        if (flags & MAP_GUARD) {
+            printf("MAP_GUARD ");
+        }
+#endif
+        if (flags & MAP_FIXED) {
             printf("MAP_FIXED ");
-        if (flags & MAP_ANON)
+        }
+        if (flags & MAP_ANONYMOUS) {
             printf("MAP_ANON ");
-        switch (flags & TARGET_BSD_MAP_FLAGMASK) {
-        case MAP_PRIVATE:
+        }
+#ifdef MAP_EXCL
+        if (flags & MAP_EXCL) {
+            printf("MAP_EXCL ");
+        }
+#endif
+        if (flags & MAP_PRIVATE) {
             printf("MAP_PRIVATE ");
-            break;
-        case MAP_SHARED:
+        }
+        if (flags & MAP_SHARED) {
             printf("MAP_SHARED ");
-            break;
-        default:
-            printf("[MAP_FLAGMASK=0x%x] ", flags & TARGET_BSD_MAP_FLAGMASK);
-            break;
         }
-        printf("fd=%d offset=" TARGET_FMT_lx "\n", fd, offset);
+        if (flags & MAP_NOCORE) {
+            printf("MAP_NOCORE ");
+        }
+#ifdef MAP_STACK
+        if (flags & MAP_STACK) {
+            printf("MAP_STACK ");
+        }
+#endif
+        printf("fd=%d offset=0x%llx\n", fd, offset);
     }
 #endif
 
@@ -399,7 +418,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     page_set_flags(start, start + len, prot | PAGE_VALID);
  the_end:
 #ifdef DEBUG_MMAP
-    printf("ret=0x" TARGET_FMT_lx "\n", start);
+    printf("ret=0x" TARGET_ABI_FMT_lx "\n", start);
     page_dump(stdout);
     printf("\n");
 #endif
@@ -416,7 +435,9 @@ int target_munmap(abi_ulong start, abi_ulong len)
     int prot, ret;
 
 #ifdef DEBUG_MMAP
-    printf("munmap: start=0x%lx len=0x%lx\n", start, len);
+    printf("munmap: start=0x" TARGET_ABI_FMT_lx " len=0x"
+           TARGET_ABI_FMT_lx "\n",
+           start, len);
 #endif
     if (start & ~TARGET_PAGE_MASK)
         return -EINVAL;
-- 
2.32.0


