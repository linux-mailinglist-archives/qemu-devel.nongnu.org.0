Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D0B2AF1F4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:22:05 +0100 (CET)
Received: from localhost ([::1]:52114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcq4a-0007Xz-IZ
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpup-0006iG-73
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpuk-00027t-Co
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=E88ljxyiC0tRDPSTxYkmVIaxfXOWW6nuI4C1ErgW4nM=;
 b=V/P/97lclJiY7TnkUU6yR8T8itMn/jDIs56OXgvp3FT9POwc+q9k78FLq/xgeCznYjNpaM
 BbN+aVE3EL87UT7ImhB1X6UH411a//4fu/Z6eX6SFqRb6Bn2U8RRZJUJYXaJlADkm1GS5v
 myDV7r6AkXkVtseoGl4wgUtlgvycOZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-Wm7tq1RcMGS-MQMGjonA2A-1; Wed, 11 Nov 2020 08:11:50 -0500
X-MC-Unique: Wm7tq1RcMGS-MQMGjonA2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7535A803629;
 Wed, 11 Nov 2020 13:11:49 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8472875139;
 Wed, 11 Nov 2020 13:11:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 01/17] virtio-net: Set mac address to hardware if the peer is
 vdpa
Date: Wed, 11 Nov 2020 21:11:25 +0800
Message-Id: <1605100301-11317-2-git-send-email-jasowang@redhat.com>
In-Reply-To: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
References: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

If the peer's type is vdpa, we need to set the mac address to hardware
in virtio_net_device_realize,

Signed-off-by: Cindy Lu <lulu@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 277289d..9179013 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3395,6 +3395,12 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     nc = qemu_get_queue(n->nic);
     nc->rxfilter_notify_enabled = 1;
 
+   if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        struct virtio_net_config netcfg = {};
+        memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
+        vhost_net_set_config(get_vhost_net(nc->peer),
+            (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
+    }
     QTAILQ_INIT(&n->rsc_chains);
     n->qdev = dev;
 
-- 
2.7.4


