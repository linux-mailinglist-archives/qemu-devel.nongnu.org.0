Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6096E8EB2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:55:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQzr-0001tS-Qo; Thu, 20 Apr 2023 05:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQzp-0001tE-Qz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:54:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQzn-0000sc-1T
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:54:33 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso14972185e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681984469; x=1684576469;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NFLZlCDKDz/BN67yChb991SQWZgDP0QpB1fyvfRc034=;
 b=jNQT6a1ai1cfcDold84Fmf6TyLr5KYMcr4RK7T5qw+v5yA4hsbWkjwpKeFOhg5VUBh
 qdMfk9iRfrvuInWzJHEePF+x/abXhkgmN+EhIpT8hm34nx2XsQ4AXs74cHTMRM2hGnU8
 5970TVhKrfblLUPdalXT1atCBzS9rN1pk4NG88L702mI7J6D5isoCgXNgfDU1f+wCgni
 Rx3Q6Q2nDoXLDto6Doj0EQPb4A8T9QJFuph8+w4oyDHvTFNKgmpfpmWNl19BktxUCjnB
 x9ngMpnaNnVbOg6nT12+1sYp3K35INi2E7RVSDWvZDKFMWk0WqG9L16HICn39KcvlEJM
 QDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681984469; x=1684576469;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NFLZlCDKDz/BN67yChb991SQWZgDP0QpB1fyvfRc034=;
 b=DePcmEHAl2eGDwIiAof86cE3Vnn1CacpzBwbiCCeqbDixQzJbOYM4rQJ/ktvMKuYv0
 kRT9CHv961wcxbnv33g6v0yNw3x4yTOClDHJPl5McNEXi7fGa1lG0fD+Md72wKWKJC/+
 L/n5ETqcBfqVBOP8SXAlG26+HuP4E/dylbuOt/HwP0BEB3TAVh6bAqHQyVtM1P12uVuB
 +DiFiyqUb0gyyDYa9EnD+X5rYW3k/595eX67TWve6QHHbIX1SZhNAvA/1GCwEG7vNceB
 pxwmhm0MUKZMBw3r6Bn+t/d4ooxzMRbpxxPR1xJRARhYL/SjmYtqVA7iLO9mbBKncy+L
 M68Q==
X-Gm-Message-State: AAQBX9dbk/2fFSGUyerlNx/Dci8oKGKbeK0fGASgD0OYeLAIGMZachhY
 N43p69k4kuh0hKObtfbvJNFsfw==
X-Google-Smtp-Source: AKy350bf5qPfaOYIv2qNwdvV8U+C8MyQwZKC3Ccc9RJkGERryTOQFNp8wI8Ix/m+2/AW9ZgTRiF2gA==
X-Received: by 2002:a5d:518e:0:b0:2fa:7203:5bae with SMTP id
 k14-20020a5d518e000000b002fa72035baemr4294598wrv.18.1681984469311; 
 Thu, 20 Apr 2023 02:54:29 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j3-20020a5d6183000000b002faaa9a1721sm1504805wru.58.2023.04.20.02.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:54:28 -0700 (PDT)
Message-ID: <a38922a7-ee0b-dcac-a232-be48cc89fc60@linaro.org>
Date: Thu, 20 Apr 2023 11:54:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/41] hw/net/net_tx_pkt: Decouple interface from PCI
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-3-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420054657.50367-3-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 20/4/23 07:46, Akihiko Odaki wrote:
> This allows to use the network packet abstractions even if PCI is not
> used.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/net_tx_pkt.h  | 31 ++++++++++++++++++++-----------
>   hw/net/e1000e_core.c | 13 ++++++++-----
>   hw/net/igb_core.c    | 13 ++++++-------
>   hw/net/net_tx_pkt.c  | 36 +++++++++++++-----------------------
>   hw/net/vmxnet3.c     | 14 +++++++-------
>   5 files changed, 54 insertions(+), 53 deletions(-)
> 
> diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
> index 5eb123ef90..f5cd44da6f 100644
> --- a/hw/net/net_tx_pkt.h
> +++ b/hw/net/net_tx_pkt.h
> @@ -26,17 +26,16 @@
>   
>   struct NetTxPkt;
>   
> -typedef void (* NetTxPktCallback)(void *, const struct iovec *, int, const struct iovec *, int);
> +typedef void (*NetTxPktFreeFrag)(void *, void *, size_t);

