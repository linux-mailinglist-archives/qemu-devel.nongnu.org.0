Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE723E4AA8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 19:17:16 +0200 (CEST)
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD8tn-0007ka-T2
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 13:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mD8qi-00057E-Qh
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:14:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mD8qh-0004mH-1z
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628529242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dAJEUbtuOE6/UYLgmsCKE90Cal3QyPf5B4d47mc3cWE=;
 b=cEysDShSSYkx1JUSsgBNX7MAsBIWXfOYINQKeb+CMf0Z6sMF/mbuLjDXf4R26lAyYZMt29
 mjQ0Uqy5vW/3bZe3HAww0BTcy7y77B3iwZU9cY5t+S6YqHU8niINA2kXeFHr74jx+6QoOt
 JPMCit2PySlFx9xmP9fo7gJt2zlRD1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-uxu5PixuNOWGou1Voa3weQ-1; Mon, 09 Aug 2021 13:13:54 -0400
X-MC-Unique: uxu5PixuNOWGou1Voa3weQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E78D8799E0
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 17:13:53 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76FA117C0B;
 Mon,  9 Aug 2021 17:13:43 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] virtio: failover: allow to keep the VFIO device rather
 than the virtio-net one
Date: Mon,  9 Aug 2021 19:13:41 +0200
Message-Id: <20210809171342.18146-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2: use validate_features() to disable the guest driver rather=0D
    than setting vring.num to 0.=0D
=0D
With failover, when the guest virtio-net driver doesn't support the=0D
STANDBY feature, the primary device is not plugged and only the virtio-net=
=0D
device is kept. Doing like that we can migrate the machine and=0D
keep the network connection.=0D
=0D
But in some cases, when performance is more important than availability=0D
we would prefer to keep the VFIO device rather than the virtio-net one,=0D
even if it means to lose the network connection during the migration of=0D
the machine.=0D
=0D
To do that we can't simply unplug the virtio-net device and plug the=0D
VFIO one because for the migration the initial state must be kept=0D
(virtio-net plugged, VFIO unplugged) but we can try to disable the=0D
virtio-net driver and plug the VFIO card, so the initial state is=0D
correct (the virtio-net card is plugged, but disabled in guest, and=0D
the VFIO card is unplugged before migration).=0D
=0D
This change doesn't impact the case when guest and host support=0D
the STANDBY feature.=0D
=0D
I've introduced the "failover-default" property to virtio-net device=0D
to set which device to keep (failover-default=3Dtrue keeps the virtio-net=
=0D
device, =3Doff the other one).=0D
=0D
For example, with a guest driver that doesn't support STANDBY:=0D
=0D
  ...=0D
  -device virtio-net-pci,id=3Dvirtio0,failover=3Don,failover-default=3Don \=
=0D
  -device vfio-pci,host=3D$PCI,id=3Dhostdev0,failover_pair_id=3Dvirtio0 \=
=0D
  ...=0D
=0D
  [root@localhost ~]# ip a=0D
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen =
1=0D
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00=0D
      inet 127.0.0.1/8 scope host lo=0D
         valid_lft forever preferred_lft forever=0D
      inet6 ::1/128 scope host=0D
         valid_lft forever preferred_lft forever=0D
  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast stat=
e UP q0=0D
      link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff=0D
      inet 192.168.20.2/24 brd 192.168.20.255 scope global eth0=0D
         valid_lft forever preferred_lft forever=0D
      inet6 fe80::2428:c5ff:fe7f:1424/64 scope link=0D
         valid_lft forever preferred_lft forever=0D
  # ethtool -i eth0=0D
  driver: virtio_net=0D
  version: 1.0.0=0D
  firmware-version:=0D
  expansion-rom-version:=0D
  bus-info: 0000:04:00.0=0D
  supports-statistics: no=0D
  supports-test: no=0D
  supports-eeprom-access: no=0D
  supports-register-dump: no=0D
  supports-priv-flags: no=0D
