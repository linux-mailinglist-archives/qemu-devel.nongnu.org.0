Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128B0686677
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:14:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNCvV-0002Fy-0W; Wed, 01 Feb 2023 08:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pNCvT-0002Fq-Mk
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:13:23 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pNCvR-0002QV-9S
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:13:23 -0500
Received: by mail-pl1-x62c.google.com with SMTP id m2so13395357plg.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 05:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OEX1Tvwqk3ZptBp9MT2cQPM4ih2WYxeeJNgC6x+7OrU=;
 b=dF25vaMlI5Vg88Nj0CGkqLV7MCsZxUuV4u6NxioPaOER3BeAgmDA5zEXXVyVYrQhDg
 Qzb6khahm11eAKAVQU46+UU0Gh5lztzPX9eceNf3hIktlHCYV2OzhvOb4tFbwLIdszGw
 ksgDe1JsuGcAd34QQ0I7DhBrQOVT+tXCTJ+hSR9LpdQz4hLsMoprs3ZO/93x76+CySFc
 3C06m17TfrlzEIkAGetEPemdiaMZ7y8LbKzPX1wWz8sDC4+6PdSW74uA/b8H0jvHa1jW
 wWpjgdWd7tAN9qIs0MHgU+BPtYw04Oem7yfgXwAM/j8KWNS5RDPF4aNJ/pEmS04TLbqb
 +0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OEX1Tvwqk3ZptBp9MT2cQPM4ih2WYxeeJNgC6x+7OrU=;
 b=ZA2H2mhqwh+LusZoIrGIPQl3H+/9O2f1uCShnTP0kyErbwRGODQ8lxYKgMnaaKmvcm
 FsQNfoJUm043W/tOT/f+U6aPGxRmM8DrOg1W1M2iKKg6kpfM7Y7uZ4Wqch1/ZKjPXY5h
 2z65vBGqyQxRjzNdHOxyL0DkTmv/z+qISBgTw7TZiSPaEqBGIDUpvb92PVGRS5LaISEm
 IZa14tZwRmMYoQ3OviZEn0o4RsuTrIbmUaTm+qMCrs2+l2vcU71fFm2rnT8nH7jJ5WIm
 1bRoHK9G/nGj9r4BKB1gykjz3u/PUdukZ2zQ9oCyb8hBaR2SaPT9INXhT4C5LXaCPBk2
 yl+Q==
X-Gm-Message-State: AO0yUKWOa8H6/26h5rlzP1yo4E2tUMZDBDsiFN7qe/pEcppt83EmB7oo
 FgpFo/Fxz5M6/I8+63WYEkde7A==
X-Google-Smtp-Source: AK7set9unZcTCOT4YKD58/KLw8nwPEmhJAVOuxVKhIqqz3t2Sk1V30RO8CdwqjyvmyRZRBLCKNIXIg==
X-Received: by 2002:a17:903:22c7:b0:198:b5e1:74fd with SMTP id
 y7-20020a17090322c700b00198b5e174fdmr981905plg.60.1675257198016; 
 Wed, 01 Feb 2023 05:13:18 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 jn16-20020a170903051000b0019611a075fasm1737389plb.58.2023.02.01.05.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 05:13:17 -0800 (PST)
Message-ID: <401715c7-b776-1688-2794-2f151cd69fbc@daynix.com>
Date: Wed, 1 Feb 2023 22:13:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 4/9] igb: implement VFRE and VFTE registers
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
 <20230201111722.28748-5-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230201111722.28748-5-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
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

On 2023/02/01 20:17, Sriram Yagnaraman wrote:
> Also introduce:
> - Checks for RXDCTL/TXDCTL queue enable bits
> - IGB_NUM_VM_POOLS enum (Sec 1.5: Table 1-7)

It may be better to have RXDCTL.ENABLE check in igb_can_receive().

