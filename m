Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBAD1F53FE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 13:56:45 +0200 (CEST)
Received: from localhost ([::1]:40614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jizLY-0004TR-N5
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 07:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jizJg-0002Sd-4q
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 07:54:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22677
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jizJe-0001tb-0V
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 07:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591790084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U68jIOHuvNFPHE8HVjN9BLo12zDx2a4qnBp0EnzJr9o=;
 b=aRLnoQY+2mAPRl1CjeDp1dCzEVOJmubuDo+p5Qe0Ndub/Ywv0z0K8uq4UCF5y4rDVxA7o6
 2GG3iXBcf3w9CWw8nuzCrjnyhDultn2rWo/SQZ1hjqzvCZDWQTBUCnUyVfEYYcnOHu8srt
 XV/jxZwGDkE77Pn0yCUoW7dss7w5qdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-LYF1y1dlMwuABbJGim0Zvg-1; Wed, 10 Jun 2020 07:54:40 -0400
X-MC-Unique: LYF1y1dlMwuABbJGim0Zvg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C04E193F560;
 Wed, 10 Jun 2020 11:54:39 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-42.ams2.redhat.com [10.36.114.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC3F25D9D3;
 Wed, 10 Jun 2020 11:54:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/21] exec: Introduce ram_block_discard_(disable|require)()
Date: Wed, 10 Jun 2020 13:53:59 +0200
Message-Id: <20200610115419.51688-2-david@redhat.com>
In-Reply-To: <20200610115419.51688-1-david@redhat.com>
References: <20200610115419.51688-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=207.211.31.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 21:17:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to replace qemu_balloon_inhibit() by something more generic.
Especially, we want to make sure that technologies that really rely on
RAM block discards to work reliably to run mutual exclusive with
technologies that effectively break it.

E.g., vfio will usually pin all guest memory, turning the virtio-balloon
basically useless and make the VM consume more memory than reported via
the balloon. While the balloon is special already (=> no guarantees, same
behavior possible afer reboots and with huge pages), this will be
different, especially, with virtio-mem.

Let's implement a way such that we can make both types of technology run
mutually exclusive. We'll convert existing balloon inhibitors in successive
patches and add some new ones. Add the check to
qemu_balloon_is_inhibited() for now. We might want to make
virtio-balloon an acutal inhibitor in the future - however, that
requires more thought to not break existing setups.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 balloon.c             |  3 ++-
 exec.c                | 52 +++++++++++++++++++++++++++++++++++++++++++
 include/exec/memory.h | 41 ++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/balloon.c b/balloon.c
index f104b42961..5fff79523a 100644
--- a/balloon.c
+++ b/balloon.c
@@ -40,7 +40,8 @@ static int balloon_inhibit_count;
 
 bool qemu_balloon_is_inhibited(void)
 {
-    return atomic_read(&balloon_inhibit_count) > 0;
+    return atomic_read(&balloon_inhibit_count) > 0 ||
+           ram_block_discard_is_disabled();
 }
 
 void qemu_balloon_inhibit(bool state)
diff --git a/exec.c b/exec.c
index be4be2df3a..c4c1d9df84 100644
--- a/exec.c
+++ b/exec.c
@@ -4051,4 +4051,56 @@ void mtree_print_dispatch(AddressSpaceDispatch *d, MemoryRegion *root)
     }
 }
 
+/*
+ * If positive, discarding RAM is disabled. If negative, discarding RAM is
+ * required to work and cannot be disabled.
+ */
+static int ram_block_discard_disabled;
+
+int ram_block_discard_disable(bool state)
+{
+    int old;
+
+    if (!state) {
+        atomic_dec(&ram_block_discard_disabled);
+        return 0;
+    }
+
+    do {
+        old = atomic_read(&ram_block_discard_disabled);
+        if (old < 0) {
+            return -EBUSY;
+        }
+    } while (atomic_cmpxchg(&ram_block_discard_disabled, old, old + 1) != old);
+    return 0;
+}
+
+int ram_block_discard_require(bool state)
+{
+    int old;
+
+    if (!state) {
+        atomic_inc(&ram_block_discard_disabled);
+        return 0;
+    }
+
+    do {
+        old = atomic_read(&ram_block_discard_disabled);
+        if (old > 0) {
+            return -EBUSY;
+        }
+    } while (atomic_cmpxchg(&ram_block_discard_disabled, old, old - 1) != old);
+    return 0;
+}
+
+bool ram_block_discard_is_disabled(void)
+{
+    return atomic_read(&ram_block_discard_disabled) > 0;
+}
+
+bool ram_block_discard_is_required(void)
+{
+    return atomic_read(&ram_block_discard_disabled) < 0;
+}
+
 #endif
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 3e00cdbbfa..eea7d284b9 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2474,6 +2474,47 @@ static inline MemOp devend_memop(enum device_endian end)
 }
 #endif
 
+/*
+ * Inhibit technologies that require discarding of pages in RAM blocks, e.g.,
+ * to manage the actual amount of memory consumed by the VM (then, the memory
+ * provided by RAM blocks might be bigger than the desired memory consumption).
+ * This *must* be set if:
+ * - Discarding parts of a RAM blocks does not result in the change being
+ *   reflected in the VM and the pages getting freed.
+ * - All memory in RAM blocks is pinned or duplicated, invaldiating any previous
+ *   discards blindly.
+ * - Discarding parts of a RAM blocks will result in integrity issues (e.g.,
+ *   encrypted VMs).
+ * Technologies that only temporarily pin the current working set of a
+ * driver are fine, because we don't expect such pages to be discarded
+ * (esp. based on guest action like balloon inflation).
+ *
+ * This is *not* to be used to protect from concurrent discards (esp.,
+ * postcopy).
+ *
+ * Returns 0 if successful. Returns -EBUSY if a technology that relies on
+ * discards to work reliably is active.
+ */
+int ram_block_discard_disable(bool state);
+
+/*
+ * Inhibit technologies that disable discarding of pages in RAM blocks.
+ *
+ * Returns 0 if successful. Returns -EBUSY if discards are already set to
+ * broken.
+ */
+int ram_block_discard_require(bool state);
+
+/*
+ * Test if discarding of memory in ram blocks is disabled.
+ */
+bool ram_block_discard_is_disabled(void);
+
+/*
+ * Test if discarding of memory in ram blocks is required to work reliably.
+ */
+bool ram_block_discard_is_required(void);
+
 #endif
 
 #endif
-- 
2.26.2


