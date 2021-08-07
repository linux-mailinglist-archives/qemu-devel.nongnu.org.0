Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E8F3E375A
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:08:24 +0200 (CEST)
Received: from localhost ([::1]:51208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUUR-0000FT-Uo
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6O-0008N7-Ec
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:32 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:46889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6L-0005IC-LP
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:32 -0400
Received: by mail-io1-xd33.google.com with SMTP id x10so9098131iop.13
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hMZeNvS0Jt1YHQmPhjmHqhTtgGPWiJc8Qou+PKhoA5E=;
 b=AYCCB486mJ86Ocw/dGGUKbi7YegpYyfXDgsJEvekdhC6Ljx5axD/2/TJoI80m/uQPx
 y5k7PIIibsMvE0jWGise/ju8hf4W0lBtGe2zTZojS3rM3eKw/e28lQlU5EL6QM4cChrM
 vOZ9ZUTPIUwYkvgytWGKVHJMtmWn+VzSMLquqHr/WTf99yjmSiJa+sm3NI0SgF4/2DAk
 QtXBu/y4pCymGoWcE7+pBotOqkZvbtzuPJdQfbTdUrewWHOgdvhzVbYkXMvuRvB9FLUF
 xsgVZBOWELrwZWX4L3KR1OLS9QppK9lT6zHl6qzJ1J9FUOCAoSmH6xHULSqJ5hLpiQ0F
 r7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hMZeNvS0Jt1YHQmPhjmHqhTtgGPWiJc8Qou+PKhoA5E=;
 b=R54ieT1vEXo4zoJp/FpMdytAET2eODBj7PXW3hYO/iJX7feo+FDFFNNuMf5yTc0XEX
 uEXGPK+tE05D8dFCwICR0K1arSFAwfz8tsCDxpGASr8ZcaGisbEsOH9SGNqvIRWAhuFM
 TQ1Od/JH0c5Fr2XYa1wbuCVYBa03GX8Cg5qGLYh23KpZ07toRvkfNsSvl/j2KCMiQMVK
 AyAnUhB6pnCbFKuZSQSyCntMCyuKVjXcXgZdMqUyb37V09uIZ6+Io9TAqOPjls7w2aK6
 26XYGklVDkH3/xdZRGwi1HbvaZPQEdU0W2D/tlA44TK+mHTpIjtHJLIiiQozTPP3CG5i
 hqYQ==
X-Gm-Message-State: AOAM5331yjMDuD40BzpFDlmLeSydfMVXLmRD6tBesTNugd9UY4/H8fJy
 egcKUWcIZCcEYHdJfv8wWaQ7ENcG26amJMzB
X-Google-Smtp-Source: ABdhPJztSPSEqjcVzeGj/sKHfUU4bro8YQ+64oFgqGxVrEIfI4+au9mgYL9OgHn/GrWYJZKyES01bg==
X-Received: by 2002:a5d:9906:: with SMTP id x6mr48148iol.23.1628372608358;
 Sat, 07 Aug 2021 14:43:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 37/49] bsd-user: update debugging in mmap.c
Date: Sat,  7 Aug 2021 15:42:30 -0600
Message-Id: <20210807214242.82385-38-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>, Sean Bruno <sbruno@FreeBSD.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Update the debugging code for new features and different targets.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 49 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 03119b1f20..99563d61aa 100644
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
-            printf("MAP_PRIVATE ");
-            break;
-        case MAP_SHARED:
-            printf("MAP_SHARED ");
-            break;
-        default:
-            printf("[MAP_FLAGMASK=0x%x] ", flags & TARGET_BSD_MAP_FLAGMASK);
-            break;
-        }
-        printf("fd=%d offset=" TARGET_FMT_lx "\n", fd, offset);
+#ifdef MAP_EXCL
+        if (flags & MAP_EXCL)
+            printf("MAP_EXCL ");
+#endif
+	if (flags & MAP_PRIVATE)
+	    printf("MAP_PRIVATE ");
+	if (flags & MAP_SHARED)
+	    printf("MAP_SHARED ");
+	if (flags & MAP_NOCORE)
+	    printf("MAP_NOCORE ");
+#ifdef MAP_STACK
+	if (flags & MAP_STACK)
+	    printf("MAP_STACK ");
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


