Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1AA6FD84A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:34:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweKp-0001qY-Sk; Wed, 10 May 2023 03:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pweKj-0001mt-2D
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pweKZ-0006AQ-8P
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683704015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72v/URg4hHDMd74JOjzRKQrPsye0d1IfPih1lYUu3p4=;
 b=cikmUzgMFnYmbNCygNn70VA1ZhuEUJYAUU9ccSlTD0pw/yDr5q2Po5+l3OSkl1f7BjFipR
 WkV9RVRp14zNCIVXmB42rp9xvNOX+fkdTe1HRj1Wq9mgpQJ+mUHKMnHL2KNlMTHuSEY1aH
 YBw7CYAkFgi5V8JsMPuYyy0l+f3gZlw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-DzcJe5GkPGOFop2MnKrOtA-1; Wed, 10 May 2023 03:33:34 -0400
X-MC-Unique: DzcJe5GkPGOFop2MnKrOtA-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-5287c9b01fdso6287582a12.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683704013; x=1686296013;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=72v/URg4hHDMd74JOjzRKQrPsye0d1IfPih1lYUu3p4=;
 b=ak3CCHWhlE/E5CZI25FK0xs148lH5qC1ZbBw3dSRKaRNuQYQwN0n+BpiKA7cc5NkkB
 jYa93wpnvM4/PJgeoQVIsCkK5MYkJlnn990BUQt6OuCMNMjXRw8cw/OwHXB17LtARROn
 oyaYJDHIy70ZwYFRhca0q7GDBg1uSyLgG+dmoa+QPsQgQk6XhsSQGqxj0xlNbxgB0OgO
 L9uVZxjh5xM5Sx1IBONgs2Ste28IkoWROWmjGgSYk5BvVCXtmDUT61KsbyPrPACfM4xT
 RRJiB6ht7zZqVo2sqxFydL78wMj2cqTxgmveA6gVMl6gfhpsPiXXk+byEzkrjpGp43Lt
 zBAg==
X-Gm-Message-State: AC+VfDzVdLAbjox0vQyfiETJ/h/MTT27W39181DfIhx5TjYcU68bX5Ip
 iE/GJA9gDo+OMmRuT/0Z06Yodje4z0eLJJY8foRCHNU26A4g2Sv9W6KYht8ByWSkPaTMXUJYE/4
 QVyJeQyc1wzbdr70=
X-Received: by 2002:a05:6a20:7f85:b0:f3:1c8b:ce54 with SMTP id
 d5-20020a056a207f8500b000f31c8bce54mr22267217pzj.4.1683704013038; 
 Wed, 10 May 2023 00:33:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Neu32cFDVqE8kCBmgk5fBRFhGIFOpYWzNT5K4djTRy8UayE1DzvJEhvcR9IuCxyrFVZwIrg==
X-Received: by 2002:a05:6a20:7f85:b0:f3:1c8b:ce54 with SMTP id
 d5-20020a056a207f8500b000f31c8bce54mr22267183pzj.4.1683704012666; 
 Wed, 10 May 2023 00:33:32 -0700 (PDT)
Received: from [10.72.12.209] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a63e14d000000b00524cfd635cesm2549934pgk.69.2023.05.10.00.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:33:32 -0700 (PDT)
Message-ID: <ec8bdc24-839a-932f-b519-7d956f4e284b@redhat.com>
Date: Wed, 10 May 2023 15:33:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 00/48] igb: Fix for DPDK
Content-Language: en-US
From: Jason Wang <jasowang@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
 <f176031e-6613-e78b-c8dd-69f13d3a4dcb@daynix.com>
 <CACGkMEuz2ajXGmd-JE_BLTfn9Xu=yq1mZckLLdjucnYfzVX1TA@mail.gmail.com>
