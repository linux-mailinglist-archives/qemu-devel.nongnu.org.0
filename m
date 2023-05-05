Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57C06F7D3A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 08:48:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pupD4-0006EU-PI; Fri, 05 May 2023 02:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pupD3-0006EE-6j
 for qemu-devel@nongnu.org; Fri, 05 May 2023 02:46:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pupD1-00011W-CQ
 for qemu-devel@nongnu.org; Fri, 05 May 2023 02:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683269186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQjGzc8irknUmSO+s2y49ZSpkqutgyquF0A38kTakJo=;
 b=AxqeIPen6iJQiF25hExhHMdUeFN13Elnyir7y41ZSdbBFtkcPq9MNjUlXXeX1VHsQ5SmIW
 ow7BggsxCxedMrzn3xkGvTMm60SHpq4wFZcafYjW9WQGj4aiaux6UU3RpSv5afphyI4m9t
 Y5l7rjMxy/ZyZ05//prwINY+CveeGcA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-yfV1UVDmNgKaJ_JUrm-LzA-1; Fri, 05 May 2023 02:46:24 -0400
X-MC-Unique: yfV1UVDmNgKaJ_JUrm-LzA-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ac79d95000so6990541fa.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 23:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683269183; x=1685861183;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CQjGzc8irknUmSO+s2y49ZSpkqutgyquF0A38kTakJo=;
 b=JdyBqBbachZ6x/lUTR3E6yRqICq4ERjCtxN0QIzGwfGkObQsJKXXe8RqSsumPZu6GG
 mADb5H2Vx4CgaNpXX5tTMynt8NJHWw3CLE6nYAUrzZZ3BB6edk/eLNIp5X1Ni+SzStel
 0ZyFOw5rfCnea3m3QqgO0nPhC54RpSgj3LhVl8HN3dpUT5D1dqmT71VE/Rsx+o25/nBL
 +xWXJqJnYfj8Qh1eXc0f65V+YqjSP0xQabt6ApkSKxWZuv7enzilUU7QmojJqhLo21WD
 k8EJqE/UNCP6U9+Q3M1azFUsCO6juUQDdEYcafqmgCdbB9ea+SoP8Fjq5GFm11IXVcOY
 e97g==
X-Gm-Message-State: AC+VfDzj/RdQGqR8HnQ2EjHYdvJYe5EyuycafWc6UAJbYt7mARNmdBgY
 QgiB6c5Q2lZK79UFQ2DdfOTgxEENoVy2BkqbcfSMaCGJrIfD1uc7B9CxDyh9q3MhGynwnoat/Tu
 jjrritCmPsUhdUK1fYLYoau1xGZVGpnE=
X-Received: by 2002:a2e:3606:0:b0:2a8:b262:35ee with SMTP id
 d6-20020a2e3606000000b002a8b26235eemr94704lja.31.1683269182941; 
 Thu, 04 May 2023 23:46:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KyDsGYxQnxJTYmu7twT14HnB/3ymZFDXkMxQcTmwCa7KX0eUQYGHHt8Ki4+9wiM6vq8ZbYyCXolmNzylCFCg=
X-Received: by 2002:a2e:3606:0:b0:2a8:b262:35ee with SMTP id
 d6-20020a2e3606000000b002a8b26235eemr94701lja.31.1683269182635; Thu, 04 May
 2023 23:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
 <f176031e-6613-e78b-c8dd-69f13d3a4dcb@daynix.com>
In-Reply-To: <f176031e-6613-e78b-c8dd-69f13d3a4dcb@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 May 2023 14:46:11 +0800
Message-ID: <CACGkMEuz2ajXGmd-JE_BLTfn9Xu=yq1mZckLLdjucnYfzVX1TA@mail.gmail.com>
Subject: Re: [PATCH v4 00/48] igb: Fix for DPDK
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
 Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 4, 2023 at 2:45=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix.=
com> wrote:
>
> Hi Jason,
>
> Can you have a look at this series as well as the patch pointed to by
> Based-on: tag?

Just come back from vacation, I will have a look at it.

Thanks


