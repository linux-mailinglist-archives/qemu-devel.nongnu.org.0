Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A913C1A60
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:09:47 +0200 (CEST)
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aLC-0004ug-9q
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1a8V-0004ZZ-A1
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1a8R-00021R-Gv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625774194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4N9OhEuNZmqUpxvOBtHZpJkVULFHUhi9PPV/t7sKG0w=;
 b=eKiz/S8d5vJUb+86EFJfSH+uYa4cil9khckMWVo7CNZBjsXWcIPVc5A62qZbBorSAWQgzZ
 h3oUhuWbgeJqY1/I/l8GL2hO68C+pO48vB3Pi56R9jXhboyLl8ZobzvdQoe9o8DyJjaSe7
 PMtzMbMiuE5axlyAIjvOvrzZWU9k/Us=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-F7nFrJuNOtOIUMkhyiBfQQ-1; Thu, 08 Jul 2021 15:56:33 -0400
X-MC-Unique: F7nFrJuNOtOIUMkhyiBfQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DF5E11DCE;
 Thu,  8 Jul 2021 19:56:32 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBC1B5D9FC;
 Thu,  8 Jul 2021 19:56:14 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 04/15] memory: Helpers to copy/free a MemoryRegionSection
Date: Thu,  8 Jul 2021 15:55:41 -0400
Message-Id: <20210708195552.2730970-5-ehabkost@redhat.com>
In-Reply-To: <20210708195552.2730970-1-ehabkost@redhat.com>
References: <20210708195552.2730970-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

In case one wants to create a permanent copy of a MemoryRegionSections,
one needs access to flatview_ref()/flatview_unref(). Instead of exposing
these, let's just add helpers to copy/free a MemoryRegionSection and
properly adjust references.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210413095531.25603-3-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/exec/memory.h | 20 ++++++++++++++++++++
 softmmu/memory.c      | 27 +++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6574e46b932..27a8833173b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1066,6 +1066,26 @@ static inline bool MemoryRegionSection_eq(MemoryRegionSection *a,
            a->nonvolatile == b->nonvolatile;
 }
 
+/**
+ * memory_region_section_new_copy: Copy a memory region section
+ *
+ * Allocate memory for a new copy, copy the memory region section, and
+ * properly take a reference on all relevant members.
+ *
+ * @s: the #MemoryRegionSection to copy
+ */
+MemoryRegionSection *memory_region_section_new_copy(MemoryRegionSection *s);
+
+/**
+ * memory_region_section_new_copy: Free a copied memory region section
+ *
+ * Free a copy of a memory section created via memory_region_section_new_copy().
+ * properly dropping references on all relevant members.
+ *
+ * @s: the #MemoryRegionSection to copy
+ */
+void memory_region_section_free_copy(MemoryRegionSection *s);
+
 /**
  * memory_region_init: Initialize a memory region
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index d20a9dec44e..cea2f622c96 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2701,6 +2701,33 @@ MemoryRegionSection memory_region_find(MemoryRegion *mr,
     return ret;
 }
 
+MemoryRegionSection *memory_region_section_new_copy(MemoryRegionSection *s)
+{
+    MemoryRegionSection *tmp = g_new(MemoryRegionSection, 1);
+
+    *tmp = *s;
+    if (tmp->mr) {
+        memory_region_ref(tmp->mr);
+    }
+    if (tmp->fv) {
+        bool ret  = flatview_ref(tmp->fv);
+
+        g_assert(ret);
+    }
+    return tmp;
+}
+
+void memory_region_section_free_copy(MemoryRegionSection *s)
+{
+    if (s->fv) {
+        flatview_unref(s->fv);
+    }
+    if (s->mr) {
+        memory_region_unref(s->mr);
+    }
+    g_free(s);
+}
+
 bool memory_region_present(MemoryRegion *container, hwaddr addr)
 {
     MemoryRegion *mr;
-- 
2.31.1


