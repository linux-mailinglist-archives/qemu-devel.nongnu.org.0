Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE48336BDD5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:44:48 +0200 (CEST)
Received: from localhost ([::1]:45820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEeV-00023j-Qu
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbEak-0006FQ-LH
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:40:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbEaY-0006Dd-50
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619494840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=luy9qUFF6YH9l21S5OyaAv3pWwDIj473IAZxR5/5crs=;
 b=UvXpJlTGmRPgxC0kr/pl5/YiQmbtXZooAqQP9OZI3+DycvCvSI83lKMDT5HSP4ZUrlWxiW
 Bks4i9JSkRUVjXO4ktfPtbEotn3OwiWx3Jq0zgnvupnML84xIDYC2yrf+lkbRi1IXmbwN7
 jNb2fuW7AMMREX8MVGx9ghAEK3mVg20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-4IkmYt-LPkymXnFQGhqW4Q-1; Mon, 26 Apr 2021 23:40:39 -0400
X-MC-Unique: 4IkmYt-LPkymXnFQGhqW4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A13D343A9
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 03:40:38 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-211.pek2.redhat.com [10.72.13.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80CBE5D9C0;
 Tue, 27 Apr 2021 03:40:33 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v6 9/9] virtio-net: add peer_deleted check in
 virtio_net_handle_rx
Date: Tue, 27 Apr 2021 11:39:51 +0800
Message-Id: <20210427033951.29805-10-lulu@redhat.com>
In-Reply-To: <20210427033951.29805-1-lulu@redhat.com>
References: <20210427033951.29805-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During the test, We found this fuction will continue running
while the peer is deleted, this will case the crash. so add
check for this.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/net/virtio-net.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 43b912453a..1be3f8e76f 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1403,7 +1403,9 @@ static void virtio_net_handle_rx(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
     int queue_index = vq2q(virtio_get_queue_index(vq));
-
+    if (n->nic->peer_deleted) {
+        return;
+    }
     qemu_flush_queued_packets(qemu_get_subqueue(n->nic, queue_index));
 }
 
-- 
2.21.3