>
> Regards,
> Akihiko Odaki
>
> On 2023/04/26 19:36, Akihiko Odaki wrote:
> > Based-on: <366bbcafdb6e0373f0deb105153768a8c0bded87.camel@gmail.com>
> > ("[PATCH 0/1] e1000e: Fix tx/rx counters")
> >
> > This series has fixes and feature additions to pass DPDK Test Suite wit=
h
> > igb. It also includes a few minor changes related to networking.
> >
> > Patch [01, 10] are bug fixes.
> > Patch [11, 14] delete code which is unnecessary.
> > Patch [15, 33] are minor changes.
> > Patch [34, 46] implement new features.
> > Patch [47, 48] update documentations.
> >
> > While this includes so many patches, it is not necessary to land them a=
t
> > once. Only bug fix patches may be applied first, for example.
> >
> > V3 -> V4:
> > - Renamed "min_buf variable to "buf". (Sriram Yagnaraman)
> > - Added patch "igb: Clear-on-read ICR when ICR.INTA is set".
> >    (Sriram Yagnaraman)
> >
> > V2 -> V3:
> > - Fixed parameter name in hw/net/net_tx_pkt. (Philippe Mathieu-Daud=C3=
=A9)
> > - Added patch "igb: Clear IMS bits when committing ICR access".
> > - Added patch "igb: Clear EICR bits for delayed MSI-X interrupts".
> > - Added patch "e1000e: Rename a variable in e1000e_receive_internal()".
> > - Added patch "igb: Rename a variable in igb_receive_internal()".
> > - Added patch "e1000e: Notify only new interrupts".
> > - Added patch "igb: Notify only new interrupts".
> >
> > V1 -> V2:
> > - Dropped patch "Include the second VLAN tag in the buffer". The second
> >    VLAN tag is not used at the point and unecessary.
> > - Added patch "e1000x: Rename TcpIpv6 into TcpIpv6Ex".
> > - Split patch "hw/net/net_tx_pkt: Decouple from PCI".
> >    (Philippe Mathieu-Daud=C3=A9)
> > - Added advanced Rx descriptor packet encoding definitions.
> >    (Sriram Yagnaraman)
> > - Added some constants to eth.h to derive packet oversize thresholds.
> > - Added IGB_TX_FLAGS_VLAN_SHIFT usage.
> > - Renamed patch "igb: Fix igb_mac_reg_init alignment".
> >    (Philippe Mathieu-Daud=C3=A9)
> > - Fixed size check for packets with double VLAN. (Sriram Yagnaraman)
> > - Fixed timing to timestamp Tx packet.
> >
> > Akihiko Odaki (48):
> >    hw/net/net_tx_pkt: Decouple implementation from PCI
> >    hw/net/net_tx_pkt: Decouple interface from PCI
> >    e1000x: Fix BPRC and MPRC
> >    igb: Fix Rx packet type encoding
> >    igb: Do not require CTRL.VME for tx VLAN tagging
> >    igb: Clear IMS bits when committing ICR access
> >    net/net_rx_pkt: Use iovec for net_rx_pkt_set_protocols()
> >    e1000e: Always copy ethernet header
> >    igb: Always copy ethernet header
> >    Fix references to igb Avocado test
> >    tests/avocado: Remove unused imports
> >    tests/avocado: Remove test_igb_nomsi_kvm
> >    hw/net/net_tx_pkt: Remove net_rx_pkt_get_l4_info
> >    net/eth: Rename eth_setup_vlan_headers_ex
> >    e1000x: Share more Rx filtering logic
> >    e1000x: Take CRC into consideration for size check
> >    e1000x: Rename TcpIpv6 into TcpIpv6Ex
> >    e1000e: Always log status after building rx metadata
> >    igb: Always log status after building rx metadata
> >    igb: Remove goto
> >    igb: Read DCMD.VLE of the first Tx descriptor
> >    e1000e: Reset packet state after emptying Tx queue
> >    vmxnet3: Reset packet state after emptying Tx queue
> >    igb: Add more definitions for Tx descriptor
> >    igb: Share common VF constants
> >    igb: Fix igb_mac_reg_init coding style alignment
> >    igb: Clear EICR bits for delayed MSI-X interrupts
> >    e1000e: Rename a variable in e1000e_receive_internal()
> >    igb: Rename a variable in igb_receive_internal()
> >    net/eth: Use void pointers
> >    net/eth: Always add VLAN tag
> >    hw/net/net_rx_pkt: Enforce alignment for eth_header
> >    tests/qtest/libqos/igb: Set GPIE.Multiple_MSIX
> >    igb: Implement MSI-X single vector mode
> >    igb: Use UDP for RSS hash
> >    igb: Implement Rx SCTP CSO
> >    igb: Implement Tx SCTP CSO
> >    igb: Strip the second VLAN tag for extended VLAN
> >    igb: Filter with the second VLAN tag for extended VLAN
> >    igb: Implement igb-specific oversize check
> >    igb: Implement Rx PTP2 timestamp
> >    igb: Implement Tx timestamp
> >    e1000e: Notify only new interrupts
> >    igb: Notify only new interrupts
> >    igb: Clear-on-read ICR when ICR.INTA is set
> >    vmxnet3: Do not depend on PC
> >    MAINTAINERS: Add a reviewer for network packet abstractions
> >    docs/system/devices/igb: Note igb is tested for DPDK
> >
> >   MAINTAINERS                                   |   3 +-
> >   docs/system/devices/igb.rst                   |  14 +-
> >   hw/net/e1000e_core.h                          |   2 -
> >   hw/net/e1000x_common.h                        |   9 +-
> >   hw/net/e1000x_regs.h                          |  24 +-
> >   hw/net/igb_common.h                           |  24 +-
> >   hw/net/igb_regs.h                             |  67 +-
> >   hw/net/net_rx_pkt.h                           |  38 +-
> >   hw/net/net_tx_pkt.h                           |  46 +-
> >   include/net/eth.h                             |  29 +-
> >   include/qemu/crc32c.h                         |   1 +
> >   hw/net/e1000.c                                |  41 +-
> >   hw/net/e1000e_core.c                          | 292 +++----
> >   hw/net/e1000x_common.c                        |  79 +-
> >   hw/net/igb.c                                  |  10 +-
> >   hw/net/igb_core.c                             | 717 ++++++++++-------=
-
> >   hw/net/igbvf.c                                |   7 -
> >   hw/net/net_rx_pkt.c                           | 107 ++-
> >   hw/net/net_tx_pkt.c                           | 101 ++-
> >   hw/net/virtio-net.c                           |   7 +-
> >   hw/net/vmxnet3.c                              |  22 +-
> >   net/eth.c                                     | 100 +--
> >   tests/qtest/libqos/igb.c                      |   1 +
> >   util/crc32c.c                                 |   8 +
> >   hw/net/Kconfig                                |   2 +-
> >   hw/net/trace-events                           |  19 +-
> >   .../org.centos/stream/8/x86_64/test-avocado   |   3 +-
> >   tests/avocado/netdev-ethtool.py               |  17 +-
> >   28 files changed, 969 insertions(+), 821 deletions(-)
> >
>


