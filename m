Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDB9316C68
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:19:13 +0100 (CET)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9t8y-0004yo-SG
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9t67-0003Ir-BE
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:16:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9t64-0001aq-Ho
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612977371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aj7TDM+GffPL0On5vU7UxKhInV5rzYZa5xE0HJ/LCoM=;
 b=HgtuDgiqGvQcnazmU4so6QAJJh4Y2OvB63CC9cLqxyM87PCFVlXkFtmCCZUeYC79xo4CCK
 pRCxw94rnDEatR/enL9hl2aO9/CKoXrIzbJ0OohZf7KFJvmrkSzdXbT/vwhX+WwHiU0v3M
 kaGfiCwuv21FswqLjT4NFtSj3M4JzCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-Pr8d8VgJNx6j45_K7tqbyw-1; Wed, 10 Feb 2021 12:16:08 -0500
X-MC-Unique: Pr8d8VgJNx6j45_K7tqbyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25BC5193578B;
 Wed, 10 Feb 2021 17:16:07 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-218.ams2.redhat.com [10.36.113.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A17B76F43F;
 Wed, 10 Feb 2021 17:15:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/5] softmmu/memory_mapping: reuse
 qemu_get_guest_simple_memory_mapping()
Date: Wed, 10 Feb 2021 18:15:34 +0100
Message-Id: <20210210171537.32932-3-david@redhat.com>
In-Reply-To: <20210210171537.32932-1-david@redhat.com>
References: <20210210171537.32932-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's reuse qemu_get_guest_simple_memory_mapping(), which does exactly
what we want.

Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/memory_mapping.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index 18d0b8067c..2677392de7 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -289,8 +289,6 @@ void qemu_get_guest_memory_mapping(MemoryMappingList *list,
                                    Error **errp)
 {
     CPUState *cpu, *first_paging_enabled_cpu;
-    GuestPhysBlock *block;
-    ram_addr_t offset, length;
 
     first_paging_enabled_cpu = find_paging_enabled_cpu(first_cpu);
     if (first_paging_enabled_cpu) {
@@ -310,11 +308,7 @@ void qemu_get_guest_memory_mapping(MemoryMappingList *list,
      * If the guest doesn't use paging, the virtual address is equal to physical
      * address.
      */
-    QTAILQ_FOREACH(block, &guest_phys_blocks->head, next) {
-        offset = block->target_start;
-        length = block->target_end - block->target_start;
-        create_new_memory_mapping(list, offset, offset, length);
-    }
+    qemu_get_guest_simple_memory_mapping(list, guest_phys_blocks);
 }
 
 void qemu_get_guest_simple_memory_mapping(MemoryMappingList *list,
-- 
2.29.2


