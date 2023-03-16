Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3D76BCFAB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:40:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmu2-00067o-VU; Thu, 16 Mar 2023 08:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcmtz-00065k-4A
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:40:15 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcmto-0004DB-W5
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:40:07 -0400
Received: by mail-pj1-x102f.google.com with SMTP id j13so1522121pjd.1
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 05:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1678970403;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GrAEBUY2zR/OQMCENThCUrZDGKfDy+6qy+iIh6FR7PE=;
 b=FDwCke7biwjDFB/5D7bzY4yn3YXJm78IgC3HJDFLWSirbhAtz/6H7XPXvX2RbpavRp
 DyQr61/V+l+uPuFDTDmE3FFhCRY4BqN7x+SUAqsaVlBv032E9aTziBZ/XohY7NjUKj0R
 gRsEfOYbO8bw94e49vnCk6IQMZw5xyzlaHyPoLaQps0WHEq7Wl5dpzUn7sfVQOJsrFTZ
 YPedxB0McXa1TabF2kd9CMBPXJvf6N3vofgKzQOSxFS2qKi29M3ko1rQTVdwQD7En5W6
 s+54gEznhxrEYWSGtLnAWKGmItIpYB9YVwyGv9d4z4ATLbw+hxCVB/A5prwx5REhmb7f
 B3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678970403;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GrAEBUY2zR/OQMCENThCUrZDGKfDy+6qy+iIh6FR7PE=;
 b=xyPKvX6Nx3dgxPBIxH7twZh+bu9Wzsz996rrlJmTmoU9dmKBuQpV9dRFHpvHTCjUA0
 YOlWw8J/OPVt8O5kgqCeBp25phg7F5DFidkPakqX0RGDdh3v3s4atNp6jVuyp5WFj83a
 h4Y1J+CDI6k3M0m/8Q75byEYWJbYu4x+0XJiL8uhmREYGv7Dc9n8Oanwx2QaAP2Fs4kN
 XtVV8SH3C7AZemmoUsue1W8TJD8FnTQ50BjHYdlzwOh6ISGxaCgmTePdnHlp9E8Z7fdZ
 WCnvt/IyS9COmdunGc+orSG1yd3/fkGbpH+kTdVq12slTrY/xWPDkREBP5M2pEn0264b
 Nhrg==
X-Gm-Message-State: AO0yUKU2lpEXpmBX3XjjqyWdak1DUe8OfRC04I9vusaDr95z9Xvi5Iwq
 rWn+2PMum+14C5UwTgTm80QycQ==
X-Google-Smtp-Source: AK7set9/UvYBLyBVcKgVAaNmhkIrn179EPL4nbQpenx8tA1l8kEOHS30G47v95p30VSku5B+f9QSpw==
X-Received: by 2002:a05:6a20:7f8e:b0:cc:ce95:7db5 with SMTP id
 d14-20020a056a207f8e00b000ccce957db5mr3738703pzj.57.1678970403507; 
 Thu, 16 Mar 2023 05:40:03 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 d13-20020aa78e4d000000b0061ddff8c53dsm5335155pfr.151.2023.03.16.05.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 05:40:03 -0700 (PDT)
Message-ID: <693992ff-cc77-c697-35f3-6ad3a94427bf@daynix.com>
Date: Thu, 16 Mar 2023 21:40:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0] igb: Save the entire Tx context descriptor
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
References: <20230316122847.11003-1-akihiko.odaki@daynix.com>
 <d60df663-51e0-67bf-0888-cfd78acec7d2@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <d60df663-51e0-67bf-0888-cfd78acec7d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
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

