Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A524414102
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 07:02:25 +0200 (CEST)
Received: from localhost ([::1]:56586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuOm-0006QF-8U
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 01:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJP-0006YG-9s
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:51 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:45938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJN-0007kG-Pi
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:51 -0400
Received: by mail-il1-x133.google.com with SMTP id b8so1337714ilh.12
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6zJfAxDT5Nlo6odfG5trP7Orh8JxL9FZBJtXEayWB6M=;
 b=OjCLlB0TSh2qoimsRo3VWVDajLZC44Gkg+Yzq8TsDDIxWGL77C79GlEBq5p6U4lCE/
 QBJY2etWxYP7PN1+oVi3sQGBfhFiTlDj4QSR0LGUa65tDBtx5QPEFASXgsmyM3rBTBGW
 isHP4SoxIXwEqzaaG0e44FZiUAf6ZQxH7ARBIK9ufVBn36IOS9dCoRspEtE9X4rezCDZ
 UyrqT4dudyVrC+vYT76wdcMWfK6Vd8hbaD5LAjBAtM3+XzMGqZvDtzgmDhe+tV8B0eJX
 z3ep2EfPHY0LxKtXmuDJvk34BWIFpmEFdFMMC9I4Jfx2wSyH2Czb39XlRfCRV+xu3Nhz
 5Yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6zJfAxDT5Nlo6odfG5trP7Orh8JxL9FZBJtXEayWB6M=;
 b=ZM4mZsX/ok4JTgJCKFPTYOUXV15HRPpMg86uW7WE9Wbp6Rz88yCMlKae0fmlJX5xLS
 T+0Y3JQY+fg2EgGxJ8FRVFjuyyG8vIoKOLgQfKjQuzRtcXN7zHEV/bxyLGhgnvoRCWrR
 P70LygIyz0GUMIIkTynjMrI3gYPHseYXtUdcPBzkYJSbqHpx7JVmF8rB/KLqQyhCn2FX
 cXBjKzJsaUKeekcTtkMYmcInHMoJfEXiD5mMvxxvR8ru5Y9bk6FqudX4gQlhT4ZGF82Z
 gbxXKckTSUoi6FVkqJKgPgx9+3j2x62Ecs5AL4W97RNF1bGnQ2z+9RclCAQU2dVHxOqD
 8ROw==
X-Gm-Message-State: AOAM530N4HMQwRIYcNX6DleHZRltVeURtK8kM8DJ47i60k83jp2dxfrg
 765F/amC7C00OR/6LMSMEABJrpobgOHLuAQ29m0=
X-Google-Smtp-Source: ABdhPJxN5TTZK4z3sRdLkg6hm/QeMEapUHD0cONnS4hSKCXLHFcbW820+XTxYVuq97xAUI4nnPODRw==
X-Received: by 2002:a92:d483:: with SMTP id p3mr24619930ilg.131.1632286608477; 
 Tue, 21 Sep 2021 21:56:48 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j5sm512833ilk.58.2021.09.21.21.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:56:48 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] bsd-user/mmap.c: mmap prefer MAP_ANON for BSD
Date: Tue, 21 Sep 2021 22:56:32 -0600
Message-Id: <20210922045636.25206-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922045636.25206-1-imp@bsdimp.com>
References: <20210922045636.25206-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
---
 bsd-user/mmap.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 0acc2db712..bafbdacd31 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -284,7 +284,7 @@ static abi_ulong mmap_find_vma_aligned(abi_ulong start, abi_ulong size,
     addr = start;
     wrapped = repeat = 0;
     prev = 0;
-    flags = MAP_ANONYMOUS | MAP_PRIVATE;
+    flags = MAP_ANON | MAP_PRIVATE;
     if (alignment != 0) {
         flags |= MAP_ALIGNED(alignment);
     }
@@ -408,7 +408,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         if (flags & MAP_FIXED) {
             printf("MAP_FIXED ");
         }
-        if (flags & MAP_ANONYMOUS) {
+        if (flags & MAP_ANON) {
             printf("MAP_ANON ");
         }
         if (flags & MAP_EXCL) {
@@ -430,7 +430,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     }
 #endif
 
-    if ((flags & MAP_ANONYMOUS) && fd != -1) {
+    if ((flags & MAP_ANON) && fd != -1) {
         errno = EINVAL;
         goto fail;
     }
@@ -532,7 +532,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
          * qemu_real_host_page_size
          */
         p = mmap(g2h_untagged(start), host_len, prot,
-                 flags | MAP_FIXED | ((fd != -1) ? MAP_ANONYMOUS : 0), -1, 0);
+                 flags | MAP_FIXED | ((fd != -1) ? MAP_ANON : 0), -1, 0);
         if (p == MAP_FAILED)
             goto fail;
         /* update start so that it points to the file position at 'offset' */
@@ -694,8 +694,7 @@ static void mmap_reserve(abi_ulong start, abi_ulong size)
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