If you don't want to restrict to PCIDevice, you can still use DeviceState:

    typedef void (*NetTxPktFreeFrag)(DeviceState *, void *, size_t);

> +typedef void (*NetTxPktSend)(void *, const struct iovec *, int, const struct iovec *, int);
>   
>   /**
>    * Init function for tx packet functionality
>    *
>    * @pkt:            packet pointer
> - * @pci_dev:        PCI device processing this packet
>    * @max_frags:      max tx ip fragments
>    */
> -void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
> -    uint32_t max_frags);
> +void net_tx_pkt_init(struct NetTxPkt **pkt, uint32_t max_frags);
>   
>   /**
>    * Clean all tx packet resources.
> @@ -95,12 +94,11 @@ net_tx_pkt_setup_vlan_header(struct NetTxPkt *pkt, uint16_t vlan)
>    * populate data fragment into pkt context.
>    *
>    * @pkt:            packet
> - * @pa:             physical address of fragment
> + * @pa:             pointer to fragment

You renamed it @base.

>    * @len:            length of fragment
>    *
>    */
> -bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
> -    size_t len);
> +bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, void *base, size_t len);
>   
>   /**
>    * Fix ip header fields and calculate IP header and pseudo header checksums.
> @@ -148,10 +146,11 @@ void net_tx_pkt_dump(struct NetTxPkt *pkt);
>    * reset tx packet private context (needed to be called between packets)
>    *
>    * @pkt:            packet
> - * @dev:            PCI device processing the next packet
> - *
> + * @callback:       function to free the fragments
> + * @context:        pointer to be passed to the callback
>    */
> -void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *dev);
> +void net_tx_pkt_reset(struct NetTxPkt *pkt,
> +                      NetTxPktFreeFrag callback, void *context);
>   
>   /**
>    * Unmap a fragment mapped from a PCI device.
> @@ -162,6 +161,16 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *dev);
>    */
>   void net_tx_pkt_unmap_frag_pci(void *context, void *base, size_t len);
>   
> +/**
> + * map data fragment from PCI device and populate it into pkt context.
> + *
> + * @pci_dev:        PCI device owning fragment
> + * @pa:             physical address of fragment
> + * @len:            length of fragment
> + */
> +bool net_tx_pkt_add_raw_fragment_pci(struct NetTxPkt *pkt, PCIDevice *pci_dev,
> +                                     dma_addr_t pa, size_t len);

(following previous patch comment, here too you use dma_addr_t).

