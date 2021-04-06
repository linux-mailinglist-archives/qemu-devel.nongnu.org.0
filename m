Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595F354E3B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:04:10 +0200 (CEST)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTggz-0001B2-IT
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lTgeg-0007vF-VT
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:01:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lTgeb-0004Av-JH
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617696100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1jRk6tqWNEEHu3VxbiQjNIhIzFlToJDr5G35vGaq2U=;
 b=Z2cIqClqxavOjBNd1xNEQATW8vHJ8N70XBFE5Lzaf6x83LVq9hVh2dmnkyqsj1aoEURr+Z
 QGOaAXrjMQk1xoY+GjuImaM9g5wwzYCd40m5Qi22gDacRLSI+z+cEtv+poVu2QWJUMGp21
 OANpwU8yuurHsOs6vBIOQLzdA2r14Qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-Q7jaYlyrOg-CF77aUeOdvA-1; Tue, 06 Apr 2021 04:01:39 -0400
X-MC-Unique: Q7jaYlyrOg-CF77aUeOdvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76D46800D53;
 Tue,  6 Apr 2021 08:01:38 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-79.ams2.redhat.com [10.36.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61E8D100239A;
 Tue,  6 Apr 2021 08:01:36 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v1 1/3] softmmu/physmem: Mark shared anonymous memory
 RAM_SHARED
Date: Tue,  6 Apr 2021 10:01:24 +0200
Message-Id: <20210406080126.24010-2-david@redhat.com>
In-Reply-To: <20210406080126.24010-1-david@redhat.com>
References: <20210406080126.24010-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: David Hildenbrand <david@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's drop the "shared" parameter from ram_block_add() and properly
store it in the flags of the ram block instead, such that
qemu_ram_is_shared() properly succeeds on all ram blocks that were mapped
MAP_SHARED.

We'll use this information next to fix some cases with shared anonymous
memory.

Reviewed-by: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/physmem.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 85034d9c11..76bb8e324e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1927,8 +1927,9 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
     }
 }
 
-static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
+static void ram_block_add(RAMBlock *new_block, Error **errp)
 {
+    const bool shared = qemu_ram_is_shared(new_block);
     RAMBlock *block;
     RAMBlock *last_block = NULL;
     ram_addr_t old_ram_size, new_ram_size;
@@ -2064,7 +2065,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
         return NULL;
     }
 
-    ram_block_add(new_block, &local_err, ram_flags & RAM_SHARED);
+    ram_block_add(new_block, &local_err);
     if (local_err) {
         g_free(new_block);
         error_propagate(errp, local_err);
@@ -2127,10 +2128,13 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
     if (host) {
         new_block->flags |= RAM_PREALLOC;
     }
+    if (share) {
+        new_block->flags |= RAM_SHARED;
+    }
     if (resizeable) {
         new_block->flags |= RAM_RESIZEABLE;
     }
-    ram_block_add(new_block, &local_err, share);
+    ram_block_add(new_block, &local_err);
     if (local_err) {
         g_free(new_block);
         error_propagate(errp, local_err);
-- 
2.30.2


