Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982643B69F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:11:56 +0200 (CEST)
Received: from localhost ([::1]:37426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfP3L-0005gn-9j
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfOzL-0007jG-Of
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfOzK-00044N-2H
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635264465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjLtlBcGj/IRcnBpCfCpWEDqyxtDvZR4R/M/lfHENw4=;
 b=dQjeLUigQYLV6a0LO7nG+kor+6taqSdazBaD6hq839C9hSfi4sXfLwcCq6P1WvBr8rY4rc
 XkTICwFrPxBN07oNwDUi8N9KzKzPFE1CwRHckqvRqeYFrrX/zdYHqAruDxF0pSPjlpL4+i
 MzZV+9wwTJnBx3jv3Y6QHQLOOg0mUTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-sZHwZIsOPLmkrhh5dO8h6A-1; Tue, 26 Oct 2021 12:07:42 -0400
X-MC-Unique: sZHwZIsOPLmkrhh5dO8h6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AC5810168C3;
 Tue, 26 Oct 2021 16:07:41 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECDB51972D;
 Tue, 26 Oct 2021 16:07:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] memory: Make memory_region_is_mapped() succeed when
 mapped via an alias
Date: Tue, 26 Oct 2021 18:06:48 +0200
Message-Id: <20211026160649.47545-3-david@redhat.com>
In-Reply-To: <20211026160649.47545-1-david@redhat.com>
References: <20211026160649.47545-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_is_mapped() currently does not return "true" when a memory
region is mapped via an alias.

Assuming we have:
    alias (A0) -> alias (A1) -> region (R0)
Mapping A0 would currently only make memory_region_is_mapped() succeed
on A0, but not on A1 and R0.

Let's fix that by adding a "mapped_via_alias" counter to memory regions and
updating it accordingly when an alias gets (un)mapped.

I am not aware of actual issues, this is rather a cleanup to make it
consistent.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/memory.h |  1 +
 softmmu/memory.c      | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index a185b6dcb8..35382d9870 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -707,6 +707,7 @@ struct MemoryRegion {
     const MemoryRegionOps *ops;
     void *opaque;
     MemoryRegion *container;
+    int mapped_via_alias; /* Mapped via an alias, container might be NULL */
     Int128 size;
     hwaddr addr;
     void (*destructor)(MemoryRegion *mr);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index e5826faa0c..17ca896c38 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2524,8 +2524,13 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
                                                hwaddr offset,
                                                MemoryRegion *subregion)
 {
+    MemoryRegion *alias;
+
     assert(!subregion->container);
     subregion->container = mr;
+    for (alias = subregion->alias; alias; alias = alias->alias) {
+        alias->mapped_via_alias++;
+    }
     subregion->addr = offset;
     memory_region_update_container_subregions(subregion);
 }
@@ -2550,9 +2555,14 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
 void memory_region_del_subregion(MemoryRegion *mr,
                                  MemoryRegion *subregion)
 {
+    MemoryRegion *alias;
+
     memory_region_transaction_begin();
     assert(subregion->container == mr);
     subregion->container = NULL;
+    for (alias = subregion->alias; alias; alias = alias->alias) {
+        alias->mapped_via_alias--;
+    }
     QTAILQ_REMOVE(&mr->subregions, subregion, subregions_link);
     memory_region_unref(subregion);
     memory_region_update_pending |= mr->enabled && subregion->enabled;
@@ -2649,7 +2659,7 @@ static FlatRange *flatview_lookup(FlatView *view, AddrRange addr)
 
 bool memory_region_is_mapped(MemoryRegion *mr)
 {
-    return mr->container ? true : false;
+    return !!mr->container || mr->mapped_via_alias;
 }
 
 /* Same as memory_region_find, but it does not add a reference to the
-- 
2.31.1


