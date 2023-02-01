Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA757685E88
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 05:36:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN4qc-0004GA-U4; Tue, 31 Jan 2023 23:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4qU-0004Fr-Gr
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:35:43 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4qR-0004ta-W7
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:35:42 -0500
Received: by mail-pl1-x636.google.com with SMTP id e6so9049281plg.12
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1mUGeqpJm5BwwltqSG/IYGs/sIHP4S5A7cpT57m/0CA=;
 b=f8I4C9JX1O401OXX8jpJbRj+l6rIkBNfRiqCC5fzrJLAWlEx4Bm9MyntIODqKvsk9J
 p7dGJmmgr2KHDnwEhiC/IgFMb/b5OMD776lpC8gfOstgJmrR6gmaRdb2ZqF4gaKrpYuX
 tKBMZIe3vH7hgW7BOfCBfN2hhYnC69/g8sojHnVwMhrZcHs/li3pq6ciNTdY+8IhPZQE
 JjAvV30QGU5JiXpAu5xiBkOUn0ZsQRNC5ycVBfiAgKzaumUnDB504pbsCX5mGhaQEhNT
 k7v7QzFKdGM3LgOFPSillMOoqyKvGpXnrsAKoJGjxF2qhDqqWhHEWVs1f3mN1Dhx40LB
 LC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1mUGeqpJm5BwwltqSG/IYGs/sIHP4S5A7cpT57m/0CA=;
 b=OHFw1PASmUSKVosPBSd6GUOehGZPBmiNQ+ettU1juUeQLDBxEvCLYKZrgPyKW7eCWw
 T9PoPCH7DBjdeHbYrZI5u8ePq/CAnxLVwE3N+m/lV6P/Y+d/ncaf5/FR7ZJ29/tT7Ii2
 PU99wOkKuvAHbPCWJQi69pH0o8ff7B1+1aNZXuXQYM/7VeBB8BOxcma0LRJRVbnSB8D1
 mbXZ3wsV3/idb0w3ibb5x6lCN9+3Vwbao9elO/gdySUAP369E8S0vy78kFNucx+X/VmW
 81YrW+DNue8pB79lMZ83dCnclJlu5mA5orx5Xmpfn1Jguj+7H/JTcrHxzGEGLTZVKr+P
 yoZw==
X-Gm-Message-State: AO0yUKWJUa8tKjUcZD8sNxuzu+rlKl1qLQhokpVTNchMZTiZ+m2dal3D
 HtOJRkct8P3tyTXJvHDaDJsgew==
X-Google-Smtp-Source: AK7set+jIn9EsfTmlxlzq8i3tE6EMq5IKhMuzv6BT/Yu3AIVKRpuvkvgHfYVsgrRfTx3X5CEqiSmmA==
X-Received: by 2002:a17:903:1247:b0:195:e92e:c4d3 with SMTP id
 u7-20020a170903124700b00195e92ec4d3mr1454214plh.46.1675226138438; 
 Tue, 31 Jan 2023 20:35:38 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 jj18-20020a170903049200b0019300c89011sm10666141plb.63.2023.01.31.20.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 20:35:38 -0800 (PST)
Message-ID: <36573e49-7d87-cb7c-4c95-e09167b5e951@daynix.com>
Date: Wed, 1 Feb 2023 13:35:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 3/9] igb: add ICR_RXDW
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
 <20230131094232.28863-4-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230131094232.28863-4-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/01/31 18:42, Sriram Yagnaraman wrote:
