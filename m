Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75666BE0BD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 06:47:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd2vV-0002EW-Ft; Fri, 17 Mar 2023 01:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pd2v2-00021T-Rw
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 01:46:27 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pd2uz-0006VQ-Rl
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 01:46:24 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so3996348pjp.1
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 22:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679031979;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8WGJcGsg/wssbfWfixTxI1tzXgVuYhjfLePQmmmO5GI=;
 b=6aBBsVKmeDJgnthnaJtW9xWbR8wCzu5ojeMbUBsC/3OFky8D52KUGKfklw0qUpTAE5
 +8/KFD2f5S/SrQWfYvjK/IHDBa8pUIUgDuPFpnmFE4SZgEfCGoB02rGJpnJrts+/8jj9
 xB3pJI3la4zs4FonrC5m5NGrLg7kUnJGdBIVKRWj7ccgsEyagHmZDIN5VeQJHVbBXNsy
 jKL6W2uep4vhJ90uP5vxERxk7+tE8Pr68Vk+rPoYKRm4hbX4m0iT2yeBDyBE8IHyvSAu
 DeraaP/hFgoz5kghtx414wzZ8ayrft8gS5iI2TS6o7yfngjCMVkIU4PzG0Apbop1aMa9
 7gWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679031979;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8WGJcGsg/wssbfWfixTxI1tzXgVuYhjfLePQmmmO5GI=;
 b=VD8fNRb8fah9oErlFo5jDGwAzrnLqznUckqfY3y/lvZwLZxLF9t0cMZ9ShoCVVRWun
 GdIvhl1iO0e6HiYkoaoW+N+eM4TtJ9fj5GaqRPcUj6vkDIqDqq90FykIsvAFyN44Hbap
 ODPp0z8jLcb/87AqhoAxgIq4QSd8sUGDtKmIPLnFb8ieYQzOJdn+2okPGz3RslGTC6XV
 6r3YGC/ddxbT4QIlXPMKaGhkVd/QT78do3wleVuy7BBkIQYNOQnW8j2dsIMVNv7CfyhJ
 UiOLd3UwNYQzexTmwADPDRXj/ght7mBwVBh76moKeGyhCOMtXz55w9TsqvH6PKUbBuaL
 qb4Q==
X-Gm-Message-State: AO0yUKUVSiKAYHKt7CA1q6uqBRztZYsVnlWeqMAmXdqNMRwCm4R0Z161
 vk903GTPzSAYHSW7pK1jbsB11w==
X-Google-Smtp-Source: AK7set/L/3mAOxVozM3WU79cDGet8FiToeXh5fVA4m3rJBeEn7Syu6yYbAusvUjBx16sfSq/H0WCkQ==
X-Received: by 2002:a17:90b:17d0:b0:23f:634a:6c7 with SMTP id
 me16-20020a17090b17d000b0023f634a06c7mr206363pjb.15.1679031979396; 
 Thu, 16 Mar 2023 22:46:19 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a17090b011300b002376d85844dsm520660pjz.51.2023.03.16.22.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 22:46:19 -0700 (PDT)
Message-ID: <9f6c9eee-7dff-00bb-e1e4-52012b39080c@daynix.com>
Date: Fri, 17 Mar 2023 14:46:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0 v2] igb: Save the entire Tx context descriptor
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "quintela@redhat.com" <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230316155707.27007-1-akihiko.odaki@daynix.com>
 <DBBP189MB1433F6AD96242F323CFEA36B95BC9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB1433F6AD96242F323CFEA36B95BC9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/03/17 5:27, Sriram Yagnaraman wrote:
