Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DED442E3E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:34:16 +0100 (CET)
Received: from localhost ([::1]:58370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhszX-0002Mv-4d
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhsAG-0007wx-LR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhsAF-0007Ke-8O
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635853274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mS3qp0P8WJtd+7vJuwmKxiOlbDcQBeCOgQBO14UPRos=;
 b=RDXUzU5blrQn+ZoeDbomAos6zKKtEMA8mk/7jQS3euaoyJ+l1M83zxF58CgtnMukcwVFU/
 fK3fgPY9GTQvxJBL4ZfOa+D2/ItGWZBXp+btnN67whyej3Szy7bzrlnIQF4JjpSiJCsI+x
 ehqNH7OF1d7w0d+zfEauUmk4+Q15aGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-7VzOG_8XOOG6bgJdFmJAhg-1; Tue, 02 Nov 2021 07:41:13 -0400
X-MC-Unique: 7VzOG_8XOOG6bgJdFmJAhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A31998066EB
 for <qemu-devel@nongnu.org>; Tue,  2 Nov 2021 11:41:12 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80478641AA;
 Tue,  2 Nov 2021 11:41:11 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] vhost: Fix last queue index of devices with no cvq
Date: Tue,  2 Nov 2021 12:40:59 +0100
Message-Id: <20211102114059.1917341-2-eperezma@redhat.com>
In-Reply-To: <20211102114059.1917341-1-eperezma@redhat.com>
References: <20211102114059.1917341-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -1 assumes that all devices with no cvq have an spare vq allocated
for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This is an invalid
device by the standard, so just stick to the right number of device
models.

This is not a problem to vhost-net, but it is to vhost-vdpa, which
device model trust to reach the last index to finish starting the
device.

Tested with vp_vdpa with host's vhost=on and vhost=off.

Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the virtio device")
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/vhost_net.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 0d888f29a6..a859cc943d 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -329,10 +329,6 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     int r, e, i, last_index = data_queue_pairs * 2;
     NetClientState *peer;
 
-    if (!cvq) {
-        last_index -= 1;
-    }
-
     if (!k->set_guest_notifiers) {
         error_report("binding does not support guest notifiers");
         return -ENOSYS;
-- 
2.27.0


