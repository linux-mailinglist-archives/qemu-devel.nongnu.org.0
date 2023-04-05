Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB366D89B1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:38:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoG-0005OH-Cg; Wed, 05 Apr 2023 17:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnw-0005Hn-WD
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:34 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnu-0005aG-GD
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:32 -0400
Received: by mail-il1-x129.google.com with SMTP id n1so18792364ili.10
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fdI4FOHX2F3suDBHi4XUkEMxaX1KjSb9ZI97Vo0+ATM=;
 b=JW9gyOITO/oP91IUVq7Cebd9akgIO7eyLFUDb8doRmA7OOczMD2qyGtF+L/45JqDBt
 I7+1YyMrHEoVt3MU29k4rX5OKMa6gTCBAsGXdbmRMgVIE+55BbN/yT75WrZP63FK/yZg
 zYkk6heAh3UgrkPM2yUePg8I/RFcOjE5XprwhUMS8rAq0A9KWGuCb8pMgVi49FZvYTwZ
 jz0cuRbibwlsjSa2ml3oT6oIsYjxwXmRsx32zLB61ZED/r45tR6P5p+08ZG9gSJofBLF
 bWYPSQcxcmlIrqCaBVSflKH0ivpD7xjBF9x/v1sb1TaLkJWwzfelGUu0RQBrj5DWMZyF
 84hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fdI4FOHX2F3suDBHi4XUkEMxaX1KjSb9ZI97Vo0+ATM=;
 b=g3gKpRJAd/vIS16+40CZtTWXMiEULwCoSzyCP0E5zbAmrPvrXJwjLfURaQjsX8xJhd
 2K4etUnGQDwmCKkXVZfTZI6/iyt+rpOLpv6mYieYf46wmH19OKBQjxoKX28E9G3HEcCU
 eGS4u+1t8OEEz62yDuLnJOctKZkIjHyBewBzFr1Vntz77O/xAYt9bsVCkj0lwp6yoStS
 AVRdpzoetSsBKLq2dVv1HTi3WS2XZ0HzT+eodQvzckwSq0PiC5gRfvXki4A4Uig+T5uH
 4C6goRIlLd2tY2MS4JkuIHsaaAy6YYTmGjVtksuZ0taZHVa0jSYasyJPOv62Kqo8QRef
 Ypiw==
X-Gm-Message-State: AAQBX9cn+Y10i/NAwrVPmW2iPReyrNnqK1qNO2EkK+zwbDas1FLLVPY7
 ZVzYYFHQFAPZGPj4Xspq/EB/D2Qo2eOSuQBOjXM=
X-Google-Smtp-Source: AKy350aXJVuRa3FLtDpjs+2+8Tbo4gW/XduyGpoG/PMv2J7Q1Ety9z7srrOREH1uM2M1IPLAqqLKJA==
X-Received: by 2002:a05:6e02:2162:b0:326:45fd:3ea1 with SMTP id
 s2-20020a056e02216200b0032645fd3ea1mr3035715ilv.13.1680730589036; 
 Wed, 05 Apr 2023 14:36:29 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 03/16] bsd-user: Cleanup style.
Date: Wed,  5 Apr 2023 15:35:59 -0600
Message-Id: <20230405213612.15942-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The only diffs between bsd-user fork and qemu upstream is style. Make
mmap.c pass checkpatch.pl.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 91 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 31 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index f732a6f6f2b..5f60efb3c5d 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -45,17 +45,19 @@ bool have_mmap_lock(void)
 /* Grab lock to make sure things are in a consistent state after fork().  */
 void mmap_fork_start(void)
 {
-    if (mmap_lock_count)
+    if (mmap_lock_count) {
         abort();
+    }
     pthread_mutex_lock(&mmap_mutex);
 }
 
 void mmap_fork_end(int child)
 {
-    if (child)
+    if (child) {
         pthread_mutex_init(&mmap_mutex, NULL);
-    else
+    } else {
         pthread_mutex_unlock(&mmap_mutex);
+    }
 }
 
 /* NOTE: all the constants are the HOST ones, but addresses are target. */
