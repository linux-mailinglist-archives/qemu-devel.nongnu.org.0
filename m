Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EF76E9AEE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 19:39:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppYEq-0004WI-U9; Thu, 20 Apr 2023 13:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppYEo-0004VK-RD
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:38:30 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppYEm-00044j-O7
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:38:30 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1a8097c1ccfso15168525ad.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 10:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682012307; x=1684604307;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lbl6guw8ijoVs/nxRV2ujFZ1WhYpL2WCS4zXnV0OULU=;
 b=VocbBJB47vzcPZyG7WwqLOd548uV89gYAjrHwaN+mLiMzOoO788x8BVI9Gi0MH5lyD
 4+uzuW6FCoZZkreAJCDhyOIe0KU5UiEHAEjjSPULogcGUFX/wOUBQsCaCc+vxLFPqM6a
 y5MftxYTCxrHg1zoeFqs/N3K7xwl+swWcJngkYpXeWCxj/dM72V7T2TCahxELfDf/meR
 d+TRCXgzXACCRYYuuix0sTJv7WM4E//L9i9Cs5r5PTCELyCln/3jCFpWSplhXcgVG9mn
 DvmZfefSLOJan7N+HtsDDcbutBZKcYOQB6XXCMExGjtbRJDMScuPMq3pTldCBvoSfMxc
 8ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682012307; x=1684604307;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lbl6guw8ijoVs/nxRV2ujFZ1WhYpL2WCS4zXnV0OULU=;
 b=O/9EG4xE0sHgUTlYmK/CkMfJ14WQ79BgmEXH5y7/hrlISiPnR6O9iMEeb33mg+gxt9
 H+UuQ6KHPKTKj72L6IO63fvQ8J1KIjdRWzpg5DBnebaR7VtITbu7zPpHPbCM2gYE8QwC
 3htP+KcEF6ErFEriipZ182x0T//HhiXH9uH9fCnC6s+NrRZ6US+/sc5NbtWiEK7U8hIp
 djfNRnDoqlqNYEmaiJzrMmBJZE+/Hby1yKUQElPD0oFg73aVwkNuWyEwpA+f6QDZsueq
 4dgZ2/4xqgdTff2g/7EdiQCfrd7gFKA+1mx5ut2LPeFEi7/xia8AMrsH8KfRyXihSiju
 ZLCA==
X-Gm-Message-State: AAQBX9c/hMk27U3f/0a2n+XbIrqB9EpJ8gn1dLtc6dZTVI7GxkNHUxPW
 ouQPSjoAEaVjhnOTx6e+auSApw==
X-Google-Smtp-Source: AKy350Z6CPQ3AA7zqOeZKVNtwOgyhC6qI/Te0EnYOxNwNvIkK3kuRo/YKfi+0Yxo4c8LAQsvTnN7OQ==
X-Received: by 2002:a17:903:187:b0:1a9:3393:edcd with SMTP id
 z7-20020a170903018700b001a93393edcdmr2580895plg.54.1682012307115; 
 Thu, 20 Apr 2023 10:38:27 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001a072aedec7sm1428102plw.75.2023.04.20.10.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 10:38:26 -0700 (PDT)
Message-ID: <79ea2ba0-6134-4bcf-9f1b-c936228abdfb@daynix.com>
Date: Fri, 21 Apr 2023 02:38:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 27/41] net/eth: Always add VLAN tag
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-28-akihiko.odaki@daynix.com>
 <DBBP189MB14338D4E07A076E687CE70FA95639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB14338D4E07A076E687CE70FA95639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/04/21 1:22, Sriram Yagnaraman wrote:
