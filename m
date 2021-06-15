Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA933A8168
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:51:47 +0200 (CEST)
Received: from localhost ([::1]:42404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9Tm-00045O-Oi
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hi-0005xA-Dk
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:18 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hg-0002mf-C3
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:18 -0400
Received: by mail-ed1-x52f.google.com with SMTP id r7so36751812edv.12
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HvPqNCF2sjL2JYw07xiEgb3yfgqupeU2JQK8pZnMZEs=;
 b=FhglVNInCNyRn/nVMaiOGodQuY3BAKBc6YfNdC0rd/bOxJNiWe59iSat1GgIcS3bGN
 0FvCjU6x4X/Jho2i5DZGZm+HgPDbhYAYBi+uK8gK/O8lCFRc6v9d1H3Y8aVzsKbVEP/n
 7SFNRjBYTJu9rMf12xl5dcDx/psqPxP4BBd3Ilnv+SwKq9eagYcx/4gPcm80aE0PwVSR
 qXICKHVV3Ebr9CvlAQb3pqyL6jY7hR2JWY5h0KIyOHh2tRmlGIvDv4n5OOGxrQ1Z+Btk
 mrXI5YW/Vj9LmuSfR4JjNf3hI35MV04oHgm3P2IdM38L/joA5Sqx8PZkElvohIVeZNoM
 WY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HvPqNCF2sjL2JYw07xiEgb3yfgqupeU2JQK8pZnMZEs=;
 b=cSp4+sMig4GK86am9/oND10VWLA9A7dN5vV5HdbUqYk25Jd66gOnb93R9N8w+O2z+d
 eq8H+iNpPRGVUYA1LzeLiAb7AWf/ffPczk7kvoUu6hyfmjJ8sfkCgK7epRyjCMOueOUc
 Mr0e5HHTB9GDO9/jMysqIuXkqOTBjFbloYO3MKx71AdrsevCAKpuDXPh+QCVqyNMRMxA
 8SnrKlwRrEp0nHSRmp+i0VdZui6uFhF7baLnnkc2eZhCyOEmGGlTzeGffSPSyUmtv/Yy
 78PzDDdBTJOCXHnnKPbn+uaSblEJh/oTmjEMVkmwsxagD0cVl4jbv8EBV+CiSp8meVny
 PrtQ==
X-Gm-Message-State: AOAM531uJMWMYcWNOJYGkOqmqJHdDq3LW/AorMHis9XRyDDQtJxlR4sJ
 MAjKzt6oMDvLNiyE11Dsvzdy/ccNIuI=
X-Google-Smtp-Source: ABdhPJwqzML7j1cNzHB7lNO5C8JGws5taC9cohfhqFUDDUSjeKhjCwFTfRkSBenTNRwUdI3yCVwQlg==
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr23664023edw.209.1623764355113; 
 Tue, 15 Jun 2021 06:39:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/33] util/mmap-alloc: Factor out calculation of the pagesize
 for the guard page
Date: Tue, 15 Jun 2021 15:38:40 +0200
Message-Id: <20210615133855.775687-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's factor out calculating the size of the guard page and rename the
variable to make it clearer that this pagesize only applies to the
guard page.

Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-2-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/mmap-alloc.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index e6fa8b598b..24854064b4 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -82,6 +82,16 @@ size_t qemu_mempath_getpagesize(const char *mem_path)
     return qemu_real_host_page_size;
 }
 
+static inline size_t mmap_guard_pagesize(int fd)
+{
+#if defined(__powerpc64__) && defined(__linux__)
+    /* Mappings in the same segment must share the same page size */
+    return qemu_fd_getpagesize(fd);
+#else
+    return qemu_real_host_page_size;
+#endif
+}
+
 void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
@@ -90,12 +100,12 @@ void *qemu_ram_mmap(int fd,
                     bool is_pmem,
                     off_t map_offset)
 {
+    const size_t guard_pagesize = mmap_guard_pagesize(fd);
     int prot;
     int flags;
     int map_sync_flags = 0;
     int guardfd;
     size_t offset;
-    size_t pagesize;
     size_t total;
     void *guardptr;
     void *ptr;
@@ -116,8 +126,7 @@ void *qemu_ram_mmap(int fd,
      * anonymous memory is OK.
      */
     flags = MAP_PRIVATE;
-    pagesize = qemu_fd_getpagesize(fd);
-    if (fd == -1 || pagesize == qemu_real_host_page_size) {
+    if (fd == -1 || guard_pagesize == qemu_real_host_page_size) {
         guardfd = -1;
         flags |= MAP_ANONYMOUS;
     } else {
@@ -126,7 +135,6 @@ void *qemu_ram_mmap(int fd,
     }
 #else
     guardfd = -1;
-    pagesize = qemu_real_host_page_size;
     flags = MAP_PRIVATE | MAP_ANONYMOUS;
 #endif
 
@@ -138,7 +146,7 @@ void *qemu_ram_mmap(int fd,
 
     assert(is_power_of_2(align));
     /* Always align to host page size */
-    assert(align >= pagesize);
+    assert(align >= guard_pagesize);
 
     flags = MAP_FIXED;
     flags |= fd == -1 ? MAP_ANONYMOUS : 0;
@@ -193,8 +201,8 @@ void *qemu_ram_mmap(int fd,
      * a guard page guarding against potential buffer overflows.
      */
     total -= offset;
-    if (total > size + pagesize) {
-        munmap(ptr + size + pagesize, total - size - pagesize);
+    if (total > size + guard_pagesize) {
+        munmap(ptr + size + guard_pagesize, total - size - guard_pagesize);
     }
 
     return ptr;
@@ -202,15 +210,8 @@ void *qemu_ram_mmap(int fd,
 
 void qemu_ram_munmap(int fd, void *ptr, size_t size)
 {
-    size_t pagesize;
-
     if (ptr) {
         /* Unmap both the RAM block and the guard page */
-#if defined(__powerpc64__) && defined(__linux__)
-        pagesize = qemu_fd_getpagesize(fd);
-#else
-        pagesize = qemu_real_host_page_size;
-#endif
-        munmap(ptr, size + pagesize);
+        munmap(ptr, size + mmap_guard_pagesize(fd));
     }
 }
-- 
2.31.1



