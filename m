Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C597A40EFE8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 04:59:04 +0200 (CEST)
Received: from localhost ([::1]:46810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR45f-0000tf-Qf
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 22:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43U-0006YP-Mf
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:48 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:43821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43S-0005t9-A0
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:47 -0400
Received: by mail-io1-xd2f.google.com with SMTP id p80so3837219iod.10
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 19:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YABXt7N5hYjs3+JGLkXDo6wCkHqEJQ3WPYs4NvgmbNI=;
 b=mIKpaPNYlzXWx/rxCMNRLbdChNTIs+0k55uMsLSLenFeYjo/WoKZAQ6vZXoD+cpqxw
 NJ6OzTECxD1lE+C8QEJRaJjeucwgi8RTVoGdGJu4REFPwuHmx2jJmV4MyAYH0+IbkRLh
 2EyY9pUbovRexEH3j6YchUj7eeQ/+nRlleiMIB0vb8l9GXfNB8lCRMffClf37TwyJ3U/
 pHCq0sy5lw5DIGveMQcBcAAWkwrpDhlEXH8YPDjRhn5DSoEbdB4yNHRjWJuvWbvQVa1H
 dS3yV+POZI+kkITpDJQ3wTxRPP0GEPHEHKyGGvmFJ2d5Hl6oCmxES2fSCRRZOdm1FzJj
 tUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YABXt7N5hYjs3+JGLkXDo6wCkHqEJQ3WPYs4NvgmbNI=;
 b=rgujNYaG4J3u5jzgyix195ZSbhI9S0JWArpS+vk4LnFt/M3Q/JgfdRaRt/e5QdIsD7
 +tnQ7vOWnekCSKzCaj5iLFT58oN8DyvhC+f1x+9lRVhv9UMJ52nd5HIad53NXEjjqbY1
 WSUBz/+Nsc5K9NR9KSIbppKWgiQu4Zc0LKshSWhaO91yaYXE4iU03oZBqSZQSrK8eWP7
 OHzbBVT2FcQZAovded2t1fLNv4we5BRcgeccvK9PnEP/57v3MO09sLZSnc05rWrwLdnL
 yAz9CbKwBudkILo+aYiR/fKUsZGtIU7EBJZypomXcg5tycyatQAcqBZtq5JhzxebV+4I
 41AQ==
X-Gm-Message-State: AOAM530kJSvWHX7PkwDC+yte+rJSNFthg6f1vc7wrdWghwfZNqKWrK7U
 6I0DnXgtqWM2YceE37XjbujTidINpIGXZE2wdUY=
X-Google-Smtp-Source: ABdhPJzCv9xh8Jm0fVLYtQVc7aDPZUy6Mt9BYZkxu49kjUhUXA0mepetxdX09xaPIruXSCtqhqOTXA==
X-Received: by 2002:a6b:28b:: with SMTP id 133mr6771025ioc.107.1631847404851; 
 Thu, 16 Sep 2021 19:56:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id e10sm2603738ili.53.2021.09.16.19.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 19:56:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] bsd-user: mmap line wrap change
Date: Thu, 16 Sep 2021 20:56:32 -0600
Message-Id: <20210917025635.32011-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210917025635.32011-1-imp@bsdimp.com>
References: <20210917025635.32011-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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

Keep the shifted expression on one line. It's the same number of lines
and easier to read like this.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index bafbdacd31..8b763fffc3 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -399,8 +399,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                prot & PROT_WRITE ? 'w' : '-',
                prot & PROT_EXEC ? 'x' : '-');
         if (flags & MAP_ALIGNMENT_MASK) {
-            printf("MAP_ALIGNED(%u) ", (flags & MAP_ALIGNMENT_MASK)
-                    >> MAP_ALIGNMENT_SHIFT);
+            printf("MAP_ALIGNED(%u) ",
+                   (flags & MAP_ALIGNMENT_MASK) >> MAP_ALIGNMENT_SHIFT);
         }
         if (flags & MAP_GUARD) {
             printf("MAP_GUARD ");
-- 
2.32.0


