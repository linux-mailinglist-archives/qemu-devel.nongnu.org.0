Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E2B40F015
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 05:02:06 +0200 (CEST)
Received: from localhost ([::1]:54086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR48b-0005ji-AC
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 23:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43U-0006Ze-TD
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:48 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:35455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43T-0005uM-Bv
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:48 -0400
Received: by mail-il1-x135.google.com with SMTP id h29so8818633ila.2
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cj37KPd2SWCobJtMrc5Dakgc5rtmPcmR/rTLXBzFkCo=;
 b=j4ehLSoTtYO6PEC9YeWjdNkfAr7L/OtYs8wXIEENoEETysofrtlukA7w/4dKuOXC37
 1gKQtakZs/d2NCT9kSnaOy6CA+5O4FudknCVrRtQ0uFosRCF0DRUUY8qhdhrVNe5Izqd
 E/bwb/FeK19CqHpHG9W34gtBzS4d3ietaSFwfD5vvPM75PU5u3buWhS8uhBtlrs9NCJa
 6qk6Ku0xm0TqmBXkGWpo8Swhy99L+yLyjgDV96/H/o/KayitTRnmTEFEzMVy+67vvhKo
 wwIgdRiT9a5cPnUKiJRMlgk27b8q6tXM5XAeVD/rPs+ZGJSXjO5O2jxLATU7xihSNo5t
 QX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cj37KPd2SWCobJtMrc5Dakgc5rtmPcmR/rTLXBzFkCo=;
 b=H0RMIIEHPzZEKIyrTiphJ0oXINiA1xNXrE8jUxUP/vtXR2MgodDAcVuB8z//+0giy3
 nVOlDVN9i93aUUbD8BTuYW5B+kGbClmIFIXiJ92J7eSfVxp8BIChuWCl4GgaaNCcqvFO
 Hrkb8kM8W9E6rnYoyNU9vQeB8/XWZwyst4azh4NkmKFyCtCR+LXxYP6ehKBjNXRXgbEY
 w+DBtB1b1Ler3QED4xuYGylx8UqxIL2Nu5b+vDNdiJ7bWT7n08ic7OD3U+Jxiw+G5aK9
 3VcbNXpwWJyIKmFJRKZiIk7Zo0ZfJhxUW48pPG4bgRbIXKvxeb2yp5J6+qtLOJBFdeFv
 UL9w==
X-Gm-Message-State: AOAM531vva9vIWSIe1t4A+xN7+O+pLLcI23BmDpuIJNKAgiPjCIiLQwp
 NWmkR8wyk3LBau0CYLqqitIZTR7C0UtyCEuyjqI=
X-Google-Smtp-Source: ABdhPJz7UfCuZ+20rzNfSMufS3B1xV8dmh8toTCd1tTWL4mqcx+MreQnaGqzRWrUXRMVivH4fcvcHA==
X-Received: by 2002:a92:c145:: with SMTP id b5mr6036399ilh.203.1631847405980; 
 Thu, 16 Sep 2021 19:56:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id e10sm2603738ili.53.2021.09.16.19.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 19:56:45 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] bsd-user: Don't try to mmap fd when it is -1
 independently from MAP_ANONYMOUS flag
Date: Thu, 16 Sep 2021 20:56:33 -0600
Message-Id: <20210917025635.32011-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210917025635.32011-1-imp@bsdimp.com>
References: <20210917025635.32011-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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
Cc: kevans@freebsd.org, Guy Yur <guyyur@gmail.com>,
 Warner Losh <imp@bsdimp.com>, Guy Yur <guyyur@ngmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guy Yur <guyyur@ngmail.com>

Switch checks for !(flags & MAP_ANONYMOUS) with checks for fd != -1.
MAP_STACK and MAP_GUARD also force fd == -1 and they don't require
mapping the fd either.

Signed-off-by: Guy Yur <guyyur@gmail.com>
[ partially merged before, finishing the job and documenting origin]
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 8b763fffc3..347d314aa9 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -154,7 +154,7 @@ static int mmap_frag(abi_ulong real_start,
     if (prot1 == 0) {
         /* no page was there, so we allocate one */
         void *p = mmap(host_start, qemu_host_page_size, prot,
-                       flags | MAP_ANON, -1, 0);
+                       flags | ((fd != -1) ? MAP_ANON : 0), -1, 0);
         if (p == MAP_FAILED)
             return -1;
         prot1 = prot;
@@ -162,7 +162,7 @@ static int mmap_frag(abi_ulong real_start,
     prot1 &= PAGE_BITS;
 
     prot_new = prot | prot1;
-    if (!(flags & MAP_ANON)) {
+    if (fd != -1) {
         /* msync() won't work here, so we return an error if write is
            possible while it is a shared mapping */
         if ((flags & TARGET_BSD_MAP_FLAGMASK) == MAP_SHARED &&
@@ -571,7 +571,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
          * worst case: we cannot map the file because the offset is not
          * aligned, so we read it
          */
-        if (!(flags & MAP_ANON) &&
+        if (fd != -1 &&
             (offset & ~qemu_host_page_mask) != (start & ~qemu_host_page_mask)) {
             /*
              * msync() won't work here, so we return an error if write is
-- 
2.32.0


