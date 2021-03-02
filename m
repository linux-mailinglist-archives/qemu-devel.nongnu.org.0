Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FC932A277
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:28:47 +0100 (CET)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH610-0000VP-C8
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH5wY-00060c-8q
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH5wW-0000W2-EI
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614695044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BZ132pm3LKEVz/5JvGWOpjOlCZruw+8zw22+Ezbthfc=;
 b=LhJiEAnYVmY3mLpHqAq0O4bVJXHQsFjaW/R2udLTIidwYI+LeU26kR3fr5VgGkNMS3kR9n
 5Ty9vSNvAAm4gz+KFGA7R7symSK0lo43DCpaa4NnqYNYWgBIYGGVlOhu+18TLZXcbBCuxJ
 TFmQVBg5K05pCIPfL/SBwKKBWFeCq+E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-lz2CaCioPSqld2VncLir-Q-1; Tue, 02 Mar 2021 09:21:17 -0500
X-MC-Unique: lz2CaCioPSqld2VncLir-Q-1
Received: by mail-ej1-f72.google.com with SMTP id di5so32986ejc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 06:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BZ132pm3LKEVz/5JvGWOpjOlCZruw+8zw22+Ezbthfc=;
 b=Quo5km4LCORxx9MzJkuvTB7iyk+DSlTBAorZx1Yp/xBf1RWH0jLsau/QEdFG82obrV
 MPXLliBmDDBIYdsoe29PkYsIfGNEIlS6FJiDGWQ/gMFLUus9/z1gb+W6GhtWmTThoIBr
 9ckyRilfRh9dBA3KopEaBy0XM4vgxdWliRVEMuF3Doi2vdDKw3oz0z8zXWBiY4iFkoSg
 EUW9CuZ9ZF8ksNo61btxU9Dgc0+KCdReOi2aOM4Rk4fOGtfE3CZhOZz6CzxI0sv0pK+a
 cSww7GoXPwP31QkOQmslp6+YBqtN0jVa33LbfVUoL7SRIjQ4jSYcnGjJdqrRgEGWgtVA
 m7og==
X-Gm-Message-State: AOAM530sdoVpu7PZ45nrKRKRuGNOo+Z1osN4bzBYvkrR35+rNucjWuHv
 UB4ka8oAaF4jgt9O0wy2Ttio4Qy/58FEyT3dwnGP4Uxcsu5nyomm6SpxwPxJagebqYDv1+0GbwV
 UpSSkyempe1nBPTFs1LrWDuziqD6lSveQtCID1gHblzFoG0flKI2XGG9KJjjF
X-Received: by 2002:a17:906:c24b:: with SMTP id
 bl11mr21439351ejb.80.1614694875730; 
 Tue, 02 Mar 2021 06:21:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCbM3qHueMEn5bHJgxPmr7u4EfQclQlPKtyadyv01TDhqNmUDpcMI6NUBAhhtFNJkXWbx7rg==
X-Received: by 2002:a17:906:c24b:: with SMTP id
 bl11mr21439321ejb.80.1614694875488; 
 Tue, 02 Mar 2021 06:21:15 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id u13sm1134759ejy.31.2021.03.02.06.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:21:15 -0800 (PST)
Date: Tue, 2 Mar 2021 09:21:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] virtio-net: handle zero mac for a vdpa peer
Message-ID: <20210302142014.141135-3-mst@redhat.com>
References: <20210302142014.141135-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210302142014.141135-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Sean Mooney <smooney@redhat.com>, Eli Cohen <elic@nvidia.com>,
 Adrian Moreno <amorenoz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

Some mlx vdpa devices with kernels at least up to 5.11 currently present
0 as their MAC address.  This is because they have not been
  pre-configured with a MAC: they have a learning bridge and only learn
the MAC once guest is up.  Kernel patches and tools to allow programming
the MAC from host are being developed. For now - since these
combinations exist in the field - let's detect zero mac and just try to
proceed with the mac from the qemu command line.

This makes the guest use this MAC to send packets in turn teaching
the MAC to the card, and things work.

TODO:
report the actual MAC from QEMU commad line in the info message.
TODO:
detect that a (non-zero) hardware MAC does not match QEMU command line
and fail init.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20210225165506.18321-2-lulu@redhat.com>

mst: rewritten code comments, message printed and the commit log.

Cc: Eli Cohen <elic@nvidia.com>
Cc: Parav Pandit <parav@nvidia.com>
Tested-by: Adrian Moreno <amorenoz@redhat.com>
Tested-by: Sean Mooney <smooney@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 439f823b19..96a3cc8357 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -126,6 +126,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
     VirtIONet *n = VIRTIO_NET(vdev);
     struct virtio_net_config netcfg;
     NetClientState *nc = qemu_get_queue(n->nic);
+    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
 
     int ret = 0;
     memset(&netcfg, 0 , sizeof(struct virtio_net_config));
@@ -151,6 +152,17 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
         ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
                                    n->config_size);
         if (ret != -1) {
+            /*
+             * Some NIC/kernel combinations present 0 as the mac address.  As
+             * that is not a legal address, try to proceed with the
+             * address from the QEMU command line in the hope that the
+             * address has been configured correctly elsewhere - just not
+             * reported by the device.
+             */
+            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) == 0) {
+                info_report("Zero hardware mac address detected. Ignoring.");
+                memcpy(netcfg.mac, n->mac, ETH_ALEN);
+            }
             memcpy(config, &netcfg, n->config_size);
         }
     }
-- 
MST


