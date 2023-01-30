Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F4681271
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:21:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMV0w-0004cF-3r; Mon, 30 Jan 2023 09:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMV0t-0004c3-Mt
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:20:03 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMV0r-0001Qp-PC
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:20:03 -0500
Received: by mail-pf1-x436.google.com with SMTP id j20so1171954pfj.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L50KaaInQiKCwROu3ozR4KTKAxGg7EsuwVn5QFiMkoI=;
 b=M89xl7Ns0JrtWVnZaVS1WhPbfmPyse6v+q0IbCpR/1H6Bgw1507bAjfMnRChAgK76t
 OGJIcWz/1Y2YWV1DsA4f/KyIpyWBDDTzyCQ5Iupca/IW6E+Xz4SBcQKVmeFEmTyd2+vp
 8GfQYUB4wItmvQPCNbk0RxC/8QiWCK8I61E7cvpkpEhfwFlz7b5vK100mDSSr6SxOFqE
 xx1nshkhlQPygNWTH1Y3BOiAAaHNMw+HmSNgzFrJtFjrk9O7oi/Vg61Oly9ILj5h/uGC
 +NNgHgV/BzzXwfINYv+Pf4qO/SMv/EWkPk7vRt9WCYdkXU/oNks56ukd0lJD9ku3EBNU
 j1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L50KaaInQiKCwROu3ozR4KTKAxGg7EsuwVn5QFiMkoI=;
 b=6EVx4PFf7+CLA3iX4taQi3cX23xhhUkdsEBGP1XmsysOThnO/pIB+dzwiLktdPwjLK
 NgzOT/mUF+anCTXSG2ADkow9slX9mvmjEmlKcsscEv97Ab5/xekK1rPr1NljAAB7OR2N
 9QQ/UUIrKRqaTmDo5dc9CzuWyBnn0izpMrrokdxPKd166ebvqBxGjFbPhsa737Em4xi+
 Rtbfd2pjCbM08mGMQAk8nlBGGMl29yAAt3hoqItXuJpTWJh7yyZxUTfVhUuGzyqk3KBa
 dFB+i3uj5HdKatlsxdSyXf97FC3nD33S0OY26YkIAqL5TifZNh4VdNESUAS78DEms4pI
 uRbw==
X-Gm-Message-State: AO0yUKWH58yS4/zPkURyhVimM7KV+NEhM8c3WlVGFobEPedyolzviDTI
 C+01kIGAsTzLijQCJX5UW04rWA==
X-Google-Smtp-Source: AK7set+YxncqWrfZcROqUHOnfmvMnjliwfIGAtTS5QJsJsltNEyvxCVWQLpYiAXqTo2pG5LUE8O87Q==
X-Received: by 2002:a05:6a00:2d4:b0:593:d111:a071 with SMTP id
 b20-20020a056a0002d400b00593d111a071mr1803707pft.9.1675088399976; 
 Mon, 30 Jan 2023 06:19:59 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u2-20020aa78482000000b0058e12bbb560sm3408425pfn.15.2023.01.30.06.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 06:19:59 -0800 (PST)
Message-ID: <5f5358e1-ee71-7c8f-8363-1de3373eeb7f@daynix.com>
Date: Mon, 30 Jan 2023 23:19:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 3/9] igb: implement VFRE and VFTE registers
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
 <20230130132304.2347-4-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230130132304.2347-4-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x436.google.com
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

On 2023/01/30 22:22, Sriram Yagnaraman wrote:
> Also add checks for RXDCTL/TXDCTL queue enable bits
> 
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c | 41 ++++++++++++++++++++++++++++++-----------
>   hw/net/igb_regs.h |  4 +++-
>   2 files changed, 33 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 9bd53cc25f..b8c01cb773 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -778,6 +778,18 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
>       return igb_tx_wb_eic(core, txi->idx);
>   }
>   
> +static inline bool
> +igb_tx_enabled(IGBCore *core, const E1000E_RingInfo *txi)
> +{
> +    bool vmdq = core->mac[MRQC] & 1;
> +    uint16_t qn = txi->idx;
> +    uint16_t vfn = qn % IGB_MAX_VM_POOLS;

Rename vfn to pool as you did in other places.

> +
> +    return (core->mac[TCTL] & E1000_TCTL_EN) &&
> +        (!vmdq || core->mac[VFTE] & BIT(vfn)) &&
> +        (core->mac[TXDCTL0 + (qn * 16)] & E1000_TXDCTL_QUEUE_ENABLE);
> +}
> +
>   static void
>   igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>   {
> @@ -787,8 +799,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>       const E1000E_RingInfo *txi = txr->i;
>       uint32_t eic = 0;
>   
> -    /* TODO: check if the queue itself is enabled too. */
> -    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
> +    if (!igb_tx_enabled(core, txi)) {
>           trace_e1000e_tx_disabled();
>           return;
>       }
> @@ -1003,6 +1014,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>               queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
>           }
>   
> +        queues &= core->mac[VFRE];
>           igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
>           if (rss_info->queue & 1) {
>               queues <<= 8;
> @@ -1486,7 +1498,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>       static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
>   
>       uint16_t queues = 0;
> -    uint32_t n;
> +    uint32_t n = 0;
>       uint8_t min_buf[ETH_ZLEN];
>       struct iovec min_iov;
>       struct eth_header *ehdr;
> @@ -1566,26 +1578,22 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>           }
>   
>           igb_rx_ring_init(core, &rxr, i);
> -
> -        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
> -

