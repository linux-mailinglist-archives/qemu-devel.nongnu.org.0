Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC440F016
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 05:02:09 +0200 (CEST)
Received: from localhost ([::1]:54168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR48d-0005n3-SA
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 23:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43T-0006WW-63
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:47 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:46891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43R-0005sN-KJ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:46 -0400
Received: by mail-il1-x12b.google.com with SMTP id h20so8730976ilj.13
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 19:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Vzgoo2caIWheChlxtQetZ/F+1IpsE33ClusX3+oSXU=;
 b=thQpduziTEbqNd3YyIRlPE7POUyRVqacoZkrqWkZJ7XZmOLB5BCs/1snLyekKMhcoN
 UTdbktoGJxujUyK/tBiBCc//EaHf0Nba3aQ35VHpkOfr+fUui6H/yS6x4n3/5qxm+V3/
 LB/Q0mYF7+OTEoyHEOYzJUPhLbX1FPbISDKooxrAjXQseiOYjBIc1ogafUe3XXBp+VtH
 POhWLmy2xWanfYFHq/hO/Ojc9iNyoEKd76t+eBV1N1duRs05UT3l1WoMZPBBQGs4h7c2
 ihj85PWAFTSsLnQmzQzWXaePILxZlsvzuDB+FltgtILbO9Pe10HCynwMxir9jRYNWIrQ
 wmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Vzgoo2caIWheChlxtQetZ/F+1IpsE33ClusX3+oSXU=;
 b=mjEsvBqiPPtIdD2bCF0TRoq+/qCL0VyFoxTA1LuAXnAL6wdu9hpTgyiERTmUy9EpLz
 j8vytT17o/1QE7gGjDVdka4CvzF245i+N5fezhcG5p8gBZf6OhZcEkOzl9cEqypgHNTk
 ttispJ7WPJdj3+nEaQ8iLOi5SUPbdR6lhnjm++7/IqjNYGkXFug/SP5pltbUIRdMBcyc
 4RnicHYo4YeA5vGs4/Tj9mLCHDwQhoGdnEzSLIuTqV4vvccFsPrnucxINpmiNXzvaos9
 JiGgvnyOTGhlYtJHZlpSI1BHYS+svzKZQg4Cg3A+EANNoxdAMp/kWlAPJA4sEwyxSGxL
 6VSA==
X-Gm-Message-State: AOAM533y9u5z1OPqkbF1cGtdK1KTvKMOXT8RsB63+5E6A7a9K1QZjRJy
 dw2tyizrjF2cazj49nulmY+eGOQjEoy9tOr5/7I=
X-Google-Smtp-Source: ABdhPJzkooptEjMQsUMfWNb36euL3LdegO1TDugwSCwaSaBdVlgF+JWDJv2eoO7I+o0P8lmiAsQA3w==
X-Received: by 2002:a05:6e02:e13:: with SMTP id
 a19mr6264786ilk.11.1631847404053; 
 Thu, 16 Sep 2021 19:56:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id e10sm2603738ili.53.2021.09.16.19.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 19:56:41 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] bsd-user: mmap prefer MAP_ANON for BSD
Date: Thu, 16 Sep 2021 20:56:31 -0600
Message-Id: <20210917025635.32011-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210917025635.32011-1-imp@bsdimp.com>
References: <20210917025635.32011-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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

MAP_ANON and MAP_ANONYMOUS are identical. Prefer MAP_ANON for BSD since
the file is now a confusing mix of the two.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 0acc2db712..bafbdacd31 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -284,7 +284,7 @@ static abi_ulong mmap_find_vma_aligned(abi_ulong start, abi_ulong size,
     addr = start;
     wrapped = repeat = 0;
     prev = 0;
-    flags = MAP_ANONYMOUS | MAP_PRIVATE;
+    flags = MAP_ANON | MAP_PRIVATE;
     if (alignment != 0) {
         flags |= MAP_ALIGNED(alignment);
     }
@@ -408,7 +408,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         if (flags & MAP_FIXED) {
             printf("MAP_FIXED ");
         }
-        if (flags & MAP_ANONYMOUS) {
+        if (flags & MAP_ANON) {
             printf("MAP_ANON ");
         }
         if (flags & MAP_EXCL) {
@@ -430,7 +430,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     }
 #endif
 
-    if ((flags & MAP_ANONYMOUS) && fd != -1) {
+    if ((flags & MAP_ANON) && fd != -1) {
         errno = EINVAL;
         goto fail;
     }
@@ -532,7 +532,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
          * qemu_real_host_page_size
          */
         p = mmap(g2h_untagged(start), host_len, prot,
-                 flags | MAP_FIXED | ((fd != -1) ? MAP_ANONYMOUS : 0), -1, 0);
+                 flags | MAP_FIXED | ((fd != -1) ? MAP_ANON : 0), -1, 0);
         if (p == MAP_FAILED)
             goto fail;
         /* update start so that it points to the file position at 'offset' */
@@ -694,8 +694,7 @@ static void mmap_reserve(abi_ulong start, abi_ulong size)
     }
     if (real_start != real_end) {
         mmap(g2h_untagged(real_start), real_end - real_start, PROT_NONE,
-                 MAP_FIXED | MAP_ANONYMOUS | MAP_PRIVATE,
-                 -1, 0);
+                 MAP_FIXED | MAP_ANON | MAP_PRIVATE, -1, 0);
     }
 }
 
-- 
2.32.0


