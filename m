Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C02836D895
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:49:35 +0200 (CEST)
Received: from localhost ([::1]:42012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkZK-0001U1-Ao
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkRl-0002KH-34
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbkRj-0007Z0-6x
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619617302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJntvOkrac0nr5MJ/9TZoFtVofiO5krNqJOI/YaTpxg=;
 b=GbgG1XvNvVvsypW8oWHei7nvIuDsIK8kjgDFlXsmyFf/rjM6Brd8YX14+aLOSETqo6D6t9
 yDtUMEJDRRhPiQP7jwix4nhxR1N/j9srbueR42j2/nABUALREmnQrQm1OuXSnH03yTnWsV
 43wg5RaqAjx5EZhH0/UbP8LeMSdctJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-nYBoAQkgPNawFpoJbXp4ng-1; Wed, 28 Apr 2021 09:41:38 -0400
X-MC-Unique: nYBoAQkgPNawFpoJbXp4ng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7D359F92C;
 Wed, 28 Apr 2021 13:41:37 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6524960C05;
 Wed, 28 Apr 2021 13:41:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/15] softmmu/memory: Pass ram_flags to qemu_ram_alloc()
 and qemu_ram_alloc_internal()
Date: Wed, 28 Apr 2021 15:37:45 +0200
Message-Id: <20210428133754.10713-7-david@redhat.com>
In-Reply-To: <20210428133754.10713-1-david@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nitesh Lal <nilal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's pass ram_flags to qemu_ram_alloc() and qemu_ram_alloc_internal(),
preparing for passing additional flags.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/ram_addr.h |  2 +-
 softmmu/memory.c        |  4 ++--
 softmmu/physmem.c       | 29 ++++++++++++-----------------
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index a7e3378340..6d4513f8e2 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -122,7 +122,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
 RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
                                   MemoryRegion *mr, Error **errp);
-RAMBlock *qemu_ram_alloc(ram_addr_t size, bool share, MemoryRegion *mr,
+RAMBlock *qemu_ram_alloc(ram_addr_t size, uint32_t ram_flags, MemoryRegion *mr,
                          Error **errp);
 RAMBlock *qemu_ram_alloc_resizeable(ram_addr_t size, ram_addr_t max_size,
                                     void (*resized)(const char*,
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 67be0aa152..580d2c06f5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1548,7 +1548,7 @@ void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
     mr->ram = true;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
-    mr->ram_block = qemu_ram_alloc(size, ram_flags & RAM_SHARED, mr, &err);
+    mr->ram_block = qemu_ram_alloc(size, ram_flags, mr, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
@@ -1704,7 +1704,7 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
     mr->terminates = true;
     mr->rom_device = true;
     mr->destructor = memory_region_destructor_ram;
-    mr->ram_block = qemu_ram_alloc(size, false,  mr, &err);
+    mr->ram_block = qemu_ram_alloc(size, 0, mr, &err);
     if (err) {
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cc59f05593..11b45be271 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2108,12 +2108,15 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
                                   void (*resized)(const char*,
                                                   uint64_t length,
                                                   void *host),
-                                  void *host, bool resizeable, bool share,
+                                  void *host, uint32_t ram_flags,
                                   MemoryRegion *mr, Error **errp)
 {
     RAMBlock *new_block;
     Error *local_err = NULL;
 
+    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC)) == 0);
+    assert(!host ^ (ram_flags & RAM_PREALLOC));
+
     size = HOST_PAGE_ALIGN(size);
     max_size = HOST_PAGE_ALIGN(max_size);
     new_block = g_malloc0(sizeof(*new_block));
@@ -2125,15 +2128,7 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
     new_block->fd = -1;
     new_block->page_size = qemu_real_host_page_size;
     new_block->host = host;
-    if (host) {
-        new_block->flags |= RAM_PREALLOC;
-    }
-    if (share) {
-        new_block->flags |= RAM_SHARED;
-    }
-    if (resizeable) {
-        new_block->flags |= RAM_RESIZEABLE;
-    }
+    new_block->flags = ram_flags;
     ram_block_add(new_block, &local_err);
     if (local_err) {
         g_free(new_block);
@@ -2146,15 +2141,15 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
 RAMBlock *qemu_ram_alloc_from_ptr(ram_addr_t size, void *host,
                                    MemoryRegion *mr, Error **errp)
 {
-    return qemu_ram_alloc_internal(size, size, NULL, host, false,
-                                   false, mr, errp);
+    return qemu_ram_alloc_internal(size, size, NULL, host, RAM_PREALLOC, mr,
+                                   errp);
 }
 
-RAMBlock *qemu_ram_alloc(ram_addr_t size, bool share,
+RAMBlock *qemu_ram_alloc(ram_addr_t size, uint32_t ram_flags,
                          MemoryRegion *mr, Error **errp)
 {
-    return qemu_ram_alloc_internal(size, size, NULL, NULL, false,
-                                   share, mr, errp);
+    assert((ram_flags & ~RAM_SHARED) == 0);
+    return qemu_ram_alloc_internal(size, size, NULL, NULL, ram_flags, mr, errp);
 }
 
 RAMBlock *qemu_ram_alloc_resizeable(ram_addr_t size, ram_addr_t maxsz,
@@ -2163,8 +2158,8 @@ RAMBlock *qemu_ram_alloc_resizeable(ram_addr_t size, ram_addr_t maxsz,
                                                      void *host),
                                      MemoryRegion *mr, Error **errp)
 {
-    return qemu_ram_alloc_internal(size, maxsz, resized, NULL, true,
-                                   false, mr, errp);
+    return qemu_ram_alloc_internal(size, maxsz, resized, NULL,
+                                   RAM_RESIZEABLE, mr, errp);
 }
 
 static void reclaim_ramblock(RAMBlock *block)
-- 
2.30.2


