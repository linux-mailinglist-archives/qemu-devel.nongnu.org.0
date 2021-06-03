Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF19139A264
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:41:30 +0200 (CEST)
Received: from localhost ([::1]:33906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lonbF-0002Ta-Mj
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXZ-00037z-1J; Thu, 03 Jun 2021 09:37:41 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXX-0000Ah-4U; Thu, 03 Jun 2021 09:37:40 -0400
Received: by mail-ed1-x533.google.com with SMTP id t3so7142998edc.7;
 Thu, 03 Jun 2021 06:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zbEKtWwYtPu17XYhL91Y3v+VjithiK8Jl8+pLNVJebs=;
 b=mhvapHKuR1ywaKvJavFkXZyniMR3SkGYpBU6Uns9o1ZmhTM+GwWsgUu39pQqCvF4R8
 pxIAm/La2sUFscOGIn7vgheBBNuZcjeF1nw5YqEnggkYiPh5Paw5q8GYXlXVq5Pz1wyq
 oTRuzQgUqkVRjxdyCZyi7w2EqVEWyiDvn7DFf7E+q7KyVQOCh3k8dDzcPtwrA2MRGEoD
 DiYjeZ6Is0PCuYmbWe7PT402K587K40y1h/7OTNpGvu1fKNgVmRQkYZOBUZLEGZI7m2b
 EbvILEM3X1Q0HCe0DNaaaOTMgVp09lanjn3cZ7pPmIVvsCnA6zSRWKjr7kaTrHN/6fIQ
 eoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zbEKtWwYtPu17XYhL91Y3v+VjithiK8Jl8+pLNVJebs=;
 b=WMDOZXfK3ZK1kh+JWUShzhsq71pGw1FFP0Ukpa6Mi3GtsS0lyT4FFDYonODw4RK83X
 pC2J8ycvdOsaKyg7rp06LeE8fB1/kM8HMv07lYx731alTymEKN3LtwOW2KlertHwULFS
 F+b9b1cbOtnIhaB8tc3ffFKWZSMdznmOSInRGlt41Ov4gxQ7+ZBW2fvM4pDJqJ4nfwA3
 QqMn1OFFIsAk61rrqzuzAcMGlRnFZUtJ4J+Xcz01i22sD0/I9wMQSss4Wif1w6wNaQcK
 J0o8k2OchSEbXW3qR+VFCQy7nf6wlFyBmT3evdYWZMDrbAvU+WH/mfvpGJwPvH4qzUe+
 nCRw==
X-Gm-Message-State: AOAM530sT+FVgrAA5ctbfM7pBmffUW1rRSy6RR3N8bLys/nqB2gX8HdS
 ZKmTMCZzETI7dwms05zEigjJYcAJTW5+/g==
X-Google-Smtp-Source: ABdhPJzUPLjoEg1MNh1ia7sNM9vnPIzltpdI9w7CIxkxY1zHcxxPXfchpL+LZYNpe65eN9SEX3N8Gg==
X-Received: by 2002:a05:6402:4310:: with SMTP id
 m16mr43878029edc.279.1622727457527; 
 Thu, 03 Jun 2021 06:37:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e24sm1555369ejb.52.2021.06.03.06.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:37:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
Date: Thu,  3 Jun 2021 15:37:22 +0200
Message-Id: <20210603133722.218465-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603133722.218465-1-pbonzini@redhat.com>
References: <20210603133722.218465-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, Warner Losh <imp@bsdimp.com>,
 Joelle van Dyne <j@getutm.app>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

iOS hosts do not have these defined so we fallback to the
default behaviour.

Co-authored-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-Id: <20210315180341.31638-4-j@getutm.app>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 5821e1afed..4e2f7cf508 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2322,8 +2322,11 @@ static int64_t raw_getlength(BlockDriverState *bs)
 again:
 #endif
     if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
+        size = 0;
 #ifdef DIOCGMEDIASIZE
-        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
+        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size)) {
+            size = 0;
+        }
 #elif defined(DIOCGPART)
         {
                 struct partinfo pi;
@@ -2332,9 +2335,7 @@ again:
                 else
                         size = 0;
         }
-        if (size == 0)
-#endif
-#if defined(__APPLE__) && defined(__MACH__)
+#elif defined(DKIOCGETBLOCKCOUNT) && defined(DKIOCGETBLOCKSIZE)
         {
             uint64_t sectors = 0;
             uint32_t sector_size = 0;
@@ -2342,19 +2343,15 @@ again:
             if (ioctl(fd, DKIOCGETBLOCKCOUNT, &sectors) == 0
                && ioctl(fd, DKIOCGETBLOCKSIZE, &sector_size) == 0) {
                 size = sectors * sector_size;
-            } else {
-                size = lseek(fd, 0LL, SEEK_END);
-                if (size < 0) {
-                    return -errno;
-                }
             }
         }
-#else
-        size = lseek(fd, 0LL, SEEK_END);
+#endif
+        if (size == 0) {
+            size = lseek(fd, 0LL, SEEK_END);
+        }
         if (size < 0) {
             return -errno;
         }
-#endif
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
         switch(s->type) {
         case FTYPE_CD:
-- 
2.31.1


