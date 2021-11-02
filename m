Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951B14433BA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:48:55 +0100 (CET)
Received: from localhost ([::1]:54354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwxy-0001kV-N0
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhwut-0006t0-8s
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhwuq-00056a-PH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635871539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4hchrxwCsRo/Xfw/XJx+BgHd8p2GwZA7aQLxDcQKGs=;
 b=jUa5wQlkRa5Zkk4T8tRrLnQAi0AK9XGG+A4J9i2IAfcGVh0flkrFhfOixIYPAooNpfNOTq
 RpBljY2NOrtBhHS7QvsiBOZPkGwL5eoOLp36RrghFqxNhCz9IMd4SquPVeGy7+VdCLmYPJ
 5P/Fd8A1XbcvNE19h5WEFjgIuwfmtF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-qKCBdH49PJSseZrvL_QZkg-1; Tue, 02 Nov 2021 12:45:38 -0400
X-MC-Unique: qKCBdH49PJSseZrvL_QZkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49AB0100738D;
 Tue,  2 Nov 2021 16:45:37 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9909A101E59D;
 Tue,  2 Nov 2021 16:45:24 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] memory: Make memory_region_is_mapped() succeed when
 mapped via an alias
Date: Tue,  2 Nov 2021 17:43:16 +0100
Message-Id: <20211102164317.45658-3-david@redhat.com>
In-Reply-To: <20211102164317.45658-1-david@redhat.com>
References: <20211102164317.45658-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/memory.h |  1 +
 softmmu/memory.c      | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 20f1b27377..fea1a493b9 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -738,6 +738,7 @@ struct MemoryRegion {
     const MemoryRegionOps *ops;
     void *opaque;
     MemoryRegion *container;
+    int mapped_via_alias; /* Mapped via an alias, container might be NULL */
     Int128 size;
     hwaddr addr;
     void (*destructor)(MemoryRegion *mr);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7340e19ff5..b52b6a2f66 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2535,8 +2535,13 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
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
@@ -2561,9 +2566,15 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
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
+        assert(alias->mapped_via_alias >= 0);
+    }
     QTAILQ_REMOVE(&mr->subregions, subregion, subregions_link);
     memory_region_unref(subregion);
     memory_region_update_pending |= mr->enabled && subregion->enabled;
@@ -2660,7 +2671,7 @@ static FlatRange *flatview_lookup(FlatView *view, AddrRange addr)
 
 bool memory_region_is_mapped(MemoryRegion *mr)
 {
-    return mr->container ? true : false;
+    return !!mr->container || mr->mapped_via_alias;
 }
 
 /* Same as memory_region_find, but it does not add a reference to the
-- 
2.31.1


