Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3FB686659
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNCm3-00053p-5M; Wed, 01 Feb 2023 08:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pNClx-00053U-S8
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:03:33 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pNClu-0007rU-22
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:03:33 -0500
Received: by mail-pj1-x1031.google.com with SMTP id o13so17258126pjg.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 05:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AhDNkVZ/cnO8v7ZnzX0yH6O3gm/y3d4Eaym2ZVED9ro=;
 b=2GNk26ojIDr0xjcJAkpAHc2cs+WOEl+TrF2Fmzz583rBu7+dJhwGSII6KYsqTzkJ/z
 WpFKGlq6K6w82y49GktJ6JcWommepJMX6a3onArB9u9K9IdeRxhqZCdHG1YuOnmnhW3z
 vSI8LxQoGXihztgYB5/y/dFMY57gg3FBK0EzbVRIM1Ia3KD+wXTY7C7pcCTw9bjcvX6f
 rfT0JhF7lCT4Rw7+xPoUPcV/oYuDopmIffub2d6An3G07CyyJzR+dtY71o2WXj8fOzwj
 axRQOBohbCrXeP7W0FNqAECXkptPBQaOwh/ZQOsusDzUYBT8qetWly6JjfzDBdD+9pNZ
 cfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AhDNkVZ/cnO8v7ZnzX0yH6O3gm/y3d4Eaym2ZVED9ro=;
 b=wnzkJ4P9oz6dzOg8QnUnOvhP3jwLnSqb6TaqGRC/imP90ldVUIIkGI2jG/SFRImO1r
 yhtRJus7uaqjBmWRVEQRAxt1fdmZvKltKyQDRlujQ3qYK6qxY0bbGiQid8YyNhpI7kZw
 ExIb0MxYl7JqD5tlrfMZ2WANPifms+ZqIq1JMPtNvcGPNFXGtCvDHncuKUBW8SMkGdZ6
 Cm4sZH9ioXyBacY0wM4s8VA/FEFcagDRRHzHUwpJYDnNT73IpavhfGoRbG4+lOT8z/JA
 IW8OpSqAQKccyLlLhz1+/ttHVUJKwYXczlhQFnE29SomiutGK2tUW1c2KzMxLqiwQzE9
 /cIg==
X-Gm-Message-State: AO0yUKW0cL4RPhHaY2WtCdLojWmIcpzkWoJRWHX3QysKoJpyXs0jtbRW
 VIpAwn1Z+BavYfJFOeXCNzB7zg==
X-Google-Smtp-Source: AK7set/F5q1zDg6qrcasZFZ+zNpQnnk/FHuL6bmJEtF7hpa6B02geOrSONrwpRd+qp3ttmlAd6x8iA==
X-Received: by 2002:a17:90b:d8b:b0:226:cdcf:da83 with SMTP id
 bg11-20020a17090b0d8b00b00226cdcfda83mr2033408pjb.46.1675256608132; 
 Wed, 01 Feb 2023 05:03:28 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a17090a664f00b00230397c3c43sm1036530pjm.38.2023.02.01.05.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 05:03:27 -0800 (PST)
Message-ID: <4fb5d35f-e859-3887-d075-1c843007beac@daynix.com>
Date: Wed, 1 Feb 2023 22:03:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 8/9] igb: respect VT_CTL ignore MAC field
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
 <20230131094232.28863-9-sriram.yagnaraman@est.tech>
 <6ee9c527-2993-83b4-02c2-6e604d0c3679@daynix.com>
 <DBBP189MB14332AC6E6880C0A15E0CB9795D19@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB14332AC6E6880C0A15E0CB9795D19@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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

