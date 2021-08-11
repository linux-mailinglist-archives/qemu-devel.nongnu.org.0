Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F733E892B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 06:18:34 +0200 (CEST)
Received: from localhost ([::1]:37918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDfhI-0006GX-NE
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 00:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mDfgZ-0005ZS-Mz
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 00:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mDfgW-000837-Tf
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 00:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628655463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Q6khA5SR6h2JcyfjoKxOPbTfiSlV9P33/7XXAdG2MY=;
 b=a07iwK5sEaZwIpaYfRfAWTUI0QDAVRWq3GaYb8FC3rwrco6mbdoHIcaId5mWCoOjO0NXeA
 VvtbH/xJTvDHRbD496ruEagIbVQH99knN0xKIUfL4PsxUKlNFN5OEnLmDbVec6fkHsybUt
 vrOrRvYdz3y5ubOXrI8GO7rqodMxRso=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-az8_x0jcMIS9goZqjjRAkw-1; Wed, 11 Aug 2021 00:17:38 -0400
X-MC-Unique: az8_x0jcMIS9goZqjjRAkw-1
Received: by mail-lf1-f71.google.com with SMTP id
 y3-20020a1975030000b02903bd2e59c7dcso438067lfe.6
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 21:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Q6khA5SR6h2JcyfjoKxOPbTfiSlV9P33/7XXAdG2MY=;
 b=Ze7xfhlxtZ3HxHR19OBJUxApAkYNOJSh16xRD6r4HVwaZkvf/pqcp8A25OLL8TLTZ/
 b/CBWOqeuCU2mOvbo66dM5Q2z4SaymZOOD7l+nP7pV7sPtk1kTuFOWk+aapovmYqPyLH
 VWwXYn/0kEt+qAahCXx45jxsKIAxYPxtPPAr17I8srNCKJVQi3x1xj07qp1i0VEY2yg1
 z4auvQQ+5qBkOTrf2gO/fhn3LIIAzBOY1buoMYkVq78EWEXAWTtkCp4HMAymwHJwam2l
 WfK6m8+Jypam8gt3duDXKRo71wTuY+bGuzF3pit8PzNOTc6XIhRNKRx0fQaQOAVnDeI4
 dycg==
X-Gm-Message-State: AOAM531uTI5Y1RP4K1fxenU1R7U3CQg/URMVq4zLgnuXPCJsP/YKgkQc
 W2oFVoGKxk0164Hrrb8qhWiH0vFeoI1nx22LpngsOt8snd30fZjqzFir6jD8UMcZh3Mdz31W8MC
 kwQ1r8qAGP86Wrdt/ELrCAc1kT4gC/5Q=
X-Received: by 2002:a05:651c:84:: with SMTP id
 4mr21407010ljq.261.1628655456772; 
 Tue, 10 Aug 2021 21:17:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9m7opZyzf4/s04KOxdFrKiQiYoLox/oGHTceorGZFR8OqJbXJqbyuh7YXLSU5HAa0YqY/lHIaBvGDHicQ2mo=
X-Received: by 2002:a05:651c:84:: with SMTP id
 4mr21406996ljq.261.1628655456464; 
 Tue, 10 Aug 2021 21:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210809171342.18146-1-lvivier@redhat.com>
In-Reply-To: <20210809171342.18146-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 Aug 2021 12:17:25 +0800
Message-ID: <CACGkMEuAY-tsTBbmGYGpv2rPnO-GsyGnCTfV=Sgfdn=LGT8oYw@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] virtio: failover: allow to keep the VFIO device
 rather than the virtio-net one
To: Laurent Vivier <lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: Juan Quintela <quintela@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 1:13 AM Laurent Vivier <lvivier@redhat.com> wrote:
>
> v2: use validate_features() to disable the guest driver rather
>     than setting vring.num to 0.
>
> With failover, when the guest virtio-net driver doesn't support the
> STANDBY feature, the primary device is not plugged and only the virtio-net
> device is kept. Doing like that we can migrate the machine and
> keep the network connection.
>
> But in some cases, when performance is more important than availability
> we would prefer to keep the VFIO device rather than the virtio-net one,
> even if it means to lose the network connection during the migration of
> the machine.

I think we still need to seek a way to recover the network after migration.

Thanks

