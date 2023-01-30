Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B406812BA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:24:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMV4Z-0006MI-U5; Mon, 30 Jan 2023 09:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMV4Y-0006M2-0X
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:23:50 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMV4W-0002Ix-30
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:23:49 -0500
Received: by mail-pf1-x42d.google.com with SMTP id z3so7803109pfb.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kEl3WvQBrSvRhdBc5amRZEhxP4thv0ZDfE7om5w2jJQ=;
 b=UlEK6JVhzKM8/O4bIYI+W8BV90e6VXqrnHIylKinZt2NwWczB6S/i8mmjp4KeMU0LG
 hhpYLYwL3vCKGVwl5aPLYYkitmGxUz0OQyo7uSIYaP35f11Tj3INBXX3OgriU5ea6hbm
 7XuUnleY9sSl/FMtxe5X5/ZhuDT7o+M4DkNgFbMjnTzNoaoR6i8tFnMZiKOapUPG9en7
 PpJQQNZmDYFzPPBY0a8mXc5NaVzTc7Tz2vinZ/7nvZlNv9sR2jY/Ydd+A3tXDUAYViZo
 AlKqzu7XLai3lq7e55dqzAPsK4jyP7fZOPIMjX1Q2LFiXUZVXk5hYudU3UzfEKLy8ZmH
 V2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kEl3WvQBrSvRhdBc5amRZEhxP4thv0ZDfE7om5w2jJQ=;
 b=LjGVcOA5vZt6vCvdgbgf1mKkyXFiA3SUhYHVuFTaQwjTT7XGTOr2qi4S4Wwj0w+Cwt
 8mjryuT1lLQzJYg6sMhWTK7uKskLiDlVkcoTqndchUY6Sftw52guVpj2ZcQkN8+RBPPq
 S5NM61oWx5m00HvX47mzf56ypWtowTLu5YdgN69qQiVIhCVzeeUhIVry7kSqGvhm+pUY
 wYRmvbZyG1KF4WLM8Q7Y7qnKiSYsysb/jDFPjPaHamSSm1AicJzZcX5X4ytZQuYFIGLe
 zVEnYZ15dRyILtpVe0HsjIQQ6MRyaHsYCEQPEwYswNys7nnhpnQwZOqoPEzXHkBG9lTl
 w4ng==
X-Gm-Message-State: AFqh2koOdWJaF+5Br/vrPiMZz7LLh9DqVukHsLV2JcwuGWLxrDDElz9n
 IvneVROh6TLiwRJ86lZUurvsng==
X-Google-Smtp-Source: AMrXdXv2zy1cznEH7RfiW7gl0VRwj1k9bldQxAsD3GgjgO2dgodg/ixBgQBVprSfvAkKB3BdKPdLGQ==
X-Received: by 2002:a62:4e8d:0:b0:58d:b8f8:5e2f with SMTP id
 c135-20020a624e8d000000b0058db8f85e2fmr45902383pfb.10.1675088626757; 
 Mon, 30 Jan 2023 06:23:46 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 74-20020a62164d000000b0058b59c81a29sm7321766pfw.220.2023.01.30.06.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 06:23:46 -0800 (PST)
Message-ID: <879d1fe1-3f57-3406-3771-5506942eb15f@daynix.com>
Date: Mon, 30 Jan 2023 23:23:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 3/9] igb: implement VFRE and VFTE registers
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
 <20230130132304.2347-4-sriram.yagnaraman@est.tech>
 <5f5358e1-ee71-7c8f-8363-1de3373eeb7f@daynix.com>
In-Reply-To: <5f5358e1-ee71-7c8f-8363-1de3373eeb7f@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
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

