Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0444569FE19
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 23:06:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUxE3-0004tE-5u; Wed, 22 Feb 2023 17:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pUxDw-0004sl-4l
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 17:04:28 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pUxDt-00079F-SX
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 17:04:27 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so2351593pjb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 14:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UUCgWDUNe8mwsSLjEAJZjwzKTOEwiTJpFLpBtRCSxdw=;
 b=OzQE0BL3DUHzJUtjxetawOHfllKsTBF0Zt/rQUkkWVy8xqZLD+tp3CxuROq1FBd42U
 eJjNFLjlJJuAyLqhUDynidcEW5l6TPrmpwuu1Eq1Vos71z33CBfSmyM7zRJOoXEfkYpM
 oNvKTY6HEG82Gw9+vky/iNVoOgQJd+Z9/hHMLVQb0n6Ol/fVcUg3kaTLbHtydW9FLd48
 2MpP4KSJZtH63e/KlDhoO5TNUIiHW/O+dzX7GSSJ02rz2DnOdNa3ywVvQUFkEPCjFXTa
 qZNYrGd8Auq0DgAGrGRzfiT+tO/17KM7z6NPsx7vDvdofVgoIv2S8sGUL2nIloDKrC3k
 HkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UUCgWDUNe8mwsSLjEAJZjwzKTOEwiTJpFLpBtRCSxdw=;
 b=Luulu6aXAZeXQ7pT2xl7SyP2V9+LyN93WuUNNu2ZVggaSm7ifQh0xMI8N9zBxC7Uvh
 LU251msKOtPVlH5GdKaQpnxYKogV4L5R0hnEjTsZ6lSVzmIJTKD+es2uRCH+qlB/tzW2
 CCVA9dOdBKAhNTBXSDkf0R3+25OYR1v0nqc0XbDpC9PBGRNS2h/SKMKu3YbslwGh5vTQ
 TwD/VY9UFynn7sme8TysYrRriDADY2JbbbiwzuJgPpDYR+FncN+NSoJCFBaJjIuhz5DL
 SEL/4D/rdqKBd0mdrlTCQM0wo2zX9yeih+fteFmoUWlPVL0jtWej1BVO2XjnA/BBu8vT
 OpbA==
X-Gm-Message-State: AO0yUKXdptH97RNUZxDwmEpbMSMbqsqW9LlJJcSe7SHnyykRByr/j9cF
 hoEksDm4TCtxK1+BEQgPli0Vag==
X-Google-Smtp-Source: AK7set9KigIHZ4sfKke0H1wrMv71LTWZCexULcNdqXS1BwgNfiOXhCCooSTIs5yhZQb6g2fQ5PHWLA==
X-Received: by 2002:a17:90a:3da3:b0:237:24eb:99d8 with SMTP id
 i32-20020a17090a3da300b0023724eb99d8mr6618574pjc.19.1677103463221; 
 Wed, 22 Feb 2023 14:04:23 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a17090a4f4900b00234afca2498sm3030655pjl.28.2023.02.22.14.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:04:22 -0800 (PST)
Message-ID: <59bdde70-10e6-e94b-3f01-83840496f503@daynix.com>
Date: Thu, 23 Feb 2023 07:04:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 21/29] hw/net/net_tx_pkt: Automatically determine if
 virtio-net header is used
To: Jason Wang <jasowang@redhat.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
 <20230201033539.30049-22-akihiko.odaki@daynix.com>
 <dfa9d36f-f3f6-8f72-7e11-d4f4620fb1c5@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <dfa9d36f-f3f6-8f72-7e11-d4f4620fb1c5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/02/21 12:38, Jason Wang wrote:
> 
> 在 2023/2/1 11:35, Akihiko Odaki 写道:
>> The new function qemu_get_using_vnet_hdr() allows to automatically
>> determine if virtio-net header is used.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/net/e1000e_core.c |  3 +--
>>   hw/net/net_tx_pkt.c  | 19 ++++++++++---------
>>   hw/net/net_tx_pkt.h  |  3 +--
>>   hw/net/vmxnet3.c     |  6 ++----
>>   4 files changed, 14 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
>> index 38d374fba3..954a007151 100644
>> --- a/hw/net/e1000e_core.c
>> +++ b/hw/net/e1000e_core.c
>> @@ -3376,8 +3376,7 @@ e1000e_core_pci_realize(E1000ECore     *core,
>>           qemu_add_vm_change_state_handler(e1000e_vm_state_change, core);
>>       for (i = 0; i < E1000E_NUM_QUEUES; i++) {
>> -        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner,
>> -                        E1000E_MAX_TX_FRAGS, core->has_vnet);
>> +        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, 
>> E1000E_MAX_TX_FRAGS);
>>       }
>>       net_rx_pkt_init(&core->rx_pkt, core->has_vnet);
>> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
>> index 8a23899a4d..cf46c8457f 100644
>> --- a/hw/net/net_tx_pkt.c
>> +++ b/hw/net/net_tx_pkt.c
>> @@ -35,7 +35,6 @@ struct NetTxPkt {
>>       PCIDevice *pci_dev;
>>       struct virtio_net_hdr virt_hdr;
>> -    bool has_virt_hdr;
> 
> 
> So this requires implicit coupling of NetTxPkt and a NetClientState (not 
> self contained). This may work now but probably not the future e.g when 
> two packets were queued in a list when one packet has a vnet header but 
> another doesn't?
> 
> Thanks

This patch is actually intended to remove coupling of NetTxPkt and 
NetClientState. e1000e and igb have loopback mode, and in this mode, 
NetTxPkt needs to perform segmentation by itself even if the peer 
accepts vnet header. However, before this patch, has_virt_hdr flag is 
fixed in net_tx_pkt_init() so it couldn't handle a case where one packet 
needs vnet header and another doesn't.

This patch fixes such a case by deferring the decision whether to have 
vnet header (and to offload segmentation) to the point when actually 
sending the packet. This allows NetTxPkt to add a vnet header and not to 
do so, depending on the situation.

Patch "e1000e: Perform software segmentation for loopback" further 
decouples NetTxPkt and NetClientState by introducing a new function, 
net_tx_pkt_send_custom(). Unlike net_tx_pkt_send(), 
net_tx_pkt_send_custom() do not need NetClientState, and it is totally 
up to the caller whether to have vnet header or to offload segmentation.

Regards,
Akihiko Odaki

> 
> 
>>       struct iovec *raw;
>>       uint32_t raw_frags;
>> @@ -59,7 +58,7 @@ struct NetTxPkt {
>>   };
>>   void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
>> -    uint32_t max_frags, bool has_virt_hdr)
>> +    uint32_t max_frags)
>>   {
>>       struct NetTxPkt *p = g_malloc0(sizeof *p);
>> @@ -71,10 +70,8 @@ void net_tx_pkt_init(struct NetTxPkt **pkt, 
>> PCIDevice *pci_dev,
>>       p->max_payload_frags = max_frags;
>>       p->max_raw_frags = max_frags;
>> -    p->has_virt_hdr = has_virt_hdr;
>>       p->vec[NET_TX_PKT_VHDR_FRAG].iov_base = &p->virt_hdr;
>> -    p->vec[NET_TX_PKT_VHDR_FRAG].iov_len =
>> -        p->has_virt_hdr ? sizeof p->virt_hdr : 0;
>> +    p->vec[NET_TX_PKT_VHDR_FRAG].iov_len = sizeof p->virt_hdr;
>>       p->vec[NET_TX_PKT_L2HDR_FRAG].iov_base = &p->l2_hdr;
>>       p->vec[NET_TX_PKT_L3HDR_FRAG].iov_base = &p->l3_hdr;
>> @@ -617,9 +614,11 @@ static bool net_tx_pkt_do_sw_fragmentation(struct 
>> NetTxPkt *pkt,
>>   bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
>>   {
>> +    bool using_vnet_hdr = qemu_get_using_vnet_hdr(nc->peer);
>> +
>>       assert(pkt);
>> -    if (!pkt->has_virt_hdr &&
>> +    if (!using_vnet_hdr &&
>>           pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
>>           net_tx_pkt_do_sw_csum(pkt);
>>       }
>> @@ -636,11 +635,13 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, 
>> NetClientState *nc)
>>           }
>>       }
>> -    if (pkt->has_virt_hdr ||
>> +    if (using_vnet_hdr ||
>>           pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
>> +        int index = using_vnet_hdr ?
>> +                    NET_TX_PKT_VHDR_FRAG : NET_TX_PKT_L2HDR_FRAG;
>>           net_tx_pkt_fix_ip6_payload_len(pkt);
>> -        net_tx_pkt_sendv(pkt, nc, pkt->vec,
>> -            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG);
>> +        net_tx_pkt_sendv(pkt, nc, pkt->vec + index,
>> +            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - index);
>>           return true;
>>       }
>> diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
>> index 2e38a5fa69..8d3faa42fb 100644
>> --- a/hw/net/net_tx_pkt.h
>> +++ b/hw/net/net_tx_pkt.h
>> @@ -32,10 +32,9 @@ struct NetTxPkt;
>>    * @pkt:            packet pointer
>>    * @pci_dev:        PCI device processing this packet
>>    * @max_frags:      max tx ip fragments
>> - * @has_virt_hdr:   device uses virtio header.
>>    */
>>   void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
>> -    uint32_t max_frags, bool has_virt_hdr);
>> +    uint32_t max_frags);
>>   /**
>>    * Clean all tx packet resources.
>> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
>> index c63bbb59bd..8c3f5d6e14 100644
>> --- a/hw/net/vmxnet3.c
>> +++ b/hw/net/vmxnet3.c
>> @@ -1521,8 +1521,7 @@ static void vmxnet3_activate_device(VMXNET3State 
>> *s)
>>       /* Preallocate TX packet wrapper */
>>       VMW_CFPRN("Max TX fragments is %u", s->max_tx_frags);
>> -    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s),
>> -                    s->max_tx_frags, s->peer_has_vhdr);
>> +    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
>>       net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
>>       /* Read rings memory locations for RX queues */
>> @@ -2402,8 +2401,7 @@ static int vmxnet3_post_load(void *opaque, int 
>> version_id)
>>   {
>>       VMXNET3State *s = opaque;
>> -    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s),
>> -                    s->max_tx_frags, s->peer_has_vhdr);
>> +    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
>>       net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
>>       if (s->msix_used) {
> 

