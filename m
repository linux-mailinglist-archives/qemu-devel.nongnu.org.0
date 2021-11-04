Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFAF4450C0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 09:59:29 +0100 (CET)
Received: from localhost ([::1]:51578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miYan-0004dx-1F
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 04:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miYY3-0007kk-JE
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miYY0-0000mM-M3
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636016195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faceouvYMIlePb3IaWeZgS3xQXI2g1spCxHWzpgxocI=;
 b=iGa4bMzlz7TnxscafI6onJ/syA211G3HV3JI3K/Ee3R4N1tpzsCit2z64FCmdATO2gLyUy
 a3EC4X/WSjA6QsPdEbn7YqAM5qfsLIMa+/cAl8+zIChMwwiHEr75ilu9MvL8Lzl3JfYt05
 H3K6J8ZFJ+7kX/qSyqMli0UPuHSP92s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-8SGv3w6rPHCWsNu06sTZmQ-1; Thu, 04 Nov 2021 04:56:34 -0400
X-MC-Unique: 8SGv3w6rPHCWsNu06sTZmQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7364280DE02
 for <qemu-devel@nongnu.org>; Thu,  4 Nov 2021 08:56:33 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 385F1100239F;
 Thu,  4 Nov 2021 08:56:32 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] vhost: Fix last vq queue index of devices with no cvq
Date: Thu,  4 Nov 2021 09:56:25 +0100
Message-Id: <20211104085625.2054959-3-eperezma@redhat.com>
In-Reply-To: <20211104085625.2054959-1-eperezma@redhat.com>
References: <20211104085625.2054959-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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

The -1 assumes that cvq device model is accounted in data_queue_pairs,
if cvq does not exists, but it's actually the opposite: Devices with
!cvq are ok but devices with cvq does not add the last queue to
data_queue_pairs.

This is not a problem to vhost-net, but it is to vhost-vdpa:
* Devices with cvq gets initialized at last data vq device model, not
at cvq one.
* Devices with !cvq never gets initialized, since last_index is the
first queue of the last device model.

Because of that, the right change in last_index is to actually add the
cvq, not to remove the missing one.

This is not a problem to vhost-net, but it is to vhost-vdpa, which
device model trust to reach the last index to finish starting the
device.

Also, as the previous commit, rename it to index_end.

Tested with vp_vdpa with host's vhost=on and vhost=off, with ctrl_vq=on
and ctrl_vq=off.

Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the virtio device")
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/vhost_net.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 29f2c4212f..30379d2ca4 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -326,11 +326,11 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     VirtIONet *n = VIRTIO_NET(dev);
     int nvhosts = data_queue_pairs + cvq;
     struct vhost_net *net;
-    int r, e, i, last_index = data_queue_pairs * 2;
+    int r, e, i, index_end = data_queue_pairs * 2;
     NetClientState *peer;
 
-    if (!cvq) {
-        last_index -= 1;
+    if (cvq) {
+        index_end += 1;
     }
 
     if (!k->set_guest_notifiers) {
@@ -347,7 +347,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         }
 
         net = get_vhost_net(peer);
-        vhost_net_set_vq_index(net, i * 2, last_index);
+        vhost_net_set_vq_index(net, i * 2, index_end);
 
         /* Suppress the masking guest notifiers on vhost user
          * because vhost user doesn't interrupt masking/unmasking
-- 
2.27.0


