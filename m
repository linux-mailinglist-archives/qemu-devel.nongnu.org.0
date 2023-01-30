Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C71680EB3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:22:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU5x-0003UG-FA; Mon, 30 Jan 2023 08:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMU5U-0003S2-6u
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:20:56 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMU5S-0005YX-FS
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:20:43 -0500
Received: by mail-pl1-x636.google.com with SMTP id v23so11595095plo.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qhKxxS+pU26NgdD2JUFgZR9O5WtMCx4QCSFrRV1EpXg=;
 b=rq63Ib+Z7gVvjsubiSw7IV0PSUI27gEK9FNIuGmkGl/M24eLeGAZ98gPnuUuLVRl4a
 lNV+X+GZkNgKy9BYjnI+8nO67/LwBrpvmXxEjigXFk4ukZ4Kkne8hruXATqoc/EPRB4t
 gS8kOWrBl6D4abp0CPnd8qSRJ+3y2rHkmIkxQhwi5UXmGDRl+QmqdTn+FTHpZTt1FHA6
 Vp1r6RdJ8+J0fbvazfDrpKMIabi4Rg7j5EnT7uhDCLaVyrko2iQwfO9uQezYRdXotyGL
 4mW3UshgBTQlgPn+Tsnlc7CBxeXuZhWKzaR07VF1ChPZ1jtJSJDK5qigfPO4ixMyhz1w
 G2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qhKxxS+pU26NgdD2JUFgZR9O5WtMCx4QCSFrRV1EpXg=;
 b=bMXEsxtxRIjCF/AfuzJzkMR8eyZGDoLLQcHZHTftdFPJjtOpjnPpEfbvGGbrcP+HmD
 H7FxHLhF1uDjFIGLJhvDlpARn/YKmZU6uUR0zuO3oDZkc/xbxv6KyHl2aMQJc+qQlGt9
 DkGhUgt//L3txh0UCz1CVdjenLlxKSt4Ar0dDX+4+v77v/bu0q9B4CkeAW0wbbSrqNd3
 0WBTsIdHX/BOOopiW6tZ01i8/AqbsIquNtgQ98+x7aI1es0fr+aqEwIX+jjRUwEpRNSL
 dMA/8d9bsnf6tnHgDzn790Z881u2gpERrYtZmEsAJBhZBXF/3faHCIYwQJZaftjdhpiX
 SXBw==
X-Gm-Message-State: AFqh2kr/BB7PGfRxw5/xucW8IYqPHLvAgeqqDtQx5t+lk3D0FD0akDh8
 g/LuF0AXUhPHfAKgQz5AMm1bgQ==
X-Google-Smtp-Source: AMrXdXsN6qZwdDF/97aQAxAG00MHB45G1frYVGrSuIe3uysdFlYA1sRV5XrM77E5lounXcF3kQSueQ==
X-Received: by 2002:a17:902:e845:b0:192:f45e:4197 with SMTP id
 t5-20020a170902e84500b00192f45e4197mr65735431plg.31.1675084841173; 
 Mon, 30 Jan 2023 05:20:41 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170902a70400b0019619f27525sm7718642plq.302.2023.01.30.05.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 05:20:40 -0800 (PST)
Message-ID: <e99249a1-6380-0d9b-7e78-7483b39ce1c1@daynix.com>
Date: Mon, 30 Jan 2023 22:20:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 5/9] igb: respect E1000_VMOLR_RSSE
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
 <20230128134633.22730-6-sriram.yagnaraman@est.tech>
 <e6a03b04-2565-7ae3-ace5-1486369d000b@daynix.com>
 <DBBP189MB143380F3BC336D9A80B251A995D39@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB143380F3BC336D9A80B251A995D39@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
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

