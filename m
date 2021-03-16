Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DAA33D1A2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:17:14 +0100 (CET)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM6lF-0001Jh-J6
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lM6h1-0005aj-1W
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:12:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lM6gz-0004kO-7S
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615889568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BQF2OghH7o/2WAZ09l9Ywsqwlkjz0WPJd6YYPo9U24=;
 b=KAnd3IlptUeolEWf96YwLkulomMY/lMU04jFqB2rS1bCPnUsEQHUU6YyqqyTgmMTVmAEel
 CaR2KuI1e3GQUY/0Rpmh35+IHYgB63/yt9yLEX65h8ijgvXvKeqhJyjwgLk35aCQ3PDiG3
 HK4iXoSswFd2PyP7862+52SZOWKteOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-C3yLNq-7MUagyVQHb4hzlg-1; Tue, 16 Mar 2021 06:12:45 -0400
X-MC-Unique: C3yLNq-7MUagyVQHb4hzlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B7248189DB;
 Tue, 16 Mar 2021 10:12:44 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-185.ams2.redhat.com
 [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 462556C43A;
 Tue, 16 Mar 2021 10:12:42 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/6] exec: Get rid of phys_mem_set_alloc()
Date: Tue, 16 Mar 2021 11:12:17 +0100
Message-Id: <20210316101221.1890034-3-cohuck@redhat.com>
In-Reply-To: <20210316101221.1890034-1-cohuck@redhat.com>
References: <20210316101221.1890034-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

As the last user is gone, we can get rid of phys_mem_set_alloc() and
simplify.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210303130916.22553-3-david@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 include/sysemu/kvm.h |  4 ----
 softmmu/physmem.c    | 36 +++---------------------------------
 2 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 687c598be9b3..a1ab1ee12d32 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -249,10 +249,6 @@ int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap);
 int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
 int kvm_on_sigbus(int code, void *addr);
 
-/* interface with exec.c */
-
-void phys_mem_set_alloc(void *(*alloc)(size_t, uint64_t *align, bool shared));
-
 /* internal API */
 
 int kvm_ioctl(KVMState *s, int type, ...);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 7e8b0fab89a9..9e5ef4828e9e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1144,19 +1144,6 @@ static int subpage_register(subpage_t *mmio, uint32_t start, uint32_t end,
                             uint16_t section);
 static subpage_t *subpage_init(FlatView *fv, hwaddr base);
 
-static void *(*phys_mem_alloc)(size_t size, uint64_t *align, bool shared) =
-                               qemu_anon_ram_alloc;
-
-/*
- * Set a custom physical guest memory alloator.
- * Accelerators with unusual needs may need this.  Hopefully, we can
- * get rid of it eventually.
- */
-void phys_mem_set_alloc(void *(*alloc)(size_t, uint64_t *align, bool shared))
-{
-    phys_mem_alloc = alloc;
-}
-
 static uint16_t phys_section_add(PhysPageMap *map,
                                  MemoryRegionSection *section)
 {
@@ -1962,8 +1949,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
                 return;
             }
         } else {
-            new_block->host = phys_mem_alloc(new_block->max_length,
-                                             &new_block->mr->align, shared);
+            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
+                                                  &new_block->mr->align,
+                                                  shared);
             if (!new_block->host) {
                 error_setg_errno(errp, errno,
                                  "cannot set up guest memory '%s'",
@@ -2047,17 +2035,6 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
         return NULL;
     }
 
-    if (phys_mem_alloc != qemu_anon_ram_alloc) {
-        /*
-         * file_ram_alloc() needs to allocate just like
-         * phys_mem_alloc, but we haven't bothered to provide
-         * a hook there.
-         */
-        error_setg(errp,
-                   "-mem-path not supported with this accelerator");
-        return NULL;
-    }
-
     size = HOST_PAGE_ALIGN(size);
     file_size = get_file_size(fd);
     if (file_size > 0 && file_size < size) {
@@ -2247,13 +2224,6 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
                     area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
                                 flags, block->fd, offset);
                 } else {
-                    /*
-                     * Remap needs to match alloc.  Accelerators that
-                     * set phys_mem_alloc never remap.  If they did,
-                     * we'd need a remap hook here.
-                     */
-                    assert(phys_mem_alloc == qemu_anon_ram_alloc);
-
                     flags |= MAP_PRIVATE | MAP_ANONYMOUS;
                     area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
                                 flags, -1, 0);
-- 
2.26.3


