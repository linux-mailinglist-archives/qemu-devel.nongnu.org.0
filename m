Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D3F69D953
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 04:40:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUJUm-0004Kj-Er; Mon, 20 Feb 2023 22:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUJUj-0004K5-Oj
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 22:39:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUJUi-0005GY-3c
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 22:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676950737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83eZbEkKLDlUyn8ZKesVCMpXVlakNgvVxQSzubXQCY0=;
 b=ipSwp1GqBCfewExrJVst656j3XEULv11xV1r57azKi1AMkAziAv7ComyvdqLjhQoe7Guwb
 SPD9boM/2JjNaGDweAMOLGxv6UlU1+LJQQDLO8edKc5+HZ4doDx69omnDmdAd1OYlxS3jr
 vltSrrAWzvI0izvlkBGSitS8mWyGruE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-HwkfkpdbN_2HpBgeJEoddw-1; Mon, 20 Feb 2023 22:38:47 -0500
X-MC-Unique: HwkfkpdbN_2HpBgeJEoddw-1
Received: by mail-pj1-f72.google.com with SMTP id
 1-20020a17090a0f0100b00237214c4e4aso123489pjy.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 19:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=83eZbEkKLDlUyn8ZKesVCMpXVlakNgvVxQSzubXQCY0=;
 b=RXEcicS38eXN9bngHFb5bEnxPFaLURUZz7NEKxMgIDR3y1BJf/zMShpwLbH2vJzge4
 DyOLht2Z/K3dzXeoLUflyo7wB2CazIrufTmegTBQK/mVSdV5CkvGc4gqNgcQwhX/A59b
 4+xySrtqtc1/pnxuiydrf2jltdl3ca7zDGf7GxG4WlqIPxYE3mEFOpntEzfKkUWoyn0o
 gNjbwgt8CEqhqbcIDc5rqOUJUc1wnHH1ei5lUG2afFsWwbgDhQiLVJYNBAHWZeDzV18j
 8aggijOQ2JLXv2NdTdQDAfh4Br/FcKy8971qZKjcUa9PU2u9PlRtxbCuVcMQMd2u3AbB
 k6ZA==
X-Gm-Message-State: AO0yUKU3r3DA5e1TVUClTpRMmLNB09796lS86ZXAYX6GtSiejp0xucce
 Sn637omEh1LTma6UORCB+GL3hqoSHKFs5RM7BRGsg8WDzpUrU7nKHXo35+9klep1ILEtQnqG+Z8
 AIz9HGw1dNiGATmc=
X-Received: by 2002:a05:6a20:938a:b0:cb:27a7:9d42 with SMTP id
 x10-20020a056a20938a00b000cb27a79d42mr5122766pzh.61.1676950726828; 
 Mon, 20 Feb 2023 19:38:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/vC3Wd9yJYFOYS0kthB3ThqRy5BfooFqfPx0ve00Pszx3vRFyCS5skUx6I4r6jLNM691zxdQ==
X-Received: by 2002:a05:6a20:938a:b0:cb:27a7:9d42 with SMTP id
 x10-20020a056a20938a00b000cb27a79d42mr5122739pzh.61.1676950726495; 
 Mon, 20 Feb 2023 19:38:46 -0800 (PST)
Received: from [10.72.13.11] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 io16-20020a17090312d000b0019a96f10c6fsm8671442plb.293.2023.02.20.19.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 19:38:46 -0800 (PST)
Message-ID: <dfa9d36f-f3f6-8f72-7e11-d4f4620fb1c5@redhat.com>
Date: Tue, 21 Feb 2023 11:38:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 21/29] hw/net/net_tx_pkt: Automatically determine if
 virtio-net header is used
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
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
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230201033539.30049-22-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


