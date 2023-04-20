Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D726E9AAE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 19:26:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppY2e-0004vX-QO; Thu, 20 Apr 2023 13:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppY2c-0004vN-GO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:25:54 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppY2Z-0007Tg-ML
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 13:25:53 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b733fd00bso1150357b3a.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 10:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682011550; x=1684603550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2zCqtpCoec0UptKb0OnX3qyznNATG92HcVmQ6vVxicY=;
 b=D/tt9NIoDej4nA/Fe6qdBMuW6Zj3EBWhL2nzi/iFjpWM1BhjdU66ke08JEGTN2JaLT
 pnVHq0gXvjY0CYa/PGJ2z7uqO7WzcfLwlPB79PLr7V9rDjhcSycl4j48+VJqO9I6SKkA
 v7N0Cf4z6AsHBemy3xh8kV5PTVgqh/247c1HuK3Cbfnt7r6qJ1EDZDZNKiW56+UeJQ/w
 sWgjP15CVOPf/fxA/aGIZHnaarLjDb+ZnbSXgVL6bLx6R0YSRpaOpUGI/D5ZoH4WMq58
 QtWIR89ha0cCFQDuCMEJexhfzQ091I9Mz5CVxCga+ztoz2OgNEOBbNskXzbIhGrCE5cc
 H01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682011550; x=1684603550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2zCqtpCoec0UptKb0OnX3qyznNATG92HcVmQ6vVxicY=;
 b=BD2T8M3nEiH9pTyHd7emfrYODkfPwMo7ycuRDwklNmOtxMV7BkfkG2fwIecDiqSfuU
 DFmUxNnn9Nemlrfmv///6Y9YR9eXr7UZ7fRqxKhxGmNr6+Gj6jLFOg85TUcyQBpu/ArI
 nvNd3gPCU9a94//fMvdQXqwa4TAJxU0MeAzaFp8t90+dHeGjSGRkvKCYQEsEhKf4q1Qx
 eFtGtUZq61ygRLH7qqRgXWQrubeed0tdslwKpspRY0F3wo4zS1HU7+BCqM6LUpYjM0GE
 ZHoFaEcUQAW98DzODf3qe0SO748jcmL1tuVES+kB4V3f0dAVF2jVhHMyopfDQsdir6ip
 gJqw==
X-Gm-Message-State: AAQBX9ep5TPJn5NfyniHEY9xtB71CQQvjLyZYyNWnxMVHO1kP6dWRfIN
 Z7oqu2/3Kx5SpwaB44BTZTxVnQ==
X-Google-Smtp-Source: AKy350ZGVymZ4rSUz5aQYBVDg0iZ9aRo+zAKUyhPV+kc+5wrZezD/o/+T2R3pBKPJMnbU49on0xxxA==
X-Received: by 2002:a05:6a20:12c1:b0:ef:f887:40cb with SMTP id
 v1-20020a056a2012c100b000eff88740cbmr3394255pzg.4.1682011550166; 
 Thu, 20 Apr 2023 10:25:50 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a62c30a000000b006352a6d56ebsm1483870pfg.119.2023.04.20.10.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 10:25:49 -0700 (PDT)
Message-ID: <c0a10431-2454-d022-f9ad-013f30b11850@daynix.com>
Date: Fri, 21 Apr 2023 02:25:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/41] hw/net/net_tx_pkt: Decouple implementation from
 PCI
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-2-akihiko.odaki@daynix.com>
 <c28bd26b-1451-4363-f7c8-585067a2d599@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <c28bd26b-1451-4363-f7c8-585067a2d599@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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

On 2023/04/20 18:46, Philippe Mathieu-Daudé wrote:
> Hi Akihiko,
> 
> On 20/4/23 07:46, Akihiko Odaki wrote:
>> This is intended to be followed by another change for the interface.
>> It also fixes the leak of memory mapping when the specified memory is
>> partially mapped.
>>
>> Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/net/net_tx_pkt.h |  9 ++++++++
>>   hw/net/net_tx_pkt.c | 53 ++++++++++++++++++++++++++++-----------------
>>   2 files changed, 42 insertions(+), 20 deletions(-)
>>
>> diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
>> index e5ce6f20bc..5eb123ef90 100644
>> --- a/hw/net/net_tx_pkt.h
>> +++ b/hw/net/net_tx_pkt.h
>> @@ -153,6 +153,15 @@ void net_tx_pkt_dump(struct NetTxPkt *pkt);
>>    */
>>   void net_tx_pkt_reset(struct NetTxPkt *pkt, PCIDevice *dev);
>> +/**
>> + * Unmap a fragment mapped from a PCI device.
>> + *
>> + * @context:        PCI device owning fragment
> 
> Per your description ...
> 
>> + * @base:           pointer to fragment
>> + * @len:            length of fragment
>> + */
>> +void net_tx_pkt_unmap_frag_pci(void *context, void *base, size_t len);
> 
> ... we can directly use the stricter 'PCIDevice *dev'.