>
> To do that we can't simply unplug the virtio-net device and plug the
> VFIO one because for the migration the initial state must be kept
> (virtio-net plugged, VFIO unplugged) but we can try to disable the
> virtio-net driver and plug the VFIO card, so the initial state is
> correct (the virtio-net card is plugged, but disabled in guest, and
> the VFIO card is unplugged before migration).
>
> This change doesn't impact the case when guest and host support
> the STANDBY feature.
>
> I've introduced the "failover-default" property to virtio-net device
> to set which device to keep (failover-default=true keeps the virtio-net
> device, =off the other one).
>
> For example, with a guest driver that doesn't support STANDBY:
>
>   ...
>   -device virtio-net-pci,id=virtio0,failover=on,failover-default=on \
>   -device vfio-pci,host=$PCI,id=hostdev0,failover_pair_id=virtio0 \
>   ...
>
>   [root@localhost ~]# ip a
>   1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
>       link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>       inet 127.0.0.1/8 scope host lo
>          valid_lft forever preferred_lft forever
>       inet6 ::1/128 scope host
>          valid_lft forever preferred_lft forever
>   2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP q0
>       link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff
>       inet 192.168.20.2/24 brd 192.168.20.255 scope global eth0
>          valid_lft forever preferred_lft forever
>       inet6 fe80::2428:c5ff:fe7f:1424/64 scope link
>          valid_lft forever preferred_lft forever
>   # ethtool -i eth0
>   driver: virtio_net
>   version: 1.0.0
>   firmware-version:
>   expansion-rom-version:
>   bus-info: 0000:04:00.0
>   supports-statistics: no
>   supports-test: no
>   supports-eeprom-access: no
>   supports-register-dump: no
>   supports-priv-flags: no
>
>   ...
>   -device virtio-net-pci,id=virtio0,failover=on,failover-default=off \
>   -device vfio-pci,host=$PCI,id=hostdev0,failover_pair_id=virtio0 \
>   ...
>
>   [root@localhost ~]# ip a
>   1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
>       link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>       inet 127.0.0.1/8 scope host lo
>          valid_lft forever preferred_lft forever
>       inet6 ::1/128 scope host
>          valid_lft forever preferred_lft forever
>   2: enp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 100
>       link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff
>       inet 192.168.20.2/24 brd 192.168.20.255 scope global enp2s0
>          valid_lft forever preferred_lft forever
>       inet6 fe80::2428:c5ff:fe7f:1424/64 scope link
>          valid_lft forever preferred_lft forever
>   [root@localhost ~]# ethtool -i enp2s0
>   driver: i40evf
>   version: 1.6.27-k
>   firmware-version: N/A
>   expansion-rom-version:
>   bus-info: 0000:02:00.0
>   supports-statistics: yes
>   supports-test: no
>   supports-eeprom-access: no
>   supports-register-dump: no
>   supports-priv-flags: no
>
> With guest driver that supports STANDBY, we would always have:
>
>   [root@localhost ~]# ip a
>   1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group defau0
>       link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>       inet 127.0.0.1/8 scope host lo
>          valid_lft forever preferred_lft forever
>       inet6 ::1/128 scope host
>          valid_lft forever preferred_lft forever
>   2: enp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP gr0
>       link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff
>       inet 192.168.20.2/24 brd 192.168.20.255 scope global noprefixroute enp4s0
>          valid_lft forever preferred_lft forever
>       inet6 fe80::2428:c5ff:fe7f:1424/64 scope link
>          valid_lft forever preferred_lft forever
>   3: enp4s0nsby: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel master0
>       link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff
>   4: enp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master enp4s0 st0
>       link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff
>   [root@localhost ~]# ethtool -i enp4s0
>   driver: net_failover
>   version: 0.1
>   firmware-version:
>   expansion-rom-version:
>   bus-info:
>   supports-statistics: no
>   supports-test: no
>   supports-eeprom-access: no
>   supports-register-dump: no
>   supports-priv-flags: no
>   [root@localhost ~]# ethtool -i enp4s0nsby
>   driver: virtio_net
>   version: 1.0.0
>   firmware-version:
>   expansion-rom-version:
>   bus-info: 0000:04:00.0
>   supports-statistics: yes
>   supports-test: no
>   supports-eeprom-access: no
>   supports-register-dump: no
>   supports-priv-flags: no
>   [root@localhost ~]# ethtool -i enp2s0
>   driver: iavf
>   version: 4.18.0-310.el8.x86_64
>   firmware-version: N/A
>   expansion-rom-version:
>   bus-info: 0000:02:00.0
>   supports-statistics: yes
>   supports-test: no
>   supports-eeprom-access: no
>   supports-register-dump: no
>   supports-priv-flags: yes
>
> Laurent Vivier (1):
>   virtio: failover: define the default device to use in case of error
>
>  include/hw/virtio/virtio-net.h |  1 +
>  hw/net/virtio-net.c            | 49 +++++++++++++++++++++++++++++-----
>  2 files changed, 44 insertions(+), 6 deletions(-)
>
> --
> 2.31.1
>
>


