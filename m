Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357E7427312
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 23:29:57 +0200 (CEST)
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYxRE-0004cP-4J
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 17:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLb-0003DW-5j
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:07 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:36785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLZ-0007eQ-MC
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:06 -0400
Received: by mail-io1-xd29.google.com with SMTP id e144so12198816iof.3
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 14:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1e18TD5eHR2hUes2puSFLwrXKaZMLfYPBvZiD2Wr2TM=;
 b=3VYYXCluck2vnrtNqBTeMT3yj33QlxkDu+Yt3UzkDD8ah5sw8Olq+johIEyJSNIADi
 r8rHdA7nqqAAtmCU4i8Nak4iLN7ZyLmodf+6AEmgfHJlHARWvYSDtDPzwlKQygwzWOzX
 iZtqj+DeqEMX9ykSERIiugAT8PtNzWrgDAC0Lxvr+VjMeFEF/FXSZaKXSXEazFuYOlxL
 vzu7o8cYx/aUUUxZeaNqa07F1GqYaIizIbI3HvglTRM5z3zT2Hq2CDfG8soj8948AsGY
 hDx+cVJuRU/sDOihnSTVOmq3B1/XFjWQWwAvojRdey92sHJAQqYlpKPCSOnujUxB0gDq
 1G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1e18TD5eHR2hUes2puSFLwrXKaZMLfYPBvZiD2Wr2TM=;
 b=lqmUw9k0FqykOb3R7rr8E1bZQ/clrp/ANuScuGdmwAN2qwACNeGNKMb9exfA+Hrpp4
 X9sU9zos7x8c06KqjqXPlX3uJNUUe0azqERtD2LBKy8uZ3zqIERLCqgqlsVyhtZNLemK
 LxBUqmNkruUHPT0bPzvo0TAgvhpPAkFUBZD8DTnQ775nELdX+d3SNhtFUiUa9IqbjdRy
 rRNu0QeENoxnjqvA5ZT5u/xy6A39HLwkpqtja8cddZ4PQ2+Dsq3kqLMf6Nw+dPQ7W6Ab
 uhwW2zCgb0cXp0QL1NfvqfXsPuHF9hnXVy0izHSw9ev8Sj4RnEmefSR47cLr9Wk7DYri
 N51g==
X-Gm-Message-State: AOAM533uL3XJjforcpmSFfagR3P9YziafTh8qEmxx4z+k4au7e872ICB
 3gxfUJBWZPXUS2+BtIP4UagbLcYR8Xjigw==
X-Google-Smtp-Source: ABdhPJwu8Utgr3l+JOKSe4a0cy3RgM6puGnlkkDI4GlNLGLvWkvkRBUM4vLDNMqQjjPVjOrngCuudg==
X-Received: by 2002:a6b:2b52:: with SMTP id r79mr3835597ior.103.1633728244432; 
 Fri, 08 Oct 2021 14:24:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm186620ild.52.2021.10.08.14.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:24:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/9] bsd-user/mmap.c: mmap prefer MAP_ANON for BSD
Date: Fri,  8 Oct 2021 15:23:40 -0600
Message-Id: <20211008212344.95537-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008212344.95537-1-imp@bsdimp.com>
References: <20211008212344.95537-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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
Cc: kevans@freebsd.org, richard.henderson@linaro.org, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MAP_ANON and MAP_ANONYMOUS are identical. Prefer MAP_ANON for BSD since
the file is now a confusing mix of the two.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


