Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3737340EFE7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 04:58:59 +0200 (CEST)
Received: from localhost ([::1]:46384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR45a-0000ca-6I
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 22:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43P-0006Oz-C9
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:43 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:44942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43N-0005nN-B3
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:43 -0400
Received: by mail-il1-x133.google.com with SMTP id x2so8734523ila.11
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 19:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V3kJ3rG5LvywxyPiAPSPaqcJeVXwF6oa43iLfreGatE=;
 b=8AqsNDsctC3Mo4aqSvc7Z6SHRbXiFPpQtDrRz6HKiVR1VrSKBj1M0PEHrsP9rdTXwi
 O7AZ9UQHFRLtakCIPzERQu8jWI/P8aeuKg8ClELMwe3+kYx45Q66JkwTVv0LbnbXHaUk
 K/tPYMdFeFH/yaeqi2jxnOlPBhn+g0NRLpOFgbwWAOzKkm/4S0HJUMdzGfERYZjZ84aX
 IHthTGLUwDzWVTdX75yrzh7n4WzM9OcbV8qmTuCATyav3SSjHLUGXr+hh8GFV3zVZd+R
 ykhaGT9p25cxJ2g+mQ9oySqmkXUFB5DUVDcDwuCSb+NSr/cfEhA7+hJsHh5KEB2i7bqx
 k0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V3kJ3rG5LvywxyPiAPSPaqcJeVXwF6oa43iLfreGatE=;
 b=HZqGCrnv9Q6pCgOwyc3Zh4jLdXjknyEDUAWb8+oV1itYtXAN7JW3L1bJew3OAJYEcT
 2Z4foabpTKeWCocbNCR/8iaQ1fSUQlmSdNw3u45JWYNkgWToSTJ7M7/qzla6YTVgORVD
 00VYA1TTds3BSmr7h8Ck3s9jOpL19R9zXMZDQTO/E7z+kZsXL3ow7LVWoLtOfmCAHIHQ
 0ZS8Y3L/FidkhO/KJLxsffu03NC9dnQRvGVO/D0QMvJp/iKfpH5rTtefv+qJDeVc4XtY
 h47TSkgMvKjbBJf+xwx9Py+YgG8SUXmH7F7hBrqTUYaxF1Ml6mOTdfQ1+pfy5KvIED/l
 vhLA==
X-Gm-Message-State: AOAM533Smlpn2J2Fm/e6XMscD9ayuaNRUkYtNthYX2xY7sY/lALOi6xC
 hL83sdyO3AtfvYmPjGN7cGObtXnsuWcH4J33Sbo=
X-Google-Smtp-Source: ABdhPJwO7e3XRcgT8n7eEl6UsCnrqQilJdcohhjBpSxim11yqLfUtJ/jQGWe5RUGArPBIkUBcss3OQ==
X-Received: by 2002:a05:6e02:ecd:: with SMTP id
 i13mr6210631ilk.143.1631847400070; 
 Thu, 16 Sep 2021 19:56:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id e10sm2603738ili.53.2021.09.16.19.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 19:56:39 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] bsd-user: Apply fb7e378cf9c from linux-user (fix FORTIFY
 warnings)
Date: Thu, 16 Sep 2021 20:56:28 -0600
Message-Id: <20210917025635.32011-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210917025635.32011-1-imp@bsdimp.com>
References: <20210917025635.32011-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
Cc: Anthony Liguori <aliguori@us.ibm.com>, Juan Quintela <quintela@redhat.com>,
 kevans@freebsd.org, Warner Losh <imp@bsdimp.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mikaël Urankar <mikael.urankar@gmail.com>

linux-user/mmap.c: fix warnings with _FORTIFY_SOURCE

CC    i386-linux-user/mmap.o
cc1: warnings being treated as errors
/usr/src/RPM/BUILD/qemu-0.11.92/linux-user/mmap.c: In function 'mmap_frag':
/usr/src/RPM/BUILD/qemu-0.11.92/linux-user/mmap.c:253: error: ignoring return value of 'pread', declared with attribute warn_unused_result
/usr/src/RPM/BUILD/qemu-0.11.92/linux-user/mmap.c: In function 'target_mmap':
/usr/src/RPM/BUILD/qemu-0.11.92/linux-user/mmap.c:477: error: ignoring return value of 'pread', declared with attribute warn_unused_result
make[1]: *** [mmap.o] Error 1

Signed-off-by: Kirill A. Shutemov <kirill@shutemov.name>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
[ Merged to bsd-user by Mikaël Urankared updated by Warner Losh for untagged ]
Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index fc3c1480f5..90b6313161 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -174,7 +174,8 @@ static int mmap_frag(abi_ulong real_start,
             mprotect(host_start, qemu_host_page_size, prot1 | PROT_WRITE);
 
         /* read the corresponding file data */
-        pread(fd, g2h_untagged(start), end - start, offset);
+        if (pread(fd, g2h_untagged(start), end - start, offset) == -1)
+            return -1;
 
         /* put final protection */
         if (prot_new != (prot1 | PROT_WRITE))
@@ -593,7 +594,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                                   -1, 0);
             if (retaddr == -1)
                 goto fail;
-            pread(fd, g2h_untagged(start), len, offset);
+            if (pread(fd, g2h_untagged(start), len, offset) == -1)
+                goto fail;
             if (!(prot & PROT_WRITE)) {
                 ret = target_mprotect(start, len, prot);
                 if (ret != 0) {
-- 
2.32.0