> 
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c | 36 ++++++++++++++++++++++++++++--------
>   hw/net/igb_core.h |  1 +
>   hw/net/igb_regs.h |  3 +++
>   3 files changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 1ddf54f630..c44b30b6d1 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -780,6 +780,18 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
>       return igb_tx_wb_eic(core, txi->idx);
>   }
>   
> +static inline bool
> +igb_tx_enabled(IGBCore *core, const E1000E_RingInfo *txi)
> +{
> +    bool vmdq = core->mac[MRQC] & 1;
> +    uint16_t qn = txi->idx;
> +    uint16_t pool = qn % IGB_NUM_VM_POOLS;
> +
> +    return (core->mac[TCTL] & E1000_TCTL_EN) &&
> +        (!vmdq || core->mac[VFTE] & BIT(pool)) &&
> +        (core->mac[TXDCTL0 + (qn * 16)] & E1000_TXDCTL_QUEUE_ENABLE);
> +}
> +
>   static void
>   igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>   {
> @@ -789,8 +801,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>       const E1000E_RingInfo *txi = txr->i;
>       uint32_t eic = 0;
>   
> -    /* TODO: check if the queue itself is enabled too. */
> -    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
> +    if (!igb_tx_enabled(core, txi)) {
>           trace_e1000e_tx_disabled();
>           return;
>       }
> @@ -932,7 +943,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>   
>       if (core->mac[MRQC] & 1) {
>           if (is_broadcast_ether_addr(ehdr->h_dest)) {
> -            for (i = 0; i < 8; i++) {
> +            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>                   if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
>                       queues |= BIT(i);
>                   }
> @@ -966,7 +977,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>                   f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
>                   f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
>                   if (macp[f >> 5] & (1 << (f & 0x1f))) {
> -                    for (i = 0; i < 8; i++) {
> +                    for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>                           if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
>                               queues |= BIT(i);
>                           }
> @@ -989,7 +1000,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>                       }
>                   }
>               } else {
> -                for (i = 0; i < 8; i++) {
> +                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>                       if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
>                           mask |= BIT(i);
>                       }
> @@ -1005,6 +1016,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>               queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
>           }
>   
> +        queues &= core->mac[VFRE];
>           igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
>           if (rss_info->queue & 1) {
>               queues <<= 8;
> @@ -1562,12 +1574,12 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>       igb_rx_fix_l4_csum(core, core->rx_pkt);
>   
>       for (i = 0; i < IGB_NUM_QUEUES; i++) {
> -        if (!(queues & BIT(i))) {
> +        if (!(queues & BIT(i)) ||
> +            !(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
>               continue;
>           }
>   
>           igb_rx_ring_init(core, &rxr, i);
> -
>           if (!igb_has_rxbufs(core, rxr.i, total_size)) {
>               n |= E1000_ICS_RXO;
>               trace_e1000e_rx_not_written_to_guest(rxr.i->idx);
> @@ -1966,9 +1978,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
>   
>   static void igb_vf_reset(IGBCore *core, uint16_t vfn)
>   {
> +    uint16_t qn0 = vfn;
> +    uint16_t qn1 = vfn + IGB_NUM_VM_POOLS;
> +
>       /* disable Rx and Tx for the VF*/
> -    core->mac[VFTE] &= ~BIT(vfn);
> +    core->mac[RXDCTL0 + (qn0 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
> +    core->mac[RXDCTL0 + (qn1 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
> +    core->mac[TXDCTL0 + (qn0 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
> +    core->mac[TXDCTL0 + (qn1 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
>       core->mac[VFRE] &= ~BIT(vfn);
> +    core->mac[VFTE] &= ~BIT(vfn);
>       /* indicate VF reset to PF */
>       core->mac[VFLRE] |= BIT(vfn);
>       /* VFLRE and mailbox use the same interrupt cause */
> @@ -3874,6 +3893,7 @@ igb_phy_reg_init[] = {
>   static const uint32_t igb_mac_reg_init[] = {
>       [LEDCTL]        = 2 | (3 << 8) | BIT(15) | (6 << 16) | (7 << 24),
>       [EEMNGCTL]      = BIT(31),
> +    [TXDCTL0]       = E1000_TXDCTL_QUEUE_ENABLE,
>       [RXDCTL0]       = E1000_RXDCTL_QUEUE_ENABLE | (1 << 16),
>       [RXDCTL1]       = 1 << 16,
>       [RXDCTL2]       = 1 << 16,
> diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
> index cc3b4d1f2b..9938922598 100644
> --- a/hw/net/igb_core.h
> +++ b/hw/net/igb_core.h
> @@ -47,6 +47,7 @@
>   #define IGB_MSIX_VEC_NUM        (10)
>   #define IGBVF_MSIX_VEC_NUM      (3)
>   #define IGB_NUM_QUEUES          (16)
> +#define IGB_NUM_VM_POOLS        (8)
>   
>   typedef struct IGBCore IGBCore;
>   
> diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
> index ddc0f931d6..4d98079906 100644
> --- a/hw/net/igb_regs.h
> +++ b/hw/net/igb_regs.h
> @@ -160,6 +160,9 @@ union e1000_adv_rx_desc {
>   #define E1000_MRQC_RSS_FIELD_IPV6_UDP       0x00800000
>   #define E1000_MRQC_RSS_FIELD_IPV6_UDP_EX    0x01000000
>   
> +/* Additional Transmit Descriptor Control definitions */
> +#define E1000_TXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Tx Queue */
> +
>   /* Additional Receive Descriptor Control definitions */
>   #define E1000_RXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Rx Queue */
>   