> 
>> -----Original Message-----
>> From: qemu-devel-bounces+sriram.yagnaraman=est.tech@nongnu.org
>> <qemu-devel-bounces+sriram.yagnaraman=est.tech@nongnu.org> On Behalf
>> Of Akihiko Odaki
>> Sent: Thursday, 16 March 2023 16:57
>> Cc: qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>; Dmitry
>> Fleytman <dmitry.fleytman@gmail.com>; quintela@redhat.com; Philippe
>> Mathieu-Daudé <philmd@linaro.org>; Akihiko Odaki
>> <akihiko.odaki@daynix.com>
>> Subject: [PATCH for 8.0 v2] igb: Save the entire Tx context descriptor
>>
>> The current implementation of igb uses only part of a advanced Tx context
>> descriptor because it misses some features and sniffs the trait of the packet
>> instead of respecting the packet type specified in the descriptor. However, we
>> will certainly need the entire Tx context descriptor when we update igb to
>> respect these ignored fields. Save the entire Tx context descriptor to prepare
>> for such a change.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>> V1 -> V2: Bump igb-tx version
>>
>>   hw/net/igb.c      | 10 ++++++----
>>   hw/net/igb_core.c | 17 ++++++++++-------  hw/net/igb_core.h |  3 +--
>>   3 files changed, 17 insertions(+), 13 deletions(-)
>>
>> diff --git a/hw/net/igb.c b/hw/net/igb.c index c6d753df87..f9ec82fc28 100644
>> --- a/hw/net/igb.c
>> +++ b/hw/net/igb.c
>> @@ -504,11 +504,13 @@ static int igb_post_load(void *opaque, int
>> version_id)
>>
>>   static const VMStateDescription igb_vmstate_tx = {
>>       .name = "igb-tx",
>> -    .version_id = 1,
>> -    .minimum_version_id = 1,
>> +    .version_id = 2,
>> +    .minimum_version_id = 2,
>>       .fields = (VMStateField[]) {
>> -        VMSTATE_UINT16(vlan, struct igb_tx),
>> -        VMSTATE_UINT16(mss, struct igb_tx),
>> +        VMSTATE_UINT32(ctx.vlan_macip_lens, struct igb_tx),
>> +        VMSTATE_UINT32(ctx.seqnum_seed, struct igb_tx),
>> +        VMSTATE_UINT32(ctx.type_tucmd_mlhl, struct igb_tx),
>> +        VMSTATE_UINT32(ctx.mss_l4len_idx, struct igb_tx),
>>           VMSTATE_BOOL(tse, struct igb_tx),
>>           VMSTATE_BOOL(ixsm, struct igb_tx),
>>           VMSTATE_BOOL(txsm, struct igb_tx), diff --git a/hw/net/igb_core.c
>> b/hw/net/igb_core.c index a7c7bfdc75..304f5d849f 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -390,7 +390,8 @@ static bool
>>   igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)  {
>>       if (tx->tse) {
>> -        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->mss)) {
>> +        uint32_t mss = tx->ctx.mss_l4len_idx >> 16;
>> +        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, mss)) {
>>               return false;
>>           }
>>
>> @@ -550,8 +551,10 @@ igb_process_tx_desc(IGBCore *core,
>>                      E1000_ADVTXD_DTYP_CTXT) {
>>               /* advanced transmit context descriptor */
>>               tx_ctx_desc = (struct e1000_adv_tx_context_desc *)tx_desc;
>> -            tx->vlan = le32_to_cpu(tx_ctx_desc->vlan_macip_lens) >> 16;
>> -            tx->mss = le32_to_cpu(tx_ctx_desc->mss_l4len_idx) >> 16;
>> +            tx->ctx.vlan_macip_lens = le32_to_cpu(tx_ctx_desc->vlan_macip_lens);
>> +            tx->ctx.seqnum_seed = le32_to_cpu(tx_ctx_desc->seqnum_seed);
>> +            tx->ctx.type_tucmd_mlhl = le32_to_cpu(tx_ctx_desc-
>>> type_tucmd_mlhl);
>> +            tx->ctx.mss_l4len_idx =
>> + le32_to_cpu(tx_ctx_desc->mss_l4len_idx);
> 
> Wouldn't it be better to parse the context into all the required fields like vlan, mss, etc., already when handling the context descriptor, instead of parsing it for every data descriptor later?
> Also, in my yet to be merged patch [1] which handles VLAN insertion for VMDq I use the vlan field in multiple places, so it would be better to have the vlan value readily available.
> [1]: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg00393.html

If there is a better representation of the entire context descriptor we 
may use it as an internal use, but I think it is good enough for the 
purpose, too.

For patch [1], I think it is better to gather the logic to derive the 
VID into one place instead of cluttering several places with the 
relevant code. Concretely, igb_tx_insert_vlan() can decide whether to 
read the VID from the context descriptor or from VMIR, or not to read 
(in case VLAN insertion is disabled).

Regards,
Akihiko Odaki

> 
>>               return;
>>           } else {
>>               /* unknown descriptor type */ @@ -575,8 +578,9 @@
>> igb_process_tx_desc(IGBCore *core,
>>       if (cmd_type_len & E1000_TXD_CMD_EOP) {
>>           if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
>>               if (cmd_type_len & E1000_TXD_CMD_VLE) {
>> -                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
>> -                    core->mac[VET] & 0xffff);
>> +                uint16_t vlan = tx->ctx.vlan_macip_lens >> 16;
>> +                uint16_t vet = core->mac[VET] & 0xffff;
>> +                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan, vet);
>>               }
>>               if (igb_tx_pkt_send(core, tx, queue_index)) {
>>                   igb_on_tx_done_update_stats(core, tx->tx_pkt); @@ -4024,8
>> +4028,7 @@ static void igb_reset(IGBCore *core, bool sw)
>>       for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
>>           tx = &core->tx[i];
>>           net_tx_pkt_reset(tx->tx_pkt);
>> -        tx->vlan = 0;
>> -        tx->mss = 0;
>> +        memset(&tx->ctx, 0, sizeof(tx->ctx));
>>           tx->tse = false;
>>           tx->ixsm = false;
>>           tx->txsm = false;
>> diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h index
>> 814c1e264b..3483edc655 100644
>> --- a/hw/net/igb_core.h
>> +++ b/hw/net/igb_core.h
>> @@ -72,8 +72,7 @@ struct IGBCore {
>>       QEMUTimer *autoneg_timer;
>>
>>       struct igb_tx {
>> -        uint16_t vlan;  /* VLAN Tag */
>> -        uint16_t mss;   /* Maximum Segment Size */
>> +        struct e1000_adv_tx_context_desc ctx;
>>           bool tse;       /* TCP/UDP Segmentation Enable */
>>           bool ixsm;      /* Insert IP Checksum */
>>           bool txsm;      /* Insert TCP/UDP Checksum */
>> --
>> 2.39.2
>>
> 

