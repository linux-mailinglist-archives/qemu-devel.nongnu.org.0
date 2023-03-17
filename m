Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604E56BE7C2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 12:14:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd81G-0004eP-G2; Fri, 17 Mar 2023 07:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pd81D-0004dt-DK
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 07:13:07 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pd81A-0004JD-U9
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 07:13:07 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so4861119pjb.0
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 04:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679051583;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4oKbpZypFeuD5hlbLULHNzPnXoLSqUHLYSt4rm7n7x4=;
 b=4g2BO0w++K1o6hXLQtAuLBhUc64VFdCuU1MDinDmYWNEj+NmNJhXpUoz7WpGKKB2ig
 QhVT9AI+edXoK4P+YceROum/c5pjbHxy/4ONC2DsK+rw0/mp3/KLyu0KELDP+mKv7uSQ
 NyX8VjWjv5yBICgzK7GsN2LPKJdIIcAAcBm84rNxgM5QlbdIdx/U9yB60HP456owHgOm
 jEjBkbgK/6McGdPYafDSKQlHWdoVoMbTm6crq3xVIqR8aropwp8WADlA5w9Z7BZb16iY
 3T19/FXh3oVlEI6Eumzyx5UibXEoBaVS0NhJ8R62yo7w7AMvU2tnZulmqOkxYQKDuOmY
 sKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679051583;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4oKbpZypFeuD5hlbLULHNzPnXoLSqUHLYSt4rm7n7x4=;
 b=YMipnvnaYSUbk1f4kDLtJFJB3o3h7QlyUi1fcCfWL55887gahrqU8c2yhaWLC93g63
 jxDrcMq3DSiI1FTrJm2FgiRXuddoLWSqJSNTiwIH6orUI3zGjEKArm3o86WB34dGenZ1
 8N9fuBj6Ex6jVCLPKLuR+DriCGKwaib79zgyxzQjo4QXiY/U/craG2wtNOoZ4CaHCzeI
 M5SAtOtipeIG2g6PGeyOS9W5M7iCw+Gz5iy5JA2tfDmC3iCyItOoZSfy4w3RY0fPKaOj
 tWWARPNMvDNNCQtSF1e1++usgYbDWKHwrdTjUFOOfOXB//RghiUx5Jh4AnJ39Zhl7xoi
 n30A==
X-Gm-Message-State: AO0yUKWG2Yq/vZ9dqeTeeOaTUYTPtqwXGAy35dtiO3HycECds6NzBixH
 QIKivVOda+GwmOqG2cDR/yHkjA==
X-Google-Smtp-Source: AK7set8S6ZUAyjCFkZOzSS49w982/4cGeUC7OxL28WQlXEN9V7wp2gV0qAooWlOHDjat6pqtZQka7w==
X-Received: by 2002:a05:6a20:2a26:b0:cc:aedf:9a1e with SMTP id
 e38-20020a056a202a2600b000ccaedf9a1emr6227606pzh.61.1679051582432; 
 Fri, 17 Mar 2023 04:13:02 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s3-20020aa78d43000000b00625c96db7desm989067pfe.198.2023.03.17.04.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 04:13:02 -0700 (PDT)
Message-ID: <e4f089cb-4b86-e649-5181-005101f71b52@daynix.com>
Date: Fri, 17 Mar 2023 20:12:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0 v2] igb: Save the entire Tx context descriptor
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "quintela@redhat.com" <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230316155707.27007-1-akihiko.odaki@daynix.com>
 <DBBP189MB1433F6AD96242F323CFEA36B95BC9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
 <9f6c9eee-7dff-00bb-e1e4-52012b39080c@daynix.com>
 <DBBP189MB1433B432AAF7A6AF40852DBE95BD9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB1433B432AAF7A6AF40852DBE95BD9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
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

