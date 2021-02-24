Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F37B3239F3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 10:54:37 +0100 (CET)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEqsO-0005rS-AP
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 04:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEqnz-0001Z3-1O
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:50:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEqnx-0007HH-Bh
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:50:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614160200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aV1XqkXm5hpkoA7S7bAk8boewumcKF5WvNDuCIWqOf4=;
 b=AWJv1KkB51kit2A19ud/TfGOM258qO5GmzBgkA3/KS0DZbMPNbFlLy5/ck0bxt6GyZMbAh
 r6ieop14ZrEGHzeeHHHUk/mRxnXJHxvRBEGwZBrJ0+QIWJW1SI3mpT40Vh9B42DqT/vzAQ
 GprEsXab/ASU25ptBchHldc0npmRtn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-D_gEOyzyPYahu2mAB_ON4w-1; Wed, 24 Feb 2021 04:49:56 -0500
X-MC-Unique: D_gEOyzyPYahu2mAB_ON4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E810100A8EB;
 Wed, 24 Feb 2021 09:49:55 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-83.ams2.redhat.com [10.36.114.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 247A1722CE;
 Wed, 24 Feb 2021 09:49:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/13] memory: Helpers to copy/free a MemoryRegionSection
Date: Wed, 24 Feb 2021 10:48:58 +0100
Message-Id: <20210224094910.44986-3-david@redhat.com>
In-Reply-To: <20210224094910.44986-1-david@redhat.com>
References: <20210224094910.44986-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 include/exec/memory.h | 20 ++++++++++++++++++++
 softmmu/memory.c      | 27 +++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 3ff36a9006..ad5e0d6278 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1023,6 +1023,26 @@ static inline bool MemoryRegionSection_eq(MemoryRegionSection *a,
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
index fa4f0fa4a3..edc6c8a29d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2693,6 +2693,33 @@ MemoryRegionSection memory_region_find(MemoryRegion *mr,
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
2.29.2


