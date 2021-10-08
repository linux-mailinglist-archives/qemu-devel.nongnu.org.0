Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FD642730C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 23:26:35 +0200 (CEST)
Received: from localhost ([::1]:51556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYxNy-00065y-LX
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 17:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLZ-00039U-G6
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:05 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:36796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLX-0007dM-RJ
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:05 -0400
Received: by mail-io1-xd35.google.com with SMTP id e144so12198763iof.3
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 14:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GXLEOZq/t0os6KbKaAOUmzhrYWQXeaANB7rwvx/zB8=;
 b=NvK2D3CgP5mR9zbAZKZAaNziPUCYEvD1k4Ul01H7Xg472vqNBY3+1G1c5WEQS3JIUe
 JKZF40idiU4IRg8BOnKNnohZK/u6RiMPOEICoUab4WpaVA9r1opedYhxzbUNjYmQD18k
 Au8KKzEnAy/c81gUIBgShGaaKPfHwOeJSSzJW5A4yNzg0bc6wAiI5g5qcnaVoCtV1Aiv
 43mZ/STRgXPKoTDGKaaPsNs0NtUBpuaM0JGra0ifEXjxqpYvovDDLexlXkHUL3pwCj5E
 loFZX7uhwEtSXKZmrgNIAOnMRe8tNZFwijCeb6mMCuPBSItHQ3GvXhOBIuInuhp1KHKQ
 E+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GXLEOZq/t0os6KbKaAOUmzhrYWQXeaANB7rwvx/zB8=;
 b=Z0+fKKEzvNBji75j6GJHBLN0EGT4BEMzF54sgt+eqzk2jtHMuHkc2oNd8gKYtv21i1
 EmMhyH78G2K4i3s3euqVhR4Z1CVLSDy/YbB557yAI4dXpmpwcFmtczI9Isq0G8yRrgmT
 uxITFiTBy2CAivwtbt/EQ1F6iBwgiEadMpqj+K3cJMDgiWYGdoz+pPcyHSB9P3qRLHHN
 unW56Dz/Jreh9/XOapyPEGolHeVKEj41D2EWjywSV7yc9cp6YWNMrfJ8dYrT0aE+xiag
 YMzjPj8RxPvfuyEsaDL6gQJG6dGIziA8oLyqswtJ5Z7bbdtjZNB4Y07ZZce+P9IQk1ix
 6Mcw==
X-Gm-Message-State: AOAM53074X98Z+0vHbmzLeCRGHWJNEpTWxBPwAzNm/0cK8UyTNqPQHdB
 K6RenUh1DKwlsiE9A3pJlRu7X2dT8/qcMQ==
X-Google-Smtp-Source: ABdhPJya1qxwkwyvl/ACWHBZOTyrdprYtjmRSrM3/qBhvepLOc7b+2XSgsZT4D1kHnHiBONnIgUl8w==
X-Received: by 2002:a02:3f4f:: with SMTP id c15mr9543187jaf.1.1633728242512;
 Fri, 08 Oct 2021 14:24:02 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm186620ild.52.2021.10.08.14.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:24:02 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/9] bsd-user/mmap.c: MAP_ symbols are defined,
 so no need for ifdefs
Date: Fri,  8 Oct 2021 15:23:38 -0600
Message-Id: <20211008212344.95537-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008212344.95537-1-imp@bsdimp.com>
References: <20211008212344.95537-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
Acked-by: Richard Henderson <richard.henderson@linaro.org>
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


