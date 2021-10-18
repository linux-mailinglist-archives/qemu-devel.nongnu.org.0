Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCD943271D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:08:19 +0200 (CEST)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXze-0008CY-7J
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtI-0007xr-Qt
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:46 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:37750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtE-0001Yu-Sp
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:44 -0400
Received: by mail-il1-x134.google.com with SMTP id x1so15976572ilv.4
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n6tmE54VM8mlyUNU6p5wy5fgl7zVk2jzyumM2Xh8/fM=;
 b=a6aTvsgk2cZeWY/nCGkk/a5quA6aDqksBAsEJcyCAlXjENpxIiFuf4+WHVL4azr09O
 Z86VGBmh+bfcIDrdO45eWa7w7ao2z4B/LgjpjXR/eINBtlTG2OpaJz0f2Rx2HX3dV8Iz
 EjqChi0zyUGrPIgqnluUxpRbErlE4gXy1ZEYkn6thFr71CuKQavCYgcSH98T2rjHiz/0
 jlSmY167j5F9zMulhSdIVrNmHf+1ggdqSJlsDj7XKx0ixDcJKEbbGWIuauXqHGnPk0ah
 yBD+sVH+rOq9+MP6tX/YtrGLYT0TCEBzXDpyuTJsKK5xwdaNS0Bl3lmg+eP3YdqSXb98
 zMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n6tmE54VM8mlyUNU6p5wy5fgl7zVk2jzyumM2Xh8/fM=;
 b=Zl17CVwcTeKQyecZAbtCCJA27VL+dM/WNgJRk6HiGkt1FjYtOm8wMzOGpTy/y75Ntr
 ZhDkLYEpNt42aOEyjUHCQkYGrm8C/ZdTap3nFJ/QGqpBjSOxRF0JF6YJxQwT2qrWOKKv
 0PhkHZhStky+ASY6MY+gI7eymbWNxTkmDtBfkDb4zr/sljZ44l5Fd+rzFDIgQFKfJKf3
 JyA+3n6wVmeSKnDWsxT5UOXbP50k/AI8a7NLrMw1AlSRr1YlRZND2yk8Y1QPod1y0Dy9
 Y4Wgq991NblGpSVCSij7ScmTcSOrehZjD/ScszG3DoloKg1Z/k/9MFTx2MgzMPiaw1E7
 f/jQ==
X-Gm-Message-State: AOAM530zplMHcXoUlgEciBS0YFzm4cHlMsX9sarglkuU3wXpBMHihBBJ
 0mp4yqTOyU/ve0TVe9EPHsCcnHlq1H4YrQ==
X-Google-Smtp-Source: ABdhPJwUNJDKVQ3yILh3OEMtYa/OAXg02e9fJORrHK5c83BpII/pcWGK43fFrVVda6K3N6BKfy60ig==
X-Received: by 2002:a05:6e02:15c4:: with SMTP id
 q4mr15330206ilu.18.1634583699619; 
 Mon, 18 Oct 2021 12:01:39 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:39 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/23] bsd-user/mmap.c: mmap prefer MAP_ANON for BSD
Date: Mon, 18 Oct 2021 13:00:57 -0600
Message-Id: <20211018190115.5365-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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


