Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DF23F2E26
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:34:17 +0200 (CEST)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5b6-0005Xa-Hn
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mH5OI-0005OH-F0
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:21:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mH5OG-0004zd-Ud
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629469260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eE6TrvVnQLMgL3ujDxJTroNsNOr5RA8N3cHSLtAWvFk=;
 b=FMif489UxelJqvMtIyYnkJGN3G8md13/ZrSCfLNSmbE4fhhK4HhSM1RoTtuHkrPvo+0nPX
 bV/Iw5iT2K9a4BL7WTfXrhFt64ZR+0/ihVD09UaZ/+XsDNNUmbOXs9zFmq+0KjSaEaSYWl
 H69I8wdvrKOlwxWX+I2TNLGzc6n0LRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-VX3WcBQuMh6ZuMv-_mIOjg-1; Fri, 20 Aug 2021 10:20:59 -0400
X-MC-Unique: VX3WcBQuMh6ZuMv-_mIOjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51929100F766;
 Fri, 20 Aug 2021 14:20:58 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 778B5226E8;
 Fri, 20 Aug 2021 14:20:44 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 6/8] failover: pci: unregister ROM on unplug
Date: Fri, 20 Aug 2021 16:20:00 +0200
Message-Id: <20210820142002.152994-7-lvivier@redhat.com>
In-Reply-To: <20210820142002.152994-1-lvivier@redhat.com>
References: <20210820142002.152994-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The intend of failover is to allow a VM with a VFIO networking card to
be migrated without disrupting the network operation by switching
to a virtio-net device during the migration.

This simple change allows a simulated device like e1000e to be tested
rather than a vfio device, even if it's useless in real life it can help
to debug failover.

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
 hw/pci/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index dd5e95216abf..10b875fdfad1 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2208,6 +2208,7 @@ static void pci_dev_handle_migration(PCIDevice *pci_dev, MigrationState *s)
     if (migration_in_setup(s)) {
         if (pci_dev_migration_unplug(pci_dev)) {
             vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
+            pci_del_option_rom(pci_dev);
             qapi_event_send_unplug_primary(dev->id);
         } else {
             warn_report("couldn't unplug primary device");
-- 
2.31.1


