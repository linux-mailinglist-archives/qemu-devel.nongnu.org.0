Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9F63AAFF2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:40:53 +0200 (CEST)
Received: from localhost ([::1]:60434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoW4-0003Xc-LA
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNJ-0002l5-Uk
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:50 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNH-00068r-Us
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:49 -0400
Received: by mail-ed1-x52a.google.com with SMTP id z12so3098688edc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jempworfNSeLBXZqL1QYZwHbPUXKSHYksUwRgxPhDCk=;
 b=UVyDblc76pFLLHP8PKq/IlzZfb3OjNLnD+JghWeNTYcKEtofH7xQTZCsmRAM/ajYCo
 hhuj0YCS7Sdza1Wmot6NYkAez7TPo5nKbd7BH8X/BESe91VXPFlyJFu1rblvLlgd8riJ
 VV4Re1xtzTc7To58AFVKZb+DfP9avSh66luYw5HVnz9xY8DNMXUaIn8PNYXuDDlhwVDd
 9KImxQCGoeN6UImeU/9MzeLA2EzxVICX5y1xEtkggU1GnpTEVqexjtQCX36xLGwKGgH1
 //yVj+JHSKxARL9UCZURJPaLmoUgklXi25es/EYrv1QBxQohOQ/M3A685kWo1VR+Q9VP
 sZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jempworfNSeLBXZqL1QYZwHbPUXKSHYksUwRgxPhDCk=;
 b=kNPLl/b3QEXJPPpACJ8bLFiL+uq5DbI48lGaNv5OIItdP7DpAtIrB8DZ6fY3XrJYl2
 3AwYxRacDFN0UyYmRHq5PlExkac2m1+kiG8jdwClfE9OJr4+DF+xl6/fyJmL7sjPo3Td
 ENBJKMkxlZ0GbwqcqbP4nGiGJ0wVQDTf4biIY3wG5RIdpV9U+Bh67wejIcmQjevO8osN
 eJF0j5t+OS0PqhRXgLp+nbY7o7/7Vh3xedIwDut4aigQetsg1BMi9SZvOrKWF/UgpuT+
 U7QZNvG5SWzQtqlemYdcUSs3VmXQO/SYU0sjZvpDTAkevIFLbKBS4HloMqg594+cDrex
 SLcg==
X-Gm-Message-State: AOAM531LRWy3JoK25Lb8CFRzVRu7nmXgdmPAmNZtELUCjGCX6LC0RZQy
 9Iv86Rr2gt3rfcsBmeyqX7ONARPiJKE=
X-Google-Smtp-Source: ABdhPJwoGruPBrAr9fbGCx9R+ZDpXiAejhyS2VRoudjYU8zSJBmYAbGdKJeozwBICVOi6yX7WPW2vg==
X-Received: by 2002:aa7:cc19:: with SMTP id q25mr5233922edt.56.1623922306630; 
 Thu, 17 Jun 2021 02:31:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/45] softmmu/physmem: Fix ram_block_discard_range() to handle
 shared anonymous memory
Date: Thu, 17 Jun 2021 11:31:05 +0200
Message-Id: <20210617093134.900014-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We can create shared anonymous memory via
    "-object memory-backend-ram,share=on,..."
which is, for example, required by PVRDMA for mremap() to work.

Shared anonymous memory is weird, though. Instead of MADV_DONTNEED, we
have to use MADV_REMOVE: MADV_DONTNEED will only remove / zap all
relevant page table entries of the current process, the backend storage
will not get removed, resulting in no reduced memory consumption and
a repopulation of previous content on next access.

Shared anonymous memory is internally really just shmem, but without a
fd exposed. As we cannot use fallocate() without the fd to discard the
backing storage, MADV_REMOVE gets the same job done without a fd as
documented in "man 2 madvise". Removing backing storage implicitly
invalidates all page table entries with relevant mappings - an additional
MADV_DONTNEED is not required.

Fixes: 06329ccecfa0 ("mem: add share parameter to memory-backend-ram")
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210406080126.24010-3-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/osdep.h | 4 ++--
 softmmu/physmem.c    | 7 ++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 236a045671..18a9e3fb4c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -410,7 +410,7 @@ void qemu_anon_ram_free(void *ptr, size_t size);
 #ifdef MADV_REMOVE
 #define QEMU_MADV_REMOVE MADV_REMOVE
 #else
-#define QEMU_MADV_REMOVE QEMU_MADV_INVALID
+#define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
 #endif
 
 #elif defined(CONFIG_POSIX_MADVISE)
@@ -424,7 +424,7 @@ void qemu_anon_ram_free(void *ptr, size_t size);
 #define QEMU_MADV_DONTDUMP QEMU_MADV_INVALID
 #define QEMU_MADV_HUGEPAGE  QEMU_MADV_INVALID
 #define QEMU_MADV_NOHUGEPAGE  QEMU_MADV_INVALID
-#define QEMU_MADV_REMOVE QEMU_MADV_INVALID
+#define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
 
 #else /* no-op */
 
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index b78b30e7ba..c0a3c47167 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3527,6 +3527,7 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
         /* The logic here is messy;
          *    madvise DONTNEED fails for hugepages
          *    fallocate works on hugepages and shmem
+         *    shared anonymous memory requires madvise REMOVE
          */
         need_madvise = (rb->page_size == qemu_host_page_size);
         need_fallocate = rb->fd != -1;
@@ -3560,7 +3561,11 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
              * fallocate'd away).
              */
 #if defined(CONFIG_MADVISE)
-            ret =  madvise(host_startaddr, length, MADV_DONTNEED);
+            if (qemu_ram_is_shared(rb) && rb->fd < 0) {
+                ret = madvise(host_startaddr, length, QEMU_MADV_REMOVE);
+            } else {
+                ret = madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
+            }
             if (ret) {
                 ret = -errno;
                 error_report("ram_block_discard_range: Failed to discard range "
-- 
2.31.1



