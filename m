Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A4740F017
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 05:02:09 +0200 (CEST)
Received: from localhost ([::1]:54144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR48f-0005m3-0e
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 23:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43Q-0006PC-3k
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:44 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:34555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43O-0005o6-Cq
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:43 -0400
Received: by mail-io1-xd2a.google.com with SMTP id y18so10490183ioc.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 19:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TL4QVglLwTwjmmK5iuIYy6RUoEGcOEGAZFpu/cA1g1k=;
 b=GTm0SByp4Q3VEIdKpQih2qoY1vKxe0rXrwQF9hViviEtrrS0ivrH9wDEADpeyz0+79
 /ValKvaJgipLOliv6HPjq66bAVRnXTmmYZ6d6F4FZSCnThq/XwA/U3jzzCvpr1SNAzCZ
 VHWjQ02nRXMfUMEr5szzLL0E2nCzKtNmCoLO8cw4UW7KnD88q3PJU7SzgCrZYWTVJCXr
 ZKXjIF/D7OiV4KwsCnBs5O7iqrIJgXSGuqOmH3Xu9o1LCo8AMyz/ZhXsHiGV+y1zIbC4
 FSczR/J+2arQG3aNIquD4Hqlv/TY/dS9+wtPmaKuPym+A5r+b0OyROHFj+JpT/1VIf2v
 JXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TL4QVglLwTwjmmK5iuIYy6RUoEGcOEGAZFpu/cA1g1k=;
 b=NVFB/Ehh6psPgtxP75JHcPmAdZ7mgTau6xuVhz/tKwz7PxUiL2QHFfiLyIfPmVQOs9
 YJkKM/JbgsjTDSwq+G6pK7U1FHim+fCPMUflhTaDlZtCd3p8M1qP3oMlZmbZ4hyB8lVK
 RYOImcFxAtQ4kJPxalhGSYnc/zeXK2XZyxYLFnE/g2r+5djJcyPuPnGe3ICdhNrED8Zd
 1hAlgs30CCmjPTW/yr2eQAviO6j8lPUDjUBjGH7sfrsBhR2+EchQU5kwg0XHQ1KLcHcI
 VJlivOtd7ao9uuL3U5rjZ8JMeN4xJ3fVEzxbZe+MJLmCGyj1S8QIjvoqN7OiVkR/KuAc
 7AyA==
X-Gm-Message-State: AOAM531El0/WwDwJ1jmwoQe9yF/JdonBb/FHu/0SJy59BidkJOf+73TD
 xjbufxB2Nr28Ry5g9bJtceVWi/Gd5w8k6jFKJvU=
X-Google-Smtp-Source: ABdhPJye1h+OlVPoKyE4edjIQjojfa5Vf9mEz5i8AgYH3sJ0KUaddXkhreAFIdJctj7bE0inaxasCQ==
X-Received: by 2002:a02:716b:: with SMTP id n43mr6909658jaf.14.1631847400778; 
 Thu, 16 Sep 2021 19:56:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id e10sm2603738ili.53.2021.09.16.19.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 19:56:40 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] bsd-user: MAP_ symbols are defined, so no need for ifdefs
Date: Thu, 16 Sep 2021 20:56:29 -0600
Message-Id: <20210917025635.32011-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210917025635.32011-1-imp@bsdimp.com>
References: <20210917025635.32011-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All these MAP_ symbols are always defined on supported FreeBSD versions
(12.2 and newer), so remove the #ifdefs since they aren't needed.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 90b6313161..c40059d7fc 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -285,13 +285,9 @@ static abi_ulong mmap_find_vma_aligned(abi_ulong start, abi_ulong size,
     wrapped = repeat = 0;
     prev = 0;
     flags = MAP_ANONYMOUS | MAP_PRIVATE;
-#ifdef MAP_ALIGNED
     if (alignment != 0) {
         flags |= MAP_ALIGNED(alignment);
     }
-#else
-    /* XXX TODO */
-#endif
 
     for (;; prev = ptr) {
         /*
@@ -406,22 +402,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             printf("MAP_ALIGNED(%u) ", (flags & MAP_ALIGNMENT_MASK)
                     >> MAP_ALIGNMENT_SHIFT);
         }
-#if MAP_GUARD
         if (flags & MAP_GUARD) {
             printf("MAP_GUARD ");
         }
-#endif
         if (flags & MAP_FIXED) {
             printf("MAP_FIXED ");
         }
         if (flags & MAP_ANONYMOUS) {
             printf("MAP_ANON ");
         }
-#ifdef MAP_EXCL
         if (flags & MAP_EXCL) {
             printf("MAP_EXCL ");
         }
-#endif
         if (flags & MAP_PRIVATE) {
             printf("MAP_PRIVATE ");
         }
@@ -431,11 +423,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         if (flags & MAP_NOCORE) {
             printf("MAP_NOCORE ");
         }
-#ifdef MAP_STACK
         if (flags & MAP_STACK) {
             printf("MAP_STACK ");
         }
-#endif
         printf("fd=%d offset=0x%llx\n", fd, offset);
     }
 #endif
@@ -444,7 +434,6 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         errno = EINVAL;
         goto fail;
     }
-#ifdef MAP_STACK
     if (flags & MAP_STACK) {
         if ((fd != -1) || ((prot & (PROT_READ | PROT_WRITE)) !=
                     (PROT_READ | PROT_WRITE))) {
@@ -452,8 +441,6 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             goto fail;
         }
     }
-#endif /* MAP_STACK */
-#ifdef MAP_GUARD
     if ((flags & MAP_GUARD) && (prot != PROT_NONE || fd != -1 ||
         offset != 0 || (flags & (MAP_SHARED | MAP_PRIVATE |
         /* MAP_PREFAULT | */ /* MAP_PREFAULT not in mman.h */
@@ -461,7 +448,6 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         errno = EINVAL;
         goto fail;
     }
-#endif
 
     if (offset & ~TARGET_PAGE_MASK) {
         errno = EINVAL;
-- 
2.32.0