@@ -69,15 +71,18 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
                   prot & PROT_READ ? 'r' : '-',
                   prot & PROT_WRITE ? 'w' : '-',
                   prot & PROT_EXEC ? 'x' : '-');
-    if ((start & ~TARGET_PAGE_MASK) != 0)
+    if ((start & ~TARGET_PAGE_MASK) != 0) {
         return -EINVAL;
+    }
     len = TARGET_PAGE_ALIGN(len);
     end = start + len;
-    if (end < start)
+    if (end < start) {
         return -EINVAL;
+    }
     prot &= PROT_READ | PROT_WRITE | PROT_EXEC;
-    if (len == 0)
+    if (len == 0) {
         return 0;
+    }
 
     mmap_lock();
     host_start = start & qemu_host_page_mask;
@@ -96,8 +101,9 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
         }
         ret = mprotect(g2h_untagged(host_start),
                        qemu_host_page_size, prot1 & PAGE_BITS);
-        if (ret != 0)
+        if (ret != 0) {
             goto error;
+        }
         host_start += qemu_host_page_size;
     }
     if (end < host_end) {
@@ -107,16 +113,18 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
         }
         ret = mprotect(g2h_untagged(host_end - qemu_host_page_size),
                        qemu_host_page_size, prot1 & PAGE_BITS);
-        if (ret != 0)
+        if (ret != 0) {
             goto error;
+        }
         host_end -= qemu_host_page_size;
     }
 
     /* handle the pages in the middle */
     if (host_start < host_end) {
         ret = mprotect(g2h_untagged(host_start), host_end - host_start, prot);
-        if (ret != 0)
+        if (ret != 0) {
             goto error;
+        }
     }
     page_set_flags(start, start + len, prot | PAGE_VALID);
     mmap_unlock();
@@ -161,31 +169,37 @@ static int mmap_frag(abi_ulong real_start,
     /* get the protection of the target pages outside the mapping */
     prot1 = 0;
     for (addr = real_start; addr < real_end; addr++) {
-        if (addr < start || addr >= end)
+        if (addr < start || addr >= end) {
             prot1 |= page_get_flags(addr);
+        }
     }
 
     if (prot1 == 0) {
         /* no page was there, so we allocate one. See also above. */
         void *p = mmap(host_start, qemu_host_page_size, prot,
                        flags | ((fd != -1) ? MAP_ANON : 0), -1, 0);
-        if (p == MAP_FAILED)
+        if (p == MAP_FAILED) {
             return -1;
+        }
         prot1 = prot;
     }
     prot1 &= PAGE_BITS;
 
     prot_new = prot | prot1;
     if (fd != -1) {
-        /* msync() won't work here, so we return an error if write is
-           possible while it is a shared mapping */
+        /*
+         * msync() won't work here, so we return an error if write is
+         * possible while it is a shared mapping
+         */
         if ((flags & TARGET_BSD_MAP_FLAGMASK) == MAP_SHARED &&
-            (prot & PROT_WRITE))
+            (prot & PROT_WRITE)) {
             return -1;
+        }
 
         /* adjust protection to be able to read */
-        if (!(prot1 & PROT_WRITE))
+        if (!(prot1 & PROT_WRITE)) {
             mprotect(host_start, qemu_host_page_size, prot1 | PROT_WRITE);
+        }
 
         /* read the corresponding file data */
         if (pread(fd, g2h_untagged(start), end - start, offset) == -1) {
@@ -193,8 +207,9 @@ static int mmap_frag(abi_ulong real_start,
         }
 
         /* put final protection */
-        if (prot_new != (prot1 | PROT_WRITE))
+        if (prot_new != (prot1 | PROT_WRITE)) {
             mprotect(host_start, qemu_host_page_size, prot_new);
+        }
     } else {
         if (prot_new != prot1) {
             mprotect(host_start, qemu_host_page_size, prot_new);
@@ -554,8 +569,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
          */
         p = mmap(g2h_untagged(start), host_len, prot,
                  flags | MAP_FIXED | ((fd != -1) ? MAP_ANON : 0), -1, 0);
-        if (p == MAP_FAILED)
+        if (p == MAP_FAILED) {
             goto fail;
+        }
         /* update start so that it points to the file position at 'offset' */
         host_start = (unsigned long)p;
         if (fd != -1) {
@@ -604,8 +620,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             retaddr = target_mmap(start, len, prot | PROT_WRITE,
                                   MAP_FIXED | MAP_PRIVATE | MAP_ANON,
                                   -1, 0);
-            if (retaddr == -1)
+            if (retaddr == -1) {
                 goto fail;
+            }
             if (pread(fd, g2h_untagged(start), len, offset) == -1) {
                 goto fail;
             }
@@ -630,14 +647,16 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                 /* one single host page */
                 ret = mmap_frag(real_start, start, end,
                                 prot, flags, fd, offset);
-                if (ret == -1)
+                if (ret == -1) {
                     goto fail;
+                }
                 goto the_end1;
             }
             ret = mmap_frag(real_start, start, real_start + qemu_host_page_size,
                             prot, flags, fd, offset);
-            if (ret == -1)
+            if (ret == -1) {
                 goto fail;
+            }
             real_start += qemu_host_page_size;
         }
         /* handle the end of the mapping */
@@ -646,8 +665,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                             real_end - qemu_host_page_size, end,
                             prot, flags, fd,
                             offset + real_end - qemu_host_page_size - start);
-            if (ret == -1)
+            if (ret == -1) {
                 goto fail;
+            }
             real_end -= qemu_host_page_size;
         }
 