On 2023/03/17 18:19, Sriram Yagnaraman wrote:
> 
> 
>> -----Original Message-----
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Friday, 17 March 2023 06:46
>> To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
>> Cc: qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>; Dmitry
>> Fleytman <dmitry.fleytman@gmail.com>; quintela@redhat.com; Philippe
>> Mathieu-Daudé <philmd@linaro.org>
>> Subject: Re: [PATCH for 8.0 v2] igb: Save the entire Tx context descriptor
>>
>> On 2023/03/17 5:27, Sriram Yagnaraman wrote:
>>>
>>>> -----Original Message-----
>>>> From: qemu-devel-bounces+sriram.yagnaraman=est.tech@nongnu.org
>>>> <qemu-devel-bounces+sriram.yagnaraman=est.tech@nongnu.org> On
>> Behalf
>>>> Of Akihiko Odaki
>>>> Sent: Thursday, 16 March 2023 16:57
>>>> Cc: qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>;
>> Dmitry
>>>> Fleytman <dmitry.fleytman@gmail.com>; quintela@redhat.com; Philippe
>>>> Mathieu-Daudé <philmd@linaro.org>; Akihiko Odaki
>>>> <akihiko.odaki@daynix.com>
>>>> Subject: [PATCH for 8.0 v2] igb: Save the entire Tx context
>>>> descriptor
>>>>
>>>> The current implementation of igb uses only part of a advanced Tx
>>>> context descriptor because it misses some features and sniffs the
>>>> trait of the packet instead of respecting the packet type specified
>>>> in the descriptor. However, we will certainly need the entire Tx
>>>> context descriptor when we update igb to respect these ignored
>>>> fields. Save the entire Tx context descriptor to prepare for such a change.
>>>>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> ---
>>>> V1 -> V2: Bump igb-tx version
>>>>
>>>>    hw/net/igb.c      | 10 ++++++----
>>>>    hw/net/igb_core.c | 17 ++++++++++-------  hw/net/igb_core.h |  3 +--
>>>>    3 files changed, 17 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/hw/net/igb.c b/hw/net/igb.c index c6d753df87..f9ec82fc28
>>>> 100644
>>>> --- a/hw/net/igb.c
>>>> +++ b/hw/net/igb.c
>>>> @@ -504,11 +504,13 @@ static int igb_post_load(void *opaque, int
>>>> version_id)
>>>>
>>>>    static const VMStateDescription igb_vmstate_tx = {
>>>>        .name = "igb-tx",
>>>> -    .version_id = 1,
>>>> -    .minimum_version_id = 1,
>>>> +    .version_id = 2,
>>>> +    .minimum_version_id = 2,
>>>>        .fields = (VMStateField[]) {
>>>> -        VMSTATE_UINT16(vlan, struct igb_tx),
>>>> -        VMSTATE_UINT16(mss, struct igb_tx),
>>>> +        VMSTATE_UINT32(ctx.vlan_macip_lens, struct igb_tx),
>>>> +        VMSTATE_UINT32(ctx.seqnum_seed, struct igb_tx),
>>>> +        VMSTATE_UINT32(ctx.type_tucmd_mlhl, struct igb_tx),
>>>> +        VMSTATE_UINT32(ctx.mss_l4len_idx, struct igb_tx),
>>>>            VMSTATE_BOOL(tse, struct igb_tx),
>>>>            VMSTATE_BOOL(ixsm, struct igb_tx),
>>>>            VMSTATE_BOOL(txsm, struct igb_tx), diff --git
>>>> a/hw/net/igb_core.c b/hw/net/igb_core.c index a7c7bfdc75..304f5d849f
>>>> 100644
>>>> --- a/hw/net/igb_core.c
>>>> +++ b/hw/net/igb_core.c
>>>> @@ -390,7 +390,8 @@ static bool
>>>>    igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)  {
>>>>        if (tx->tse) {
>>>> -        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->mss)) {
>>>> +        uint32_t mss = tx->ctx.mss_l4len_idx >> 16;
>>>> +        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, mss))
>>>> + {
>>>>                return false;
>>>>            }
>>>>
>>>> @@ -550,8 +551,10 @@ igb_process_tx_desc(IGBCore *core,
>>>>                       E1000_ADVTXD_DTYP_CTXT) {
>>>>                /* advanced transmit context descriptor */
>>>>                tx_ctx_desc = (struct e1000_adv_tx_context_desc *)tx_desc;
>>>> -            tx->vlan = le32_to_cpu(tx_ctx_desc->vlan_macip_lens) >> 16;
>>>> -            tx->mss = le32_to_cpu(tx_ctx_desc->mss_l4len_idx) >> 16;
>>>> +            tx->ctx.vlan_macip_lens = le32_to_cpu(tx_ctx_desc-
>>> vlan_macip_lens);
>>>> +            tx->ctx.seqnum_seed = le32_to_cpu(tx_ctx_desc->seqnum_seed);
>>>> +            tx->ctx.type_tucmd_mlhl = le32_to_cpu(tx_ctx_desc-
>>>>> type_tucmd_mlhl);
>>>> +            tx->ctx.mss_l4len_idx =
>>>> + le32_to_cpu(tx_ctx_desc->mss_l4len_idx);
>>>
>>> Wouldn't it be better to parse the context into all the required fields like vlan,
>> mss, etc., already when handling the context descriptor, instead of parsing it for
>> every data descriptor later?
>>> Also, in my yet to be merged patch [1] which handles VLAN insertion for
>> VMDq I use the vlan field in multiple places, so it would be better to have the
>> vlan value readily available.
>>> [1]:
>>> https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg00393.html
>>
>> If there is a better representation of the entire context descriptor we may use it
>> as an internal use, but I think it is good enough for the purpose, too.
> 
> If I understand correctly this change will help to realize "Table 7-31: Valid context vs Required Offload"?
> If so, the internal representation can already be prepared to hold the following:
> - vlan
> - l4len
> - iplen
> - maclen
> - mss
> - l4type
> - ip4

This patch is not intended to cover a specific feature, but it is 
intended to allow us to implement any (currently) uncovered features in 
the future. In this regard, all of the fields except the reserved fields 
and DTYP are necessary. Anyway, in my opinion, the original format of 
the context descriptor is well-suited to save the fields you listed.

> 
> If we have an internal representation, the fields can hold values from the context, or from VMDq registers, or from the data descriptor depending on what the driver has configured.

Certainly if you save the context descriptor as is, you do not expect 
the fields of the saved descriptor to repesent values from other places 
like VMDq registers. However I rather see this as a more favorable 
feature. The driver can change the configuration anytime, and the 
effective value can change accordingly. For example, you may see the 
configuration at a time, and you overwrite the value saved from the 
context with the value provided from the configuration, the value of the 
field may be valid at the time, but if the configuration gets changed 
after that and the value from the context becomes valid again, you will 
no longer know what the effective value is. Such a situation is rare in 
this case, but still better to cover if possible.

And it seems your patch for VLAN actually has such a bug. I thought it 
is OK to overwrite the VID got from the context descriptor with another 
in igb_tx_insert_vlan() as it is EOP and the context becomes invalid 
anyway, but I have just realized nothing says the old context gets 
invalidated after EOP. The VID from the context descriptor should not be 
overwritten.

In general, a persistent state derived from other persistent states are 
prone to such bugs. The less error-prone way is to have a function which 
derives the value effective now.

> Anyhow, I don't want to derail this patch, you already have ACKs, please go ahead if you don't want to do this now.

I'll keep this moving forward, but thank you for sharing your thoughts.

For your VLAN patch, please correct the bug I described and submit a new 
version (probably after this patch is landed as your patch is affected 
with the change of vlan field.)

Regards,
Akihiko Odaki

> 
>>
>> For patch [1], I think it is better to gather the logic to derive the VID into one
>> place instead of cluttering several places with the relevant code. Concretely,
>> igb_tx_insert_vlan() can decide whether to read the VID from the context
>> descriptor or from VMIR, or not to read (in case VLAN insertion is disabled).
>>
>> Regards,
>> Akihiko Odaki
>>
>>>
>>>>                return;
>>>>            } else {
>>>>                /* unknown descriptor type */ @@ -575,8 +578,9 @@
>>>> igb_process_tx_desc(IGBCore *core,
>>>>        if (cmd_type_len & E1000_TXD_CMD_EOP) {
>>>>            if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
>>>>                if (cmd_type_len & E1000_TXD_CMD_VLE) {
>>>> -                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
>>>> -                    core->mac[VET] & 0xffff);
>>>> +                uint16_t vlan = tx->ctx.vlan_macip_lens >> 16;
>>>> +                uint16_t vet = core->mac[VET] & 0xffff;
>>>> +                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan,
>>>> + vet);
>>>>                }
>>>>                if (igb_tx_pkt_send(core, tx, queue_index)) {
>>>>                    igb_on_tx_done_update_stats(core, tx->tx_pkt); @@
>>>> -4024,8
>>>> +4028,7 @@ static void igb_reset(IGBCore *core, bool sw)
>>>>        for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
>>>>            tx = &core->tx[i];
>>>>            net_tx_pkt_reset(tx->tx_pkt);
>>>> -        tx->vlan = 0;
>>>> -        tx->mss = 0;
>>>> +        memset(&tx->ctx, 0, sizeof(tx->ctx));
>>>>            tx->tse = false;
>>>>            tx->ixsm = false;
>>>>            tx->txsm = false;
>>>> diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h index
>>>> 814c1e264b..3483edc655 100644
>>>> --- a/hw/net/igb_core.h
>>>> +++ b/hw/net/igb_core.h
>>>> @@ -72,8 +72,7 @@ struct IGBCore {
>>>>        QEMUTimer *autoneg_timer;
>>>>
>>>>        struct igb_tx {
>>>> -        uint16_t vlan;  /* VLAN Tag */
>>>> -        uint16_t mss;   /* Maximum Segment Size */
>>>> +        struct e1000_adv_tx_context_desc ctx;
>>>>            bool tse;       /* TCP/UDP Segmentation Enable */
>>>>            bool ixsm;      /* Insert IP Checksum */
>>>>            bool txsm;      /* Insert TCP/UDP Checksum */
>>>> --
>>>> 2.39.2
>>>>
>>>

