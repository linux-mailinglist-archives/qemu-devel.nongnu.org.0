Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736713FF84C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:15:55 +0200 (CEST)
Received: from localhost ([::1]:55264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLws6-0006AO-Gw
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRO-00077p-Rv
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:18 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:33765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRN-0003Aw-6R
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:18 -0400
Received: by mail-il1-x12d.google.com with SMTP id z2so3603047iln.0
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q+DwhZkbE/7PnmMrGHnWD/j96V4JPrO+89tpRM2MG+8=;
 b=F2jqwDktwKCz89Ki6taqZt/1SGvcuS1R7vv8Fk2G3R6dSezshuqE5tw5O/GcTNFt2B
 zH+TfOPfF6Z+L/g5QSN2J4c33qaqrMMolZOY0h+OIxUg+UQFJ49YyxoYp3sDshW/E5GE
 LXZIhd9M4xqOfjldYD9YnFwg38+P00gtqDfh/8vr7YSMuShc29wpPN+ccvVLhc430nLO
 PGmQI03e2S8hty6T6e2UwCQrwWir+PI+dPaytND6aqEkKnXVtQye3tzSBvbv/yvayMV4
 BRd/jJNBIpFoL6qsDyjjvGYUqMqcUHVphgsWd2VjFR/brmOKzYWAsMHCyb8OvXgxcF7h
 jUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q+DwhZkbE/7PnmMrGHnWD/j96V4JPrO+89tpRM2MG+8=;
 b=QOGQIm7BajOGsJRIvt4nJOfhs0xVSB/0Uqk+Ds2Yw8Le28PaO5ZL1Lxp36GbTLUT5S
 Lq7PfP3g69ZMFkRq8jY2MiGUDfHK99Fd24u9giAQI3QF1UBNdGMNuRrdjlfWtFw6aHg+
 8moD3O8aN9JC5LcsYtHVThmIcS1KDJK10HgT725L19zdzwGb6fssyzLCMDD/aCIyZ7bj
 DoLgDevqMIQJ/gdWd5xTpWEEi5PxD2SFM2AMkLrK/hBK5yJhXYn8/rU1cfkrilGi2MPv
 hTRQ1ddkHQlN6Gw9ezXZ2xM5y29Vlarou4eTl7A2B71IBrN4UbHKheLNi0jyjxg/gjWg
 99jQ==
X-Gm-Message-State: AOAM532nZPzFzCgtpFoCQEp0ed+H9lTb+88IO9i36dnj1rA6qTFafR54
 eByq3mnPQZGQMudROAN6m7SWIhD57E6AL5Gl
X-Google-Smtp-Source: ABdhPJwJRdgctKi65+KZReTJcwa52MEoQxqWCdyGS5zJYF3rzWzuywUs0a28/zIWhlXwTsmLLQ9njQ==
X-Received: by 2002:a05:6e02:1522:: with SMTP id
 i2mr539731ilu.208.1630626495751; 
 Thu, 02 Sep 2021 16:48:15 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:15 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 34/43] bsd-user: update debugging in mmap.c
Date: Thu,  2 Sep 2021 17:47:20 -0600
Message-Id: <20210902234729.76141-35-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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


