Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E499C6EAA2E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:19:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pppiP-0004st-18; Fri, 21 Apr 2023 08:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pppiN-0004sj-1A
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:18:11 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pppiK-0008I4-JU
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:18:10 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1a6670671e3so19866885ad.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 05:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682079487; x=1684671487;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CvUP+Y/afFX/YuQLhFGhi+4RSba325nyTQ6Vzm1gR6U=;
 b=wGX46Nkj2S4jRkRGCJJ2+HVFiFZP9FbuHuDpGChkoRWIG5Mr4bPD/ZoKQCTqNFHbAF
 0/6qaEPQWDOpErbIbwrGkme7EvskDGLO/U71GeihATzIcg5nqJkmNsODENilgomJMNAe
 MqFX6kWlgX3f90lxPNG2it0vTs5oGeQWXwh2YSYXzta9yxexsy8gy74ucETn/Ynrff02
 cH61VLrKQj2p4ChCe/ki8k5MZFptFDnUTIPmDP1aojVklPY0kGfXVjhoVXo+8JX4pRUA
 e979jEcJQMmv9HnpmpHw2Qqc+ErO+pEcZaR9SeC6XQTuLa3L55a3aiLBcPhh1CUerqqs
 8BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682079487; x=1684671487;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CvUP+Y/afFX/YuQLhFGhi+4RSba325nyTQ6Vzm1gR6U=;
 b=geFT1omH8HkrDOKulWu1jZW8S452Y4UWlrdR8xji+cB1CIQ0mnOfwH3lMOJSdRsx5l
 yQ6Umlsn2w5WYjZ0SDvMDugAk3zRilYWRLUEEkWSJCceyUA1jf87TaSe6tq4TkZ+6lP8
 E/IZlWvURqYn9DRIgK45tK3Tu0fuHuhgYsUP/5Tl/fnOWZAAnPZ0CH8QPnZlPude1Y5Z
 yGq5bSBIStlRxomwzmTALRvMxlwFElOS35V5Y2EbPFXpqRREc/D9Qak3A7jNy3aP6raV
 075lXrWlTXvOC5iM67FBgOCbZVmABaLnNuexZH/KBVDVPyvfa+9ObcQERgkcnqC5wLpz
 gPeA==
X-Gm-Message-State: AAQBX9evpIpwKmYoBkDJQYkveUGkvCW/Wl6FUYukDEfzyaigqP2fjCJm
 L7ZNp3QGCSg26gY2dE7CGi6BlQ==
X-Google-Smtp-Source: AKy350ajSDo27B6ylvhYpA2bO7ZVIekestbIe8fv6eXXmfwrrEp5XyQo3y76Us9uzNnofMGmNQShAA==
X-Received: by 2002:a17:903:294c:b0:1a1:e01e:7279 with SMTP id
 li12-20020a170903294c00b001a1e01e7279mr4105928plb.4.1682079486762; 
 Fri, 21 Apr 2023 05:18:06 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a170902778300b001a1a07d04e6sm2695222pll.77.2023.04.21.05.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 05:18:06 -0700 (PDT)
Message-ID: <c26f49a2-4ee7-f7f3-e162-a181efebadd4@daynix.com>
Date: Fri, 21 Apr 2023 21:18:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/40] igb: Always copy ethernet header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-9-akihiko.odaki@daynix.com>
 <95840429-756a-98f9-b336-91e480b37781@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <95840429-756a-98f9-b336-91e480b37781@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-3.297, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2023/04/14 23:46, Philippe Mathieu-Daudé wrote:
> On 14/4/23 13:37, Akihiko Odaki wrote:
>> igb_receive_internal() used to check the iov length to determine
>> copy the iovs to a contiguous buffer, but the check is flawed in two
>> ways:
>> - It does not ensure that iovcnt > 0.
>> - It does not take virtio-net header into consideration.
>>
>> The size of this copy is just 22 octets, which can be even less than
>> the code size required for checks. This (wrong) optimization is probably
>> not worth so just remove it. Removing this also allows igb to assume
>> aligned accesses for the ethernet header.
>>
>> Fixes: 3a977deebe ("Intrdocue igb device emulation")
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/net/igb_core.c | 39 +++++++++++++++++++++------------------
>>   1 file changed, 21 insertions(+), 18 deletions(-)
>>
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
>> index 53f60fc3d3..1d188b526c 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
> 
> 
>> -static uint16_t igb_receive_assign(IGBCore *core, const struct 
>> eth_header *ehdr,
>> +static uint16_t igb_receive_assign(IGBCore *core, const L2Header 
>> *l2_header,
>>                                      size_t size, E1000E_RSSInfo 
>> *rss_info,
>>                                      bool *external_tx)
>>   {
>>       static const int ta_shift[] = { 4, 3, 2, 0 };
>> +    const struct eth_header *ehdr = &l2_header->eth;
>>       uint32_t f, ra[2], *macp, rctl = core->mac[RCTL];
>>       uint16_t queues = 0;
>>       uint16_t oversized = 0;
>> -    uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(ehdr)->h_tci) & 
>> VLAN_VID_MASK;
>> +    uint16_t vid = be16_to_cpu(l2_header->vlan[0].h_tci) & 
>> VLAN_VID_MASK;
> 
> Why this API change? Are we certain tci is aligned in host memory?

This change makes the VLAN tag always copied to the host memory, which 
ensures that tci is aligned.