> IGB uses RXDW ICR bit to indicate that rx descriptor has been written
> back. This is the same as RXT0 bit in older HW.
> 
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/e1000x_regs.h |  4 ++++
>   hw/net/igb_core.c    | 46 +++++++++++++++++---------------------------
>   2 files changed, 22 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
> index fb5b861135..f509db73a7 100644
> --- a/hw/net/e1000x_regs.h
> +++ b/hw/net/e1000x_regs.h
> @@ -335,6 +335,7 @@
>   #define E1000_ICR_RXDMT0        0x00000010 /* rx desc min. threshold (0) */
>   #define E1000_ICR_RXO           0x00000040 /* rx overrun */
>   #define E1000_ICR_RXT0          0x00000080 /* rx timer intr (ring 0) */
> +#define E1000_ICR_RXDW          0x00000080 /* rx desc written back */
>   #define E1000_ICR_MDAC          0x00000200 /* MDIO access complete */
>   #define E1000_ICR_RXCFG         0x00000400 /* RX /c/ ordered set */
>   #define E1000_ICR_GPI_EN0       0x00000800 /* GP Int 0 */
> @@ -378,6 +379,7 @@
>   #define E1000_ICS_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
>   #define E1000_ICS_RXO       E1000_ICR_RXO       /* rx overrun */
>   #define E1000_ICS_RXT0      E1000_ICR_RXT0      /* rx timer intr */
> +#define E1000_ICS_RXDW      E1000_ICR_RXDW      /* rx desc written back */
>   #define E1000_ICS_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
>   #define E1000_ICS_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
>   #define E1000_ICS_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
> @@ -407,6 +409,7 @@
>   #define E1000_IMS_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
>   #define E1000_IMS_RXO       E1000_ICR_RXO       /* rx overrun */
>   #define E1000_IMS_RXT0      E1000_ICR_RXT0      /* rx timer intr */
> +#define E1000_IMS_RXDW      E1000_ICR_RXDW      /* rx desc written back */
>   #define E1000_IMS_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
>   #define E1000_IMS_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
>   #define E1000_IMS_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
> @@ -441,6 +444,7 @@
>   #define E1000_IMC_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
>   #define E1000_IMC_RXO       E1000_ICR_RXO       /* rx overrun */
>   #define E1000_IMC_RXT0      E1000_ICR_RXT0      /* rx timer intr */
> +#define E1000_IMC_RXDW      E1000_ICR_RXDW      /* rx desc written back */
>   #define E1000_IMC_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
>   #define E1000_IMC_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
>   #define E1000_IMC_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 9c32ad5e36..e78bc3611a 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -1488,7 +1488,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>       static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
>   
>       uint16_t queues = 0;
> -    uint32_t n;
> +    uint32_t icr_bits = 0;
>       uint8_t min_buf[ETH_ZLEN];
>       struct iovec min_iov;
>       struct eth_header *ehdr;
> @@ -1561,6 +1561,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>           e1000x_fcs_len(core->mac);
>   
>       retval = orig_size;
> +    igb_rx_fix_l4_csum(core, core->rx_pkt);
>   
>       for (i = 0; i < IGB_NUM_QUEUES; i++) {
>           if (!(queues & BIT(i))) {
> @@ -1569,43 +1570,32 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>   
>           igb_rx_ring_init(core, &rxr, i);
>   
> -        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
> -
>           if (!igb_has_rxbufs(core, rxr.i, total_size)) {
> -            retval = 0;
> +            icr_bits |= E1000_ICS_RXO;
> +            continue;
>           }
> -    }
>   
> -    if (retval) {
> -        n = E1000_ICR_RXT0;
> -
> -        igb_rx_fix_l4_csum(core, core->rx_pkt);
> -
> -        for (i = 0; i < IGB_NUM_QUEUES; i++) {
> -            if (!(queues & BIT(i))) {
> -                continue;
> -            }
> -
> -            igb_rx_ring_init(core, &rxr, i);
> +        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
> +        igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
>   
> -            igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
> +        /* Check if receive descriptor minimum threshold hit */
> +        if (igb_rx_descr_threshold_hit(core, rxr.i)) {
> +            icr_bits |= E1000_ICS_RXDMT0;
> +        }
>   
> -            /* Check if receive descriptor minimum threshold hit */
> -            if (igb_rx_descr_threshold_hit(core, rxr.i)) {
> -                n |= E1000_ICS_RXDMT0;
> -            }
> +        core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
>   
> -            core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
> -        }
> +        icr_bits |= E1000_ICR_RXDW;
> +    }
>   
> -        trace_e1000e_rx_written_to_guest(n);
> +    if (icr_bits & E1000_ICR_RXDW) {
> +        trace_e1000e_rx_written_to_guest(icr_bits);
>       } else {
> -        n = E1000_ICS_RXO;
> -        trace_e1000e_rx_not_written_to_guest(n);
> +        trace_e1000e_rx_not_written_to_guest(icr_bits);
>       }
>   
> -    trace_e1000e_rx_interrupt_set(n);
> -    igb_set_interrupt_cause(core, n);
> +    trace_e1000e_rx_interrupt_set(icr_bits);
> +    igb_set_interrupt_cause(core, icr_bits);
>   
>       return retval;
>   }

The change for igb_receive_internal() actually fixes a bug; even if a 
pool doesn't have enough space to write back a packet, it shouldn't 
prevent other pools from receiving the packet.

I have fixed in v7 (well, I intended to do that in v6 but I made some 
mistakes) of "introduce igb" series, but there are some differences:
- "n" is not renamed to "icr_bits". Yes, "n" is a bad name, but if it's 
to be fixed, it should be done for e1000e too at the same time.
- "retval" variable is removed.
- tracepoints were updated so that we can see to which queue the Rx 
packet is written back.

E1000_ICR_RXDW is still not added to "introduce igb" series so please 
rebase this and submit again.