This function is intended to match the following type added later:
typedef void (*NetTxPktFreeFrag)(DeviceState *, void *, size_t);

> 
>>   /**
>>    * Send packet to qemu. handles sw offloads if vhdr is not supported.
>>    *
>> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
>> index 8dc8568ba2..aca12ff035 100644
>> --- a/hw/net/net_tx_pkt.c
>> +++ b/hw/net/net_tx_pkt.c
>> @@ -384,10 +384,9 @@ void net_tx_pkt_setup_vlan_header_ex(struct 
>> NetTxPkt *pkt,
>>       }
>>   }
>> -bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
>> -    size_t len)
>> +static bool net_tx_pkt_add_raw_fragment_common(struct NetTxPkt *pkt,
>> +                                               void *base, size_t len)
>>   {
>> -    hwaddr mapped_len = 0;
>>       struct iovec *ventry;
>>       assert(pkt);
>> @@ -395,23 +394,12 @@ bool net_tx_pkt_add_raw_fragment(struct NetTxPkt 
>> *pkt, hwaddr pa,
>>           return false;
>>       }
>> -    if (!len) {
>> -        return true;
>> -     }
>> -
>>       ventry = &pkt->raw[pkt->raw_frags];
>> -    mapped_len = len;
>> +    ventry->iov_base = base;
>> +    ventry->iov_len = len;
>> +    pkt->raw_frags++;
>> -    ventry->iov_base = pci_dma_map(pkt->pci_dev, pa,
>> -                                   &mapped_len, 
>> DMA_DIRECTION_TO_DEVICE);
>> -
>> -    if ((ventry->iov_base != NULL) && (len == mapped_len)) {
>> -        ventry->iov_len = mapped_len;
>> -        pkt->raw_frags++;
>> -        return true;
>> -    } else {
>> -        return false;
>> -    }
>> +    return true;
>>   }
>>   bool net_tx_pkt_has_fragments(struct NetTxPkt *pkt)
>> @@ -465,8 +453,9 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt, 
>> PCIDevice *pci_dev)
>>           assert(pkt->raw);
>>           for (i = 0; i < pkt->raw_frags; i++) {
>>               assert(pkt->raw[i].iov_base);
>> -            pci_dma_unmap(pkt->pci_dev, pkt->raw[i].iov_base,
>> -                          pkt->raw[i].iov_len, 
>> DMA_DIRECTION_TO_DEVICE, 0);
>> +            net_tx_pkt_unmap_frag_pci(pkt->pci_dev,
>> +                                      pkt->raw[i].iov_base,
>> +                                      pkt->raw[i].iov_len);
>>           }
>>       }
>>       pkt->pci_dev = pci_dev;
>> @@ -476,6 +465,30 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt, 
>> PCIDevice *pci_dev)
>>       pkt->l4proto = 0;
>>   }
>> +void net_tx_pkt_unmap_frag_pci(void *context, void *base, size_t len)
> 
> So net_tx_pkt_unmap_frag_pci(PCIDevice *dev, ...)
> 
>> +{
>> +    pci_dma_unmap(context, base, len, DMA_DIRECTION_TO_DEVICE, 0);
>> +}
>> +
>> +bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
> 
> It seems other hw/net/ models use (dma_addr_t addr, dma_addr_t len).
> Similarly does the pci_dma_FOO() API.

This prototype is what net_tx_pkt_add_raw_fragment() currently has, and 
this patch only moves it here. It will be updated in the following 
patch, which replaces hwaddr with dma_addr_t.

> 
>> +    size_t len)
>> +{
>> +    dma_addr_t mapped_len = len;
> 
> See, here you use dma_addr_t.
> 
>> +    void *base = pci_dma_map(pkt->pci_dev, pa, &mapped_len,
>> +                             DMA_DIRECTION_TO_DEVICE);
>> +    if (!base) {
>> +        return false;
>> +    }
>> +
>> +    if (mapped_len != len ||
>> +        !net_tx_pkt_add_raw_fragment_common(pkt, base, len)) {
>> +        net_tx_pkt_unmap_frag_pci(pkt->pci_dev, base, mapped_len);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt,
>>                                     struct iovec *iov, uint32_t iov_len,
>>                                     uint16_t csl)
> 

