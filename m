Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E854140EA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:59:32 +0200 (CEST)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuLy-0000eo-Vx
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJN-0006VQ-M2
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:49 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:40655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJM-0007gb-7F
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:49 -0400
Received: by mail-il1-x12a.google.com with SMTP id a20so1381234ilq.7
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/YbCTb4pyb9g8pcHFf9V0TExz+u9RHYfFDmfNr6nfQ=;
 b=42rguCYVCVvJ9vtXGpTq8ofBvAOl1yrSwdSP95Ziz+Vb7pwJZjJGUBKVDcPzqrPlDU
 p8Mcic7oDPB6xrf4ljJjlB6Q59aW0TPfwjorFlhiijwtirEmkLzt/h0OEYGH/gSTRPZJ
 RN3/rDsFpxQAnG2ydSlsacq3GWv2NTpmVMXQcCgXAdAGihDrAxm2Ku/hkBdA1h+ojkuL
 HS2foasqzVkwLaca2OA6S4dPSCO4zXaH7XyMzeohbpwmNGoDPfiLfw+j2/mutesZ63Qr
 HVaq3mVtAUeKESWpZuNi09jsD5oDYO3RlD9yN8SKjRY9lXfhmJ/746Tv9qpmk7huO8Ml
 IaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/YbCTb4pyb9g8pcHFf9V0TExz+u9RHYfFDmfNr6nfQ=;
 b=qJdZ+AcLBh38S2TIblLcWvpl6uZWsJHtSUpJAbsjZqdHP/Q4cD8f208kQecrKfYQQ0
 yCx2OEAQK86azjqjsKX1Iu7eFwpHxR8/0rDYCP/gx7Hzsc2EmoHwDY6yLQcIcaz2AgtP
 VC06mmcTOKwYIPkGPTOxhbjWuRZvkGG4F3626jmcpnNibm9hhieGqxhwiNfY1lyYbYri
 bHe/H72JAE1zfiKQqSlc68HChDQNkogFFzNbdVUFl5M7kgkRx8zt1Nq79vKvAAIbREXj
 jVdgyzL8OmqHpvV7aP7JOi9Rfz1MnIxec4/WsJGiiP0BJ7fUn1lwh13BnRQWoYB7381K
 9tjw==
X-Gm-Message-State: AOAM533nUETz5vLKFj17xgsxUOANa8uNls+cFitmqdYS2rBE0/N0WZCk
 yTdPjxsxjTzFAOmI5x+0fSjderAHfqofGXpWEys=
X-Google-Smtp-Source: ABdhPJxaihZetrdLz1di2lS0Q1SMQ1h1ecw743O6yZ23SjwAuzZwRnUoLn/2c+yqgh7IgOjPHQBk5Q==
X-Received: by 2002:a05:6e02:20e4:: with SMTP id
 q4mr22039914ilv.58.1632286606738; 
 Tue, 21 Sep 2021 21:56:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j5sm512833ilk.58.2021.09.21.21.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:56:46 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] bsd-user/mmap.c: MAP_ symbols are defined,
 so no need for ifdefs
Date: Tue, 21 Sep 2021 22:56:30 -0600
Message-Id: <20210922045636.25206-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922045636.25206-1-imp@bsdimp.com>
References: <20210922045636.25206-1-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, richard.henderson@linaro.org, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All these MAP_ symbols are always defined on supported FreeBSD versions
(12.2 and newer), so remove the #ifdefs since they aren't needed.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


