Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C772D3404
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:36:56 +0100 (CET)
Received: from localhost ([::1]:41698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjjB-0002dU-NV
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmipI-0000r3-4A
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:39:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmipF-0006Lt-Af
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:39:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QowV/giP343KnzfILfGamLCO9JCQa97xX2d65deKp4E=;
 b=L60Z1xlQXCKl+4cJzafPErQeaQ+CqUVH9p33FeHBBKwjNjBZhv+xZAQByzGrsYJIXXKNVu
 6L3vy7Y83WeOlkyUpOvlwQH+NI4vfgjy9u2T0geUYhrRux84C/HDvNl8Wyg6CYG1EszZD6
 4b6dzDwpcntfVNHuXlGUP/E9WHBdD+c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-EjonCmZMNaqbwxVMAN0rWg-1; Tue, 08 Dec 2020 14:36:05 -0500
X-MC-Unique: EjonCmZMNaqbwxVMAN0rWg-1
Received: by mail-wm1-f72.google.com with SMTP id v5so1289045wmj.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QowV/giP343KnzfILfGamLCO9JCQa97xX2d65deKp4E=;
 b=KNBZlhPy2PePwvxrIpMhUzP231n72PmI/OT7v9XfzDZ2Wkqty0r6nlMATAmi9mB9Tf
 /58mXf3sgh/RXE6nvQeiI79nAVZke1aiXQkTqptR8alTDINFL2ZbYj69KiOFalMeWZu2
 zTWh4Al/6rgalI2UiGlgRdOJw4vj1Zq+YlkF4MZK5GSnbx6V9MyDC5kYYiO1YYb8hGFX
 LDHDyAIIJm5LxUV3ZK6QMJexGWrMpuca6JEMu/8o+1QbZfkoFtKM/7kBqHZSXXTdK9ig
 IETRIiFCNghxUz8/ZoVrR0q4eOeQqpaMswX2gYaR66GQBbaZt4QeHaM9MSrnaYoNX0Vl
 duUg==
X-Gm-Message-State: AOAM533IJYc+J6fFg07H5f3RUQYXh0n2ci/I3NOX42pfSOp4RCUMKUiN
 GR5dq02cWkR9EG1sZNwsNNEIrRF552GsbMirYyu1lVnPY/0udXAiqJscp6qubcDA02eXqUn+fbd
 29lZ0WtiELyZXsc8OLKv4H1Bb0EE3HMyxGtmB9uafuCBwu4lagzJ5c7DC6NmP
X-Received: by 2002:a1c:3b85:: with SMTP id i127mr5359594wma.150.1607456164138; 
 Tue, 08 Dec 2020 11:36:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHACso/5pWFAw2J68o2tVutRdH2UDxaB4Fv+zdgYgtVmsOsSjM0WakHHa1TMX9jKqM48+YDw==
X-Received: by 2002:a1c:3b85:: with SMTP id i127mr5359575wma.150.1607456163915; 
 Tue, 08 Dec 2020 11:36:03 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id b9sm5405077wmd.32.2020.12.08.11.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:36:03 -0800 (PST)
Date: Tue, 8 Dec 2020 14:36:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/66] failover: simplify failover_unplug_primary
Message-ID: <20201208193307.646726-42-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

We can calculate device just once.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-27-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b37e9cd1d9..9203d81780 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3146,34 +3146,29 @@ out:
     return !err;
 }
 
-static void virtio_net_handle_migration_primary(VirtIONet *n,
-                                                MigrationState *s)
+static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
 {
     bool should_be_hidden;
     Error *err = NULL;
+    DeviceState *dev = failover_find_primary_device(n);
+
+    if (!dev) {
+        return;
+    }
 
     should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
-    if (!n->primary_dev) {
-        n->primary_dev = failover_find_primary_device(n);
-        if (!n->primary_dev) {
-            return;
-        }
-    }
-
     if (migration_in_setup(s) && !should_be_hidden) {
-        if (failover_unplug_primary(n, n->primary_dev)) {
-            vmstate_unregister(VMSTATE_IF(n->primary_dev),
-                               qdev_get_vmsd(n->primary_dev),
-                               n->primary_dev);
-            qapi_event_send_unplug_primary(n->primary_dev->id);
+        if (failover_unplug_primary(n, dev)) {
+            vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
+            qapi_event_send_unplug_primary(dev->id);
             qatomic_set(&n->failover_primary_hidden, true);
         } else {
             warn_report("couldn't unplug primary device");
         }
     } else if (migration_has_failed(s)) {
         /* We already unplugged the device let's plug it back */
-        if (!failover_replug_primary(n, n->primary_dev, &err)) {
+        if (!failover_replug_primary(n, dev, &err)) {
             if (err) {
                 error_report_err(err);
             }
-- 
MST


