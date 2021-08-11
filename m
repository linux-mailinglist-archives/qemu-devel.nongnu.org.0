Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2E63E8A38
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:29:27 +0200 (CEST)
Received: from localhost ([::1]:33772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDhjy-00086x-Iz
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mDhho-0005yN-GH
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mDhhk-0002OI-Fb
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628663226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQAkcyBewqHmUdd2PiyrdALLfJaJqTyRfHuiDna3+3s=;
 b=I2zlviMm7LTvg4t2N3bAoOhYwXpyHHDVfJ/itRGSJ19zfcw6bsWM30yKwj59sSJShZKSaq
 TIyO95y9ZWhJjQjLq9uz3oQ6REoooyDLhP/ojP/AjaBSZfH4tELcIHhQy3gKSOJdYArV4a
 /Xpa9Q00y2zyvfG448XPYFasoqPXKmk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-QmxoF78mPjyf9cREpJgR8w-1; Wed, 11 Aug 2021 02:27:04 -0400
X-MC-Unique: QmxoF78mPjyf9cREpJgR8w-1
Received: by mail-wm1-f71.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so480924wmc.9
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 23:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HQAkcyBewqHmUdd2PiyrdALLfJaJqTyRfHuiDna3+3s=;
 b=bLTGHJgVkeP+16jKraFYuMeLoIQAgEW7p4XcvM3Yix9ZLlqin/M8Co41/2GXEl8+68
 95KZEgOvVqzpz2k+i9ExFlVMRPQRBitFlmm+vTvg9Ge4MWNG0ew/UBHim8jGiElnLeI0
 lGGmy4QtWL2c3YgXLJy9z1ueGey2X75RmfYeEm8RbTnYzSW4GrS1UpzaUwh7rI5cPt1I
 Gp9mlNP2+wRZey8Y9NscEUW1OMT3wqdkO4MUF7sfQwiSmSi6ZbE7BW7cwWFW7AUYH8M8
 xRzpvwkh712ta4fH/AWu/856H7vUVC6xS6SaAGWmneVtfj1hfd1MY9qJ87dzkp61syol
 dExA==
X-Gm-Message-State: AOAM530MuKqiqehludbVlUn5Qugty4I2K0A5u3eOQ44bF+5F8av7+ydv
 QroJyHPTNiFwrCThLEvKskhRbg+hxVhRbCwThT54X1z3QE8QZ4SCtIwDVG+JABzTvDUGc1WeZ3P
 0H5fBZfefVtmAVQQ=
X-Received: by 2002:a7b:cc98:: with SMTP id p24mr8427395wma.118.1628663223764; 
 Tue, 10 Aug 2021 23:27:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYnswVT/S6t2LJkMhjFdht5xmKG1x6dg3ltX8PmSa0LjPePQ52/qhO686Z41pbv6YcadhNwQ==
X-Received: by 2002:a7b:cc98:: with SMTP id p24mr8427370wma.118.1628663223490; 
 Tue, 10 Aug 2021 23:27:03 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.5.86])
 by smtp.gmail.com with ESMTPSA id k17sm6016236wmj.0.2021.08.10.23.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 23:27:02 -0700 (PDT)
Subject: Re: [PATCH v2 0/1] virtio: failover: allow to keep the VFIO device
 rather than the virtio-net one
To: Jason Wang <jasowang@redhat.com>
References: <20210809171342.18146-1-lvivier@redhat.com>
 <CACGkMEuAY-tsTBbmGYGpv2rPnO-GsyGnCTfV=Sgfdn=LGT8oYw@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <22052fa1-d560-bdf9-cb05-328a52c369a5@redhat.com>
Date: Wed, 11 Aug 2021 08:27:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACGkMEuAY-tsTBbmGYGpv2rPnO-GsyGnCTfV=Sgfdn=LGT8oYw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/08/2021 06:17, Jason Wang wrote:
> On Tue, Aug 10, 2021 at 1:13 AM Laurent Vivier <lvivier@redhat.com> wrote:
>>
>> v2: use validate_features() to disable the guest driver rather
>>     than setting vring.num to 0.
>>
>> With failover, when the guest virtio-net driver doesn't support the
>> STANDBY feature, the primary device is not plugged and only the virtio-net
>> device is kept. Doing like that we can migrate the machine and
>> keep the network connection.
>>
>> But in some cases, when performance is more important than availability
>> we would prefer to keep the VFIO device rather than the virtio-net one,
>> even if it means to lose the network connection during the migration of
>> the machine.
> 
> I think we still need to seek a way to recover the network after migration.

If the network device is configured to have an IP address at boot, the IP will be restored
when the card is hotplugged. The only difference with virtio-net is _during_ the
migration. Witht virtio-net we keep the networking while the VM is migrated, without it we
lose the networking when the VFIO card is unplugged and restored when it is plugged back.

Thanks,
Laurent

