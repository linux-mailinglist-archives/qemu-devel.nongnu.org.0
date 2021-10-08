Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BBC42730D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 23:26:37 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYxO0-00068q-1f
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 17:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLc-0003Fw-2e
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:08 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:37400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLa-0007fQ-H5
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:07 -0400
Received: by mail-il1-x129.google.com with SMTP id i13so11308029ilm.4
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 14:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kh9FF1ChBgsarVfVAqz0ob9kRn+eek1S73Cr8kxiPG8=;
 b=30NlvziNpDjGhJsagXWNX0D9ZyhJ/fx6q5G4joCt1fkQmLgupDqHoDjXsPy4XxmN5/
 liu0WgcHcwF0yHoPolZe6d1P6mf7ZlNH4Vu2Y64i9MIp/sO5PkmtlVV6N+7SjlL5+MOA
 HY7PuHRRkW6F4EY1wgeDo5l3hR1xUhA3i87oNxUq1T9BOu4YIxjkS3Q3rk5PKThFEDcc
 Ofw0hby+JizVPJJOsuakp20loV8SZwUvAndDMQDyIgbFf22ArOJML+VvpPy3Or0fuLwb
 Gj9uZUpv46JaveHPt1zYc5xeYoRf+3Ng+M82DiCJ7vyl55cKoctBtdMPeyrV3pJt3yNH
 AQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kh9FF1ChBgsarVfVAqz0ob9kRn+eek1S73Cr8kxiPG8=;
 b=oQk0n/QJDe6W4peNbFT6P7VaeJ/OVGSfSZkczOPQeDYic0bwKUEFmTW21kk8DvDk2h
 HZUexslgtvfkkBBSBFiDVkY6erTGqtr/tP9csaKuK/MktLW3gsssi0LOgedbM1lvn3So
 b3E5pMbd8i6wZvMsXrpaZWAkO8t76T7M6nk9iMlcOE6M/lHVMYKpsJOsuJbhCQEASdsC
 Mghnu3fLAXm42f/AZgJVWtvr4Ep/Ar0mi9RgaAyE7CIB+clbYq9gWcldcYcWKh3J8VG0
 mHDm4Etfnr/A8RbVu+VaogxVEW+Ledr5ecWz08iLj557kQrbhU7JjE/1j2wjQ06UU70s
 8+ww==
X-Gm-Message-State: AOAM531WrQBqQgXsmgIOe87/TUphumw2HKUVrEMHwftGT1VdjfVhoN0u
 x4wzdy6OW/QhxyOHMnzQmPZyyoDhSN2iZw==
X-Google-Smtp-Source: ABdhPJwEAh9M41kdkbS3glwBTQfvj5/woww7XsQr7iMAUfgCXTvl72RjfJNhA7TCYQlumLZ1eDYtoA==
X-Received: by 2002:a92:2001:: with SMTP id j1mr9317260ile.84.1633728245221;
 Fri, 08 Oct 2021 14:24:05 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm186620ild.52.2021.10.08.14.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:24:04 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/9] bsd-user/mmap.c: Convert to qemu_log logging for mmap
 debugging
Date: Fri,  8 Oct 2021 15:23:41 -0600
Message-Id: <20211008212344.95537-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008212344.95537-1-imp@bsdimp.com>
References: <20211008212344.95537-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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

Convert DEBUG_MMAP to qemu_log CPU_LOG_PAGE.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 53 +++++++++++++++++++++----------------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 301108ed25..face98573f 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -21,8 +21,6 @@
 #include "qemu.h"
 #include "qemu-common.h"
 
-//#define DEBUG_MMAP
-
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
 
@@ -67,14 +65,11 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
     abi_ulong end, host_start, host_end, addr;
     int prot1, ret;
 
-#ifdef DEBUG_MMAP
-    printf("mprotect: start=0x" TARGET_ABI_FMT_lx
-           "len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c\n", start, len,
-           prot & PROT_READ ? 'r' : '-',
-           prot & PROT_WRITE ? 'w' : '-',
-           prot & PROT_EXEC ? 'x' : '-');
-#endif
-
+    qemu_log_mask(CPU_LOG_PAGE, "mprotect: start=0x" TARGET_ABI_FMT_lx
+                  " len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c\n", start, len,
+                  prot & PROT_READ ? 'r' : '-',
+                  prot & PROT_WRITE ? 'w' : '-',
+                  prot & PROT_EXEC ? 'x' : '-');
     if ((start & ~TARGET_PAGE_MASK) != 0)
         return -EINVAL;
     len = TARGET_PAGE_ALIGN(len);
@@ -391,45 +386,43 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
 
     mmap_lock();
-#ifdef DEBUG_MMAP
-    {
-        printf("mmap: start=0x" TARGET_ABI_FMT_lx
-               " len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c flags=",
-               start, len,
-               prot & PROT_READ ? 'r' : '-',
-               prot & PROT_WRITE ? 'w' : '-',
-               prot & PROT_EXEC ? 'x' : '-');
+    if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
+        qemu_log("mmap: start=0x" TARGET_ABI_FMT_lx
+                 " len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c flags=",
+                 start, len,
+                 prot & PROT_READ ? 'r' : '-',
+                 prot & PROT_WRITE ? 'w' : '-',
+                 prot & PROT_EXEC ? 'x' : '-');
         if (flags & MAP_ALIGNMENT_MASK) {
-            printf("MAP_ALIGNED(%u) ", (flags & MAP_ALIGNMENT_MASK)
-                    >> MAP_ALIGNMENT_SHIFT);
+            qemu_log("MAP_ALIGNED(%u) ",
+                     (flags & MAP_ALIGNMENT_MASK) >> MAP_ALIGNMENT_SHIFT);
         }
         if (flags & MAP_GUARD) {
-            printf("MAP_GUARD ");
+            qemu_log("MAP_GUARD ");
         }
         if (flags & MAP_FIXED) {
-            printf("MAP_FIXED ");
+            qemu_log("MAP_FIXED ");
         }
         if (flags & MAP_ANON) {
-            printf("MAP_ANON ");
+            qemu_log("MAP_ANON ");
         }
         if (flags & MAP_EXCL) {
-            printf("MAP_EXCL ");
+            qemu_log("MAP_EXCL ");
         }
         if (flags & MAP_PRIVATE) {
-            printf("MAP_PRIVATE ");
+            qemu_log("MAP_PRIVATE ");
         }
         if (flags & MAP_SHARED) {
-            printf("MAP_SHARED ");
+            qemu_log("MAP_SHARED ");
         }
         if (flags & MAP_NOCORE) {
-            printf("MAP_NOCORE ");
+            qemu_log("MAP_NOCORE ");
         }
         if (flags & MAP_STACK) {
-            printf("MAP_STACK ");
+            qemu_log("MAP_STACK ");
         }
-        printf("fd=%d offset=0x%llx\n", fd, offset);
+        qemu_log("fd=%d offset=0x%lx\n", fd, offset);
     }
-#endif
 
     if ((flags & MAP_ANON) && fd != -1) {
         errno = EINVAL;
-- 
2.32.0


