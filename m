Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EED685E99
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 05:42:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN4wq-0000QG-8T; Tue, 31 Jan 2023 23:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4wn-0000Pj-Nv
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:42:13 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4wl-0005yG-Qz
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:42:13 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso865851pjj.1
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NirswWKLnFMqiA+yMq+7jixc2FMNf0Ua1ZkNfZyV/Zk=;
 b=JMueJaA1SYei4QHN9dnRdfHRI4Jou5hGa2x5l5du9A+QYnKN7IYDoFfKJ/awS+9feF
 GIkx66l0Zv2vg91Trl6AA6rufIIBAwr1A1v0vFHa1M7tvBkggOLyYR/1HOXqzWAG9eHj
 3PN7mKOpEqELd3lW3KZLEtfFxV77SMxtbMBECNhl7MMrJxRZ8nNFUR9q6v/z+STXZ5r/
 kClbodN9kuF0n7Yjn2Utbw9QzxXogVJ9/4yCtfT7UAwwARdBRQnKeW79yNT7ffsMVbBu
 aw6MXYuU6Ewbg5IrRheQn1HC8AZUWV0327zCsk9xyBsjG+RnAZbcgVpz5GsfsHZFN6Sf
 D66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NirswWKLnFMqiA+yMq+7jixc2FMNf0Ua1ZkNfZyV/Zk=;
 b=lY06mF569Qf0/3y/k3I5oS/f1aStVzoAHZ4jFPFnyLNw75IYTDCmdj/9HEh5gGrhnA
 Mi9B9xLImQnX7HNWj6Kw11jWzei5S+P32cXkdl6tdhNHSFzEztQJIpuOD3LF8q958vpr
 AwVvATsLiKEve6/UaNACU9P0aV6oKzqVl/6F7WE0Moyot647JQu4ogilL2QJOC0Dp+aA
 Xnz5lHppX+3FisiCdN5LpyU9qQBBlj/QLSoMfBnYlqXdHdEDMn/usWksqhtXvdEjHi5g
 mzYhFK78a08ETxkYbITq+PZWj+5riCmkteE0qr5ue5wxVGz4gokpSDzJugavKbWVsPq7
 EjBA==
X-Gm-Message-State: AO0yUKUdkcPwxK0OWzXB8t6DC/FoYufnTmykk/4WSwhSgFLKjENieC7s
 6mUcAKlPW1CmrpGwZqd7+3zomA==
X-Google-Smtp-Source: AK7set+ax0ZrKvjkU/BRhEcMxKG1e+VOg0rqhh1eRvGw6H0PBdO75BjGkdfmRtxYoLtwj1y16sfXFQ==
X-Received: by 2002:a17:90b:3881:b0:22b:e367:9b2a with SMTP id
 mu1-20020a17090b388100b0022be3679b2amr16037969pjb.44.1675226529324; 
 Tue, 31 Jan 2023 20:42:09 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 hd14-20020a17090b458e00b0022c503c1897sm314705pjb.3.2023.01.31.20.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 20:42:09 -0800 (PST)
Message-ID: <430c4b06-6d85-5376-36a7-8a060227c4da@daynix.com>
Date: Wed, 1 Feb 2023 13:42:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 4/9] igb: implement VFRE and VFTE registers
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
 <20230131094232.28863-5-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230131094232.28863-5-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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
> Also add checks for RXDCTL/TXDCTL queue enable bits
> 
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c | 30 +++++++++++++++++++++++++-----
>   hw/net/igb_core.h |  1 +
>   hw/net/igb_regs.h |  3 +++
>   3 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index e78bc3611a..4a1b98bf0e 100644
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
> @@ -1005,6 +1016,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>               queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
>           }
>   
> +        queues &= core->mac[VFRE];
>           igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
>           if (rss_info->queue & 1) {
>               queues <<= 8;
> @@ -1564,12 +1576,12 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
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
>               icr_bits |= E1000_ICS_RXO;
>               continue;
> @@ -1973,9 +1985,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
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
> @@ -3881,6 +3900,7 @@ igb_phy_reg_init[] = {
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

If you are adding this definition, search for "8" and replace the 
occurrences with it where appropriate.

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

