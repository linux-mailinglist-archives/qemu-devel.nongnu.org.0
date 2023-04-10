Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6462F6DCAB6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:24:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8r-0002gk-T1; Mon, 10 Apr 2023 14:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8d-0002e3-Vx
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:13 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8b-0000ey-Ij
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:11 -0400
Received: by mail-il1-x129.google.com with SMTP id j12so3358280ilf.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKhb1NLkZTXMdbuk1c6jApM9kMzNhp0oHnhtXy58THA=;
 b=PM0cIKdh2il8tHA5hoyYhhpr+HlVpYXWsqaK0ocdqtO7VyuVsct6ViB3MbmKVT6Zhf
 UYDyEBUFKl+TfL7dk1FhcZdhWB4uMBFwQIFgmlcdF9bFKZB+/znIaPN/2EmoBZKVdh5V
 TO0RLUiBYLINc9yRiZOGutYlGe+zx8eMn2KuoeSiPl6lqIZ/om6u3KaAgqJJd+eHmvgc
 YZZJd2AhWoQd+sxCemM+67SvrROQw0QVBB0sH1f6Q3ePSRquGUfRvZK80nZfSaOHgdPm
 HrPK3alBjATiy0JQrFCxoj656w7+bwZG8f2qtU3hJ7cToKG6zhIkMg05WKjC+QApF5iN
 Eg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KKhb1NLkZTXMdbuk1c6jApM9kMzNhp0oHnhtXy58THA=;
 b=iEFyYhczuCTBttwCZy8wJRpWdynrTwG3pkraTEZtA6mxK7tW0DFX6bAgkerc+9ahWo
 P+3aLsJ0DvvQnjIvIoplSEhgIsdMoflcyyq7xM35G/t4hcrVOXF1nRhT7PVCsleZ8kRi
 Mkmr6ch5ADMUwij20drl9neUHT/A/6h2+iU/EPNsNLMY1zLtZUQkCBEMHuht3HYuBUn2
 WM1zPl8aJaawKxZNigl3eAhl/UPpbhwgyRIpE5CZvIqIcn7qH/kqDfRB7GL8Fv4prlja
 SEzSSBuumDG4K966AG+IY18K6dNsv1NkD1Wt+9d0FCcyhZhDIj1dEovYL5mHZoCCJ4fm
 fEFg==
X-Gm-Message-State: AAQBX9fk0fjm8n/Hh10jNLqZcZOZmGwA2XzDhrhwCIODS8GgyQsNMmJr
 z4sophrunAyZpl1omqHP7UJr1113bmLWmdhBx7c=
X-Google-Smtp-Source: AKy350bdzEFQwpjeFTt9BY+4nFoCwLFzjiZw+Z5fGj5TyBxP9Oo5m0MZyy4SCBCBx0qOT98Gy+9Vmg==
X-Received: by 2002:a92:c981:0:b0:326:752e:7f8a with SMTP id
 y1-20020a92c981000000b00326752e7f8amr6045268iln.2.1681150867906; 
 Mon, 10 Apr 2023 11:21:07 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 03/19] bsd-user: Cleanup style.
Date: Mon, 10 Apr 2023 12:20:40 -0600
Message-Id: <20230410182056.320-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
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
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/mmap.c | 91 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 31 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 2d91e8e8826..d0ade1b52f3 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -59,17 +59,19 @@ bool have_mmap_lock(void)
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
@@ -83,15 +85,18 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
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
@@ -110,8 +115,9 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
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
@@ -121,16 +127,18 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
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
@@ -175,31 +183,37 @@ static int mmap_frag(abi_ulong real_start,
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
@@ -207,8 +221,9 @@ static int mmap_frag(abi_ulong real_start,
         }
 
         /* put final protection */
-        if (prot_new != (prot1 | PROT_WRITE))
+        if (prot_new != (prot1 | PROT_WRITE)) {
             mprotect(host_start, qemu_host_page_size, prot_new);
+        }
     } else {
         if (prot_new != prot1) {
             mprotect(host_start, qemu_host_page_size, prot_new);
@@ -560,8 +575,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
@@ -610,8 +626,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
@@ -634,14 +651,16 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
@@ -650,8 +669,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                             real_end - qemu_host_page_size, end,
                             prot, flags, fd,
                             offset + real_end - qemu_host_page_size - start);
-            if (ret == -1)
+            if (ret == -1) {
                 goto fail;
+            }
             real_end -= qemu_host_page_size;
         }
 
@@ -659,14 +679,16 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
@@ -736,11 +758,13 @@ int target_munmap(abi_ulong start, abi_ulong len)
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
@@ -758,16 +782,18 @@ int target_munmap(abi_ulong start, abi_ulong len)
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
@@ -791,14 +817,17 @@ int target_msync(abi_ulong start, abi_ulong len, int flags)
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