> 
> 
>> -----Original Message-----
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Thursday, 20 April 2023 07:47
>> Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>; Jason Wang
>> <jasowang@redhat.com>; Dmitry Fleytman <dmitry.fleytman@gmail.com>;
>> Michael S . Tsirkin <mst@redhat.com>; Alex Bennée
>> <alex.bennee@linaro.org>; Philippe Mathieu-Daudé <philmd@linaro.org>;
>> Thomas Huth <thuth@redhat.com>; Wainer dos Santos Moschetta
>> <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>; Cleber Rosa
>> <crosa@redhat.com>; Laurent Vivier <lvivier@redhat.com>; Paolo Bonzini
>> <pbonzini@redhat.com>; qemu-devel@nongnu.org; Tomasz Dzieciol
>> <t.dzieciol@partner.samsung.com>; Akihiko Odaki
>> <akihiko.odaki@daynix.com>
>> Subject: [PATCH v2 27/41] net/eth: Always add VLAN tag
>>
>> It is possible to have another VLAN tag even if the packet is already tagged.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   include/net/eth.h   |  4 ++--
>>   hw/net/net_tx_pkt.c | 16 +++++++---------
>>   net/eth.c           | 22 ++++++----------------
>>   3 files changed, 15 insertions(+), 27 deletions(-)
>>
>> diff --git a/include/net/eth.h b/include/net/eth.h index
>> 95ff24d6b8..048e434685 100644
>> --- a/include/net/eth.h
>> +++ b/include/net/eth.h
>> @@ -353,8 +353,8 @@ eth_strip_vlan_ex(const struct iovec *iov, int iovcnt,
>> size_t iovoff,  uint16_t  eth_get_l3_proto(const struct iovec *l2hdr_iov, int
>> iovcnt, size_t l2hdr_len);
>>
>> -void eth_setup_vlan_headers(struct eth_header *ehdr, uint16_t vlan_tag,
>> -    uint16_t vlan_ethtype, bool *is_new);
>> +void eth_setup_vlan_headers(struct eth_header *ehdr, size_t *ehdr_size,
>> +                            uint16_t vlan_tag, uint16_t vlan_ethtype);
>>
>>
>>   uint8_t eth_get_gso_type(uint16_t l3_proto, uint8_t *l3_hdr, uint8_t l4proto);
>> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c index
>> ce6b102391..af8f77a3f0 100644
>> --- a/hw/net/net_tx_pkt.c
>> +++ b/hw/net/net_tx_pkt.c
>> @@ -40,7 +40,10 @@ struct NetTxPkt {
>>
>>       struct iovec *vec;
>>
>> -    uint8_t l2_hdr[ETH_MAX_L2_HDR_LEN];
>> +    struct {
>> +        struct eth_header eth;
>> +        struct vlan_header vlan[3];
>> +    } l2_hdr;
>>       union {
>>           struct ip_header ip;
>>           struct ip6_header ip6;
>> @@ -365,18 +368,13 @@ bool net_tx_pkt_build_vheader(struct NetTxPkt
>> *pkt, bool tso_enable,  void net_tx_pkt_setup_vlan_header_ex(struct NetTxPkt
>> *pkt,
>>       uint16_t vlan, uint16_t vlan_ethtype)  {
>> -    bool is_new;
>>       assert(pkt);
>>
>>       eth_setup_vlan_headers(pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_base,
>> -        vlan, vlan_ethtype, &is_new);
>> +                           &pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_len,
>> +                           vlan, vlan_ethtype);
>>
>> -    /* update l2hdrlen */
>> -    if (is_new) {
>> -        pkt->hdr_len += sizeof(struct vlan_header);
>> -        pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_len +=
>> -            sizeof(struct vlan_header);
>> -    }
>> +    pkt->hdr_len += sizeof(struct vlan_header);
>>   }
>>
>>   bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, void *base, size_t
>> len) diff --git a/net/eth.c b/net/eth.c index f7ffbda600..5307978486 100644
>> --- a/net/eth.c
>> +++ b/net/eth.c
>> @@ -21,26 +21,16 @@
>>   #include "net/checksum.h"
>>   #include "net/tap.h"
>>
>> -void eth_setup_vlan_headers(struct eth_header *ehdr, uint16_t vlan_tag,
>> -    uint16_t vlan_ethtype, bool *is_new)
>> +void eth_setup_vlan_headers(struct eth_header *ehdr, size_t *ehdr_size,
>> +                            uint16_t vlan_tag, uint16_t vlan_ethtype)
>>   {
>>       struct vlan_header *vhdr = PKT_GET_VLAN_HDR(ehdr);
>>
>> -    switch (be16_to_cpu(ehdr->h_proto)) {
>> -    case ETH_P_VLAN:
>> -    case ETH_P_DVLAN:
>> -        /* vlan hdr exists */
>> -        *is_new = false;
>> -        break;
>> -
>> -    default:
>> -        /* No VLAN header, put a new one */
>> -        vhdr->h_proto = ehdr->h_proto;
>> -        ehdr->h_proto = cpu_to_be16(vlan_ethtype);
>> -        *is_new = true;
>> -        break;
>> -    }
>> +    memmove(vhdr + 1, vhdr, *ehdr_size - ETH_HLEN);
> 
> Do we need a check that we are not overflowing the vlan array size?

It is the caller's responsibility to accommodate the space necessary for 
the new VLAN tag.

> 
>>       vhdr->h_tci = cpu_to_be16(vlan_tag);
>> +    vhdr->h_proto = ehdr->h_proto;
>> +    ehdr->h_proto = cpu_to_be16(vlan_ethtype);
>> +    *ehdr_size += sizeof(*vhdr);
>>   }
>>
>>   uint8_t
>> --
>> 2.40.0
> 

