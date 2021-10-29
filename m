Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375FE43FE50
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 16:19:15 +0200 (CEST)
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgSiv-0000tS-QR
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 10:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgSg8-0007uX-V6
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgSg5-0001P5-Uk
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635516976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DYfTRWXkURGy/5j4zB03lSM+M2H3qfnYclQpIff4Atk=;
 b=B8F2vMYz4NUEPCc2oiwWZ8bHulwrtxk63HAML/N7YNapR3OloIQwV+3pbTxmPaOZDNhKJB
 BhUvMJDlDKPTrP04dv6cRjhGtCIrqKHDTizRnCLOSp8SiK/EugdZnE8HCzZAGExzuoFwuU
 rQdbANsBzY8djDuH2ngBCkZfYEeR6L8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-yBU3EQbAPpuc3kIhXIyumA-1; Fri, 29 Oct 2021 10:16:14 -0400
X-MC-Unique: yBU3EQbAPpuc3kIhXIyumA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C113910144EA
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 14:16:13 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C32AD60BD8;
 Fri, 29 Oct 2021 14:16:12 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost: Fix last queue index of devices with no cvq
Date: Fri, 29 Oct 2021 16:16:08 +0200
Message-Id: <20211029141608.1728855-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -1 assumes that all devices with no cvq have an spare vq allocated
for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be the
case, and the device may have a pair number of queues.

To fix this, just resort to the lower even number of queues.

Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the virtio device")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/vhost_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 0d888f29a6..edf56a597f 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     NetClientState *peer;
 
     if (!cvq) {
-        last_index -= 1;
+        last_index &= ~1ULL;
     }
 
     if (!k->set_guest_notifiers) {
-- 
2.27.0


