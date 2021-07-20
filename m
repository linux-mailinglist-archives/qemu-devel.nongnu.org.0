Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8979C3CFA27
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:10:10 +0200 (CEST)
Received: from localhost ([::1]:56912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pVh-0007XA-JJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m5pPf-0005sC-RI
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:03:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m5pPe-0001JZ-54
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626786233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdQD+N4Y9uU7e/4s21vkkY2fZYuVqYGiTZftNf9f1hA=;
 b=RwLNaQxy/R8Tcd8VwmVTVPtWhjsmdzeyOegTO4AH1nDR+ZuBUmg06EhvYZ96/ajCzCGDbE
 PtHzNVN1Y0L8kjuZJw8UTmq4rrY6ksUVKEuWhAB7h2oJW5EV6Slzmd/fMecxO3KojrTglk
 1LkCQ8XZfjszSnsMM8KLKkhkdZsEw0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-GcnuzYpgNjCK-JyLkByCjw-1; Tue, 20 Jul 2021 09:03:52 -0400
X-MC-Unique: GcnuzYpgNjCK-JyLkByCjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EF08CC621;
 Tue, 20 Jul 2021 13:03:51 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8B4218AAB;
 Tue, 20 Jul 2021 13:03:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH resend v2 2/5] softmmu/memory_mapping: reuse
 qemu_get_guest_simple_memory_mapping()
Date: Tue, 20 Jul 2021 15:03:01 +0200
Message-Id: <20210720130304.26323-3-david@redhat.com>
In-Reply-To: <20210720130304.26323-1-david@redhat.com>
References: <20210720130304.26323-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's reuse qemu_get_guest_simple_memory_mapping(), which does exactly
what we want.

Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/memory_mapping.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index e7af276546..d63f896b30 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -288,8 +288,6 @@ void qemu_get_guest_memory_mapping(MemoryMappingList *list,
                                    Error **errp)
 {
     CPUState *cpu, *first_paging_enabled_cpu;
-    GuestPhysBlock *block;
-    ram_addr_t offset, length;
 
     first_paging_enabled_cpu = find_paging_enabled_cpu(first_cpu);
     if (first_paging_enabled_cpu) {
@@ -309,11 +307,7 @@ void qemu_get_guest_memory_mapping(MemoryMappingList *list,
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
2.31.1


