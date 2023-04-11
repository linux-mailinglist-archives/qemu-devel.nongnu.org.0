Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E145D6DE209
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHW3-0003sC-A1; Tue, 11 Apr 2023 13:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVm-0003pD-OH
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:30 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVj-00067C-9K
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:29 -0400
Received: by mail-il1-x12f.google.com with SMTP id o12so22672328ilh.13
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKhb1NLkZTXMdbuk1c6jApM9kMzNhp0oHnhtXy58THA=;
 b=duLxO/6mnxFuXt9QUHXrkX09gWmPaPOx6dGKH4qkNG2kKLHOetaTkGsRNSItc32n56
 DG0TWAvCvlNY4Esjt5rZf+/XGzJ+FUyIQ0rqhM2wNPqIhpft8DY3W0l8UhYG/+77xfpL
 4/3a/gOGM7xlb1ZEH/XZfQa55qfVadhyc7vv70+bw0feS3feHqWebtrGDusZ4GMdIu4d
 ybe+mTSSyAU2y9WAbJH9/YiJurYpTxHiSda8jmoyc8AYgXflKK8gTYBZWItzZZyZDgpx
 LAk+cLO3Z0rBylCXABuHBF33ThZnVb98/ebJfjgNksC+et8V+QxY6cUUzfZ9XCFs0+K5
 e2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KKhb1NLkZTXMdbuk1c6jApM9kMzNhp0oHnhtXy58THA=;
 b=Xz3eMUtLCt0RbV6Dg6eydjsywHl0r1b+bogthN7iwSyMKL2G46gRdwovo6Yhsgl9GM
 ZktEOlsEo03CZS92wa43UK9x1221d/rlkzNOePiuXhSVdhTeJnLjltcD8DAgGMCoqJca
 jHZuPYBBo27IHuUI9aT4+31r3eaBhhHTYvwNF73pFOoyQ115xl9ULwhZn6n+nPKPbUs6
 mphKNpqjlZXMse4vaANDD056L/g+bbQZ98SYmweC/deQSi5t6m2Iz67SjVaGAmVLRIqy
 UCjjzAuSR6stGgh4Ru2XuUPqFe1PJnkhdcQk0u7rCOqWlDoWO1QcmSvW1eUEtzXZUUyN
 z/CQ==
X-Gm-Message-State: AAQBX9c7Rjpowk5GtHTFG6sC6wnUfDatGjg6X8gP0ROLXhfdr+Q6xchZ
 DNx39Z3eOFQiSLCfteWHlDMutTiqBhRiD5aThfo=
X-Google-Smtp-Source: AKy350axTqMQ0K2G5U6GOnJsiRR8u+BCFzoGKavw6Qhmg41enebzfmOtRFucGaNbfkzkfH8nJ7ebCQ==
X-Received: by 2002:a92:dc41:0:b0:326:2d3a:c770 with SMTP id
 x1-20020a92dc41000000b003262d3ac770mr9841257ilq.26.1681233025193; 
 Tue, 11 Apr 2023 10:10:25 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:24 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 03/20] bsd-user: Cleanup style.
Date: Tue, 11 Apr 2023 11:09:38 -0600
Message-Id: <20230411170955.17358-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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