=0D
  ...=0D
  -device virtio-net-pci,id=3Dvirtio0,failover=3Don,failover-default=3Doff =
\=0D
  -device vfio-pci,host=3D$PCI,id=3Dhostdev0,failover_pair_id=3Dvirtio0 \=
=0D
  ...=0D
=0D
  [root@localhost ~]# ip a=0D
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen =
1=0D
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00=0D
      inet 127.0.0.1/8 scope host lo=0D
         valid_lft forever preferred_lft forever=0D
      inet6 ::1/128 scope host=0D
         valid_lft forever preferred_lft forever=0D
  2: enp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP q=
len 100=0D
      link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff=0D
      inet 192.168.20.2/24 brd 192.168.20.255 scope global enp2s0=0D
         valid_lft forever preferred_lft forever=0D
      inet6 fe80::2428:c5ff:fe7f:1424/64 scope link=0D
         valid_lft forever preferred_lft forever=0D
  [root@localhost ~]# ethtool -i enp2s0=0D
  driver: i40evf=0D
  version: 1.6.27-k=0D
  firmware-version: N/A=0D
  expansion-rom-version:=0D
  bus-info: 0000:02:00.0=0D
  supports-statistics: yes=0D
  supports-test: no=0D
  supports-eeprom-access: no=0D
  supports-register-dump: no=0D
  supports-priv-flags: no=0D
=0D
With guest driver that supports STANDBY, we would always have:=0D
=0D
  [root@localhost ~]# ip a=0D
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group=
 defau0=0D
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00=0D
      inet 127.0.0.1/8 scope host lo=0D
         valid_lft forever preferred_lft forever=0D
      inet6 ::1/128 scope host=0D
         valid_lft forever preferred_lft forever=0D
  2: enp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state=
 UP gr0=0D
      link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff=0D
      inet 192.168.20.2/24 brd 192.168.20.255 scope global noprefixroute en=
p4s0=0D
         valid_lft forever preferred_lft forever=0D
      inet6 fe80::2428:c5ff:fe7f:1424/64 scope link=0D
         valid_lft forever preferred_lft forever=0D
  3: enp4s0nsby: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel =
master0=0D
      link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff=0D
  4: enp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master enp=
4s0 st0=0D
      link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff=0D
  [root@localhost ~]# ethtool -i enp4s0=0D
  driver: net_failover=0D
  version: 0.1=0D
  firmware-version:=0D
  expansion-rom-version:=0D
  bus-info:=0D
  supports-statistics: no=0D
  supports-test: no=0D
  supports-eeprom-access: no=0D
  supports-register-dump: no=0D
  supports-priv-flags: no=0D
  [root@localhost ~]# ethtool -i enp4s0nsby=0D
  driver: virtio_net=0D
  version: 1.0.0=0D
  firmware-version:=0D
  expansion-rom-version:=0D
  bus-info: 0000:04:00.0=0D
  supports-statistics: yes=0D
  supports-test: no=0D
  supports-eeprom-access: no=0D
  supports-register-dump: no=0D
  supports-priv-flags: no=0D
  [root@localhost ~]# ethtool -i enp2s0=0D
  driver: iavf=0D
  version: 4.18.0-310.el8.x86_64=0D
  firmware-version: N/A=0D
  expansion-rom-version:=0D
  bus-info: 0000:02:00.0=0D
  supports-statistics: yes=0D
  supports-test: no=0D
  supports-eeprom-access: no=0D
  supports-register-dump: no=0D
  supports-priv-flags: yes=0D
=0D
Laurent Vivier (1):=0D
  virtio: failover: define the default device to use in case of error=0D
=0D
 include/hw/virtio/virtio-net.h |  1 +=0D
 hw/net/virtio-net.c            | 49 +++++++++++++++++++++++++++++-----=0D
 2 files changed, 44 insertions(+), 6 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