On 2023/01/30 21:07, Sriram Yagnaraman wrote:
>> -----Original Message-----
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Sunday, 29 January 2023 08:25
>> To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
>> Cc: qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>; Dmitry
>> Fleytman <dmitry.fleytman@gmail.com>; Michael S . Tsirkin
>> <mst@redhat.com>; Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> Subject: Re: [PATCH 5/9] igb: respect E1000_VMOLR_RSSE
>>
>> On 2023/01/28 22:46, Sriram Yagnaraman wrote:
>>> RSS for VFs is only enabled if VMOLR[n].RSSE is set.
>>>
>>> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
>>> ---
>>>    hw/net/igb_core.c | 18 +++++++++++++-----
>>>    1 file changed, 13 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c index
>>> 1eb7ba168f..e4fd4a1a5f 100644
>>> --- a/hw/net/igb_core.c
>>> +++ b/hw/net/igb_core.c
>>> @@ -69,7 +69,7 @@ typedef struct IGBTxPktVmdqCallbackContext {
>>>
>>>    static ssize_t
>>>    igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
>>> -                     bool has_vnet, bool *assigned);
>>> +                     bool has_vnet, bool *external_tx);
>>
>> I admit external_tx is somewhat confusing, but it is more than just telling if it
>> is assigned to Rx queue or not. If external_tx is not NULL, it indicates it is part
>> of Tx packet switching. In that case, a bool value which describes whether the
>> packet should be routed to external LAN must be assigned. The value can be
>> false even if the packet is assigned to Rx queues; it will be always false if it is
>> multicast, for example.
> 
> Yes, I undestand the purpose of external_tx. I merely changed the parameter name in the function declaration to match it's defintion. Anyhow, I will remove this change since it was purely comsetic.

The definition is wrong then. I'll submit the new version with it fixed.

> 
>>
>>>
>>>    static inline void
>>>    igb_set_interrupt_cause(IGBCore *core, uint32_t val); @@ -942,7
>>> +942,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const
>>> struct eth_header *ehdr,
>>>
>>>        if (core->mac[MRQC] & 1) {
>>>            if (is_broadcast_ether_addr(ehdr->h_dest)) {
>>> -            for (i = 0; i < 8; i++) {
>>> +            for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
>>
>> I just left it as 8 because VMDq is not specific to VF. Perhaps it is better to
>> have another macro to denote the number of VMDq pools, but it is not done
>> yet.
> 
> Ok, I agree. I will introduce a new IGB_MAX_VM_POOLS macro instead.

You don't need "MAX" as the number of pools is fixed if I understand it 
correctly.

> 
>>
>>>                    if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
>>>                        queues |= BIT(i);
>>>                    }
>>> @@ -976,7 +976,7 @@ static uint16_t igb_receive_assign(IGBCore *core,
>> const struct eth_header *ehdr,
>>>                    f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
>>>                    f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
>>>                    if (macp[f >> 5] & (1 << (f & 0x1f))) {
>>> -                    for (i = 0; i < 8; i++) {
>>> +                    for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
>>>                            if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
>>>                                queues |= BIT(i);
>>>                            }
>>> @@ -999,7 +999,7 @@ static uint16_t igb_receive_assign(IGBCore *core,
>> const struct eth_header *ehdr,
>>>                        }
>>>                    }
>>>                } else {
>>> -                for (i = 0; i < 8; i++) {
>>> +                for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
>>>                        if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
>>>                            mask |= BIT(i);
>>>                        }
>>> @@ -1018,7 +1018,15 @@ static uint16_t igb_receive_assign(IGBCore
>> *core, const struct eth_header *ehdr,
>>>            queues &= core->mac[VFRE];
>>>            igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL,
>> rss_info);
>>>            if (rss_info->queue & 1) {
>>> -            queues <<= 8;
>>> +            for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
>>> +                if (!(queues & BIT(i))) {
>>> +                    continue;
>>> +                }
>>> +                if (core->mac[VMOLR0 + i] & E1000_VMOLR_RSSE) {
>>> +                    queues |= BIT(i + IGB_MAX_VF_FUNCTIONS);
>>> +                    queues &= ~BIT(i);
>>> +                }
>>> +            }
>>>            }
>>>        } else {
>>>            switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {

