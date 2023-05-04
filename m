Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBB06F6532
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 08:46:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puSiS-0004RT-OS; Thu, 04 May 2023 02:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1puSiM-0004RA-7p
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:45:18 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1puSiI-0007AX-NJ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:45:16 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1aad5245632so332745ad.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 23:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683182713; x=1685774713;
 h=content-transfer-encoding:in-reply-to:from:to:references:cc
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ZfRRK7t2FLOx+oXbnn21OrN1Pacbzrgq6sqg4+OAiQ=;
 b=XETVL+JqO3AY/ZiBECTQfb5h4mquPCWJ8UyOCRQIQNN7YndWoaEblmC8Sog687l5++
 Ypa9CBVa7ocmOx8OJH6MutiUBdOpR2637Y80aPrsavBugPBVS/fPgKUq8V0+znG2wrBA
 joA+PSLZnROqmOnvZU+L1rG4i5q3WeXCwU4F87EvT5lRdFi8LiLkeHsf4PoGKRjOWNaf
 45Lf7XxoKys1isP98Uv1nXWgyAtRL1x1qlLztLPhA7WG6Vr3aZoiTjNVpXb28XdlXkku
 nhlnLJoD4kM3bqOOkBhXtA/S+Qy/LS14AqlZqUO5Id02vUVi/KiugWodDt2sLjn6xPEw
 w/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683182713; x=1685774713;
 h=content-transfer-encoding:in-reply-to:from:to:references:cc
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ZfRRK7t2FLOx+oXbnn21OrN1Pacbzrgq6sqg4+OAiQ=;
 b=j1xF8vdhtpYgDLDQw6tUHK2hz5sjkGaB5VAYWn8uHCvybAKil5fNLWq+2ODwhjRBmP
 fE9nQsrroKEzFbw09MQ7qxv6gAF22vSoWu1HEcfPydPnYJSpCy+Yrv+pTrM+fFF10QXY
 Sn9cxTvrLA0ucK6IdTtnhyWlT85lJ9RHgfaJWiJpvsojBIDWT362k3t+12/alK1hUbe2
 3wGEjhT5dOgVIIWvTpycJIq+dl4GYbPR+9ju/ygGFKdiqdMf8axsnhu9m4We5owd4N3F
 4BSfCE5XfGvN/hNTLLoZcV7+/auz3q4STATh2TijGQFI66NfWhEP1qC2HWUvz/A2n7Lm
 FNtQ==
X-Gm-Message-State: AC+VfDzo+0ELBzQvN6iU+BlLO4KBBH0F9KbTTKsEI5qgAttr4LnM4INB
 KmXXcnHmtoK1JhQNcssiLfT9vg==
X-Google-Smtp-Source: ACHHUZ6PZxRMyDXLyhL4RqhxivIJdUr96cldOAAUgVcW9GtL4G0j/9ZRJtS/uBG2RkkR1Ddum8nvyA==
X-Received: by 2002:a17:903:2349:b0:1a9:581d:3efb with SMTP id
 c9-20020a170903234900b001a9581d3efbmr3096658plh.6.1683182713157; 
 Wed, 03 May 2023 23:45:13 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170902a9c500b001a4fa2f7a23sm22660905plr.274.2023.05.03.23.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 23:45:12 -0700 (PDT)
Message-ID: <f176031e-6613-e78b-c8dd-69f13d3a4dcb@daynix.com>
Date: Thu, 4 May 2023 15:45:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 00/48] igb: Fix for DPDK
Content-Language: en-US
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
To: Jason Wang <jasowang@redhat.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Hi Jason,

Can you have a look at this series as well as the patch pointed to by 
Based-on: tag?

Regards,
Akihiko Odaki

On 2023/04/26 19:36, Akihiko Odaki wrote:
> Based-on: <366bbcafdb6e0373f0deb105153768a8c0bded87.camel@gmail.com>
> ("[PATCH 0/1] e1000e: Fix tx/rx counters")
> 
> This series has fixes and feature additions to pass DPDK Test Suite with
> igb. It also includes a few minor changes related to networking.
> 
> Patch [01, 10] are bug fixes.
> Patch [11, 14] delete code which is unnecessary.
> Patch [15, 33] are minor changes.
> Patch [34, 46] implement new features.
> Patch [47, 48] update documentations.
> 
> While this includes so many patches, it is not necessary to land them at
> once. Only bug fix patches may be applied first, for example.
> 
> V3 -> V4:
> - Renamed "min_buf variable to "buf". (Sriram Yagnaraman)
> - Added patch "igb: Clear-on-read ICR when ICR.INTA is set".
>    (Sriram Yagnaraman)
> 
> V2 -> V3:
> - Fixed parameter name in hw/net/net_tx_pkt. (Philippe Mathieu-Daudé)
> - Added patch "igb: Clear IMS bits when committing ICR access".
> - Added patch "igb: Clear EICR bits for delayed MSI-X interrupts".
> - Added patch "e1000e: Rename a variable in e1000e_receive_internal()".
> - Added patch "igb: Rename a variable in igb_receive_internal()".
> - Added patch "e1000e: Notify only new interrupts".
> - Added patch "igb: Notify only new interrupts".
> 
> V1 -> V2:
> - Dropped patch "Include the second VLAN tag in the buffer". The second
>    VLAN tag is not used at the point and unecessary.
> - Added patch "e1000x: Rename TcpIpv6 into TcpIpv6Ex".
> - Split patch "hw/net/net_tx_pkt: Decouple from PCI".
>    (Philippe Mathieu-Daudé)
> - Added advanced Rx descriptor packet encoding definitions.
>    (Sriram Yagnaraman)
> - Added some constants to eth.h to derive packet oversize thresholds.
> - Added IGB_TX_FLAGS_VLAN_SHIFT usage.
> - Renamed patch "igb: Fix igb_mac_reg_init alignment".
>    (Philippe Mathieu-Daudé)
> - Fixed size check for packets with double VLAN. (Sriram Yagnaraman)
> - Fixed timing to timestamp Tx packet.
> 
> Akihiko Odaki (48):
>    hw/net/net_tx_pkt: Decouple implementation from PCI
>    hw/net/net_tx_pkt: Decouple interface from PCI
>    e1000x: Fix BPRC and MPRC
>    igb: Fix Rx packet type encoding
>    igb: Do not require CTRL.VME for tx VLAN tagging
>    igb: Clear IMS bits when committing ICR access
>    net/net_rx_pkt: Use iovec for net_rx_pkt_set_protocols()
>    e1000e: Always copy ethernet header
>    igb: Always copy ethernet header
>    Fix references to igb Avocado test
>    tests/avocado: Remove unused imports
>    tests/avocado: Remove test_igb_nomsi_kvm
>    hw/net/net_tx_pkt: Remove net_rx_pkt_get_l4_info
>    net/eth: Rename eth_setup_vlan_headers_ex
>    e1000x: Share more Rx filtering logic
>    e1000x: Take CRC into consideration for size check
>    e1000x: Rename TcpIpv6 into TcpIpv6Ex
>    e1000e: Always log status after building rx metadata
>    igb: Always log status after building rx metadata
>    igb: Remove goto
>    igb: Read DCMD.VLE of the first Tx descriptor
>    e1000e: Reset packet state after emptying Tx queue
>    vmxnet3: Reset packet state after emptying Tx queue
>    igb: Add more definitions for Tx descriptor
>    igb: Share common VF constants
>    igb: Fix igb_mac_reg_init coding style alignment
>    igb: Clear EICR bits for delayed MSI-X interrupts
>    e1000e: Rename a variable in e1000e_receive_internal()
>    igb: Rename a variable in igb_receive_internal()
>    net/eth: Use void pointers
>    net/eth: Always add VLAN tag
>    hw/net/net_rx_pkt: Enforce alignment for eth_header
>    tests/qtest/libqos/igb: Set GPIE.Multiple_MSIX
>    igb: Implement MSI-X single vector mode
>    igb: Use UDP for RSS hash
>    igb: Implement Rx SCTP CSO
>    igb: Implement Tx SCTP CSO
>    igb: Strip the second VLAN tag for extended VLAN
>    igb: Filter with the second VLAN tag for extended VLAN
>    igb: Implement igb-specific oversize check
>    igb: Implement Rx PTP2 timestamp
>    igb: Implement Tx timestamp
>    e1000e: Notify only new interrupts
>    igb: Notify only new interrupts
>    igb: Clear-on-read ICR when ICR.INTA is set
>    vmxnet3: Do not depend on PC
>    MAINTAINERS: Add a reviewer for network packet abstractions
>    docs/system/devices/igb: Note igb is tested for DPDK
> 
>   MAINTAINERS                                   |   3 +-
>   docs/system/devices/igb.rst                   |  14 +-
>   hw/net/e1000e_core.h                          |   2 -
>   hw/net/e1000x_common.h                        |   9 +-
>   hw/net/e1000x_regs.h                          |  24 +-
>   hw/net/igb_common.h                           |  24 +-
>   hw/net/igb_regs.h                             |  67 +-
>   hw/net/net_rx_pkt.h                           |  38 +-
>   hw/net/net_tx_pkt.h                           |  46 +-
>   include/net/eth.h                             |  29 +-
>   include/qemu/crc32c.h                         |   1 +
>   hw/net/e1000.c                                |  41 +-
>   hw/net/e1000e_core.c                          | 292 +++----
>   hw/net/e1000x_common.c                        |  79 +-
>   hw/net/igb.c                                  |  10 +-
>   hw/net/igb_core.c                             | 717 ++++++++++--------
>   hw/net/igbvf.c                                |   7 -
>   hw/net/net_rx_pkt.c                           | 107 ++-
>   hw/net/net_tx_pkt.c                           | 101 ++-
>   hw/net/virtio-net.c                           |   7 +-
>   hw/net/vmxnet3.c                              |  22 +-
>   net/eth.c                                     | 100 +--
>   tests/qtest/libqos/igb.c                      |   1 +
>   util/crc32c.c                                 |   8 +
>   hw/net/Kconfig                                |   2 +-
>   hw/net/trace-events                           |  19 +-
>   .../org.centos/stream/8/x86_64/test-avocado   |   3 +-
>   tests/avocado/netdev-ethtool.py               |  17 +-
>   28 files changed, 969 insertions(+), 821 deletions(-)
> 

