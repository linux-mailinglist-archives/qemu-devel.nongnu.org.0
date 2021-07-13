Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC83C792F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:44:56 +0200 (CEST)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QD1-0000YS-6Y
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3Pya-0005Fi-7r
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:30:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3PyY-0005uX-3M
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azpdq8G6mvVbNaUh4TlYuUNI0KCyMorWVg2RYDAB4xE=;
 b=D6LfmJ/wgQFliGwxCZZdnlhe1d3ZgmFxT4aSmITEX4XDq5g9Fznzbn5EckYijp+ijxk1/b
 5v5qtqUZh6NuN/A+SpxesXXcr9g7xphslvcGztpBUfH3fHbF+Czg3s5P63OcZ1qXJ9JsXW
 aHUko6yqwVMe1mNqzTj9ZDCdPUSOJvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-ScssKVk_NA6ijMq9TGC0TA-1; Tue, 13 Jul 2021 17:29:55 -0400
X-MC-Unique: ScssKVk_NA6ijMq9TGC0TA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3774D80006E;
 Tue, 13 Jul 2021 21:29:54 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-112-106.phx2.redhat.com [10.3.112.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1B8C10016F7;
 Tue, 13 Jul 2021 21:29:40 +0000 (UTC)
Subject: [PULL 1/3] vfio: Fix CID 1458134 in
 vfio_register_ram_discard_listener()
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Jul 2021 15:29:40 -0600
Message-ID: <162621178053.487037.17045908415646631264.stgit@omen>
In-Reply-To: <162621155674.487037.8788212042441164398.stgit@omen>
References: <162621155674.487037.8788212042441164398.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Auger Eric <eric.auger@redhat.com>,
 alex.williamson@redhat.com, teawater <teawaterz@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Link: https://lore.kernel.org/r/20210712083135.15755-1-david@redhat.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3f0d11136081..8728d4d5c2e2 100644
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



