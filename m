Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6943AB023
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:48:52 +0200 (CEST)
Received: from localhost ([::1]:33124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltodn-0006G5-I9
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNR-0002rJ-35
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:58 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNM-0006Ar-OW
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:56 -0400
Received: by mail-ed1-x52f.google.com with SMTP id r7so3016122edv.12
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EUJcgMbiy+TJhdc0JIxQcF5/rLoJrViqR3WCrNaqHgA=;
 b=a4gAdIymstt98imS5Cx+cdFYsrLWt8PxrffQqIficYfqF5Qrz7a1UyaKQlMmyjkg6a
 v2jGgmgrxGdPrtcZsXpDF+8+KPtB7UsX+pJpYY+WxWvuBavGuvt3HoFQKzoTGFbHsvHa
 kTJoiasmwIJ324m0GvbrSVTj54vqSPqN2hQ95IDC0+lGo7zBS3PR9U/m7Am1llXw6NBf
 tMfcBAsv7ytag1elSPq8S1AhUj/sayiRajeCSeywBSbI1ZRJ+rKYnQ4H+1dgW8PVqPT4
 vyWnslcEbFexahTKqwTK1GeNw33O228S7Ldz4USZys+3xUtXP1bpt5rEDbU9BfuwAFdn
 lxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EUJcgMbiy+TJhdc0JIxQcF5/rLoJrViqR3WCrNaqHgA=;
 b=bUL2/6heFSvmw9JkqpIC5n2rhFTZH99An5nUk6D5UWD5PR3SiDHvFQncIkrHPnI4TV
 6o9/9q2GK4dfBfS/+7EtU1hOMfrwkdUPFIAikNPuP1S9Bb9oaDGBbXUfNRLevMX8A/+v
 Nph9nRtaT6CVD+mKS+44M2/qbk+beVFoQs3t79Ic4fzhafk3B3VHQb+GP239WOqSK4jF
 4NC0DT5ASjt3kEQmT4Uv83Qg9cpVSwY3oF0A7uFcppcXO+r0mT1IVe+eB/fR+B7FaoYr
 wdldir3xC1LahRTDd8iXt8u1L5inRVmgnqmHSDAAT6NFpraKBIEWz/yRy+0vmA11PvXM
 mD2A==
X-Gm-Message-State: AOAM532+/JQOjx6oXylrpyf1oLaQTeH7k4VndE/LEBn7YIqe5Cel+irw
 07DQz4ThUYQ3J/GVo4/+zcr4l/+l0N4=
X-Google-Smtp-Source: ABdhPJycg246I3U4KrjDnTQVkCFR/hjMU5kdXQGJ7E6vYXiT/HR80lRp1E5Kh1Oe31leAsqQ7Ngkxg==
X-Received: by 2002:aa7:d892:: with SMTP id u18mr5366258edq.196.1623922309751; 
 Thu, 17 Jun 2021 02:31:49 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/45] util/mmap-alloc: Factor out activating of memory to
 mmap_activate()
Date: Thu, 17 Jun 2021 11:31:09 +0200
Message-Id: <20210617093134.900014-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We want to activate memory within a reserved memory region, to make it
accessible. Let's factor that out.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-4-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/mmap-alloc.c | 94 +++++++++++++++++++++++++----------------------
 1 file changed, 50 insertions(+), 44 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 223d66219c..0e2bd7bc0e 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -114,6 +114,52 @@ static void *mmap_reserve(size_t size, int fd)
     return mmap(0, size, PROT_NONE, flags, fd, 0);
 }
 
