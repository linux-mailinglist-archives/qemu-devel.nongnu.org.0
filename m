Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791216EB7A3
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 07:47:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pq64L-0001bm-0n; Sat, 22 Apr 2023 01:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pq647-0001S8-Dv
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 01:45:44 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pq644-0000QM-LZ
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 01:45:42 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso18220034b3a.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 22:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682142339; x=1684734339;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oZSWOSokEhCIQ75KHPHc3lWl8HMiil+pC8ySJhue7lg=;
 b=OmknBv7RgydJ11biOKFweo7jPK/89Fs7UhsgF6z+7iD7hGbtKFb8itSMm4xkpjyNrZ
 7JhsNhU23ifxxuYyiV9vL0yHvrIpruEw/V2WIh0KrHvqB9y1mvIJLEkl0jR5JEDx+6g+
 BJbQTa6GH5FhE4Yy2gdqklQ5MVy1X7da7CnJI8ZaS6umyX9dqY/02cFgQYsdla0WsY3k
 iw8Ly25ZWJwf4zqZSX3PGoYi1JzkPArE3xiesV5yVxM6A+gEGa+Ef5rHJ4U1EuW3F5ht
 sSq2Fa/vE1SXa1Eq/N3jVckS+SEL6Uw1t5QLh1Kqo8SKlgkvSPOHXGZoOmVgSAdn1EYT
 vkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682142339; x=1684734339;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oZSWOSokEhCIQ75KHPHc3lWl8HMiil+pC8ySJhue7lg=;
 b=LlJadkn1SYzMKzdVGRFGEhQmHlmkdVkox+AdJN7pTXDpjvDexXu9R8oEgSiaOhviJz
 qjKiq6Q3AZY4WDGWVj9JCuiKVv0Rjr217GUGtF7T2VaYcsEGUHfWo7jmL10qEyuYlk0C
 OesP2/c9nKL6tlmOfpLtUAzjwCMiEtjz8X/IX7za+wqPg0hIUM6GB7nOMXG5t4H8oEm/
 iePr7hRbGsepHGX3qiJk3P9LmNzwkAjbBml2G7ex31kt5rU5VQbed+kvGZU7cduHgV5Y
 nVsxA9RX9drndTfSzwaNS7ep1QiVYa9W3qMdwnhh7pS/jqKK7yWVwOWrKgGlbB/iOuzc
 v4Gw==
X-Gm-Message-State: AAQBX9eb4GQISjIsbC3fq/8q9bKGzR1jzoE/XdRtOL68kcXgXTu0HkW6
 lcdtCP3UmSVNtEqtRynk4dxwYA==
X-Google-Smtp-Source: AKy350bx4EZBUuNs/vWBrItkf/0iWVNu4efm15Z5BPAZXqnVwQVy36qYSnSxDgXgpkI8/c0sXi/xxg==
X-Received: by 2002:a17:903:26c9:b0:1a2:7462:d674 with SMTP id
 jg9-20020a17090326c900b001a27462d674mr11610516plb.24.1682142338852; 
 Fri, 21 Apr 2023 22:45:38 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a170902b18400b001a52cfc73acsm1917691plr.129.2023.04.21.22.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 22:45:38 -0700 (PDT)
Message-ID: <93b1b22a-de04-b073-a722-848e9e2a4c1c@daynix.com>
Date: Sat, 22 Apr 2023 14:45:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 30/40] igb: Implement igb-specific oversize check
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-31-akihiko.odaki@daynix.com>
 <PA4P189MB14398ED75EF9CB376DC2CD61959F9@PA4P189MB1439.EURP189.PROD.OUTLOOK.COM>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <PA4P189MB14398ED75EF9CB376DC2CD61959F9@PA4P189MB1439.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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

On 2023/04/16 20:22, Sriram Yagnaraman wrote:
> 
> 
>> -----Original Message-----
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Friday, 14 April 2023 13:37
>> Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>; Jason Wang
>> <jasowang@redhat.com>; Dmitry Fleytman <dmitry.fleytman@gmail.com>;
>> Michael S. Tsirkin <mst@redhat.com>; Alex Bennée <alex.bennee@linaro.org>;
>> Philippe Mathieu-Daudé <philmd@linaro.org>; Thomas Huth
>> <thuth@redhat.com>; Wainer dos Santos Moschetta
>> <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>; Cleber Rosa
>> <crosa@redhat.com>; Laurent Vivier <lvivier@redhat.com>; Paolo Bonzini
>> <pbonzini@redhat.com>; qemu-devel@nongnu.org; Akihiko Odaki
>> <akihiko.odaki@daynix.com>
>> Subject: [PATCH 30/40] igb: Implement igb-specific oversize check
>>
>> igb has a configurable size limit for LPE, and uses different limits depending on
>> whether the packet is treated as a VLAN packet.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/net/igb_core.c | 41 +++++++++++++++++++++++++++--------------
>>   1 file changed, 27 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c index
>> 2013a9a53d..569897fb99 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -954,16 +954,21 @@ igb_rx_l4_cso_enabled(IGBCore *core)
>>       return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);  }
>>
>> -static bool
> 
> The convention in seems to be to declare return value in first line and then the function name in the next line.

