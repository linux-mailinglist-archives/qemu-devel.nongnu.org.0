Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692143F904C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:48:20 +0200 (CEST)
Received: from localhost ([::1]:55988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJNEM-0000t7-G5
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgD-0006X9-83
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:59 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:35455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg9-00071a-8g
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:57 -0400
Received: by mail-il1-x12c.google.com with SMTP id h29so4750390ila.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fw3ub3XV22/J/EjH/3lolOHd/DBVeLkqCaDVd3hucE4=;
 b=0N4eTg+l+Cr6mZEFqMI0FchPE4qi5NVqx8C74ojhAt4wkgi/WohqOzyCz5R/mgP7fD
 26kvbwkGCAvfYyDcef6mfUsoHTLxBzvS2qQTylyXrsQfU1EcHQhewewx5Kt9Ggf9hYmL
 NEHipw/P9KohrFRcAym42ivGgfkNjUjYZGWmX984sU5lhlw0WYa/N2ZNkpd2Ynzw477t
 wXm9vHU2dijmtlpc04N5QqMS/DfDJKovfQ96WTAChxL0uFi6QRBYVbUlEn1WZobCA7BK
 VBJigREbpmtc3hhExnqwMn2d3SV+kbnSv1qtMPmX0kdQVG07a3qv4UGc5SqBwhLzjb2Z
 1fNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fw3ub3XV22/J/EjH/3lolOHd/DBVeLkqCaDVd3hucE4=;
 b=l9AXMsOMHeK1lZ6t9oEO+iGYn80Fo+di8i6wdgEqT3YnrDlmtF+ofNUL7YwxxD/tiK
 4m3E+aUujuIAq/FaG4TjV5sqkdYsLKjIiIfUnw1zjCXv183B+E2KAKsNTZmsAePbFtIH
 g97GwPYkE257FAZTm8nUsQRJQG39QDe//XqyUdUSbluuhv90vk1wHqGpN0Sv23qB1HYz
 hrVB1ABX3/poJj2psJeAyS95FWDCdgoKk91hZhlzAqwaQli6SOgFe7ckEnbJqsw9v8lJ
 0USb5lDoBaQ3/4VTXLzYEbOZzTAN+H0GlEsNSUHVPamXEMhY1Lf5zozF7Atso+5L9Yqt
 f7XQ==
X-Gm-Message-State: AOAM533Q83hKFkDj6fxeFZhqHt/WFnitb6XzfJ5/nbNSTQIAHIzASZh/
 I9JXiuvjy/WJ0nliLhAu41NzkaItVpo0DYvn
X-Google-Smtp-Source: ABdhPJyKDN/f3zRl8UFeur9JcQyYy+oUT6Dx6Tepcf8YBrI9oZEKSy/Hm4Ep8koWkLOKDUh+Tae/VQ==
X-Received: by 2002:a92:c848:: with SMTP id b8mr4046331ilq.54.1630012371973;
 Thu, 26 Aug 2021 14:12:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:51 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/43] bsd-user: update debugging in mmap.c
Date: Thu, 26 Aug 2021 15:11:51 -0600
Message-Id: <20210826211201.98877-34-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
 bsd-user/mmap.c | 45 ++++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 03119b1f20..1ef4d271a8 100644
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
@@ -250,28 +250,37 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
+        if (flags & MAP_ALIGNMENT_MASK)
+            printf ("MAP_ALIGNED(%u) ", (flags & MAP_ALIGNMENT_MASK) >> MAP_ALIGNMENT_SHIFT);
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200035
+        if (flags & MAP_GUARD)
+            printf("MAP_GUARD ");
+#endif
         if (flags & MAP_FIXED)
             printf("MAP_FIXED ");
-        if (flags & MAP_ANON)
+        if (flags & MAP_ANONYMOUS)
             printf("MAP_ANON ");
-        switch (flags & TARGET_BSD_MAP_FLAGMASK) {
-        case MAP_PRIVATE:
+#ifdef MAP_EXCL
+        if (flags & MAP_EXCL)
+            printf("MAP_EXCL ");
+#endif
+        if (flags & MAP_PRIVATE)
             printf("MAP_PRIVATE ");
-            break;
-        case MAP_SHARED:
+        if (flags & MAP_SHARED)
             printf("MAP_SHARED ");
-            break;
-        default:
-            printf("[MAP_FLAGMASK=0x%x] ", flags & TARGET_BSD_MAP_FLAGMASK);
-            break;
-        }
-        printf("fd=%d offset=" TARGET_FMT_lx "\n", fd, offset);
+        if (flags & MAP_NOCORE)
+            printf("MAP_NOCORE ");
+#ifdef MAP_STACK
+        if (flags & MAP_STACK)
+            printf("MAP_STACK ");
+#endif
+        printf("fd=%d offset=0x%llx\n", fd, offset);
     }
 #endif
 
@@ -399,7 +408,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     page_set_flags(start, start + len, prot | PAGE_VALID);
  the_end:
 #ifdef DEBUG_MMAP
-    printf("ret=0x" TARGET_FMT_lx "\n", start);
+    printf("ret=0x" TARGET_ABI_FMT_lx "\n", start);
     page_dump(stdout);
     printf("\n");
 #endif
@@ -416,7 +425,9 @@ int target_munmap(abi_ulong start, abi_ulong len)
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