In-Reply-To: <CACGkMEuz2ajXGmd-JE_BLTfn9Xu=yq1mZckLLdjucnYfzVX1TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/5/5 14:46, Jason Wang 写道:
> On Thu, May 4, 2023 at 2:45 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>> Hi Jason,
>>
>> Can you have a look at this series as well as the patch pointed to by
>> Based-on: tag?
> Just come back from vacation, I will have a look at it.


I've queued them.

Thanks


>
> Thanks
>
>
>> Regards,
>> Akihiko Odaki
>>
>> On 2023/04/26 19:36, Akihiko Odaki wrote:
>>> Based-on: <366bbcafdb6e0373f0deb105153768a8c0bded87.camel@gmail.com>
>>> ("[PATCH 0/1] e1000e: Fix tx/rx counters")
>>>
>>> This series has fixes and feature additions to pass DPDK Test Suite with
>>> igb. It also includes a few minor changes related to networking.
>>>
>>> Patch [01, 10] are bug fixes.
>>> Patch [11, 14] delete code which is unnecessary.
>>> Patch [15, 33] are minor changes.
>>> Patch [34, 46] implement new features.
>>> Patch [47, 48] update documentations.
>>>
>>> While this includes so many patches, it is not necessary to land them at
>>> once. Only bug fix patches may be applied first, for example.
>>>
>>> V3 -> V4:
>>> - Renamed "min_buf variable to "buf". (Sriram Yagnaraman)
>>> - Added patch "igb: Clear-on-read ICR when ICR.INTA is set".
>>>     (Sriram Yagnaraman)
>>>
>>> V2 -> V3:
>>> - Fixed parameter name in hw/net/net_tx_pkt. (Philippe Mathieu-Daudé)
>>> - Added patch "igb: Clear IMS bits when committing ICR access".
>>> - Added patch "igb: Clear EICR bits for delayed MSI-X interrupts".
>>> - Added patch "e1000e: Rename a variable in e1000e_receive_internal()".
>>> - Added patch "igb: Rename a variable in igb_receive_internal()".
>>> - Added patch "e1000e: Notify only new interrupts".
>>> - Added patch "igb: Notify only new interrupts".
>>>
>>> V1 -> V2:
>>> - Dropped patch "Include the second VLAN tag in the buffer". The second
>>>     VLAN tag is not used at the point and unecessary.
>>> - Added patch "e1000x: Rename TcpIpv6 into TcpIpv6Ex".
>>> - Split patch "hw/net/net_tx_pkt: Decouple from PCI".
>>>     (Philippe Mathieu-Daudé)
>>> - Added advanced Rx descriptor packet encoding definitions.
>>>     (Sriram Yagnaraman)
>>> - Added some constants to eth.h to derive packet oversize thresholds.
>>> - Added IGB_TX_FLAGS_VLAN_SHIFT usage.
>>> - Renamed patch "igb: Fix igb_mac_reg_init alignment".
>>>     (Philippe Mathieu-Daudé)
>>> - Fixed size check for packets with double VLAN. (Sriram Yagnaraman)
>>> - Fixed timing to timestamp Tx packet.
>>>
>>> Akihiko Odaki (48):
>>>     hw/net/net_tx_pkt: Decouple implementation from PCI
>>>     hw/net/net_tx_pkt: Decouple interface from PCI
>>>     e1000x: Fix BPRC and MPRC
>>>     igb: Fix Rx packet type encoding
>>>     igb: Do not require CTRL.VME for tx VLAN tagging
>>>     igb: Clear IMS bits when committing ICR access
>>>     net/net_rx_pkt: Use iovec for net_rx_pkt_set_protocols()
>>>     e1000e: Always copy ethernet header
>>>     igb: Always copy ethernet header
>>>     Fix references to igb Avocado test
>>>     tests/avocado: Remove unused imports
>>>     tests/avocado: Remove test_igb_nomsi_kvm
>>>     hw/net/net_tx_pkt: Remove net_rx_pkt_get_l4_info
>>>     net/eth: Rename eth_setup_vlan_headers_ex
>>>     e1000x: Share more Rx filtering logic
>>>     e1000x: Take CRC into consideration for size check
>>>     e1000x: Rename TcpIpv6 into TcpIpv6Ex
>>>     e1000e: Always log status after building rx metadata
>>>     igb: Always log status after building rx metadata
>>>     igb: Remove goto
>>>     igb: Read DCMD.VLE of the first Tx descriptor
>>>     e1000e: Reset packet state after emptying Tx queue
>>>     vmxnet3: Reset packet state after emptying Tx queue
>>>     igb: Add more definitions for Tx descriptor
>>>     igb: Share common VF constants
>>>     igb: Fix igb_mac_reg_init coding style alignment
>>>     igb: Clear EICR bits for delayed MSI-X interrupts
>>>     e1000e: Rename a variable in e1000e_receive_internal()
>>>     igb: Rename a variable in igb_receive_internal()
>>>     net/eth: Use void pointers
>>>     net/eth: Always add VLAN tag
>>>     hw/net/net_rx_pkt: Enforce alignment for eth_header
>>>     tests/qtest/libqos/igb: Set GPIE.Multiple_MSIX
>>>     igb: Implement MSI-X single vector mode
>>>     igb: Use UDP for RSS hash
>>>     igb: Implement Rx SCTP CSO
>>>     igb: Implement Tx SCTP CSO
>>>     igb: Strip the second VLAN tag for extended VLAN
>>>     igb: Filter with the second VLAN tag for extended VLAN
>>>     igb: Implement igb-specific oversize check
>>>     igb: Implement Rx PTP2 timestamp
>>>     igb: Implement Tx timestamp
>>>     e1000e: Notify only new interrupts
>>>     igb: Notify only new interrupts
>>>     igb: Clear-on-read ICR when ICR.INTA is set
>>>     vmxnet3: Do not depend on PC
>>>     MAINTAINERS: Add a reviewer for network packet abstractions
>>>     docs/system/devices/igb: Note igb is tested for DPDK
>>>
>>>    MAINTAINERS                                   |   3 +-
>>>    docs/system/devices/igb.rst                   |  14 +-
>>>    hw/net/e1000e_core.h                          |   2 -
>>>    hw/net/e1000x_common.h                        |   9 +-
>>>    hw/net/e1000x_regs.h                          |  24 +-
>>>    hw/net/igb_common.h                           |  24 +-
>>>    hw/net/igb_regs.h                             |  67 +-
>>>    hw/net/net_rx_pkt.h                           |  38 +-
>>>    hw/net/net_tx_pkt.h                           |  46 +-
>>>    include/net/eth.h                             |  29 +-
>>>    include/qemu/crc32c.h                         |   1 +
>>>    hw/net/e1000.c                                |  41 +-
>>>    hw/net/e1000e_core.c                          | 292 +++----
>>>    hw/net/e1000x_common.c                        |  79 +-
>>>    hw/net/igb.c                                  |  10 +-
>>>    hw/net/igb_core.c                             | 717 ++++++++++--------
>>>    hw/net/igbvf.c                                |   7 -
>>>    hw/net/net_rx_pkt.c                           | 107 ++-
>>>    hw/net/net_tx_pkt.c                           | 101 ++-
>>>    hw/net/virtio-net.c                           |   7 +-
>>>    hw/net/vmxnet3.c                              |  22 +-
>>>    net/eth.c                                     | 100 +--
>>>    tests/qtest/libqos/igb.c                      |   1 +
>>>    util/crc32c.c                                 |   8 +
>>>    hw/net/Kconfig                                |   2 +-
>>>    hw/net/trace-events                           |  19 +-
>>>    .../org.centos/stream/8/x86_64/test-avocado   |   3 +-
>>>    tests/avocado/netdev-ethtool.py               |  17 +-
>>>    28 files changed, 969 insertions(+), 821 deletions(-)
>>>