There are already functions not following the convention, and it is more 
like exceptional in the entire QEMU code base. This patch prioritize the 
QEMU's common practice over e1000e's old convention.

> 
>> -igb_rx_is_oversized(IGBCore *core, uint16_t qn, size_t size)
>> +static bool igb_rx_is_oversized(IGBCore *core, const struct eth_header *ehdr,
>> +                                size_t size, bool lpe, uint16_t rlpml)
>>   {
>> -    uint16_t pool = qn % IGB_NUM_VM_POOLS;
>> -    bool lpe = !!(core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE);
>> -    int max_ethernet_lpe_size =
>> -        core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK;
>> -    int max_ethernet_vlan_size = 1522;
>> +    size += 4;
> 
> Is the above 4 CRC bytes?

Yes. In v2, a new constant ETH_FCS_LEN is used to explictly state that.

> 
>> +
>> +    if (lpe) {
>> +        return size > rlpml;
>> +    }
>> +
>> +    if (e1000x_is_vlan_packet(ehdr, core->mac[VET] & 0xffff) &&
>> +        e1000x_vlan_rx_filter_enabled(core->mac)) {
>> +        return size > 1522;
>> +    }
> 
> Should a check for 1526 bytes if extended VLAN is present be added?
> Maybe in "igb: Strip the second VLAN tag for extended VLAN"?

In v2, I placed "igb: Strip the second VLAN tag for extended VLAN" 
earlier than this patch, and this patch is rewritten so it can handle 
the second VLAN tag too.

> 
>>
>> -    return size > (lpe ? max_ethernet_lpe_size : max_ethernet_vlan_size);
>> +    return size > 1518;
>>   }
>>
>>   static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
>> @@ -976,6 +981,8 @@ static uint16_t igb_receive_assign(IGBCore *core,
>> const L2Header *l2_header,
>>       uint16_t queues = 0;
>>       uint16_t oversized = 0;
>>       uint16_t vid = be16_to_cpu(l2_header->vlan[0].h_tci) & VLAN_VID_MASK;
>> +    bool lpe;
>> +    uint16_t rlpml;
>>       int i;
>>
>>       memset(rss_info, 0, sizeof(E1000E_RSSInfo)); @@ -984,6 +991,14 @@
>> static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
>>           *external_tx = true;
>>       }
>>
>> +    lpe = !!(core->mac[RCTL] & E1000_RCTL_LPE);
>> +    rlpml = core->mac[RLPML];
>> +    if (!(core->mac[RCTL] & E1000_RCTL_SBP) &&
>> +        igb_rx_is_oversized(core, ehdr, size, lpe, rlpml)) {
>> +        trace_e1000x_rx_oversized(size);
>> +        return queues;
>> +    }
>> +
>>       if (e1000x_is_vlan_packet(ehdr, core->mac[VET] & 0xffff) &&
>>           !e1000x_rx_vlan_filter(core->mac, PKT_GET_VLAN_HDR(ehdr))) {
>>           return queues;
>> @@ -1067,7 +1082,10 @@ static uint16_t igb_receive_assign(IGBCore *core,
>> const L2Header *l2_header,
>>           queues &= core->mac[VFRE];
>>           if (queues) {
>>               for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>> -                if ((queues & BIT(i)) && igb_rx_is_oversized(core, i, size)) {
>> +                lpe = !!(core->mac[VMOLR0 + i] & E1000_VMOLR_LPE);
>> +                rlpml = core->mac[VMOLR0 + i] & E1000_VMOLR_RLPML_MASK;
>> +                if ((queues & BIT(i)) &&
>> +                    igb_rx_is_oversized(core, ehdr, size, lpe, rlpml))
>> + {
>>                       oversized |= BIT(i);
>>                   }
>>               }
>> @@ -1609,11 +1627,6 @@ igb_receive_internal(IGBCore *core, const struct
>> iovec *iov, int iovcnt,
>>           iov_to_buf(iov, iovcnt, iov_ofs, &min_buf, sizeof(min_buf.l2_header));
>>       }
>>
>> -    /* Discard oversized packets if !LPE and !SBP. */
>> -    if (e1000x_is_oversized(core->mac, size)) {
>> -        return orig_size;
>> -    }
>> -
>>       net_rx_pkt_set_packet_type(core->rx_pkt,
>>                                  get_eth_packet_type(&min_buf.l2_header.eth));
>>       net_rx_pkt_set_protocols(core->rx_pkt, iov, iovcnt, iov_ofs);
>> --
>> 2.40.0
> 