> +
>   /**
>    * Send packet to qemu. handles sw offloads if vhdr is not supported.
>    *
> @@ -182,7 +191,7 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc);
>    * @ret:            operation result
>    */
>   bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
> -                            NetTxPktCallback callback, void *context);
> +                            NetTxPktSend callback, void *context);
>   
>   /**
>    * parse raw packet data and analyze offload requirements.
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index cfa3f55e96..15821a75e0 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -746,7 +746,8 @@ e1000e_process_tx_desc(E1000ECore *core,
>       addr = le64_to_cpu(dp->buffer_addr);
>   
>       if (!tx->skip_cp) {
> -        if (!net_tx_pkt_add_raw_fragment(tx->tx_pkt, addr, split_size)) {
> +        if (!net_tx_pkt_add_raw_fragment_pci(tx->tx_pkt, core->owner,
> +                                             addr, split_size)) {
>               tx->skip_cp = true;
>           }
>       }
> @@ -764,7 +765,7 @@ e1000e_process_tx_desc(E1000ECore *core,
>           }
>   
>           tx->skip_cp = false;
> -        net_tx_pkt_reset(tx->tx_pkt, core->owner);
> +        net_tx_pkt_reset(tx->tx_pkt, net_tx_pkt_unmap_frag_pci, core->owner);
>   
>           tx->sum_needed = 0;
>           tx->cptse = 0;
> @@ -3421,7 +3422,7 @@ e1000e_core_pci_realize(E1000ECore     *core,
>           qemu_add_vm_change_state_handler(e1000e_vm_state_change, core);
>   
>       for (i = 0; i < E1000E_NUM_QUEUES; i++) {
> -        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, E1000E_MAX_TX_FRAGS);
> +        net_tx_pkt_init(&core->tx[i].tx_pkt, E1000E_MAX_TX_FRAGS);
>       }
>   
>       net_rx_pkt_init(&core->rx_pkt);
> @@ -3446,7 +3447,8 @@ e1000e_core_pci_uninit(E1000ECore *core)
>       qemu_del_vm_change_state_handler(core->vmstate);
>   
>       for (i = 0; i < E1000E_NUM_QUEUES; i++) {
> -        net_tx_pkt_reset(core->tx[i].tx_pkt, core->owner);
> +        net_tx_pkt_reset(core->tx[i].tx_pkt,
> +                         net_tx_pkt_unmap_frag_pci, core->owner);
>           net_tx_pkt_uninit(core->tx[i].tx_pkt);
>       }
>   
> @@ -3571,7 +3573,8 @@ static void e1000e_reset(E1000ECore *core, bool sw)
>       e1000x_reset_mac_addr(core->owner_nic, core->mac, core->permanent_mac);
>   
>       for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
> -        net_tx_pkt_reset(core->tx[i].tx_pkt, core->owner);
> +        net_tx_pkt_reset(core->tx[i].tx_pkt,
> +                         net_tx_pkt_unmap_frag_pci, core->owner);
>           memset(&core->tx[i].props, 0, sizeof(core->tx[i].props));
>           core->tx[i].skip_cp = false;
>       }
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 826e7a6cf1..abfdce9aaf 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -597,7 +597,8 @@ igb_process_tx_desc(IGBCore *core,
>       length = cmd_type_len & 0xFFFF;
>   
>       if (!tx->skip_cp) {
> -        if (!net_tx_pkt_add_raw_fragment(tx->tx_pkt, buffer_addr, length)) {
> +        if (!net_tx_pkt_add_raw_fragment_pci(tx->tx_pkt, dev,
> +                                             buffer_addr, length)) {
>               tx->skip_cp = true;
>           }
>       }
> @@ -616,7 +617,7 @@ igb_process_tx_desc(IGBCore *core,
>   
>           tx->first = true;
>           tx->skip_cp = false;
> -        net_tx_pkt_reset(tx->tx_pkt, dev);
> +        net_tx_pkt_reset(tx->tx_pkt, net_tx_pkt_unmap_frag_pci, dev);
>       }
>   }
>   
> @@ -842,8 +843,6 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>           d = core->owner;
>       }
>   
> -    net_tx_pkt_reset(txr->tx->tx_pkt, d);
> -
>       while (!igb_ring_empty(core, txi)) {
>           base = igb_ring_head_descr(core, txi);
>   
> @@ -861,6 +860,8 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>           core->mac[EICR] |= eic;
>           igb_set_interrupt_cause(core, E1000_ICR_TXDW);
>       }
> +
> +    net_tx_pkt_reset(txr->tx->tx_pkt, net_tx_pkt_unmap_frag_pci, d);
>   }
>   
>   static uint32_t
> @@ -3954,7 +3955,7 @@ igb_core_pci_realize(IGBCore        *core,
>       core->vmstate = qemu_add_vm_change_state_handler(igb_vm_state_change, core);
>   
>       for (i = 0; i < IGB_NUM_QUEUES; i++) {
> -        net_tx_pkt_init(&core->tx[i].tx_pkt, NULL, E1000E_MAX_TX_FRAGS);
> +        net_tx_pkt_init(&core->tx[i].tx_pkt, E1000E_MAX_TX_FRAGS);
>       }
>   
>       net_rx_pkt_init(&core->rx_pkt);
> @@ -3979,7 +3980,6 @@ igb_core_pci_uninit(IGBCore *core)
>       qemu_del_vm_change_state_handler(core->vmstate);
>   
>       for (i = 0; i < IGB_NUM_QUEUES; i++) {
> -        net_tx_pkt_reset(core->tx[i].tx_pkt, NULL);
>           net_tx_pkt_uninit(core->tx[i].tx_pkt);
>       }
>   
> @@ -4158,7 +4158,6 @@ static void igb_reset(IGBCore *core, bool sw)
>   
>       for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
>           tx = &core->tx[i];
> -        net_tx_pkt_reset(tx->tx_pkt, NULL);
>           memset(tx->ctx, 0, sizeof(tx->ctx));
>           tx->first = true;
>           tx->skip_cp = false;
> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> index aca12ff035..cc36750c9b 100644
> --- a/hw/net/net_tx_pkt.c
> +++ b/hw/net/net_tx_pkt.c
> @@ -16,12 +16,12 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "net_tx_pkt.h"
>   #include "net/eth.h"
>   #include "net/checksum.h"
>   #include "net/tap.h"
>   #include "net/net.h"
>   #include "hw/pci/pci_device.h"
> +#include "net_tx_pkt.h"
>   
>   enum {
>       NET_TX_PKT_VHDR_FRAG = 0,
> @@ -32,8 +32,6 @@ enum {
>   
>   /* TX packet private context */
>   struct NetTxPkt {
> -    PCIDevice *pci_dev;
> -
>       struct virtio_net_hdr virt_hdr;
>   
>       struct iovec *raw;
> @@ -59,13 +57,10 @@ struct NetTxPkt {
>       uint8_t l4proto;
>   };
>   
> -void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
> -    uint32_t max_frags)
> +void net_tx_pkt_init(struct NetTxPkt **pkt, uint32_t max_frags)
>   {
>       struct NetTxPkt *p = g_malloc0(sizeof *p);
>   
> -    p->pci_dev = pci_dev;
> -
>       p->vec = g_new(struct iovec, max_frags + NET_TX_PKT_PL_START_FRAG);
>   
>       p->raw = g_new(struct iovec, max_frags);
> @@ -384,8 +379,7 @@ void net_tx_pkt_setup_vlan_header_ex(struct NetTxPkt *pkt,
>       }
>   }
>   
> -static bool net_tx_pkt_add_raw_fragment_common(struct NetTxPkt *pkt,
> -                                               void *base, size_t len)
> +bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, void *base, size_t len)
>   {
>       struct iovec *ventry;
>       assert(pkt);
> @@ -433,7 +427,8 @@ void net_tx_pkt_dump(struct NetTxPkt *pkt)
>   #endif
>   }
>   
> -void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *pci_dev)
> +void net_tx_pkt_reset(struct NetTxPkt *pkt,
> +                      NetTxPktFreeFrag callback, void *context)

