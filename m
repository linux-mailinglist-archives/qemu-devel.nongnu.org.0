Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204FD3E372F
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:48:21 +0200 (CEST)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUAy-0003g9-CT
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5w-0006Xa-EM
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:04 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:46887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5v-0004mu-3E
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:04 -0400
Received: by mail-io1-xd36.google.com with SMTP id x10so9096552iop.13
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/SzdmCxbDbx37uUlzLl6leaezBFWr4q0LzmRZIBccw=;
 b=Snnet+QbUAdAQq/OSdn9XgOnTfM60AzctVSLZ9Q7SBaSDO4RALd1r1a0ckgD+/H5Ay
 m+rzHeAAkVjoJJtks915zdgtCW0Tx4Su9bx4VmAehV4IBOsTdr/9FmaHBa5Wpy8IrKSJ
 cDv1587P6MWif1eu8Esj6IzRrQ3BiOXYSeQoUv9B9XhNy5c9fWXFKWkhi+CZk+fPIwLi
 JKGWiyDbvI594rW/c+ugadZyM3qUJvFr9oGwI/9EqB8n4I8QfPdCXTP9O+zoo62xDOtT
 6JIKBgcv6macoTJdo/2qjlubnIIq+rW9rNot6i5V0BppgMSQ6ifiBRq1q3ow82Lcwnyk
 BUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/SzdmCxbDbx37uUlzLl6leaezBFWr4q0LzmRZIBccw=;
 b=MiSvbaVKLRZY6q/tRBI7+Bm61sueFmcMEH6NWpa76GO9WkQWmSez2OFXQiN+1kxRtR
 HV8RGeO9TbYfn8BtFV2pI1bm9CH8cc8SAAnkqqVp7aH1gA/gp16QD252yzPDA3DqITWZ
 QXvUKLmKhavsY3Iic6r70x4IgA+Qse4WZkYqZ26rN8QTO76KIG3aZpng2sMEAdmWr00z
 cVy7zxssEkBMLwSP21Bp7nrVsWs/VQUXtGXPZiCby7kGAx+htHvfHwwBOluXTOGsFZlJ
 XFt+WU3qFGIiNVW4wFZg8EalaA12w8n3A80l6G1sklkR+cLtkwpAyxScYG9FIkND0Ume
 sCdg==
X-Gm-Message-State: AOAM532QQJZNSVww8qpUPmx+hV48S00uXLaFs1ES3XoB7bGgLTV707SR
 mZPV+e9SWZWPv4LeFxJAYzvOfVN5v+vMZL7d
X-Google-Smtp-Source: ABdhPJyRZbrzZYFFF43yOEk4F88iJ2ASi/lzIIvQKN7bGLxzTtL7MDp4L6ElNQNKI10XYd5ftJhWPA==
X-Received: by 2002:a05:6e02:107:: with SMTP id t7mr97029ilm.77.1628372581832; 
 Sat, 07 Aug 2021 14:43:01 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:01 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 11/49] bsd-user: Fix calculation of size to allocate
Date: Sat,  7 Aug 2021 15:42:04 -0600
Message-Id: <20210807214242.82385-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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

It was incorrect to subtract off the size of an unsigned int here.  In
bsd-user fork, this change was made when moving the arch specific items
to specific files.  The size in BSD that's available for the arguments
does not need a return address subtracted from it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 5282a7c4f2..379015c744 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -143,10 +143,9 @@ int loader_exec(const char *filename, char **argv, char **envp,
                 struct target_pt_regs *regs, struct image_info *infop,
                 struct bsd_binprm *bprm)
 {
-    int retval;
-    int i;
+    int retval, i;
 
-    bprm->p = TARGET_PAGE_SIZE * MAX_ARG_PAGES - sizeof(unsigned int);
+    bprm->p = TARGET_PAGE_SIZE * MAX_ARG_PAGES;
     for (i = 0; i < MAX_ARG_PAGES; i++) {       /* clear page-table */
         bprm->page[i] = NULL;
     }
-- 
2.32.0


