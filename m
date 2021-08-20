Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475653F2E12
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:28:18 +0200 (CEST)
Received: from localhost ([::1]:53296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5VJ-0002Rs-Bk
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mH5Ni-0003ol-3N
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mH5Ne-0004NI-Uv
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629469221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RavhpEnHDUDfz8sbQ0TS+QuKv12g6QL+lkQzgmgPsaY=;
 b=eaxNoAcTM9sRsnEfgHkA2JkBQwSOwoqOd9zRaja2HhrZYXwhz3PNqCQwgVHnXcvAUyMaYH
 ViPCA/ifphIPK9GRvegB6TTxzNw1HJ7EVFDiCNJ3e6ngP+DGBEagFIoMKwYc8XkP0hlzbN
 Cc7rcJ4db+doF2xsXFq3K4mcTcee/Fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-lgHv1tPOOJKIR2EFVKII8Q-1; Fri, 20 Aug 2021 10:20:19 -0400
X-MC-Unique: lgHv1tPOOJKIR2EFVKII8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F5B7100F766;
 Fri, 20 Aug 2021 14:20:18 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B14360938;
 Fri, 20 Aug 2021 14:20:03 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/8] virtio-net failover cleanup and new features
Date: Fri, 20 Aug 2021 16:19:54 +0200
Message-Id: <20210820142002.152994-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

v2: add helpers to manage the list of hidden devices rather=0D
    than relying on the command line parameters=0D
    Hide VFIO device if it is plugged before the virtio-net one=0D
=0D
This series moves the code used by virtio-net failover from the=0D
virtio-net device to the PCI subsystem.=0D
=0D
Doing that, we can use failover with a regular QEMU PCI device=0D
(we can add the function call to unregister the ROM vmstate) and we=0D
can also use this code to unplug a PCI card before migration=0D
and plug it back after migration without using a failover=0D
device (of course, connectivity is lost during all the migration).=0D
In contrary of failover, this does not need support from the=0D
guest system to work.=0D
=0D
Laurent Vivier (8):=0D
  qdev: add an Error parameter to the DeviceListener hide_device()=0D
    function=0D
  qdev/qbus: remove failover specific code=0D
  failover: virtio-net: remove failover_primary_hidden flag=0D
  failover: pci: move failover hotplug/unplug code into pci subsystem=0D
  failover: hide the PCI device if the virtio-net device is not present=0D
  failover: pci: unregister ROM on unplug=0D
  pci: automatically unplug a PCI card before migration=0D
  failover: qemu-opts: manage hidden device list=0D
=0D
 include/hw/pci/pci.h           |   5 +=0D
 include/hw/qdev-core.h         |   6 +-=0D
 include/hw/virtio/virtio-net.h |   4 -=0D
 include/hw/virtio/virtio.h     |   1 -=0D
 include/qemu/option.h          |   4 +=0D
 hw/core/qdev.c                 |   5 +-=0D
 hw/net/virtio-net.c            | 149 +-------------------=0D
 hw/pci/pci.c                   | 242 +++++++++++++++++++++++++++++++--=0D
 hw/vfio/pci.c                  |   2 +-=0D
 softmmu/qdev-monitor.c         |  14 +-=0D
 util/qemu-option.c             |  82 +++++++++++=0D
 11 files changed, 338 insertions(+), 176 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


