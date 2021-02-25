Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4935F325421
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 17:57:34 +0100 (CET)
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFJxF-0001Bz-Au
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 11:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lFJvA-0008Mf-J2
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:55:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lFJv8-0004L5-MH
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614272122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ts8/6AW1C0fMfD6EEERr/r95bnaSqwoK6ohlyXWos6Y=;
 b=inMS1GkFeks0WocffZpABadu6mJ006BpwJeV7dWi8qYPTazS+cacPgHVv5oPgHYm2OKoog
 XMqGNaQic+D5k6hvyrO5v5vF8rn2sOeYupKwP/eEMI2HyX8eHTKHFAOv3MczC0ZcNgl8Xp
 b48i/fiM7MG+9ZokK98VWbqPuSh80mU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-gjP552y3PcWPg8UeaBMWew-1; Thu, 25 Feb 2021 11:55:19 -0500
X-MC-Unique: gjP552y3PcWPg8UeaBMWew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8955318C35C1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 16:55:18 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-46.pek2.redhat.com [10.72.12.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B7A260861;
 Thu, 25 Feb 2021 16:55:16 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v5 1/1] virtio-net: Add check for mac address while peer is
 vdpa
Date: Fri, 26 Feb 2021 00:55:06 +0800
Message-Id: <20210225165506.18321-2-lulu@redhat.com>
In-Reply-To: <20210225165506.18321-1-lulu@redhat.com>
References: <20210225165506.18321-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eperezma@redhat.com, amorenoz@redhat.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While peer is vdpa, sometime qemu get an all zero mac address from the hardware,
This is not a legal value. Add the check for this.if we get an zero mac address.
qemu will use the default mac address or the mac address from qemu cmdline

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/net/virtio-net.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9179013ac4..8f36ca5066 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -126,6 +126,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
     VirtIONet *n = VIRTIO_NET(vdev);
     struct virtio_net_config netcfg;
     NetClientState *nc = qemu_get_queue(n->nic);
+    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
 
     int ret = 0;
     memset(&netcfg, 0 , sizeof(struct virtio_net_config));
@@ -151,6 +152,15 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
         ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
                                    n->config_size);
         if (ret != -1) {
+            /*
+             * Here is a work around, the 0 mac address is not a legal value.
+             * if we got this from hardware, qemu will use the mac address
+             * saved in VirtIONet->mac.
+             */
+            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) == 0) {
+                info_report("Get an all zero mac address from hardware");
+                memcpy(netcfg.mac, n->mac, ETH_ALEN);
+            }
             memcpy(config, &netcfg, n->config_size);
         }
     }
-- 
2.21.3