On 2023/01/30 23:19, Akihiko Odaki wrote:
> On 2023/01/30 22:22, Sriram Yagnaraman wrote:
>> Also add checks for RXDCTL/TXDCTL queue enable bits
>>
>> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
>> ---
>>   hw/net/igb_core.c | 41 ++++++++++++++++++++++++++++++-----------
>>   hw/net/igb_regs.h |  4 +++-
>>   2 files changed, 33 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
>> index 9bd53cc25f..b8c01cb773 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -778,6 +778,18 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
>>       return igb_tx_wb_eic(core, txi->idx);
>>   }
>> +static inline bool
>> +igb_tx_enabled(IGBCore *core, const E1000E_RingInfo *txi)
>> +{
>> +    bool vmdq = core->mac[MRQC] & 1;
>> +    uint16_t qn = txi->idx;
>> +    uint16_t vfn = qn % IGB_MAX_VM_POOLS;
> 
> Rename vfn to pool as you did in other places.
> 
>> +
>> +    return (core->mac[TCTL] & E1000_TCTL_EN) &&
>> +        (!vmdq || core->mac[VFTE] & BIT(vfn)) &&
>> +        (core->mac[TXDCTL0 + (qn * 16)] & E1000_TXDCTL_QUEUE_ENABLE);
>> +}
>> +
>>   static void
>>   igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>>   {
>> @@ -787,8 +799,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
>>       const E1000E_RingInfo *txi = txr->i;
>>       uint32_t eic = 0;
>> -    /* TODO: check if the queue itself is enabled too. */
>> -    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
>> +    if (!igb_tx_enabled(core, txi)) {
>>           trace_e1000e_tx_disabled();
>>           return;
>>       }
>> @@ -1003,6 +1014,7 @@ static uint16_t igb_receive_assign(IGBCore 
>> *core, const struct eth_header *ehdr,
>>               queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
>>           }
>> +        queues &= core->mac[VFRE];
>>           igb_rss_parse_packet(core, core->rx_pkt, external_tx != 
>> NULL, rss_info);
>>           if (rss_info->queue & 1) {
>>               queues <<= 8;
>> @@ -1486,7 +1498,7 @@ igb_receive_internal(IGBCore *core, const struct 
>> iovec *iov, int iovcnt,
>>       static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
>>       uint16_t queues = 0;
>> -    uint32_t n;
>> +    uint32_t n = 0;
>>       uint8_t min_buf[ETH_ZLEN];
>>       struct iovec min_iov;
>>       struct eth_header *ehdr;
>> @@ -1566,26 +1578,22 @@ igb_receive_internal(IGBCore *core, const 
>> struct iovec *iov, int iovcnt,
>>           }
>>           igb_rx_ring_init(core, &rxr, i);
>> -
>> -        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
>> -
> 
> I think you have seen my earlier email, but just in case: please move 
> the fix included in a later patch to this.
> 
>>           if (!igb_has_rxbufs(core, rxr.i, total_size)) {
>>               retval = 0;
>>           }
>>       }
>>       if (retval) {
>> -        n = E1000_ICR_RXT0;
>> -
>>           igb_rx_fix_l4_csum(core, core->rx_pkt);
>>           for (i = 0; i < IGB_NUM_QUEUES; i++) {
>> -            if (!(queues & BIT(i))) {
>> +            if (!(queues & BIT(i)) ||
>> +                !(core->mac[E1000_RXDCTL(i) >> 2] & 
>> E1000_RXDCTL_QUEUE_ENABLE)) {
>>                   continue;
>>               }
>>               igb_rx_ring_init(core, &rxr, i);
>> -
>> +            trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
>>               igb_write_packet_to_guest(core, core->rx_pkt, &rxr, 
>> &rss_info);
>>               /* Check if receive descriptor minimum threshold hit */
>> @@ -1594,6 +1602,9 @@ igb_receive_internal(IGBCore *core, const struct 
>> iovec *iov, int iovcnt,
>>               }
>>               core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
>> +
>> +            /* same as RXDW (rx descriptor written back)*/
>> +            n = E1000_ICR_RXT0;
> 
> Place the next patch, "igb: add ICR_RXDW" before this patch and remove 
> the comment; the comment will be redundant after that patch.
> 
>>           }
>>           trace_e1000e_rx_written_to_guest(n);
>> @@ -1981,9 +1992,16 @@ static void igb_set_vfmailbox(IGBCore *core, 
>> int index, uint32_t val)
>>   static void igb_vf_reset(IGBCore *core, uint16_t vfn)
>>   {
>> +    uint16_t qn0 = vfn;
>> +    uint16_t qn1 = vfn + IGB_MAX_VF_FUNCTIONS;
>> +
>>       /* disable Rx and Tx for the VF*/
>> -    core->mac[VFTE] &= ~BIT(vfn);
>> +    core->mac[RXDCTL0 + (qn0 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
>> +    core->mac[RXDCTL0 + (qn1 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
>> +    core->mac[TXDCTL0 + (qn0 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
>> +    core->mac[TXDCTL0 + (qn1 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
>>       core->mac[VFRE] &= ~BIT(vfn);
>> +    core->mac[VFTE] &= ~BIT(vfn);
>>       /* indicate VF reset to PF */
>>       core->mac[VFLRE] |= BIT(vfn);
>>       /* VFLRE and mailbox use the same interrupt cause */
>> @@ -3889,6 +3907,7 @@ igb_phy_reg_init[] = {
>>   static const uint32_t igb_mac_reg_init[] = {
>>       [LEDCTL]        = 2 | (3 << 8) | BIT(15) | (6 << 16) | (7 << 24),
>>       [EEMNGCTL]      = BIT(31),
>> +    [TXDCTL0]       = E1000_TXDCTL_QUEUE_ENABLE,
>>       [RXDCTL0]       = E1000_RXDCTL_QUEUE_ENABLE | (1 << 16),
>>       [RXDCTL1]       = 1 << 16,
>>       [RXDCTL2]       = 1 << 16,
>> diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
>> index ebf3e95023..c8ce5b1671 100644
>> --- a/hw/net/igb_regs.h
>> +++ b/hw/net/igb_regs.h
>> @@ -147,6 +147,7 @@ union e1000_adv_rx_desc {
>>   #define IGB_MAX_TX_QUEUES          8
>>   #define IGB_MAX_VF_MC_ENTRIES      30
>>   #define IGB_MAX_VF_FUNCTIONS       8
>> +#define IGB_MAX_VM_POOLS           8
>>   #define IGB_MAX_VFTA_ENTRIES       128
>>   #define IGB_82576_VF_DEV_ID        0x10CA
>>   #define IGB_I350_VF_DEV_ID         0x1520
>> @@ -160,7 +161,8 @@ union e1000_adv_rx_desc {
>>   #define E1000_MRQC_RSS_FIELD_IPV6_UDP       0x00800000
>>   #define E1000_MRQC_RSS_FIELD_IPV6_UDP_EX    0x01000000
>> -/* Additional Receive Descriptor Control definitions */
>> +/* Additional RX/TX Descriptor Control definitions */
>> +#define E1000_TXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Tx 
>> Queue */
>>   #define E1000_RXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Rx 
>> Queue */
>>   /* Direct Cache Access (DCA) definitions */

Also: igb_regs.h is copied from Linux. Copy the definition from:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/intel/igb/e1000_82575.h?h=v6.1#n140

...and paste it to the corresponding place.

