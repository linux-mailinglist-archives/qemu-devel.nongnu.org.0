Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0C680EB1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:22:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU5v-0003Sw-VF; Mon, 30 Jan 2023 08:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMU58-0003Qx-GN
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:20:27 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMU55-0005XU-Tv
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:20:21 -0500
Received: by mail-pl1-x631.google.com with SMTP id be8so11571378plb.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=guVQ5noq1PVaxty1Xy/pQtfP2UZPP7NPU905nw/Bv6w=;
 b=N+2zEqIeQqURNbFg5iM/cQ5T5UXkfsTkxSgcfqhQig28T3LwzKTZc1CGfaxYrGZ4tr
 ak0+JZ9wpqEbTmXcqGRKP3TM+jW2bUklMDgQjxjox9DMkW6KSK2mq2dYM7y6A7Dv32Mt
 L3tBZCjFv66oc62nntBLkM/TwPzZDRM7gtu6j8lcUgoMY1/WU67TomKC6/qy6ESR1Bjx
 rssEUtbdcAdTzUbN59IFnk/rQKV61plKLqa6qyr9sYzToFbqPQFV3fs9jXRcc1ZYwTIu
 7WSvxqs8EX11TG7vDbdN1mofl1UwJ7dxhFvDQirEkPvdKpMUcQex/uEJTEYuxNVEZRco
 +WFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=guVQ5noq1PVaxty1Xy/pQtfP2UZPP7NPU905nw/Bv6w=;
 b=cQODZ/QWfVXpa2bhd074wOjcp3a0TJVfTAGOukudSpUvG4/odfd/3sYANdMFD1LwcB
 qm+MLr07SWSN1UQe9LtWgY5D0oc3zjiesOV5fsbS16tPLRS8DSa9SZjEfgaD+K7TO25I
 2UGf/aCR1Not+hASODwGgdKgAY7YLgY/X0igp6ux9AcBSt0MteZmBhml+304C1MRaNlP
 av0eRv5hyPD/KpSR8tzNlYKEmFVPYtRwYgNbO1xSgHS+ItGNGsfB/vPapLdCXod/nTx2
 OD9g2kqCjDlAWsSXmeKLxsDwE6WnZEdHX3mw5DcpwMr7InWDUuA6Nx8fZ7ownrP5w82T
 bONA==
X-Gm-Message-State: AO0yUKVVMmN8piP2kdxHwLkrfGM2QG816QxIgt+ZNyH/CiZnSH+dSgzM
 I0bEPUwXSlHQon52FrwwVa8DmA==
X-Google-Smtp-Source: AK7set80Zob8r6mvdp5y7mb436HKkF1Ot/EfQdn6xioOlgMxEfDrleFG+CjTjzkVpRBlYFvlPccPAA==
X-Received: by 2002:a17:903:32ce:b0:196:8362:b727 with SMTP id
 i14-20020a17090332ce00b001968362b727mr4257380plr.63.1675084817165; 
 Mon, 30 Jan 2023 05:20:17 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a17090302cc00b001743ba85d39sm7788756plk.110.2023.01.30.05.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 05:20:16 -0800 (PST)
Message-ID: <96ecc312-b307-ac49-7f58-0004e39dd033@daynix.com>
Date: Mon, 30 Jan 2023 22:20:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/9] igb: implement VFRE and VFTE registers
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
 <20230128134633.22730-4-sriram.yagnaraman@est.tech>
 <5829b55e-2ac3-67dd-3b3e-932abb0b35e1@daynix.com>
 <DBBP189MB14334298124A2E60D1409F5F95D39@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB14334298124A2E60D1409F5F95D39@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
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