'void *context' -> 'DeviceState *dev'.

>   {
>       int i;
>   
> @@ -453,12 +448,9 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *pci_dev)
>           assert(pkt->raw);
>           for (i = 0; i < pkt->raw_frags; i++) {
>               assert(pkt->raw[i].iov_base);
> -            net_tx_pkt_unmap_frag_pci(pkt->pci_dev,
> -                                      pkt->raw[i].iov_base,
> -                                      pkt->raw[i].iov_len);
> +            callback(context, pkt->raw[i].iov_base, pkt->raw[i].iov_len);
>           }
>       }
> -    pkt->pci_dev = pci_dev;
>       pkt->raw_frags = 0;
>   
>       pkt->hdr_len = 0;
> @@ -470,19 +462,17 @@ void net_tx_pkt_unmap_frag_pci(void *context, void *base, size_t len)
>       pci_dma_unmap(context, base, len, DMA_DIRECTION_TO_DEVICE, 0);
>   }
>   
> -bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
> -    size_t len)
> +bool net_tx_pkt_add_raw_fragment_pci(struct NetTxPkt *pkt, PCIDevice *pci_dev,
> +                                     dma_addr_t pa, size_t len)

Ah, finally you use dma_addr_t. So this clearly belong to the previous 
patch.

>   {
>       dma_addr_t mapped_len = len;
> -    void *base = pci_dma_map(pkt->pci_dev, pa, &mapped_len,
> -                             DMA_DIRECTION_TO_DEVICE);
> +    void *base = pci_dma_map(pci_dev, pa, &mapped_len, DMA_DIRECTION_TO_DEVICE);
>       if (!base) {
>           return false;
>       }
>   
> -    if (mapped_len != len ||
> -        !net_tx_pkt_add_raw_fragment_common(pkt, base, len)) {
> -        net_tx_pkt_unmap_frag_pci(pkt->pci_dev, base, mapped_len);
> +    if (mapped_len != len || !net_tx_pkt_add_raw_fragment(pkt, base, len)) {
> +        net_tx_pkt_unmap_frag_pci(pci_dev, base, mapped_len);
>           return false;
>       }
>   
> @@ -710,7 +700,7 @@ static void net_tx_pkt_udp_fragment_fix(struct NetTxPkt *pkt,
>   }
>   
>   static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
> -                                           NetTxPktCallback callback,
> +                                           NetTxPktSend callback,
>                                              void *context)
>   {
>       uint8_t gso_type = pkt->virt_hdr.gso_type & ~VIRTIO_NET_HDR_GSO_ECN;
> @@ -807,7 +797,7 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
>   }
>   
>   bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
> -                            NetTxPktCallback callback, void *context)
> +                            NetTxPktSend callback, void *context)
>   {
>       assert(pkt);


