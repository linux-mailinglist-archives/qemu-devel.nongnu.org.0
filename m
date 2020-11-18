Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3886C2B79DE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:02:16 +0100 (CET)
Received: from localhost ([::1]:52886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJLz-0001vs-96
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIz5-0003SG-Av
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIz3-0005gI-GD
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LwfAnqKkvd3KtGEnOzJlbeEpwQWJWYlc8So1esTOmIU=;
 b=G+v4f6Njjb7VMoM9nJl9uAe9pMO2yE2+OkYz3wwNCRxxbA6EtPsmaFde+kGWvfDwD2bOFI
 5RYVzTaqzmnltzMIBaAXL81DOLF3RbXeGXfOiCU5NGdPuwOV0/kDznvk3b4ltdGkqd39zc
 XXvf9/EVjPl82a9SfckPUvIx3f7/mfA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-7PIyPJDRNSCqua0o-ndpSg-1; Wed, 18 Nov 2020 03:38:30 -0500
X-MC-Unique: 7PIyPJDRNSCqua0o-ndpSg-1
Received: by mail-wr1-f69.google.com with SMTP id w6so637175wrk.1
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LwfAnqKkvd3KtGEnOzJlbeEpwQWJWYlc8So1esTOmIU=;
 b=m92nyRuFs8CVmq7BpztHmCe2PFVXwxxeyuxPNyMQQXvDiu/wOiVrYWk8HoACS/DJYx
 AF3Vcfvuoaqub2UfS5DfT/8CvvVObEccOiujuyV0VIeh+h5xXGpo3U4oxO9e2vlCsLaJ
 WjL/W1MJ+sp94uwzw4yzaPYupo/JCUbsO7pvZYTSu1YIKg0DO9NwrUx2A+/p9I1YRi1M
 eiwmGxBLYFO4cpaAMREGBNSQkVe7Imaaq/FMtNKeF0dHvtGT4UnjX3WQ/VwHBr9axyoM
 txVD5tR1lyqEFzFBgpng+cnC7PZJyWHvMY6GspVDqDlUxm2WNaZld8G6BC6WGZIQB1bA
 L9iw==
X-Gm-Message-State: AOAM531SUnd1qD2ZLn7R1/KQjr2Y1SmZEkRl+1O49jyRoGcOfvyG1ghK
 boleWabJrPL08M7uopC43oaj1hTeT0M9t7HkaS1bZjMHwxYnBtgYMilieGBQiOt3JuSxNsKzydw
 7W/t6WsT9AtcTKOTiPC0DZwqdrGuTxDwLGmNL8lGjSvsa7Yq8VR0OuPgYd7zRkUiNTx8=
X-Received: by 2002:a5d:474f:: with SMTP id o15mr3446598wrs.377.1605688708650; 
 Wed, 18 Nov 2020 00:38:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyeIN2kKUcv+1zuXp4DBBqHeafXzwDENXn0I/nb1RV+Ft3m8XreFi5GW33TYmL1UD8m7XF3A==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr3446579wrs.377.1605688708418; 
 Wed, 18 Nov 2020 00:38:28 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id a18sm2370036wmm.22.2020.11.18.00.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:27 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/27] failover: Caller of this two functions already have
 primary_dev
Date: Wed, 18 Nov 2020 09:37:46 +0100
Message-Id: <20201118083748.1328-26-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass it as an argument.

Signed-off-by: Juan Quintela <quintela@redhat.com>
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
2.26.2


