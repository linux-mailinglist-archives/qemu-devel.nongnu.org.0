Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2D40F01D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 05:03:54 +0200 (CEST)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR4AL-0001k1-Aq
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 23:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43R-0006SJ-Q4
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:45 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:46901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43Q-0005rI-Fb
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:45 -0400
Received: by mail-il1-x136.google.com with SMTP id h20so8730959ilj.13
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 19:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bz9xxzOHeyZagtkOxaSrxkXtiVjb/9po0iv6mA9969Y=;
 b=e2rwnNAeeHEiHHAEknTuo+PWA2/ILK05wd+vEUCCuasQ4LIvhsu0jWmWS+4gHTnZ2j
 6pKB3MpARQWwL6lGnAzm1rFZtpLy7/kBz8qz529GDTb+XykxXkMw8qa2VfLDd6CDJxOj
 PvtcZKRGWQ5l3eXyKJEDce+y0SU/BfGzVTxCZ/PMlU3iKpw/HJHLad3T73aDwOWPhDDF
 zD1nCScZK59tFKBaHc0BG/O8uAkSqTfWsJN6jLppk/ignletezyxm8ixhUPjbi/HlU7a
 jSHcGWmg/pEnyWwHGI9ccLmJR8M/8sxmtnZ0gQJlNni9RvaK0RTh2kLW5zTPnlIek0o4
 ThgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bz9xxzOHeyZagtkOxaSrxkXtiVjb/9po0iv6mA9969Y=;
 b=yR2/1uhvfJKwnaOQsP2OuUd5kL3QK5SDxCbU+X+9deuX+5XHmkjkzWA57GZMto17yF
 TpGMDVCJ1z9XzswBSVs+JYvvMjj9JPfxumbhwrmRR66qgabvfJTPkgyIEs+9x7RJTBvT
 /MF53rqrkITRKNBefd7G4P0ijqzMAO3SFU8VFuyCfh14F60LT46r55hT8IZvCcEyFQlB
 vr0xVAA20jWc6vf3SmkKaMGLKIXE49GmtkgLsC4Ep2rlTidJO054MF6eCZH6vbDCE3DN
 UQNWOAcRxn4DhAYQIihasQwHCvmW4r/Y3cfgXReaNWYno5froyJkMI87oMIhU0u438Mn
 LRxg==
X-Gm-Message-State: AOAM530gWrGuiUSYiS7gSasVogav8q7v6Q2qsQ+lwaHCChTSHN3qh1HB
 iluLpyOIVtEvHtmb8YEbIb1sFeUy9P2a/b38xOA=
X-Google-Smtp-Source: ABdhPJy5BipFUox6GNOw2IxuQZE0ROZLaQS1mIhqM8j9bl2IxquV5B2GuoawSfgwgILOd2CeyWhmEA==
X-Received: by 2002:a05:6e02:f13:: with SMTP id
 x19mr6406915ilj.216.1631847401538; 
 Thu, 16 Sep 2021 19:56:41 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id e10sm2603738ili.53.2021.09.16.19.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 19:56:41 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] bsd-user: mmap return ENOMEM on overflow
Date: Thu, 16 Sep 2021 20:56:30 -0600
Message-Id: <20210917025635.32011-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210917025635.32011-1-imp@bsdimp.com>
References: <20210917025635.32011-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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

mmap should return ENOMEM on len overflow rather than EINVAL. Return
EINVAL when len == 0 and ENOMEM when the rounded to a page length is 0.
Found by make check-tcg.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index c40059d7fc..0acc2db712 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -454,11 +454,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         goto fail;
     }
 
-    len = TARGET_PAGE_ALIGN(len);
     if (len == 0) {
         errno = EINVAL;
         goto fail;
     }
+
+    /* Check for overflows */
+    len = TARGET_PAGE_ALIGN(len);
+    if (len == 0) {
+        errno = ENOMEM;
+        goto fail;
+    }
+
     real_start = start & qemu_host_page_mask;
     host_offset = offset & qemu_host_page_mask;
 
-- 
2.32.0