@@ -655,14 +675,16 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         if (real_start < real_end) {
             void *p;
             unsigned long offset1;
-            if (flags & MAP_ANON)
+            if (flags & MAP_ANON) {
                 offset1 = 0;
-            else
+            } else {
                 offset1 = offset + real_start - start;
+            }
             p = mmap(g2h_untagged(real_start), real_end - real_start,
                      prot, flags, fd, offset1);
-            if (p == MAP_FAILED)
+            if (p == MAP_FAILED) {
                 goto fail;
+            }
         }
     }
  the_end1:
@@ -732,11 +754,13 @@ int target_munmap(abi_ulong start, abi_ulong len)
            TARGET_ABI_FMT_lx "\n",
            start, len);
 #endif
-    if (start & ~TARGET_PAGE_MASK)
+    if (start & ~TARGET_PAGE_MASK) {
         return -EINVAL;
+    }
     len = TARGET_PAGE_ALIGN(len);
-    if (len == 0)
+    if (len == 0) {
         return -EINVAL;
+    }
     mmap_lock();
     end = start + len;
     real_start = start & qemu_host_page_mask;
@@ -754,16 +778,18 @@ int target_munmap(abi_ulong start, abi_ulong len)
             }
             end = real_end;
         }
-        if (prot != 0)
+        if (prot != 0) {
             real_start += qemu_host_page_size;
+        }
     }
     if (end < real_end) {
         prot = 0;
         for (addr = end; addr < real_end; addr += TARGET_PAGE_SIZE) {
             prot |= page_get_flags(addr);
         }
-        if (prot != 0)
+        if (prot != 0) {
             real_end -= qemu_host_page_size;
+        }
     }
 
     ret = 0;
@@ -787,14 +813,17 @@ int target_msync(abi_ulong start, abi_ulong len, int flags)
 {
     abi_ulong end;
 
-    if (start & ~TARGET_PAGE_MASK)
+    if (start & ~TARGET_PAGE_MASK) {
         return -EINVAL;
+    }
     len = TARGET_PAGE_ALIGN(len);
     end = start + len;
-    if (end < start)
+    if (end < start) {
         return -EINVAL;
-    if (end == start)
+    }
+    if (end == start) {
         return 0;
+    }
 
     start &= qemu_host_page_mask;
     return msync(g2h_untagged(start), end - start, flags);
-- 
2.40.0