+/*
+ * Activate memory in a reserved region from the given fd (if any), to make
+ * it accessible.
+ */
+static void *mmap_activate(void *ptr, size_t size, int fd, bool readonly,
+                           bool shared, bool is_pmem, off_t map_offset)
+{
+    const int prot = PROT_READ | (readonly ? 0 : PROT_WRITE);
+    int map_sync_flags = 0;
+    int flags = MAP_FIXED;
+    void *activated_ptr;
+
+    flags |= fd == -1 ? MAP_ANONYMOUS : 0;
+    flags |= shared ? MAP_SHARED : MAP_PRIVATE;
+    if (shared && is_pmem) {
+        map_sync_flags = MAP_SYNC | MAP_SHARED_VALIDATE;
+    }
+
+    activated_ptr = mmap(ptr, size, prot, flags | map_sync_flags, fd,
+                         map_offset);
+    if (activated_ptr == MAP_FAILED && map_sync_flags) {
+        if (errno == ENOTSUP) {
+            char *proc_link = g_strdup_printf("/proc/self/fd/%d", fd);
+            char *file_name = g_malloc0(PATH_MAX);
+            int len = readlink(proc_link, file_name, PATH_MAX - 1);
+
+            if (len < 0) {
+                len = 0;
+            }
+            file_name[len] = '\0';
+            fprintf(stderr, "Warning: requesting persistence across crashes "
+                    "for backend file %s failed. Proceeding without "
+                    "persistence, data might become corrupted in case of host "
+                    "crash.\n", file_name);
+            g_free(proc_link);
+            g_free(file_name);
+        }
+        /*
+         * If mmap failed with MAP_SHARED_VALIDATE | MAP_SYNC, we will try
+         * again without these flags to handle backwards compatibility.
+         */
+        activated_ptr = mmap(ptr, size, prot, flags, fd, map_offset);
+    }
+    return activated_ptr;
+}
+
 static inline size_t mmap_guard_pagesize(int fd)
 {
 #if defined(__powerpc64__) && defined(__linux__)
@@ -133,13 +179,8 @@ void *qemu_ram_mmap(int fd,
                     off_t map_offset)
 {
     const size_t guard_pagesize = mmap_guard_pagesize(fd);
-    int prot;
-    int flags;
-    int map_sync_flags = 0;
-    size_t offset;
-    size_t total;
-    void *guardptr;
-    void *ptr;
+    size_t offset, total;
+    void *ptr, *guardptr;
 
     /*
      * Note: this always allocates at least one extra page of virtual address
@@ -156,45 +197,10 @@ void *qemu_ram_mmap(int fd,
     /* Always align to host page size */
     assert(align >= guard_pagesize);
 
-    flags = MAP_FIXED;
-    flags |= fd == -1 ? MAP_ANONYMOUS : 0;
-    flags |= shared ? MAP_SHARED : MAP_PRIVATE;
-    if (shared && is_pmem) {
-        map_sync_flags = MAP_SYNC | MAP_SHARED_VALIDATE;
-    }
-
     offset = QEMU_ALIGN_UP((uintptr_t)guardptr, align) - (uintptr_t)guardptr;
 
-    prot = PROT_READ | (readonly ? 0 : PROT_WRITE);
-
-    ptr = mmap(guardptr + offset, size, prot,
-               flags | map_sync_flags, fd, map_offset);
-
-    if (ptr == MAP_FAILED && map_sync_flags) {
-        if (errno == ENOTSUP) {
-            char *proc_link, *file_name;
-            int len;
-            proc_link = g_strdup_printf("/proc/self/fd/%d", fd);
-            file_name = g_malloc0(PATH_MAX);
-            len = readlink(proc_link, file_name, PATH_MAX - 1);
-            if (len < 0) {
-                len = 0;
-            }
-            file_name[len] = '\0';
-            fprintf(stderr, "Warning: requesting persistence across crashes "
-                    "for backend file %s failed. Proceeding without "
-                    "persistence, data might become corrupted in case of host "
-                    "crash.\n", file_name);
-            g_free(proc_link);
-            g_free(file_name);
-        }
-        /*
-         * if map failed with MAP_SHARED_VALIDATE | MAP_SYNC,
-         * we will remove these flags to handle compatibility.
-         */
-        ptr = mmap(guardptr + offset, size, prot, flags, fd, map_offset);
-    }
-
+    ptr = mmap_activate(guardptr + offset, size, fd, readonly, shared, is_pmem,
+                        map_offset);
     if (ptr == MAP_FAILED) {
         munmap(guardptr, total);
         return MAP_FAILED;
-- 
2.31.1