On 2023/01/30 19:16, Sriram Yagnaraman wrote:
> 
> 
>> -----Original Message-----
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Sunday, 29 January 2023 10:16
>> To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
>> Cc: qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>; Dmitry
>> Fleytman <dmitry.fleytman@gmail.com>; Michael S . Tsirkin
>> <mst@redhat.com>; Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> Subject: Re: [PATCH 3/9] igb: implement VFRE and VFTE registers
>>
>> On 2023/01/28 22:46, Sriram Yagnaraman wrote:
>>> Also add checks for RXDCTL/TXDCTL queue enable bits
>>>
>>> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
>>> ---
>>>    hw/net/igb_core.c | 42 +++++++++++++++++++++++++++++++-----------
>>>    hw/net/igb_regs.h |  3 ++-
>>>    2 files changed, 33 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c index
>>> 9bd53cc25f..6bca5459b9 100644
>>> --- a/hw/net/igb_core.c
>>> +++ b/hw/net/igb_core.c
>>> @@ -778,6 +778,19 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t
>> base,
>>>        return igb_tx_wb_eic(core, txi->idx);
>>>    }
>>>
>>> +static inline bool
>>> +igb_tx_enabled(IGBCore *core, const E1000E_RingInfo *txi) {
>>> +    bool vmdq = core->mac[MRQC] & 1;
>>> +    uint16_t qn = txi->idx;
>>> +    uint16_t vfn = (qn > IGB_MAX_VF_FUNCTIONS) ?
>>> +                   (qn - IGB_MAX_VF_FUNCTIONS) : qn;
>>> +
>>> +    return (core->mac[TCTL] & E1000_TCTL_EN) &&
>>> +        (vmdq ? (core->mac[VFTE] & BIT(vfn)) : true) &&
>>
>> Instead, do: (!vmdq || core->mac[VFTE] & BIT(vfn))
>>
>>> +        (core->mac[TXDCTL0 + (qn * 16)] & E1000_TXDCTL_QUEUE_ENABLE);
>>> +}
>>> +
>>>    static void
>>>    igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>>>    {
>>> @@ -787,8 +800,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing
>> *txr)
>>>        const E1000E_RingInfo *txi = txr->i;
>>>        uint32_t eic = 0;
>>>
>>> -    /* TODO: check if the queue itself is enabled too. */
>>> -    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
>>> +    if (!igb_tx_enabled(core, txi)) {
>>>            trace_e1000e_tx_disabled();
>>>            return;
>>>        }
>>> @@ -1003,6 +1015,7 @@ static uint16_t igb_receive_assign(IGBCore *core,
>> const struct eth_header *ehdr,
>>>                queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
>>>            }
>>>
>>> +        queues &= core->mac[VFRE];
>>>            igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL,
>> rss_info);
>>>            if (rss_info->queue & 1) {
>>>                queues <<= 8;
>>> @@ -1486,7 +1499,7 @@ igb_receive_internal(IGBCore *core, const struct
>> iovec *iov, int iovcnt,
>>>        static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
>>>
>>>        uint16_t queues = 0;
>>> -    uint32_t n;
>>> +    uint32_t n = 0;
>>>        uint8_t min_buf[ETH_ZLEN];
>>>        struct iovec min_iov;
>>>        struct eth_header *ehdr;
>>> @@ -1566,26 +1579,22 @@ igb_receive_internal(IGBCore *core, const
>> struct iovec *iov, int iovcnt,
>>>            }
>>>
>>>            igb_rx_ring_init(core, &rxr, i);
>>> -
>>> -        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
>>> -
>>>            if (!igb_has_rxbufs(core, rxr.i, total_size)) {
>>>                retval = 0;
>>>            }
>>
>> This stops sending packet when a disabled queue has no space.
> 
> Yes, that is true, but I have refactored this part a bit in patchset 9 that fixes this.

I see. Please include the fix in this patch so it will be easier to 
review and it won't prevent from bisecting.

> 
>>
>>>        }
>>>
>>>        if (retval) {
>>> -        n = E1000_ICR_RXT0;
>>> -
>>>            igb_rx_fix_l4_csum(core, core->rx_pkt);
>>>
>>>            for (i = 0; i < IGB_NUM_QUEUES; i++) {
>>> -            if (!(queues & BIT(i))) {
>>> +            if (!(queues & BIT(i)) ||
>>> +                !(core->mac[E1000_RXDCTL(i) >> 2] &
>>> + E1000_RXDCTL_QUEUE_ENABLE)) {
>>>                    continue;
>>>                }
>>>
>>>                igb_rx_ring_init(core, &rxr, i);
>>> -
>>> +            trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
>>>                igb_write_packet_to_guest(core, core->rx_pkt, &rxr,
>>> &rss_info);
>>>
>>>                /* Check if receive descriptor minimum threshold hit */
>>> @@ -1594,6 +1603,9 @@ igb_receive_internal(IGBCore *core, const struct
>> iovec *iov, int iovcnt,
>>>                }
>>>
>>>                core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
>>> +
>>> +            /* same as RXDW (rx descriptor written back)*/
>>> +            n = E1000_ICR_RXT0;
>>>            }
>>>
>>>            trace_e1000e_rx_written_to_guest(n);
>>> @@ -1981,9 +1993,16 @@ static void igb_set_vfmailbox(IGBCore *core,
>>> int index, uint32_t val)
>>>
>>>    static void igb_vf_reset(IGBCore *core, uint16_t vfn)
>>>    {
>>> +    uint16_t qn0 = vfn;
>>> +    uint16_t qn1 = vfn + IGB_MAX_VF_FUNCTIONS;
>>> +
>>>        /* disable Rx and Tx for the VF*/
>>> -    core->mac[VFTE] &= ~BIT(vfn);
>>> +    core->mac[RXDCTL0 + (qn0 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
>>> +    core->mac[RXDCTL0 + (qn1 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
>>> +    core->mac[TXDCTL0 + (qn0 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
>>> +    core->mac[TXDCTL0 + (qn1 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
>>>        core->mac[VFRE] &= ~BIT(vfn);
>>> +    core->mac[VFTE] &= ~BIT(vfn);
>>>        /* indicate VF reset to PF */
>>>        core->mac[VFLRE] |= BIT(vfn);
>>>        /* VFLRE and mailbox use the same interrupt cause */ @@ -3889,6
>>> +3908,7 @@ igb_phy_reg_init[] = {
>>>    static const uint32_t igb_mac_reg_init[] = {
>>>        [LEDCTL]        = 2 | (3 << 8) | BIT(15) | (6 << 16) | (7 << 24),
>>>        [EEMNGCTL]      = BIT(31),
>>> +    [TXDCTL0]       = E1000_TXDCTL_QUEUE_ENABLE,
>>>        [RXDCTL0]       = E1000_RXDCTL_QUEUE_ENABLE | (1 << 16),
>>>        [RXDCTL1]       = 1 << 16,
>>>        [RXDCTL2]       = 1 << 16,
>>> diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h index
>>> ebf3e95023..084e751378 100644
>>> --- a/hw/net/igb_regs.h
>>> +++ b/hw/net/igb_regs.h
>>> @@ -160,7 +160,8 @@ union e1000_adv_rx_desc {
>>>    #define E1000_MRQC_RSS_FIELD_IPV6_UDP       0x00800000
>>>    #define E1000_MRQC_RSS_FIELD_IPV6_UDP_EX    0x01000000
>>>
>>> -/* Additional Receive Descriptor Control definitions */
>>> +/* Additional RX/TX Descriptor Control definitions */ #define
>>> +E1000_TXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Tx Queue
>> */
>>>    #define E1000_RXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Rx
>>> Queue */
>>>
>>>    /* Direct Cache Access (DCA) definitions */

