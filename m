Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E9687760
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 09:29:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNUxR-00067J-97; Thu, 02 Feb 2023 03:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pNUxP-00066s-1k
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 03:28:35 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pNUxN-00074j-3X
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 03:28:34 -0500
Received: by mail-pg1-x52d.google.com with SMTP id a23so751045pga.13
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 00:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hU4lxUwxyBs/Zaq6fnf/x9HKEXiAbYqxq3YsddxzuQE=;
 b=N4T4oXIfNBPInQd9GPsJtmX9Ta9mjKonHAdxpPIs8oI/JGAhmEoiV5C/wqVCUJq/qj
 lGpf12WmtYIDQn3S5rilr0lWh3IuRFIbWQeQr6Usfn3jxdoQl0uNrTrxdY1JHa7XMc2M
 WbkzvZWlx7VjKnuEp0pdvVXHEWHguqoQmDlrf/khBY7Mz9rqvCRk3WL8gOlSdLMcpIe+
 /2azhn1Vtsig/D0IwWwwnNM4QtAmmzQb43FJFEK/f7VTTeOV0rDVVhv23vCsD1s4iTt0
 6qQhKbmnYAFLEWNIUPvoGexWLJ8pgqv8NJsFv/kQymj4pIXxBFRajiRCFEv+ZoZ01nxy
 4ZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hU4lxUwxyBs/Zaq6fnf/x9HKEXiAbYqxq3YsddxzuQE=;
 b=xQ/G5ofSe9CpUzRlAdTF1BgQw7lmDSILft+7pAeYn32ssFcS0sGF83/h12peTuZJE4
 BZiZNXNntIdbueF5xvEJPLhkkzCc+UqsVo0xOaMbpFQuinnsXU1wBWHmCzmVHee/ftWu
 E/fhtn/s/LJUxHcKzrlnCOzXpqoiqwvooVyDd6PHV/yuvd1c+hvRHQPpkaPtsCtJqwlO
 Sd4u+SNTAfxVeDWgP7dNMvzmbmvLNMg/4ixzTdzp9HUHfcJZbkWtlkz0YzW/vLonyywn
 T9jCFCAPljKpU/4/9pxdJsKAJfvSGnWpKUwDtPKp6fldaLhQL9FpMvItY+D+jd8Go6d/
 o1XQ==
X-Gm-Message-State: AO0yUKVw0m75bfVcSmh9L5DpwLxZ6NxTcyK0GSAAiA5KyfYEJ9HGIohg
 oeDTV+9Ar2fyT52oPsPcbmGADA==
X-Google-Smtp-Source: AK7set9srWwf2v2hA8EF+neWlQkEMSMJHWxQ61q3nuEv5/aOSc8rV/Lz7IonaKKyURJxYWuq8xiXtw==
X-Received: by 2002:a05:6a00:790:b0:58d:948f:2acd with SMTP id
 g16-20020a056a00079000b0058d948f2acdmr4541696pfu.33.1675326511015; 
 Thu, 02 Feb 2023 00:28:31 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 t1-20020aa79461000000b0058da7e58008sm12882423pfq.36.2023.02.02.00.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 00:28:30 -0800 (PST)
Message-ID: <29b047de-bdb8-85f8-d0ee-77a812c03df1@daynix.com>
Date: Thu, 2 Feb 2023 17:28:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 4/8] igb: implement VFRE and VFTE registers
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
 <20230202072648.4743-5-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230202072648.4743-5-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52d.google.com
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

On 2023/02/02 16:26, Sriram Yagnaraman wrote:
> Also introduce:
> - Checks for RXDCTL/TXDCTL queue enable bits
> - IGB_NUM_VM_POOLS enum (Sec 1.5: Table 1-7)
> 
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c | 39 +++++++++++++++++++++++++++++++--------
>   hw/net/igb_core.h |  1 +
>   hw/net/igb_regs.h |  3 +++
>   3 files changed, 35 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 1ddf54f630..8437cd6829 100644
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
> @@ -866,6 +877,9 @@ igb_can_receive(IGBCore *core)
>   
>       for (i = 0; i < IGB_NUM_QUEUES; i++) {
>           E1000E_RxRing rxr;
> +        if (!(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
> +            continue;
> +        }
>   
>           igb_rx_ring_init(core, &rxr, i);
>           if (igb_ring_enabled(core, rxr.i) && igb_has_rxbufs(core, rxr.i, 1)) {
> @@ -932,7 +946,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>   
>       if (core->mac[MRQC] & 1) {
>           if (is_broadcast_ether_addr(ehdr->h_dest)) {
> -            for (i = 0; i < 8; i++) {
> +            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>                   if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
>                       queues |= BIT(i);
>                   }
> @@ -966,7 +980,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>                   f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
>                   f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
>                   if (macp[f >> 5] & (1 << (f & 0x1f))) {
> -                    for (i = 0; i < 8; i++) {
> +                    for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>                           if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
>                               queues |= BIT(i);
>                           }
> @@ -989,7 +1003,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>                       }
>                   }
>               } else {
> -                for (i = 0; i < 8; i++) {
> +                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>                       if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
>                           mask |= BIT(i);
>                       }
> @@ -1005,6 +1019,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>               queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
>           }
>   
> +        queues &= core->mac[VFRE];
>           igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
>           if (rss_info->queue & 1) {
>               queues <<= 8;
> @@ -1562,12 +1577,12 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
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

This deletion of line is irrelevant and should be removed.

This is probably the last change I request. I will test this series and 
gives Reviewed-by: and Tested-by: after that.

>           if (!igb_has_rxbufs(core, rxr.i, total_size)) {
>               n |= E1000_ICS_RXO;
>               trace_e1000e_rx_not_written_to_guest(rxr.i->idx);
> @@ -1966,9 +1981,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
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
> @@ -3874,6 +3896,7 @@ igb_phy_reg_init[] = {
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

