Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4043AAFFD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:43:08 +0200 (CEST)
Received: from localhost ([::1]:41738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoYF-0001VH-Qt
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNO-0002nx-WF
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:55 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:46739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNK-0006AH-7E
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:51 -0400
Received: by mail-ed1-x52d.google.com with SMTP id s15so3015466edt.13
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hiu7ziiW42i1lxDyJDOcGawcWvmvcODGC75HldQeDRk=;
 b=Y/dRO7uHPmJWmEZDzAC0CdLggjBnok+5WFoctspVAzsJi854u56VYoqcKJdYCtg/iD
 J2Ogco2yXKzDKmmsDYP6CrG3CBh5j8FLpk+wspLtkBNrs750AJEttJglLARGod2Sk6Xi
 oiJpG/NWZDzhyX6wqJYt73/CXJL8UFcmZfMbTnoH2fTIBdaoFs3QLIOnXW6I3U7BXWVZ
 ExUGqDK7aXofVHofnT1q4qPbMwoG2MHjMzHcw83qf81wJevWGH48agWzRL/hqMjus+18
 lVjuM6qUdIlAR2ppEBfUJXw7lL/gp+eJ1pMetg750oNXCve4+NhIvIHsRUEBOc44sCd1
 4poQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hiu7ziiW42i1lxDyJDOcGawcWvmvcODGC75HldQeDRk=;
 b=SpgsoQ0Rw8oaNCIuvNHd94YDBK2wHIAquyUkAFArJcz9qEGKiA93kFfalgT32u/Bx+
 Vb9kt4irv6TA1LVudamRFZSsey/OFmhrndh8M8DQyAsH7jZVuFR7Cp3PwEbrX/CHHu1E
 JYuWt7tSemJOuRdocwbFQJyjaHsQLpzzT753EV6pN0kmKtQlDkm1llKXLcHunwJemBNr
 b3HUUtfUCuVJiFU0vhjb1X5YcJYdqa2xYOycjPdl5E2rvd/WL+jwciNPQDogXFE6+iiv
 Z4CcRz2cXWshMGHYexGCXoEf0Kp3mU8omKsIpJYq1xqGOZf+piI0tXLQ6JkVVEw0CioU
 WdNw==
X-Gm-Message-State: AOAM530NL7spnUcRwdD5bXN2YBKF+J/03l7nuTs4ElLaaigcAJ4cohEF
 k8g6bWiYDo2TQ3N2nnvk5SFd7DOCO2g=
X-Google-Smtp-Source: ABdhPJxATh9QgtTRzDuKplu6nWWC1cuZP17ekTi3OUAM6ggfzersLOpdIaYh4LP3vqt7fCuymnr5mA==
X-Received: by 2002:a05:6402:35cc:: with SMTP id
 z12mr5297671edc.45.1623922308975; 
 Thu, 17 Jun 2021 02:31:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/45] util/mmap-alloc: Factor out reserving of a memory region
 to mmap_reserve()
Date: Thu, 17 Jun 2021 11:31:08 +0200
Message-Id: <20210617093134.900014-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We want to reserve a memory region without actually populating memory.
Let's factor that out.

Reviewed-by: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Acked-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-3-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/mmap-alloc.c | 58 +++++++++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 24854064b4..223d66219c 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -82,6 +82,38 @@ size_t qemu_mempath_getpagesize(const char *mem_path)
     return qemu_real_host_page_size;
 }
 
+/*
+ * Reserve a new memory region of the requested size to be used for mapping
+ * from the given fd (if any).
+ */
+static void *mmap_reserve(size_t size, int fd)
+{
+    int flags = MAP_PRIVATE;
+
+#if defined(__powerpc64__) && defined(__linux__)
+    /*
+     * On ppc64 mappings in the same segment (aka slice) must share the same
+     * page size. Since we will be re-allocating part of this segment
+     * from the supplied fd, we should make sure to use the same page size, to
+     * this end we mmap the supplied fd.  In this case, set MAP_NORESERVE to
+     * avoid allocating backing store memory.
+     * We do this unless we are using the system page size, in which case
+     * anonymous memory is OK.
+     */
+    if (fd == -1 || qemu_fd_getpagesize(fd) == qemu_real_host_page_size) {
+        fd = -1;
+        flags |= MAP_ANONYMOUS;
+    } else {
+        flags |= MAP_NORESERVE;
+    }
+#else
+    fd = -1;
+    flags |= MAP_ANONYMOUS;
+#endif
+
+    return mmap(0, size, PROT_NONE, flags, fd, 0);
+}
+
 static inline size_t mmap_guard_pagesize(int fd)
 {
 #if defined(__powerpc64__) && defined(__linux__)
@@ -104,7 +136,6 @@ void *qemu_ram_mmap(int fd,
     int prot;
     int flags;
     int map_sync_flags = 0;
-    int guardfd;
     size_t offset;
     size_t total;
     void *guardptr;
@@ -116,30 +147,7 @@ void *qemu_ram_mmap(int fd,
      */
     total = size + align;
 
-#if defined(__powerpc64__) && defined(__linux__)
-    /* On ppc64 mappings in the same segment (aka slice) must share the same
-     * page size. Since we will be re-allocating part of this segment
-     * from the supplied fd, we should make sure to use the same page size, to
-     * this end we mmap the supplied fd.  In this case, set MAP_NORESERVE to
-     * avoid allocating backing store memory.
-     * We do this unless we are using the system page size, in which case
-     * anonymous memory is OK.
-     */
-    flags = MAP_PRIVATE;
-    if (fd == -1 || guard_pagesize == qemu_real_host_page_size) {
-        guardfd = -1;
-        flags |= MAP_ANONYMOUS;
-    } else {
-        guardfd = fd;
-        flags |= MAP_NORESERVE;
-    }
-#else
-    guardfd = -1;
-    flags = MAP_PRIVATE | MAP_ANONYMOUS;
-#endif
-
-    guardptr = mmap(0, total, PROT_NONE, flags, guardfd, 0);
-
+    guardptr = mmap_reserve(total, fd);
     if (guardptr == MAP_FAILED) {
         return MAP_FAILED;
     }
-- 
2.31.1



