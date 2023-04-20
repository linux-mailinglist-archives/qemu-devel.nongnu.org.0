Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB5B6E9AD6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 19:34:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppY9k-0006qt-30; Thu, 20 Apr 2023 13:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppY9g-0006qO-GN
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:33:12 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppY9d-0002jp-Oo
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:33:12 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-63b7588005fso1213955b3a.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 10:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682011988; x=1684603988;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tDsR0ucEp5B/ja9NwQJUlSQltEpBbNRijuumwerZSP8=;
 b=Sam7a+JLiJjy/e0MesK6UNORHETx1S8dARIs41VlSBJ5XsKuRP+niCS3bbnyYwHOpU
 rfksZPfAqWdQFEqsmbCj7e42t0Vy3I39mpuyp0wb1KR/RSJ6g4+eWgRegpBLqSwS55sj
 D+Mhg8eQwES5p1fsTOP68TDEdcLeFsFpxcrfS7YjsvWBlAvmYBc+rt1TdR+qomkNScTC
 9cXKmnaDC//F/Ji7O8ES6uar27K+YT73dugZVVZ3D2ff0qFqtyUJZDhxqdThpf2dA7lo
 2y8pPoCHPw9FR7zG2Y9ppyaXnZMQ74zPsJgUFueEzdd+9hFn4V2VF+RW3AZIWwGt7J+S
 hfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682011988; x=1684603988;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tDsR0ucEp5B/ja9NwQJUlSQltEpBbNRijuumwerZSP8=;
 b=Vog8yQDwJ8qtelw0HbGHd3jvlV3N+ozeU7lo1g5WcyeSZHsn6SuXd25pfgEC1Q4DhW
 oxDmf5wqciB9hUfQfzWli7uRCFy52JLEzxS/lY4Cjw+GdC3dhu998n2DRgYi2/CRgey/
 K44Htalzp0VXAhE7SI/vj0cRsDW/0V/obeqg067wqPQHFlwJCIKe7Vy1ooVSLZSfQjTL
 qCs6zJ7h96XPKktBt904jvAm9ZDl6pdEsmrPhp0IQLZWv/BkfF/zlUhhfPGBgR3/oOzT
 LgGY4Hu29uvFVEKk53NNLkko6e//AVY/rmWHGrvsEM4NRYHcLhFcmD4ZRrBkVHvfyaf3
 yNWA==
X-Gm-Message-State: AAQBX9cOY0ikpdDFvuBYyjcbb1OoWt/ARoIfoC2a2yxNqPtVJriBgJYZ
 lpIgydV6ZD2KD+S78vMwCbLszw==
X-Google-Smtp-Source: AKy350brUvjXdqD4skGvsr5DvxRcHXMARhPN4joVSasMzMjrLzYkSa3JkPBdM5HHRoZVFPqGsnVPqA==
X-Received: by 2002:a17:90a:8a8e:b0:23d:4b01:b27 with SMTP id
 x14-20020a17090a8a8e00b0023d4b010b27mr2550469pjn.10.1682011987970; 
 Thu, 20 Apr 2023 10:33:07 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 lx3-20020a17090b4b0300b00246cc751c6bsm3283460pjb.46.2023.04.20.10.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 10:33:07 -0700 (PDT)
Message-ID: <6116593a-a572-2195-61da-0980401128ca@daynix.com>
Date: Fri, 21 Apr 2023 02:33:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/41] hw/net/net_tx_pkt: Decouple interface from PCI
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
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
 <a38922a7-ee0b-dcac-a232-be48cc89fc60@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <a38922a7-ee0b-dcac-a232-be48cc89fc60@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/04/20 18:54, Philippe Mathieu-Daudé wrote:
