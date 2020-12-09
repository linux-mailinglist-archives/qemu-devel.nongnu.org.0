Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120562D4956
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:47:06 +0100 (CET)
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4UT-0001lj-1a
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uT-0003bb-Hq
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uR-0008Tp-8y
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Ad7MPrUrEPsjPnzQmDTkeEewqARoHTT0yNjTvWPD84=;
 b=jR2loYjRBfDuKs2Efs00A4iG8zdjzUAr1V9P9Lj3UQRqsGZhEfJn9FBPKbOQMGJ60bA/ZO
 /5JM8r3aMkOqQe/plaTwV87zqJfy8vCyAsqZr8x9U8AhH6NwiYoNFF1bFLy4Ujp6p7gCS2
 1B/qjfPQlpaRcoS0Ao/f+VAqv44/Nw0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-YPHSh4kKM227rEEw2Mb3_A-1; Wed, 09 Dec 2020 13:09:46 -0500
X-MC-Unique: YPHSh4kKM227rEEw2Mb3_A-1
Received: by mail-wm1-f72.google.com with SMTP id u123so639847wmu.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5Ad7MPrUrEPsjPnzQmDTkeEewqARoHTT0yNjTvWPD84=;
 b=D7p82/e6by+uBgq7T8pfevX18wdQYdI5jd1K7CF4JOVLjACU/lmqVg3i7/sQ0hFKMK
 JpsWuwGx4Ys5NIdSLkCwKUWNKvn3vANHCAptV3/PcLDNvZRgLU+ahmhBHsIHvERqR3KR
 uC/7zr0tUM/kNpn+02au06+HhbP1kd2w1D1JIXPYy0fv9nQGqHvUKDibvP0z2KS5akZD
 5wgnl93QnoQUaeK0QmjN5HCMblxO4Fu3ycdLDilVddaGoMLUmRCKArbyk7N9kOmeA3EA
 SH5rITd8Tz5ZKl1OU3zeV66d0qbZ+3El4pEElTUGNavhXf8rkd7NX6KuxBgQjElTBHKp
 Buig==
X-Gm-Message-State: AOAM530qBhRymUxXbS8bBBHIgGnKARIIKNTCrDZeZA9gZX2SpStHAa8x
 XXtPZyI/KBC08zaSSgPijG5puPdccS6PuF139EzRS59AwtJRF2EPPslok/Sh0HpdntrUog9DQLm
 PJOS+FX+g1nw5+t7HvfH1i2N6YNkKGNcU0qZiU5x4dadxPStgLBSeky1bOayL
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr4008142wmg.145.1607537384836; 
 Wed, 09 Dec 2020 10:09:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHf+zyxOOfahZVlQKVuuGewMMZIp/NpA5/JgO36yT7oQQx7dvNkdhvlAbzjtXinMOV+qoSdQ==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr4008122wmg.145.1607537384677; 
 Wed, 09 Dec 2020 10:09:44 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id w17sm4716327wmk.12.2020.12.09.10.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:44 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 40/65] failover: Caller of this two functions already have
 primary_dev
Message-ID: <20201209180546.721296-41-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Pass it as an argument.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-26-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 746ed3fb71..b37e9cd1d9 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3093,17 +3093,17 @@ void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
     n->netclient_type = g_strdup(type);
 }
 
-static bool failover_unplug_primary(VirtIONet *n)
+static bool failover_unplug_primary(VirtIONet *n, DeviceState *dev)
 {
     HotplugHandler *hotplug_ctrl;
     PCIDevice *pci_dev;
     Error *err = NULL;
 
-    hotplug_ctrl = qdev_get_hotplug_handler(n->primary_dev);
+    hotplug_ctrl = qdev_get_hotplug_handler(dev);
     if (hotplug_ctrl) {
-        pci_dev = PCI_DEVICE(n->primary_dev);
+        pci_dev = PCI_DEVICE(dev);
         pci_dev->partially_hotplugged = true;
-        hotplug_handler_unplug_request(hotplug_ctrl, n->primary_dev, &err);
+        hotplug_handler_unplug_request(hotplug_ctrl, dev, &err);
         if (err) {
             error_report_err(err);
             return false;
@@ -3114,30 +3114,31 @@ static bool failover_unplug_primary(VirtIONet *n)
     return true;
 }
 
-static bool failover_replug_primary(VirtIONet *n, Error **errp)
+static bool failover_replug_primary(VirtIONet *n, DeviceState *dev,
+                                    Error **errp)
 {
     Error *err = NULL;
     HotplugHandler *hotplug_ctrl;
-    PCIDevice *pdev = PCI_DEVICE(n->primary_dev);
+    PCIDevice *pdev = PCI_DEVICE(dev);
     BusState *primary_bus;
 
     if (!pdev->partially_hotplugged) {
         return true;
     }
-    primary_bus = n->primary_dev->parent_bus;
+    primary_bus = dev->parent_bus;
     if (!primary_bus) {
         error_setg(errp, "virtio_net: couldn't find primary bus");
         return false;
     }
-    qdev_set_parent_bus(n->primary_dev, primary_bus, &error_abort);
+    qdev_set_parent_bus(dev, primary_bus, &error_abort);
     qatomic_set(&n->failover_primary_hidden, false);
-    hotplug_ctrl = qdev_get_hotplug_handler(n->primary_dev);
+    hotplug_ctrl = qdev_get_hotplug_handler(dev);
     if (hotplug_ctrl) {
-        hotplug_handler_pre_plug(hotplug_ctrl, n->primary_dev, &err);
+        hotplug_handler_pre_plug(hotplug_ctrl, dev, &err);
         if (err) {
             goto out;
         }
-        hotplug_handler_plug(hotplug_ctrl, n->primary_dev, &err);
+        hotplug_handler_plug(hotplug_ctrl, dev, &err);
     }
 
 out:
@@ -3161,7 +3162,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     }
 
     if (migration_in_setup(s) && !should_be_hidden) {
-        if (failover_unplug_primary(n)) {
+        if (failover_unplug_primary(n, n->primary_dev)) {
             vmstate_unregister(VMSTATE_IF(n->primary_dev),
                                qdev_get_vmsd(n->primary_dev),
                                n->primary_dev);
@@ -3172,7 +3173,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
         }
     } else if (migration_has_failed(s)) {
         /* We already unplugged the device let's plug it back */
-        if (!failover_replug_primary(n, &err)) {
+        if (!failover_replug_primary(n, n->primary_dev, &err)) {
             if (err) {
                 error_report_err(err);
             }
-- 
MST


