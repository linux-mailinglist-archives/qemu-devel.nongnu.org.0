Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9FE5AC839
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 02:03:48 +0200 (CEST)
Received: from localhost ([::1]:51536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzac-0004mr-Ul
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 20:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oUzXT-0002sE-3W
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 20:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oUzXP-0000Ay-EI
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 20:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662336025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4QazN0vxrS2oU9++UsLNRKoSx+HSHvwBoVnF9Xuf4aI=;
 b=OFrLdUydkrxzp/NRXvfFd23G0iQqE3fAg3DMcX311hOeMAtKc1x2Fp8JZRZQHu2Cjo8jsm
 vLt2w5u2T9xz96m9ZtB22LZgyw9TthOnpdcemi0gFhkBRa2wm722wfUaZlNYakgOmGOFvH
 d28VjRsqD3Q9GFjoo258W4yh3E6v9zE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-SRX-RCueP1yO8njelE91Lg-1; Sun, 04 Sep 2022 20:00:24 -0400
X-MC-Unique: SRX-RCueP1yO8njelE91Lg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3017029AA2EF;
 Mon,  5 Sep 2022 00:00:24 +0000 (UTC)
Received: from DESKTOP-E7ACR7D.lan (unknown [10.39.192.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA23540CF8E7;
 Mon,  5 Sep 2022 00:00:22 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>, Alberto Faria <afaria@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2] softmmu/physmem: Fix address of FlatView access in
 address_space_(read|write)_cached_slow()
Date: Mon,  5 Sep 2022 01:00:21 +0100
Message-Id: <20220905000021.157613-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

flatview_(read|write)_continue() must be called with an address in the
FlatView's address space, but `addr` is relative to the
MemoryRegionCache.

Convert `addr` from the MemoryRegionCache's address space to the
FlatView's before passing it to flatview_(read|write)_continue().

This problem was uncovered while attempting to perform unaligned writes,
which caused flatview_write_continue() to reach the call to
flatview_translate(), which then translated the erroneous address and
caused the subsequent write to fail.

Fixes: 48564041a7 ("exec: reintroduce MemoryRegion caching")
Co-Developed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 softmmu/physmem.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 50231bab30..bdde4eb927 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3420,6 +3420,14 @@ static inline MemoryRegion *address_space_translate_cached(
     return section.mr;
 }
 
+/* Converts `addr` from the address space of `cache` to that of `cache->fv`. */
+static inline hwaddr addr_in_cache_to_in_flat_view(MemoryRegionCache *cache,
+                                                   hwaddr addr)
+{
+    hwaddr addr_in_mrs = addr + cache->xlat - cache->mrs.offset_within_region;
+    return addr_in_mrs + cache->mrs.offset_within_address_space;
+}
+
 /* Called from RCU critical section. address_space_read_cached uses this
  * out of line function when the target is an MMIO or IOMMU region.
  */
@@ -3434,8 +3442,9 @@ address_space_read_cached_slow(MemoryRegionCache *cache, hwaddr addr,
     mr = address_space_translate_cached(cache, addr, &addr1, &l, false,
                                         MEMTXATTRS_UNSPECIFIED);
     return flatview_read_continue(cache->fv,
-                                  addr, MEMTXATTRS_UNSPECIFIED, buf, len,
-                                  addr1, l, mr);
+                                  addr_in_cache_to_in_flat_view(cache, addr),
+                                  MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
+                                  mr);
 }
 
 /* Called from RCU critical section. address_space_write_cached uses this
@@ -3452,8 +3461,9 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
     mr = address_space_translate_cached(cache, addr, &addr1, &l, true,
                                         MEMTXATTRS_UNSPECIFIED);
     return flatview_write_continue(cache->fv,
-                                   addr, MEMTXATTRS_UNSPECIFIED, buf, len,
-                                   addr1, l, mr);
+                                   addr_in_cache_to_in_flat_view(cache, addr),
+                                   MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
+                                   mr);
 }
 
 #define ARG1_DECL                MemoryRegionCache *cache
-- 
2.37.2