> On 20/4/23 07:46, Akihiko Odaki wrote:
>> This allows to use the network packet abstractions even if PCI is not
>> used.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/net/net_tx_pkt.h  | 31 ++++++++++++++++++++-----------
>>   hw/net/e1000e_core.c | 13 ++++++++-----
>>   hw/net/igb_core.c    | 13 ++++++-------
>>   hw/net/net_tx_pkt.c  | 36 +++++++++++++-----------------------
>>   hw/net/vmxnet3.c     | 14 +++++++-------
>>   5 files changed, 54 insertions(+), 53 deletions(-)
>>
>> diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
>> index 5eb123ef90..f5cd44da6f 100644
>> --- a/hw/net/net_tx_pkt.h
>> +++ b/hw/net/net_tx_pkt.h
>> @@ -26,17 +26,16 @@
>>   struct NetTxPkt;
>> -typedef void (* NetTxPktCallback)(void *, const struct iovec *, int, 
>> const struct iovec *, int);
>> +typedef void (*NetTxPktFreeFrag)(void *, void *, size_t);
> 
> If you don't want to restrict to PCIDevice, you can still use DeviceState:
> 
>     typedef void (*NetTxPktFreeFrag)(DeviceState *, void *, size_t);

I'd rather like to keep the context as void * for the consistency with 
NetTxPktCallback, which is now renamed as NetTxPktSend. igb already has 
some code to pass something not DeviceState to NetTxPktSend, and it is 
possible that NetTxPktFreeFrag gains such a use case in the future.

