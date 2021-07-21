Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9BD3D0B7E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:33:54 +0200 (CEST)
Received: from localhost ([::1]:39340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68bx-0007pV-Gc
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m68Y6-00037z-VI
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:29:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m68Y5-0003ED-D9
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626859792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dycnHQf7h8SdEIxMNLsLgEUsPh/ewb06CrWUcZ1/B5U=;
 b=a5hM7oDdZYozAn4I3BHiAwFWmH9mBvVQZ2PVpcnmR3V6etPVEvKqFMgGfShvjrKi+Ew2PU
 lEoNwudBzJhJLcoy992NicnFswD3jMykkMgb8PLDBwcbE69kzKdptd0rejRNE5gV4152xp
 i0UwWaZa5swgNRrdY6FIO1a782rHv1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-_RtlnjivPRSBF2ydN6wyNg-1; Wed, 21 Jul 2021 05:29:51 -0400
X-MC-Unique: _RtlnjivPRSBF2ydN6wyNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 859EB107B031
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:29:50 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51C951017CE8;
 Wed, 21 Jul 2021 09:29:41 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] failover: unregister ROM on unplug
Date: Wed, 21 Jul 2021 11:29:40 +0200
Message-Id: <20210721092940.225010-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The intend of failover is to allow to migrate a VM with a VFIO
networking card without disrupting the network operation by switching
to a virtio-net device during the migration.

This simple change allows to test failover with a simulated device
like e1000e rather than a vfio device, even if it's useless in real
life it can help to debug failover.

This is interesting to developers that want to test failover on
a system with no vfio device. Moreover it simplifies host networking
configuration as we can use the same bridge for virtio-net and
the other failover networking device.

Without this change the migration of a system configured with failover
fails with:

  ...
  -device virtio-net-pci,id=virtionet0,failover=on,...  \
  -device e1000,failover_pair_id=virtionet0,... \
  ...

  (qemu) migrate ...

  Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
  error while loading state for instance 0x0 of device 'ram'
  load of migration failed: Invalid argument

This happens because QEMU correctly unregisters the interface vmstate but
not the ROM one. This patch fixes that.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---

Notes:
    v2:
      reset has_rom to false
      update commit log message

 hw/net/virtio-net.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 16d20cdee52a..b75794c2447a 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3256,6 +3256,10 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
     if (migration_in_setup(s) && !should_be_hidden) {
         if (failover_unplug_primary(n, dev)) {
             vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
+            if (PCI_DEVICE(dev)->has_rom) {
+                PCI_DEVICE(dev)->has_rom = false;
+                vmstate_unregister_ram(&PCI_DEVICE(dev)->rom , dev);
+            }
             qapi_event_send_unplug_primary(dev->id);
             qatomic_set(&n->failover_primary_hidden, true);
         } else {
-- 
2.31.1


