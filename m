Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF4B3C4610
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 10:34:26 +0200 (CEST)
Received: from localhost ([::1]:53472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2rOS-0004zr-EH
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 04:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m2rME-00045l-DX
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m2rMB-0001On-Md
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626078720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F7sR3kTKHcoi8mjj/QxPy4/HQ4Z5Z2DR72sBhQ1jMEE=;
 b=GSif4vgwdndVAYRqb1IJynKn56nNAYsejeI4MCwLBxZXmndqgs+5GV4MBefSG2ompf719t
 NIdCWjgVeSqS7aRvrvvOeotgvIHInc6FFhbUsVCSsDPfpWzuFRpEqyd1sN/1jBhLLzVAiU
 o8KKV4Vz1yhO8MYD8BP0MichJwUAh+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-xJhs7NA3MEG2xk0M7oDF0Q-1; Mon, 12 Jul 2021 04:31:58 -0400
X-MC-Unique: xJhs7NA3MEG2xk0M7oDF0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B871F1023F48;
 Mon, 12 Jul 2021 08:31:57 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-111.rdu2.redhat.com [10.10.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E352D60BD8;
 Mon, 12 Jul 2021 08:31:36 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] vfio: Fix CID 1458134 in
 vfio_register_ram_discard_listener()
Date: Mon, 12 Jul 2021 10:31:35 +0200
Message-Id: <20210712083135.15755-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  CID 1458134:  Integer handling issues  (BAD_SHIFT)
    In expression "1 << ctz64(container->pgsizes)", left shifting by more
    than 31 bits has undefined behavior.  The shift amount,
    "ctz64(container->pgsizes)", is 64.

Commit 5e3b981c330c ("vfio: Support for RamDiscardManager in the !vIOMMU
case") added an assertion that our granularity is at least as big as the
page size.

Although unlikely, we could have a page size that does not fit into
32 bit. In that case, we'd try shifting by more than 31 bit.

Let's use 1ULL instead and make sure we're not shifting by more than 63
bit by asserting that any bit in container->pgsizes is set.

Fixes: CID 1458134
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/vfio/common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3f0d111360..8728d4d5c2 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -783,7 +783,8 @@ static void vfio_register_ram_discard_listener(VFIOContainer *container,
                                                                 section->mr);
 
     g_assert(vrdl->granularity && is_power_of_2(vrdl->granularity));
-    g_assert(vrdl->granularity >= 1 << ctz64(container->pgsizes));
+    g_assert(container->pgsizes &&
+             vrdl->granularity >= 1ULL << ctz64(container->pgsizes));
 
     ram_discard_listener_init(&vrdl->listener,
                               vfio_ram_discard_notify_populate,
-- 
2.31.1


