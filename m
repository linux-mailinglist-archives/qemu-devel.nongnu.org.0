Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634EA414103
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 07:02:26 +0200 (CEST)
Received: from localhost ([::1]:56636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuOn-0006SN-EE
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 01:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJN-0006VU-RS
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:49 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:38532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJL-0007f3-0Z
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:49 -0400
Received: by mail-il1-x132.google.com with SMTP id q14so1396588ils.5
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i4NpgXtAEZY2117PSHLpXzBBewAezHeu7zLi+N0vW3Q=;
 b=su1jqUpl3ckFgHjNEtPcX2DKZMtqOi0rJeKKPKqNeY4kDym4nhQBFHY5V4vQ6YB+n5
 iF00nfnVvfVlCR4G1YCiSiXIL13qCpSJ/9yXyFUoPkJz124IUkvoS2F3iy1VOey8rdOY
 LY0IYvvjepLduWJQ8dJOnCVldV11nGrRH6Uad2aSDMZ0qe1VGcC3Crrfk1jW2bOw7YOE
 0QROKHcok8/Kxwq0qizNiUcjYjuiI90y/NcDWh6AGxzBRJKd8+RUHofE5PCSdyMvXQW3
 zJJjOhyLhBtRdGhWWpwbGYjvZ1OHxiT+y4qsRHfEZMNTXo5JH1x0lFRYyCkBzBmFjOgU
 2YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i4NpgXtAEZY2117PSHLpXzBBewAezHeu7zLi+N0vW3Q=;
 b=8Nc9xhqZaSnvXyOIuZpeDcNFFA5JOLQLobSjaQwRpIwbdISoxkxC+MHqHqwyyp7PON
 lR197nFl7lxuWeuILrVIJBQv2LNV/ZPvIKsxPMMvmFSRht3Qkn4m/Lh4CugnqnjABKGv
 kgpvzTr5yFaV0JA/AavQZ1NllTbUtjFMIb5ykyZrXFpHwiAkA0cifAWt9XXfk3ebFOH2
 4Fp9kWP5ZBgORCprTI6LcBWXnmEl+BbOnQjFNaOpMjD4M8RmPurO/k6YJSQwUGHUNCD9
 jrfGjI1mS3LPT85bppxgaj4Jb7c/nkCD3R5Ui7TQvji1v2sPefCaESdfhd/RJnP67SjC
 wCQQ==
X-Gm-Message-State: AOAM530kHCucT4sSSLuz0w8aAADAzzrs6Xzin/neyImXbsHSc090JRTS
 5SsH/E+FPX/WTF7Zjr78kGz6C9uhQQ5bmoRwQFc=
X-Google-Smtp-Source: ABdhPJyl+zTSfo1mKloQ5CpJNUI/vLlXu21hsgUUwBzHFoUTYBRgfTCkCKRlXWkL08Dt7xHwrXGsow==
X-Received: by 2002:a05:6e02:1aa5:: with SMTP id
 l5mr22829146ilv.73.1632286605231; 
 Tue, 21 Sep 2021 21:56:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j5sm512833ilk.58.2021.09.21.21.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:56:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] bsd-user/mmap.c: Always zero MAP_ANONYMOUS memory in
 mmap_frag()
Date: Tue, 21 Sep 2021 22:56:28 -0600
Message-Id: <20210922045636.25206-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922045636.25206-1-imp@bsdimp.com>
References: <20210922045636.25206-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 richard.henderson@linaro.org, f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mikaël Urankar <mikael.urankar@gmail.com>

Similar to the equivalent linux-user commit e6deac9cf99

When mapping MAP_ANONYMOUS memory fragments, still need notice about to
set it zero, or it will cause issues.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index b40ab9045f..fc3c1480f5 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -180,10 +180,12 @@ static int mmap_frag(abi_ulong real_start,
         if (prot_new != (prot1 | PROT_WRITE))
             mprotect(host_start, qemu_host_page_size, prot_new);
     } else {
-        /* just update the protection */
         if (prot_new != prot1) {
             mprotect(host_start, qemu_host_page_size, prot_new);
         }
+        if (prot_new & PROT_WRITE) {
+            memset(g2h_untagged(start), 0, end - start);
+        }
     }
     return 0;
 }
-- 
2.32.0


