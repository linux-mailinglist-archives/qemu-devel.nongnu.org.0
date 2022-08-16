Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEC35957D9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 12:16:49 +0200 (CEST)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNtct-0002eL-Tf
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 06:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNtZF-0005Zl-3L
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 06:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNtZD-0004Jz-Dr
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 06:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660644778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxOtHMeWpRKVHAmqRlfILA8ZLjrIx8Hld0hXMLuWU4c=;
 b=EuPmR7FILzQLBuM2i77+bF9GFYllwFocrFyN7b4vWKXdRI/MwyyqB1YTFAVhZ3UjleUr9B
 EewXTjNEN6LawO/U6n/2rsaQiViiKH4xFY7sw0444jKIhslYoFQh9Uayo/u7uvOU0242xK
 Ii5Cm9PedKDKOMnkAxX1Hq2+RtOoUn8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-a2SB4FsjMU2i5tzHHrcd0g-1; Tue, 16 Aug 2022 06:12:56 -0400
X-MC-Unique: a2SB4FsjMU2i5tzHHrcd0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6387638164C7;
 Tue, 16 Aug 2022 10:12:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EEE540D2827;
 Tue, 16 Aug 2022 10:12:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH 1/2] softmmu/memory: add missing begin/commit callback
 calls
Date: Tue, 16 Aug 2022 06:12:49 -0400
Message-Id: <20220816101250.1715523-2-eesposit@redhat.com>
In-Reply-To: <20220816101250.1715523-1-eesposit@redhat.com>
References: <20220816101250.1715523-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

kvm listeners now need ->commit callback in order to actually send
the ioctl to the hypervisor. Therefore, add missing callers around
address_space_set_flatview(), which in turn calls
address_space_update_topology_pass() which calls ->region_* and
->log_* callbacks.

Using MEMORY_LISTENER_CALL_GLOBAL is a little bit an overkill,
but it is harmless, considering that other listeners that are not
invoked in address_space_update_topology_pass() won't do anything,
since they won't have anything to commit.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 softmmu/memory.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7ba2048836..1afd3f9703 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1076,7 +1076,9 @@ static void address_space_update_topology(AddressSpace *as)
     if (!g_hash_table_lookup(flat_views, physmr)) {
         generate_memory_topology(physmr);
     }
+    MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
     address_space_set_flatview(as);
+    MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
 }
 
 void memory_region_transaction_begin(void)
-- 
2.31.1


