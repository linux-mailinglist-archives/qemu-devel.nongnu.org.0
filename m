Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67914323A3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:18:15 +0200 (CEST)
Received: from localhost ([::1]:38714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVL4-0006Z7-QL
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8o-0007gU-N1
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:37 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8b-0007tf-HT
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:29 -0400
Received: by mail-io1-xd2b.google.com with SMTP id b188so11986303iof.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n6tmE54VM8mlyUNU6p5wy5fgl7zVk2jzyumM2Xh8/fM=;
 b=Yqnsc2lf+H3NT/f0tYyyzOXxMF6IpBG5/dMZUiGb4sMQfXzktLsg/RWDEPvjvyDO33
 KCuujcPvOowq2mNo2qpmGHLWW0/IxJNUwysVdlxr+Qgezx0bis223mwaBDVDXhOqEjuX
 iSxij2GhbJtXU8LzsF8djF5yVG5sMET7cIfcDQ6rK8/ACyOIsOwN34bLKchq/dglR2f5
 /Hp5ROM5wP2kP8F9qLfdsgUTA1qKUpWPg5w3g3vdEymqLjxSzaWXomSktB9oFNMDbcSS
 uR8KvN332dBwRXwehP1IHZwjutkwOIIbyssO7PXbAntYKkLIT5LXqI6xC/oTFIXCd5ou
 /C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n6tmE54VM8mlyUNU6p5wy5fgl7zVk2jzyumM2Xh8/fM=;
 b=I4Drk0z257A0qwHlb8FMHxSZzy08NxTAwzK8/eV3iR2i9ZElEkEpUCUTA6s8hySnoI
 DduDNEMyYxedxraO1f47evczOiGZtYFNUW6odp7+LH5Hze8gjZhaZ+VAZPzWSud4g+Ts
 qqCi6fklaGceKBVWuYV0LxYCIVb+39Pc/PGjn3Dytdzy3KJL5TbatcUo2bK31baMyac9
 uQpa1WbQIe5tATUTKCSLdiCRcIlg6o+4/GtT4HDvYbP5N8Ble/pS42nDwbXJPiiFybm0
 bRAZB1T/Tg62lxPZxbN+7I2VvrhDShMDB6EfLtS9QntrrdRuAkg4Qdmh7KvS5NhhOXlg
 U9NA==
X-Gm-Message-State: AOAM533u005+zmj82moe8i3fIH8W3RTqpErFjupI/DRvox7U8+slDumk
 t545LSkRf+e/XuapDxJUTY3oHAkXODsFcg==
X-Google-Smtp-Source: ABdhPJx2c5Qpq59Chi1Vd8Efzpd8odo8vvFHvRuA5eAceEWcLInf/EWZAvD365bhpLwnphep+8S+5g==
X-Received: by 2002:a5d:844b:: with SMTP id w11mr15159228ior.209.1634573120172; 
 Mon, 18 Oct 2021 09:05:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:19 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/23] bsd-user/mmap.c: mmap prefer MAP_ANON for BSD
Date: Mon, 18 Oct 2021 10:04:40 -0600
Message-Id: <20211018160458.1976-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MAP_ANON and MAP_ANONYMOUS are identical. Prefer MAP_ANON for BSD since
the file is now a confusing mix of the two.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/mmap.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index f0be3b12cf..301108ed25 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -285,7 +285,7 @@ static abi_ulong mmap_find_vma_aligned(abi_ulong start, abi_ulong size,
     addr = start;
     wrapped = repeat = 0;
     prev = 0;
-    flags = MAP_ANONYMOUS | MAP_PRIVATE;
+    flags = MAP_ANON | MAP_PRIVATE;
     if (alignment != 0) {
         flags |= MAP_ALIGNED(alignment);
     }
@@ -409,7 +409,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         if (flags & MAP_FIXED) {
             printf("MAP_FIXED ");
         }
-        if (flags & MAP_ANONYMOUS) {
+        if (flags & MAP_ANON) {
             printf("MAP_ANON ");
         }
         if (flags & MAP_EXCL) {
@@ -431,7 +431,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     }
 #endif
 
-    if ((flags & MAP_ANONYMOUS) && fd != -1) {
+    if ((flags & MAP_ANON) && fd != -1) {
         errno = EINVAL;
         goto fail;
     }
@@ -533,7 +533,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
          * qemu_real_host_page_size
          */
         p = mmap(g2h_untagged(start), host_len, prot,
-                 flags | MAP_FIXED | ((fd != -1) ? MAP_ANONYMOUS : 0), -1, 0);
+                 flags | MAP_FIXED | ((fd != -1) ? MAP_ANON : 0), -1, 0);
         if (p == MAP_FAILED)
             goto fail;
         /* update start so that it points to the file position at 'offset' */
@@ -696,8 +696,7 @@ static void mmap_reserve(abi_ulong start, abi_ulong size)
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


