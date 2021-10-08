Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD54427318
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 23:32:24 +0200 (CEST)
Received: from localhost ([::1]:38080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYxTb-0007Zg-Hg
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 17:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLd-0003Iq-BB
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:09 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:33353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLb-0007gL-JF
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:09 -0400
Received: by mail-io1-xd2e.google.com with SMTP id n7so3334133iod.0
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 14:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5zvZO2JIzhKG0lGaFVeCYf0u5EXqJ+A9G0XWhWcAtPw=;
 b=ZAZKTTNjMrlA4Nj2FdZcBcFqyyrufiOIfZLgvtkWslClmxdYneTc57OwpnYDfpSASz
 T5Yd3p00wsWx/ehYMDE/yiEoFaP+R5HJ8QY0bouTo1yqJs9OtaQ0WWfTtau0+kJeL8zR
 9al8DQp21Bu0shcpw1xoMOdeLrxj3ZYu8dxhVE1N+e2u+mEjgpNfF3Cm/z1YyTWs4fU4
 S3SBfHLQspXEtHZxZShEtFaWteKO9ojEIy68J0gmyQmO6HnEF8vre9SelHfIyvi/KJSd
 OpGnqAh9b7SFR+MVb85bZuv8jjcs2wG4qy67F/FghZ7fhhw7ryHMsBTOT0hDNLFdfK78
 v8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5zvZO2JIzhKG0lGaFVeCYf0u5EXqJ+A9G0XWhWcAtPw=;
 b=AVaqou7q6SfJq9o/lHPmACuHZa47/MjaRqY0nU4f3+0dRQYvHRLW72JPZ9gIEXYnmC
 dCdhi1logvr3u/AbOWvS5MZ4shRIZM/HIIG4BNzuZ02gB2Fgp+MnPHrW7bJ/d3T2ZA+F
 M5SU2/twp2DsO+H3q0k25oJ3DGwDOUlPG9/h3XR8dGQfppu/MkQMPrYeeGW1jDWVKSAI
 ZqrqjIYmgvGS0q02lIc3EQ8QnUbBMivbztTftSPJlp66mBq9uAY77qYDr/UJWy7I+COW
 k+UCmc7CzrYDyIZebK03awlIIgGHokrYzxmz5JIS1mra7klYl+0xpxvkW61we7WtPmvW
 FAyA==
X-Gm-Message-State: AOAM530wmSRbsrDV4PTF5RUu6E0h9wP6JhiINvWG8DvTATrw/aofMwem
 HpIAkhLccJFVQDS3FVrwOkbJwmUSMyUUaQ==
X-Google-Smtp-Source: ABdhPJykTx1dKWhwZjy8mw2ceJFjUEAtBvL5BAa0BweS1aHfecPCCstf1N9IpTABw0C8RPFTFENxPw==
X-Received: by 2002:a6b:8f86:: with SMTP id r128mr9471024iod.201.1633728246214; 
 Fri, 08 Oct 2021 14:24:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm186620ild.52.2021.10.08.14.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:24:05 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/9] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
Date: Fri,  8 Oct 2021 15:23:42 -0600
Message-Id: <20211008212344.95537-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008212344.95537-1-imp@bsdimp.com>
References: <20211008212344.95537-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
 richard.henderson@linaro.org, f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guy Yur <guyyur@gmail.com>

Switch checks for !(flags & MAP_ANONYMOUS) with checks for fd != -1.
MAP_STACK and MAP_GUARD both require fd == -1 and don't require mapping
the fd either. Add analysis from Guy Yur detailing the different cases
for MAP_GUARD and MAP_STACK.

Signed-off-by: Guy Yur <guyyur@gmail.com>
[ partially merged before, finishing the job and documenting origin]
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index face98573f..4ecd949a10 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -127,7 +127,27 @@ error:
     return ret;
 }
 
-/* map an incomplete host page */
+/*
+ * map an incomplete host page
+ *
+ * mmap_frag can be called with a valid fd, if flags doesn't contain one of
+ * MAP_ANON, MAP_STACK, MAP_GUARD. If we need to map a page in those cases, we
+ * pass fd == -1. However, if flags contains MAP_GUARD then MAP_ANON cannot be
+ * added.
+ *
+ * * If fd is valid (not -1) we want to map the pages with MAP_ANON.
+ * * If flags contains MAP_GUARD we don't want to add MAP_ANON because it
+ *   will be rejected.  See kern_mmap's enforcing of constraints for MAP_GUARD
+ *   in sys/vm/vm_mmap.c.
+ * * If flags contains MAP_ANON it doesn't matter if we add it or not.
+ * * If flags contains MAP_STACK, mmap adds MAP_ANON when called so doesn't
+ *   matter if we add it or not either. See enforcing of constraints for
+ *   MAP_STACK in kern_mmap.
+ *
+ * Don't add MAP_ANON for the flags that use fd == -1 without specifying the
+ * flags directly, with the assumption that future flags that require fd == -1
+ * will also not require MAP_ANON.
+ */
 static int mmap_frag(abi_ulong real_start,
                      abi_ulong start, abi_ulong end,
                      int prot, int flags, int fd, abi_ulong offset)
@@ -147,9 +167,9 @@ static int mmap_frag(abi_ulong real_start,
     }
 
     if (prot1 == 0) {
-        /* no page was there, so we allocate one */
+        /* no page was there, so we allocate one. See also above. */
         void *p = mmap(host_start, qemu_host_page_size, prot,
-                       flags | MAP_ANON, -1, 0);
+                       flags | ((fd != -1) ? MAP_ANON : 0), -1, 0);
         if (p == MAP_FAILED)
             return -1;
         prot1 = prot;
@@ -157,7 +177,7 @@ static int mmap_frag(abi_ulong real_start,
     prot1 &= PAGE_BITS;
 
     prot_new = prot | prot1;
-    if (!(flags & MAP_ANON)) {
+    if (fd != -1) {
         /* msync() won't work here, so we return an error if write is
            possible while it is a shared mapping */
         if ((flags & TARGET_BSD_MAP_FLAGMASK) == MAP_SHARED &&
@@ -565,7 +585,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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