On 2023/03/16 21:36, Philippe Mathieu-Daudé wrote:
> On 16/3/23 13:28, Akihiko Odaki wrote:
>> The current implementation of igb uses only part of a advanced Tx
>> context descriptor because it misses some features and sniffs the trait
>> of the packet instead of respecting the packet type specified in the
>> descriptor. However, we will certainly need the entire Tx context
>> descriptor when we update igb to respect these ignored fields. Save the
>> entire Tx context descriptor to prepare for such a change.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/net/igb.c      |  6 ++++--
>>   hw/net/igb_core.c | 17 ++++++++++-------
>>   hw/net/igb_core.h |  3 +--
>>   3 files changed, 15 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/net/igb.c b/hw/net/igb.c
>> index 0792626322..50239a7cb1 100644
>> --- a/hw/net/igb.c
>> +++ b/hw/net/igb.c
>> @@ -499,8 +499,10 @@ static const VMStateDescription igb_vmstate_tx = {
>>       .version_id = 1,
> 
> Don't we need to increment the vmstate version? See
> https://qemu-project.gitlab.io/qemu/devel/migration.html#versions

This device is added only a week ago so it shouldn't need version bump. 
That is also why I tagged this change "for 8.0".

> 
>>       .minimum_version_id = 1,
>>       .fields = (VMStateField[]) {
>> -        VMSTATE_UINT16(vlan, struct igb_tx),
>> -        VMSTATE_UINT16(mss, struct igb_tx),
>> +        VMSTATE_UINT32(ctx.vlan_macip_lens, struct igb_tx),
>> +        VMSTATE_UINT32(ctx.seqnum_seed, struct igb_tx),
>> +        VMSTATE_UINT32(ctx.type_tucmd_mlhl, struct igb_tx),
>> +        VMSTATE_UINT32(ctx.mss_l4len_idx, struct igb_tx),
>>           VMSTATE_BOOL(tse, struct igb_tx),
>>           VMSTATE_BOOL(ixsm, struct igb_tx),
>>           VMSTATE_BOOL(txsm, struct igb_tx),
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
>> index 41d1abae03..dbe24739d0 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -390,7 +390,8 @@ static bool
>>   igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
>>   {
>>       if (tx->tse) {
>> -        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, 
>> tx->mss)) {
>> +        uint32_t mss = tx->ctx.mss_l4len_idx >> 16;
>> +        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, mss)) {
>>               return false;
>>           }
>> @@ -551,8 +552,10 @@ igb_process_tx_desc(IGBCore *core,
>>                      E1000_ADVTXD_DTYP_CTXT) {
>>               /* advanced transmit context descriptor */
>>               tx_ctx_desc = (struct e1000_adv_tx_context_desc *)tx_desc;
>> -            tx->vlan = le32_to_cpu(tx_ctx_desc->vlan_macip_lens) >> 16;
>> -            tx->mss = le32_to_cpu(tx_ctx_desc->mss_l4len_idx) >> 16;
>> +            tx->ctx.vlan_macip_lens = 
>> le32_to_cpu(tx_ctx_desc->vlan_macip_lens);
>> +            tx->ctx.seqnum_seed = le32_to_cpu(tx_ctx_desc->seqnum_seed);
>> +            tx->ctx.type_tucmd_mlhl = 
>> le32_to_cpu(tx_ctx_desc->type_tucmd_mlhl);
>> +            tx->ctx.mss_l4len_idx = 
>> le32_to_cpu(tx_ctx_desc->mss_l4len_idx);
>>               return;
>>           } else {
>>               /* unknown descriptor type */
>> @@ -576,8 +579,9 @@ igb_process_tx_desc(IGBCore *core,
>>       if (cmd_type_len & E1000_TXD_CMD_EOP) {
>>           if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
>>               if (cmd_type_len & E1000_TXD_CMD_VLE) {
>> -                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
>> -                    core->mac[VET] & 0xffff);
>> +                uint16_t vlan = tx->ctx.vlan_macip_lens >> 16;
>> +                uint16_t vet = core->mac[VET] & 0xffff;
>> +                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan, vet);
>>               }
>>               if (igb_tx_pkt_send(core, tx, queue_index)) {
>>                   igb_on_tx_done_update_stats(core, tx->tx_pkt);
>> @@ -4027,8 +4031,7 @@ static void igb_reset(IGBCore *core, bool sw)
>>       for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
>>           tx = &core->tx[i];
>>           net_tx_pkt_reset(tx->tx_pkt, NULL);
>> -        tx->vlan = 0;
>> -        tx->mss = 0;
>> +        memset(&tx->ctx, 0, sizeof(tx->ctx));
>>           tx->tse = false;
>>           tx->ixsm = false;
>>           tx->txsm = false;
>> diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
>> index 814c1e264b..3483edc655 100644
>> --- a/hw/net/igb_core.h
>> +++ b/hw/net/igb_core.h
>> @@ -72,8 +72,7 @@ struct IGBCore {
>>       QEMUTimer *autoneg_timer;
>>       struct igb_tx {
>> -        uint16_t vlan;  /* VLAN Tag */
>> -        uint16_t mss;   /* Maximum Segment Size */
>> +        struct e1000_adv_tx_context_desc ctx;
>>           bool tse;       /* TCP/UDP Segmentation Enable */
>>           bool ixsm;      /* Insert IP Checksum */
>>           bool txsm;      /* Insert TCP/UDP Checksum */
> 