I think you have seen my earlier email, but just in case: please move 
the fix included in a later patch to this.

>           if (!igb_has_rxbufs(core, rxr.i, total_size)) {
>               retval = 0;
>           }
>       }
>   
>       if (retval) {
> -        n = E1000_ICR_RXT0;
> -
>           igb_rx_fix_l4_csum(core, core->rx_pkt);
>   
>           for (i = 0; i < IGB_NUM_QUEUES; i++) {
> -            if (!(queues & BIT(i))) {
> +            if (!(queues & BIT(i)) ||
> +                !(core->mac[E1000_RXDCTL(i) >> 2] & E1000_RXDCTL_QUEUE_ENABLE)) {
>                   continue;
>               }
>   
>               igb_rx_ring_init(core, &rxr, i);
> -
> +            trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
>               igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
>   
>               /* Check if receive descriptor minimum threshold hit */
> @@ -1594,6 +1602,9 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>               }
>   
>               core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
> +
> +            /* same as RXDW (rx descriptor written back)*/
> +            n = E1000_ICR_RXT0;

Place the next patch, "igb: add ICR_RXDW" before this patch and remove 
the comment; the comment will be redundant after that patch.

>           }
>   
>           trace_e1000e_rx_written_to_guest(n);
> @@ -1981,9 +1992,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
>   
>   static void igb_vf_reset(IGBCore *core, uint16_t vfn)
>   {
> +    uint16_t qn0 = vfn;
> +    uint16_t qn1 = vfn + IGB_MAX_VF_FUNCTIONS;
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
> @@ -3889,6 +3907,7 @@ igb_phy_reg_init[] = {
>   static const uint32_t igb_mac_reg_init[] = {
>       [LEDCTL]        = 2 | (3 << 8) | BIT(15) | (6 << 16) | (7 << 24),
>       [EEMNGCTL]      = BIT(31),
> +    [TXDCTL0]       = E1000_TXDCTL_QUEUE_ENABLE,
>       [RXDCTL0]       = E1000_RXDCTL_QUEUE_ENABLE | (1 << 16),
>       [RXDCTL1]       = 1 << 16,
>       [RXDCTL2]       = 1 << 16,
> diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
> index ebf3e95023..c8ce5b1671 100644
> --- a/hw/net/igb_regs.h
> +++ b/hw/net/igb_regs.h
> @@ -147,6 +147,7 @@ union e1000_adv_rx_desc {
>   #define IGB_MAX_TX_QUEUES          8
>   #define IGB_MAX_VF_MC_ENTRIES      30
>   #define IGB_MAX_VF_FUNCTIONS       8
> +#define IGB_MAX_VM_POOLS           8
>   #define IGB_MAX_VFTA_ENTRIES       128
>   #define IGB_82576_VF_DEV_ID        0x10CA
>   #define IGB_I350_VF_DEV_ID         0x1520
> @@ -160,7 +161,8 @@ union e1000_adv_rx_desc {
>   #define E1000_MRQC_RSS_FIELD_IPV6_UDP       0x00800000
>   #define E1000_MRQC_RSS_FIELD_IPV6_UDP_EX    0x01000000
>   
> -/* Additional Receive Descriptor Control definitions */
> +/* Additional RX/TX Descriptor Control definitions */
> +#define E1000_TXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Tx Queue */
>   #define E1000_RXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Rx Queue */
>   
>   /* Direct Cache Access (DCA) definitions */