在 2023/2/1 11:35, Akihiko Odaki 写道:
> The new function qemu_get_using_vnet_hdr() allows to automatically
> determine if virtio-net header is used.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000e_core.c |  3 +--
>   hw/net/net_tx_pkt.c  | 19 ++++++++++---------
>   hw/net/net_tx_pkt.h  |  3 +--
>   hw/net/vmxnet3.c     |  6 ++----
>   4 files changed, 14 insertions(+), 17 deletions(-)
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 38d374fba3..954a007151 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -3376,8 +3376,7 @@ e1000e_core_pci_realize(E1000ECore     *core,
>           qemu_add_vm_change_state_handler(e1000e_vm_state_change, core);
>   
>       for (i = 0; i < E1000E_NUM_QUEUES; i++) {
> -        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner,
> -                        E1000E_MAX_TX_FRAGS, core->has_vnet);
> +        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, E1000E_MAX_TX_FRAGS);
>       }
>   
>       net_rx_pkt_init(&core->rx_pkt, core->has_vnet);
> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> index 8a23899a4d..cf46c8457f 100644
> --- a/hw/net/net_tx_pkt.c
> +++ b/hw/net/net_tx_pkt.c
> @@ -35,7 +35,6 @@ struct NetTxPkt {
>       PCIDevice *pci_dev;
>   
>       struct virtio_net_hdr virt_hdr;
> -    bool has_virt_hdr;


So this requires implicit coupling of NetTxPkt and a NetClientState (not 
self contained). This may work now but probably not the future e.g when 
two packets were queued in a list when one packet has a vnet header but 
another doesn't?

Thanks


>   
>       struct iovec *raw;
>       uint32_t raw_frags;
> @@ -59,7 +58,7 @@ struct NetTxPkt {
>   };
>   
>   void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
> -    uint32_t max_frags, bool has_virt_hdr)
> +    uint32_t max_frags)
>   {
>       struct NetTxPkt *p = g_malloc0(sizeof *p);
>   
> @@ -71,10 +70,8 @@ void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
>   
>       p->max_payload_frags = max_frags;
>       p->max_raw_frags = max_frags;
> -    p->has_virt_hdr = has_virt_hdr;
>       p->vec[NET_TX_PKT_VHDR_FRAG].iov_base = &p->virt_hdr;
> -    p->vec[NET_TX_PKT_VHDR_FRAG].iov_len =
> -        p->has_virt_hdr ? sizeof p->virt_hdr : 0;
> +    p->vec[NET_TX_PKT_VHDR_FRAG].iov_len = sizeof p->virt_hdr;
>       p->vec[NET_TX_PKT_L2HDR_FRAG].iov_base = &p->l2_hdr;
>       p->vec[NET_TX_PKT_L3HDR_FRAG].iov_base = &p->l3_hdr;
>   
> @@ -617,9 +614,11 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
>   
>   bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
>   {
> +    bool using_vnet_hdr = qemu_get_using_vnet_hdr(nc->peer);
> +
>       assert(pkt);
>   
> -    if (!pkt->has_virt_hdr &&
> +    if (!using_vnet_hdr &&
>           pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
>           net_tx_pkt_do_sw_csum(pkt);
>       }
> @@ -636,11 +635,13 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
>           }
>       }
>   
> -    if (pkt->has_virt_hdr ||
> +    if (using_vnet_hdr ||
>           pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
> +        int index = using_vnet_hdr ?
> +                    NET_TX_PKT_VHDR_FRAG : NET_TX_PKT_L2HDR_FRAG;
>           net_tx_pkt_fix_ip6_payload_len(pkt);
> -        net_tx_pkt_sendv(pkt, nc, pkt->vec,
> -            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG);
> +        net_tx_pkt_sendv(pkt, nc, pkt->vec + index,
> +            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - index);
>           return true;
>       }
>   
> diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
> index 2e38a5fa69..8d3faa42fb 100644
> --- a/hw/net/net_tx_pkt.h
> +++ b/hw/net/net_tx_pkt.h
> @@ -32,10 +32,9 @@ struct NetTxPkt;
>    * @pkt:            packet pointer
>    * @pci_dev:        PCI device processing this packet
>    * @max_frags:      max tx ip fragments
> - * @has_virt_hdr:   device uses virtio header.
>    */
>   void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
> -    uint32_t max_frags, bool has_virt_hdr);
> +    uint32_t max_frags);
>   
>   /**
>    * Clean all tx packet resources.
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index c63bbb59bd..8c3f5d6e14 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1521,8 +1521,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>   
>       /* Preallocate TX packet wrapper */
>       VMW_CFPRN("Max TX fragments is %u", s->max_tx_frags);
> -    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s),
> -                    s->max_tx_frags, s->peer_has_vhdr);
> +    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
>       net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
>   
>       /* Read rings memory locations for RX queues */
> @@ -2402,8 +2401,7 @@ static int vmxnet3_post_load(void *opaque, int version_id)
>   {
>       VMXNET3State *s = opaque;
>   
> -    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s),
> -                    s->max_tx_frags, s->peer_has_vhdr);
> +    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
>       net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
>   
>       if (s->msix_used) {