> 
>> +typedef void (*NetTxPktSend)(void *, const struct iovec *, int, const 
>> struct iovec *, int);
>>   /**
>>    * Init function for tx packet functionality
>>    *
>>    * @pkt:            packet pointer
>> - * @pci_dev:        PCI device processing this packet
>>    * @max_frags:      max tx ip fragments
>>    */
>> -void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
>> -    uint32_t max_frags);
>> +void net_tx_pkt_init(struct NetTxPkt **pkt, uint32_t max_frags);
>>   /**
>>    * Clean all tx packet resources.
>> @@ -95,12 +94,11 @@ net_tx_pkt_setup_vlan_header(struct NetTxPkt *pkt, 
>> uint16_t vlan)
>>    * populate data fragment into pkt context.
>>    *
>>    * @pkt:            packet
>> - * @pa:             physical address of fragment
>> + * @pa:             pointer to fragment
> 
> You renamed it @base.

Thanks for catching this. I'll fix it in the next version.

> 
>>    * @len:            length of fragment
>>    *
>>    */
>> -bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
>> -    size_t len);
>> +bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, void *base, 
>> size_t len);
>>   /**
>>    * Fix ip header fields and calculate IP header and pseudo header 
>> checksums.
>> @@ -148,10 +146,11 @@ void net_tx_pkt_dump(struct NetTxPkt *pkt);
>>    * reset tx packet private context (needed to be called between 
>> packets)
>>    *
>>    * @pkt:            packet
>> - * @dev:            PCI device processing the next packet
>> - *
>> + * @callback:       function to free the fragments
>> + * @context:        pointer to be passed to the callback
>>    */
>> -void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *dev);
>> +void net_tx_pkt_reset(struct NetTxPkt *pkt,
>> +                      NetTxPktFreeFrag callback, void *context);
>>   /**
>>    * Unmap a fragment mapped from a PCI device.
>> @@ -162,6 +161,16 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt, 
>> PCIDevice *dev);
>>    */
>>   void net_tx_pkt_unmap_frag_pci(void *context, void *base, size_t len);
>> +/**
>> + * map data fragment from PCI device and populate it into pkt context.
>> + *
>> + * @pci_dev:        PCI device owning fragment
>> + * @pa:             physical address of fragment
>> + * @len:            length of fragment
>> + */
>> +bool net_tx_pkt_add_raw_fragment_pci(struct NetTxPkt *pkt, PCIDevice 
>> *pci_dev,
>> +                                     dma_addr_t pa, size_t len);
> 
> (following previous patch comment, here too you use dma_addr_t).
> 
>> +
>>   /**
>>    * Send packet to qemu. handles sw offloads if vhdr is not supported.
>>    *
>> @@ -182,7 +191,7 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, 
>> NetClientState *nc);
>>    * @ret:            operation result
>>    */
>>   bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
>> -                            NetTxPktCallback callback, void *context);
>> +                            NetTxPktSend callback, void *context);
>>   /**
>>    * parse raw packet data and analyze offload requirements.
>> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
>> index cfa3f55e96..15821a75e0 100644
>> --- a/hw/net/e1000e_core.c
>> +++ b/hw/net/e1000e_core.c
>> @@ -746,7 +746,8 @@ e1000e_process_tx_desc(E1000ECore *core,
>>       addr = le64_to_cpu(dp->buffer_addr);
>>       if (!tx->skip_cp) {
>> -        if (!net_tx_pkt_add_raw_fragment(tx->tx_pkt, addr, 
>> split_size)) {
>> +        if (!net_tx_pkt_add_raw_fragment_pci(tx->tx_pkt, core->owner,
>> +                                             addr, split_size)) {
>>               tx->skip_cp = true;
>>           }
>>       }
>> @@ -764,7 +765,7 @@ e1000e_process_tx_desc(E1000ECore *core,
>>           }
>>           tx->skip_cp = false;
>> -        net_tx_pkt_reset(tx->tx_pkt, core->owner);
>> +        net_tx_pkt_reset(tx->tx_pkt, net_tx_pkt_unmap_frag_pci, 
>> core->owner);
>>           tx->sum_needed = 0;
>>           tx->cptse = 0;
>> @@ -3421,7 +3422,7 @@ e1000e_core_pci_realize(E1000ECore     *core,
>>           qemu_add_vm_change_state_handler(e1000e_vm_state_change, core);
>>       for (i = 0; i < E1000E_NUM_QUEUES; i++) {
>> -        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, 
>> E1000E_MAX_TX_FRAGS);
>> +        net_tx_pkt_init(&core->tx[i].tx_pkt, E1000E_MAX_TX_FRAGS);
>>       }
>>       net_rx_pkt_init(&core->rx_pkt);
>> @@ -3446,7 +3447,8 @@ e1000e_core_pci_uninit(E1000ECore *core)
>>       qemu_del_vm_change_state_handler(core->vmstate);
>>       for (i = 0; i < E1000E_NUM_QUEUES; i++) {
>> -        net_tx_pkt_reset(core->tx[i].tx_pkt, core->owner);
>> +        net_tx_pkt_reset(core->tx[i].tx_pkt,
>> +                         net_tx_pkt_unmap_frag_pci, core->owner);
>>           net_tx_pkt_uninit(core->tx[i].tx_pkt);
>>       }
>> @@ -3571,7 +3573,8 @@ static void e1000e_reset(E1000ECore *core, bool sw)
>>       e1000x_reset_mac_addr(core->owner_nic, core->mac, 
>> core->permanent_mac);
>>       for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
>> -        net_tx_pkt_reset(core->tx[i].tx_pkt, core->owner);
>> +        net_tx_pkt_reset(core->tx[i].tx_pkt,
>> +                         net_tx_pkt_unmap_frag_pci, core->owner);
>>           memset(&core->tx[i].props, 0, sizeof(core->tx[i].props));
>>           core->tx[i].skip_cp = false;
>>       }
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
>> index 826e7a6cf1..abfdce9aaf 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -597,7 +597,8 @@ igb_process_tx_desc(IGBCore *core,
>>       length = cmd_type_len & 0xFFFF;
>>       if (!tx->skip_cp) {
>> -        if (!net_tx_pkt_add_raw_fragment(tx->tx_pkt, buffer_addr, 
>> length)) {
>> +        if (!net_tx_pkt_add_raw_fragment_pci(tx->tx_pkt, dev,
>> +                                             buffer_addr, length)) {
>>               tx->skip_cp = true;
>>           }
>>       }
>> @@ -616,7 +617,7 @@ igb_process_tx_desc(IGBCore *core,
>>           tx->first = true;
>>           tx->skip_cp = false;
>> -        net_tx_pkt_reset(tx->tx_pkt, dev);
>> +        net_tx_pkt_reset(tx->tx_pkt, net_tx_pkt_unmap_frag_pci, dev);
>>       }
>>   }
>> @@ -842,8 +843,6 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>>           d = core->owner;
>>       }
>> -    net_tx_pkt_reset(txr->tx->tx_pkt, d);
>> -
>>       while (!igb_ring_empty(core, txi)) {
>>           base = igb_ring_head_descr(core, txi);
>> @@ -861,6 +860,8 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>>           core->mac[EICR] |= eic;
>>           igb_set_interrupt_cause(core, E1000_ICR_TXDW);
>>       }
>> +
>> +    net_tx_pkt_reset(txr->tx->tx_pkt, net_tx_pkt_unmap_frag_pci, d);
>>   }
>>   static uint32_t
>> @@ -3954,7 +3955,7 @@ igb_core_pci_realize(IGBCore        *core,
>>       core->vmstate = 
>> qemu_add_vm_change_state_handler(igb_vm_state_change, core);
>>       for (i = 0; i < IGB_NUM_QUEUES; i++) {
>> -        net_tx_pkt_init(&core->tx[i].tx_pkt, NULL, E1000E_MAX_TX_FRAGS);
>> +        net_tx_pkt_init(&core->tx[i].tx_pkt, E1000E_MAX_TX_FRAGS);
>>       }
>>       net_rx_pkt_init(&core->rx_pkt);
>> @@ -3979,7 +3980,6 @@ igb_core_pci_uninit(IGBCore *core)
>>       qemu_del_vm_change_state_handler(core->vmstate);
>>       for (i = 0; i < IGB_NUM_QUEUES; i++) {
>> -        net_tx_pkt_reset(core->tx[i].tx_pkt, NULL);
>>           net_tx_pkt_uninit(core->tx[i].tx_pkt);
>>       }
>> @@ -4158,7 +4158,6 @@ static void igb_reset(IGBCore *core, bool sw)
>>       for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
>>           tx = &core->tx[i];
>> -        net_tx_pkt_reset(tx->tx_pkt, NULL);
>>           memset(tx->ctx, 0, sizeof(tx->ctx));
>>           tx->first = true;
>>           tx->skip_cp = false;
>> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
>> index aca12ff035..cc36750c9b 100644
>> --- a/hw/net/net_tx_pkt.c
>> +++ b/hw/net/net_tx_pkt.c
>> @@ -16,12 +16,12 @@
>>    */
>>   #include "qemu/osdep.h"
>> -#include "net_tx_pkt.h"
>>   #include "net/eth.h"
>>   #include "net/checksum.h"
>>   #include "net/tap.h"
>>   #include "net/net.h"
>>   #include "hw/pci/pci_device.h"
>> +#include "net_tx_pkt.h"
>>   enum {
>>       NET_TX_PKT_VHDR_FRAG = 0,
>> @@ -32,8 +32,6 @@ enum {
>>   /* TX packet private context */
>>   struct NetTxPkt {
>> -    PCIDevice *pci_dev;
>> -
>>       struct virtio_net_hdr virt_hdr;
>>       struct iovec *raw;
>> @@ -59,13 +57,10 @@ struct NetTxPkt {
>>       uint8_t l4proto;
>>   };
>> -void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
>> -    uint32_t max_frags)
>> +void net_tx_pkt_init(struct NetTxPkt **pkt, uint32_t max_frags)
>>   {
>>       struct NetTxPkt *p = g_malloc0(sizeof *p);
>> -    p->pci_dev = pci_dev;
>> -
>>       p->vec = g_new(struct iovec, max_frags + NET_TX_PKT_PL_START_FRAG);
>>       p->raw = g_new(struct iovec, max_frags);
>> @@ -384,8 +379,7 @@ void net_tx_pkt_setup_vlan_header_ex(struct 
>> NetTxPkt *pkt,
>>       }
>>   }
>> -static bool net_tx_pkt_add_raw_fragment_common(struct NetTxPkt *pkt,
>> -                                               void *base, size_t len)
>> +bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, void *base, 
>> size_t len)
>>   {
>>       struct iovec *ventry;
>>       assert(pkt);
>> @@ -433,7 +427,8 @@ void net_tx_pkt_dump(struct NetTxPkt *pkt)
>>   #endif
>>   }
>> -void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *pci_dev)
>> +void net_tx_pkt_reset(struct NetTxPkt *pkt,
>> +                      NetTxPktFreeFrag callback, void *context)
> 
> 'void *context' -> 'DeviceState *dev'.
> 
>>   {
>>       int i;
>> @@ -453,12 +448,9 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt, 
>> PCIDevice *pci_dev)
>>           assert(pkt->raw);
>>           for (i = 0; i < pkt->raw_frags; i++) {
>>               assert(pkt->raw[i].iov_base);
>> -            net_tx_pkt_unmap_frag_pci(pkt->pci_dev,
>> -                                      pkt->raw[i].iov_base,
>> -                                      pkt->raw[i].iov_len);
>> +            callback(context, pkt->raw[i].iov_base, 
>> pkt->raw[i].iov_len);
>>           }
>>       }
>> -    pkt->pci_dev = pci_dev;
>>       pkt->raw_frags = 0;
>>       pkt->hdr_len = 0;
>> @@ -470,19 +462,17 @@ void net_tx_pkt_unmap_frag_pci(void *context, 
>> void *base, size_t len)
>>       pci_dma_unmap(context, base, len, DMA_DIRECTION_TO_DEVICE, 0);
>>   }
>> -bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
>> -    size_t len)
>> +bool net_tx_pkt_add_raw_fragment_pci(struct NetTxPkt *pkt, PCIDevice 
>> *pci_dev,
>> +                                     dma_addr_t pa, size_t len)
> 
> Ah, finally you use dma_addr_t. So this clearly belong to the previous 
> patch.
> 
>>   {
>>       dma_addr_t mapped_len = len;
>> -    void *base = pci_dma_map(pkt->pci_dev, pa, &mapped_len,
>> -                             DMA_DIRECTION_TO_DEVICE);
>> +    void *base = pci_dma_map(pci_dev, pa, &mapped_len, 
>> DMA_DIRECTION_TO_DEVICE);
>>       if (!base) {
>>           return false;
>>       }
>> -    if (mapped_len != len ||
>> -        !net_tx_pkt_add_raw_fragment_common(pkt, base, len)) {
>> -        net_tx_pkt_unmap_frag_pci(pkt->pci_dev, base, mapped_len);
>> +    if (mapped_len != len || !net_tx_pkt_add_raw_fragment(pkt, base, 
>> len)) {
>> +        net_tx_pkt_unmap_frag_pci(pci_dev, base, mapped_len);
>>           return false;
>>       }
>> @@ -710,7 +700,7 @@ static void net_tx_pkt_udp_fragment_fix(struct 
>> NetTxPkt *pkt,
>>   }
>>   static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
>> -                                           NetTxPktCallback callback,
>> +                                           NetTxPktSend callback,
>>                                              void *context)
>>   {
>>       uint8_t gso_type = pkt->virt_hdr.gso_type & 
>> ~VIRTIO_NET_HDR_GSO_ECN;
>> @@ -807,7 +797,7 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, 
>> NetClientState *nc)
>>   }
>>   bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
>> -                            NetTxPktCallback callback, void *context)
>> +                            NetTxPktSend callback, void *context)
>>   {
>>       assert(pkt);
> 

