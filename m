Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4C2298A13
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 11:11:23 +0100 (CET)
Received: from localhost ([::1]:41576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWzTG-0007k3-Rj
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 06:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kWzP1-0002bE-Sl
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:07:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kWzOx-0006f2-2x
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603706813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=Q7utiPbMI+tm18kijyblHQxsmeyYZVDQzQn75XCpiJ8=;
 b=hP+Rno7y3GLZWok9uWektJI5cSGzUxulM/vcVCfCm5f+zOb//vE3WuOGTtnF5fQi0SGVFF
 GPAtuIAoQifGow9LlWggpcwECraZ+K0w2aOtRQpUbns6jzevUUr63aU7k7YJgg/xuuviNT
 e7wBbtKqxvfXCSnOZkHGK+zJ/1LJ5ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-U-ydJKnnO6Oz4SIS7qtBKw-1; Mon, 26 Oct 2020 06:06:50 -0400
X-MC-Unique: U-ydJKnnO6Oz4SIS7qtBKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A1CD10E2188;
 Mon, 26 Oct 2020 10:06:49 +0000 (UTC)
Received: from thuth.com (ovpn-112-104.ams2.redhat.com [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 609EB8B849;
 Mon, 26 Oct 2020 10:06:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/31] memory: Add FlatView foreach function
Date: Mon, 26 Oct 2020 11:06:10 +0100
Message-Id: <20201026100632.212530-10-thuth@redhat.com>
In-Reply-To: <20201026100632.212530-1-thuth@redhat.com>
References: <20201026100632.212530-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20201023150746.107063-2-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/exec/memory.h |  5 +++++
 softmmu/memory.c      | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 622207bde1..042918dd16 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -719,6 +719,11 @@ static inline FlatView *address_space_to_flatview(AddressSpace *as)
     return qatomic_rcu_read(&as->current_map);
 }
 
+typedef int (*flatview_cb)(Int128 start,
+                           Int128 len,
+                           const MemoryRegion*, void*);
+
+void flatview_for_each_range(FlatView *fv, flatview_cb cb , void *opaque);
 
 /**
  * struct MemoryRegionSection: describes a fragment of a #MemoryRegion
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 403ff3abc9..a5d1641820 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -656,6 +656,19 @@ static void render_memory_region(FlatView *view,
     }
 }
 
+void flatview_for_each_range(FlatView *fv, flatview_cb cb , void *opaque)
+{
+    FlatRange *fr;
+
+    assert(fv);
+    assert(cb);
+
+    FOR_EACH_FLAT_RANGE(fr, fv) {
+        if (cb(fr->addr.start, fr->addr.size, fr->mr, opaque))
+            break;
+    }
+}
+
 static MemoryRegion *memory_region_get_flatview_root(MemoryRegion *mr)
 {
     while (mr->enabled) {
-- 
2.18.2


