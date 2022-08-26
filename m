Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BFC5A2C35
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:22:38 +0200 (CEST)
Received: from localhost ([::1]:56506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRc6O-0002jx-0z
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oRbtq-0006F1-7Q
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 12:09:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oRbtn-0006K2-4H
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 12:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661530172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LQ6XpvHQNUKBfbm9nqsdH5xFWwXs/utW2YgFeagOHxo=;
 b=K7/bsXzhJi0fn/juvEvRUKOGOXIZ8/INZ0O9lJj9RJVXXNGsJRTgS02gl6lEW/DKDD0dxs
 +k8qsswoSyNrcP1S1A5hJLrcLmToePYRPn22lc6aUDom0NhEHAeVCqdvUDvBmBgAf9+UJy
 S92KYgGQsfs9wu5rCQtWPOIhCSnnrsM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-k4HFnt0RMPKFBO6xOe-yvQ-1; Fri, 26 Aug 2022 12:09:31 -0400
X-MC-Unique: k4HFnt0RMPKFBO6xOe-yvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCCF7101AA52;
 Fri, 26 Aug 2022 16:09:30 +0000 (UTC)
Received: from DESKTOP-E7ACR7D.lan (unknown [10.39.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69E2440CF916;
 Fri, 26 Aug 2022 16:09:29 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alberto Faria <afaria@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] softmmu/physmem: Fix address of FlatView access in
 address_space_(read|write)_cached_slow()
Date: Fri, 26 Aug 2022 17:09:27 +0100
Message-Id: <20220826160927.322797-1-afaria@redhat.com>
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

Apply cache->xlat to addr before passing it to
flatview_(read|write)_continue(), to convert it from the
MemoryRegionCache's address space to the FlatView's.

Fixes: 48564041a7 ("exec: reintroduce MemoryRegion caching")
Co-Developed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 softmmu/physmem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index dc3c3e5f2e..95d4c77cc3 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3450,9 +3450,9 @@ address_space_read_cached_slow(MemoryRegionCache *cache, hwaddr addr,
     l = len;
     mr = address_space_translate_cached(cache, addr, &addr1, &l, false,
                                         MEMTXATTRS_UNSPECIFIED);
-    return flatview_read_continue(cache->fv,
-                                  addr, MEMTXATTRS_UNSPECIFIED, buf, len,
-                                  addr1, l, mr);
+    return flatview_read_continue(cache->fv, cache->xlat + addr,
+                                  MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
+                                  mr);
 }
 
 /* Called from RCU critical section. address_space_write_cached uses this
@@ -3468,9 +3468,9 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
     l = len;
     mr = address_space_translate_cached(cache, addr, &addr1, &l, true,
                                         MEMTXATTRS_UNSPECIFIED);
-    return flatview_write_continue(cache->fv,
-                                   addr, MEMTXATTRS_UNSPECIFIED, buf, len,
-                                   addr1, l, mr);
+    return flatview_write_continue(cache->fv, cache->xlat + addr,
+                                   MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
+                                   mr);
 }
 
 #define ARG1_DECL                MemoryRegionCache *cache
-- 
2.37.2