> 
> Thanks
> 
>>
>> To do that we can't simply unplug the virtio-net device and plug the
>> VFIO one because for the migration the initial state must be kept
>> (virtio-net plugged, VFIO unplugged) but we can try to disable the
>> virtio-net driver and plug the VFIO card, so the initial state is
>> correct (the virtio-net card is plugged, but disabled in guest, and
>> the VFIO card is unplugged before migration).
>>
>> This change doesn't impact the case when guest and host support
>> the STANDBY feature.
>>
>> I've introduced the "failover-default" property to virtio-net device
>> to set which device to keep (failover-default=true keeps the virtio-net
>> device, =off the other one).
>>
>> For example, with a guest driver that doesn't support STANDBY:
>>
>>   ...
>>   -device virtio-net-pci,id=virtio0,failover=on,failover-default=on \
>>   -device vfio-pci,host=$PCI,id=hostdev0,failover_pair_id=virtio0 \
>>   ...
>>
>>   [root@localhost ~]# ip a
>>   1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
>>       link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>>       inet 127.0.0.1/8 scope host lo
>>          valid_lft forever preferred_lft forever
>>       inet6 ::1/128 scope host
>>          valid_lft forever preferred_lft forever
>>   2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP q0
>>       link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff
>>       inet 192.168.20.2/24 brd 192.168.20.255 scope global eth0
>>          valid_lft forever preferred_lft forever
>>       inet6 fe80::2428:c5ff:fe7f:1424/64 scope link
>>          valid_lft forever preferred_lft forever
>>   # ethtool -i eth0
>>   driver: virtio_net
>>   version: 1.0.0
>>   firmware-version:
>>   expansion-rom-version:
>>   bus-info: 0000:04:00.0
>>   supports-statistics: no
>>   supports-test: no
>>   supports-eeprom-access: no
>>   supports-register-dump: no
>>   supports-priv-flags: no
>>
>>   ...
>>   -device virtio-net-pci,id=virtio0,failover=on,failover-default=off \
>>   -device vfio-pci,host=$PCI,id=hostdev0,failover_pair_id=virtio0 \
>>   ...
>>
>>   [root@localhost ~]# ip a
>>   1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
>>       link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>>       inet 127.0.0.1/8 scope host lo
>>          valid_lft forever preferred_lft forever
>>       inet6 ::1/128 scope host
>>          valid_lft forever preferred_lft forever
>>   2: enp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 100
>>       link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff
>>       inet 192.168.20.2/24 brd 192.168.20.255 scope global enp2s0
>>          valid_lft forever preferred_lft forever
>>       inet6 fe80::2428:c5ff:fe7f:1424/64 scope link
>>          valid_lft forever preferred_lft forever
>>   [root@localhost ~]# ethtool -i enp2s0
>>   driver: i40evf
>>   version: 1.6.27-k
>>   firmware-version: N/A
>>   expansion-rom-version:
>>   bus-info: 0000:02:00.0
>>   supports-statistics: yes
>>   supports-test: no
>>   supports-eeprom-access: no
>>   supports-register-dump: no
>>   supports-priv-flags: no
>>
>> With guest driver that supports STANDBY, we would always have:
>>
>>   [root@localhost ~]# ip a
>>   1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group defau0
>>       link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>>       inet 127.0.0.1/8 scope host lo
>>          valid_lft forever preferred_lft forever
>>       inet6 ::1/128 scope host
>>          valid_lft forever preferred_lft forever
>>   2: enp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP gr0
>>       link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff
>>       inet 192.168.20.2/24 brd 192.168.20.255 scope global noprefixroute enp4s0
>>          valid_lft forever preferred_lft forever
>>       inet6 fe80::2428:c5ff:fe7f:1424/64 scope link
>>          valid_lft forever preferred_lft forever
>>   3: enp4s0nsby: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel master0
>>       link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff
>>   4: enp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master enp4s0 st0
>>       link/ether 26:28:c5:7f:14:24 brd ff:ff:ff:ff:ff:ff
>>   [root@localhost ~]# ethtool -i enp4s0
>>   driver: net_failover
>>   version: 0.1
>>   firmware-version:
>>   expansion-rom-version:
>>   bus-info:
>>   supports-statistics: no
>>   supports-test: no
>>   supports-eeprom-access: no
>>   supports-register-dump: no
>>   supports-priv-flags: no
>>   [root@localhost ~]# ethtool -i enp4s0nsby
>>   driver: virtio_net
>>   version: 1.0.0
>>   firmware-version:
>>   expansion-rom-version:
>>   bus-info: 0000:04:00.0
>>   supports-statistics: yes
>>   supports-test: no
>>   supports-eeprom-access: no
>>   supports-register-dump: no
>>   supports-priv-flags: no
>>   [root@localhost ~]# ethtool -i enp2s0
>>   driver: iavf
>>   version: 4.18.0-310.el8.x86_64
>>   firmware-version: N/A
>>   expansion-rom-version:
>>   bus-info: 0000:02:00.0
>>   supports-statistics: yes
>>   supports-test: no
>>   supports-eeprom-access: no
>>   supports-register-dump: no
>>   supports-priv-flags: yes
>>
>> Laurent Vivier (1):
>>   virtio: failover: define the default device to use in case of error
>>
>>  include/hw/virtio/virtio-net.h |  1 +
>>  hw/net/virtio-net.c            | 49 +++++++++++++++++++++++++++++-----
>>  2 files changed, 44 insertions(+), 6 deletions(-)
>>
>> --
>> 2.31.1
>>
>>
> 