On 2023/02/01 19:29, Sriram Yagnaraman wrote:
> 
> 
>> -----Original Message-----
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Wednesday, 1 February 2023 05:58
>> To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
>> Cc: qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>; Dmitry
>> Fleytman <dmitry.fleytman@gmail.com>; Michael S . Tsirkin
>> <mst@redhat.com>; Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> Subject: Re: [PATCH v3 8/9] igb: respect VT_CTL ignore MAC field
>>
>> On 2023/01/31 18:42, Sriram Yagnaraman wrote:
>>> Also trace out a warning if replication mode is disabled, since we
>>> only support replication mode enabled.
>>>
>>> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
>>> ---
>>>    hw/net/igb_core.c   | 9 +++++++++
>>>    hw/net/trace-events | 2 ++
>>>    2 files changed, 11 insertions(+)
>>>
>>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c index
>>> c5f9c14f47..8115be2d76 100644
>>> --- a/hw/net/igb_core.c
>>> +++ b/hw/net/igb_core.c
>>> @@ -964,6 +964,10 @@ static uint16_t igb_receive_assign(IGBCore *core,
>> const struct eth_header *ehdr,
>>>        }
>>>
>>>        if (core->mac[MRQC] & 1) {
>>> +        if (!(core->mac[VT_CTL] & E1000_VT_CTL_VM_REPL_EN)) {
>>> +            trace_igb_rx_vmdq_replication_mode_disabled();
>>> +        }
>>> +
>>>            if (is_broadcast_ether_addr(ehdr->h_dest)) {
>>>                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>>>                    if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) { @@
>>> -1010,6 +1014,11 @@ static uint16_t igb_receive_assign(IGBCore *core,
>> const struct eth_header *ehdr,
>>>                }
>>>            }
>>>
>>> +        /* assume a full pool list if IGMAC is set */
>>> +        if (core->mac[VT_CTL] & E1000_VT_CTL_IGNORE_MAC) {
>>> +            queues = BIT(IGB_MAX_VF_FUNCTIONS) - 1;
>>> +        }
>>> +
>>
>> This overwrites "queues", but "external_tx" is not overwritten.
> 
> Description in section 7.10.3.6 is a bit confusing, I interpreted that packet is not sent to network if it matches an exact filter regardless of VT_CTL.IGMAC setting.
> I think that VT_CTL.IGMAC setting is only for MAC filtering and pool selection, and not to determine if a packet must go to external LAN or not.

It says nothing about VT_CTL.IGMAC so we need to make the best guess.

The rule saying "a unicast packet that matches an exact filter is not 
sent to the LAN" aligns with the common expectation of driver authors 
that a packet directed to a VF won't be sent to someone else.

However, when VT_CTL.IGMAC is set, the exact filter does not tell if the 
destination of the packet is a VF. In such a case, that rule does not do 
anything good, but can do some harm; if you have used igb for normal MAC 
routing and later switched to VLAN routing with VT_CTL.IGMAC, the exact 
filter may be left as is, the exact filter can prevent irrelevant 
packets from being routed to the external LAN.

> 
>>
>>>            if (e1000x_vlan_rx_filter_enabled(core->mac)) {
>>>                uint16_t mask = 0;
>>>
>>> diff --git a/hw/net/trace-events b/hw/net/trace-events index
>>> e94172e748..9bc7658692 100644
>>> --- a/hw/net/trace-events
>>> +++ b/hw/net/trace-events
>>> @@ -288,6 +288,8 @@ igb_rx_desc_buff_write(uint64_t addr, uint16_t
>>> offset, const void* source, uint3
>>>
>>>    igb_rx_metadata_rss(uint32_t rss) "RSS data: 0x%X"
>>>
>>> +igb_rx_vmdq_replication_mode_disabled(void) "WARN: Only replication
>> mode enabled is supported"
>>> +
>>>    igb_irq_icr_clear_gpie_nsicr(void) "Clearing ICR on read due to GPIE.NSICR
>> enabled"
>>>    igb_irq_icr_write(uint32_t bits, uint32_t old_icr, uint32_t new_icr)
>> "Clearing ICR bits 0x%x: 0x%x --> 0x%x"
>>>    igb_irq_set_iam(uint32_t icr) "Update IAM: 0x%x"

