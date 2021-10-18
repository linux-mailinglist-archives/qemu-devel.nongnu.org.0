Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E78B43237E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:08:07 +0200 (CEST)
Received: from localhost ([::1]:35596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVBG-0002RD-0e
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8o-0007gM-Kn
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:37 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:33737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8b-0007rB-6Q
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:27 -0400
Received: by mail-io1-xd34.google.com with SMTP id n7so16965561iod.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PY6MV6MerQjsFge0//XqvVk7s3rubPiFJX6U1DaTO60=;
 b=Zyr0eiQ5krDMHRM2AtzGgYtHeaenICKyTifpupdrdnO0tIGtazX2MiLEq8gAMQDEt0
 hxyMfJSq3DgU/FheP480iV6w2buHUoJcuM3GS9Wr0JaWLy0qvUuIEgCN4Lm4/lh+54rg
 XnkUmY3LVkT8Maes1BGd6lX8IWu7ngsbRivWh5U1jsCsC6PCZUBjWelDylwe3dxnZUI4
 xTY7oVdc5gOxAIBF/RU+RD2p95IrxPxzuvyBhWSbI4aDmXzYxnidekfqDzQw2XBxjDRT
 4EqcnXuv2HgNNOn0dVCe7XncCauSpIx3y+eOvX6QZcwW0Oat5MtBahwO0PqSaEpLPFbP
 zPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PY6MV6MerQjsFge0//XqvVk7s3rubPiFJX6U1DaTO60=;
 b=JA6MRfZ5/nV7q2A6TZfars3YxsHnNyLa0jv1Qqd2OYRjHv7Sh2Xw5FVkCFisMw6k7D
 sU4FsB1TQYbk2ABDVZWh4e3A4dsvOWdXIpXAld5F015PwGlN8CMolJvPJorH3W99XZI7
 lUHYPNfRgoych9r/Ign89jiFS3O9e92j8WNapqplOhLeVZygNHhjA88nEAkymVNSmLGC
 2BbDwSP9R8O1KAup8TpbaFyiXk4WzUkyzQhEqhesHUb+Pq/YBbsAd9pP8GFdEp8PKm1/
 f+d9vyODIOZdBis5HBNnm5i/i0Yd6KQfLhE1vYw6U6dxgKnWdULxyxXg8doFE+aBmFix
 xqSg==
X-Gm-Message-State: AOAM531mVi7/d/s8dl1GWCjqfTwKEh/dona2pjB0GUKrb1C2EBpVycwk
 NHzUdOKhpc1Dw0Moigj+MKlaaI0VrJKqDQ==
X-Google-Smtp-Source: ABdhPJz64PJGXAHYOSKJ+TqCnp32TuVl9SAd2cFmQJC74Xi+ZUGE4gJYdKVbQr7SaBWqcACFPLTIAQ==
X-Received: by 2002:a5d:9d82:: with SMTP id ay2mr14927512iob.128.1634573118064; 
 Mon, 18 Oct 2021 09:05:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:17 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/23] bsd-user/mmap.c: MAP_ symbols are defined,
 so no need for ifdefs
Date: Mon, 18 Oct 2021 10:04:38 -0600
Message-Id: <20211018160458.1976-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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

All these MAP_ symbols are always defined on supported FreeBSD versions
(12.2 and newer), so remove the #ifdefs since they aren't needed.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/mmap.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 4f4fa3ab46..6f33aec58b 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -286,13 +286,9 @@ static abi_ulong mmap_find_vma_aligned(abi_ulong start, abi_ulong size,
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
@@ -407,22 +403,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
@@ -432,11 +424,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
@@ -445,7 +435,6 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         errno = EINVAL;
         goto fail;
     }
-#ifdef MAP_STACK
     if (flags & MAP_STACK) {
         if ((fd != -1) || ((prot & (PROT_READ | PROT_WRITE)) !=
                     (PROT_READ | PROT_WRITE))) {
@@ -453,8 +442,6 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             goto fail;
         }
     }
-#endif /* MAP_STACK */
-#ifdef MAP_GUARD
     if ((flags & MAP_GUARD) && (prot != PROT_NONE || fd != -1 ||
         offset != 0 || (flags & (MAP_SHARED | MAP_PRIVATE |
         /* MAP_PREFAULT | */ /* MAP_PREFAULT not in mman.h */
@@ -462,7 +449,6 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         errno = EINVAL;
         goto fail;
     }
-#endif
 
     if (offset & ~TARGET_PAGE_MASK) {
         errno = EINVAL;
-- 
2.32.0


