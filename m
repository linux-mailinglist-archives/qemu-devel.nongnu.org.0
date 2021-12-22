Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3017D47CD78
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:19:59 +0100 (CET)
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzvuo-0002WT-9M
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:19:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvO1-0002Bn-Ph
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:46:06 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:37783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvNv-0005sF-En
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:46:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 03692D35ABAD;
 Wed, 22 Dec 2021 07:45:56 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 07:45:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00183cd4a4f-0a07-41f2-a483-a05c9dc41cab,
 22B606D71DB07679CF58DDA73D3573C2F131FB73) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <036975e0-28f9-75c2-aada-a2a0976cf302@kaod.org>
Date: Wed, 22 Dec 2021 07:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/4] dma: Let st*_dma() propagate MemTxResult
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211218145111.1540114-1-philmd@redhat.com>
 <20211218145111.1540114-4-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211218145111.1540114-4-philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 46338aeb-6643-470d-a800-a2b16491e714
X-Ovh-Tracer-Id: 14529738301247622017
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddthedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 15:51, Philippe Mathieu-Daudé wrote:
> dma_memory_write() returns a MemTxResult type. Do not discard
> it, return it to the caller.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
     

> ---
>   include/sysemu/dma.h | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index b711d390a4f..191cf0b271a 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -249,13 +249,13 @@ static inline void dma_memory_unmap(AddressSpace *as,
>           dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
>           return _end##_bits##_to_cpu(val);                               \
>       }                                                                   \
> -    static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
> -                                                 dma_addr_t addr,       \
> -                                                 uint##_bits##_t val,   \
> -                                                 MemTxAttrs attrs)      \
> -    {                                                                   \
> -        val = cpu_to_##_end##_bits(val);                                \
> -        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);           \
> +    static inline MemTxResult st##_sname##_##_end##_dma(AddressSpace *as, \
> +                                                        dma_addr_t addr, \
> +                                                        uint##_bits##_t val, \
> +                                                        MemTxAttrs attrs) \
> +    { \
> +        val = cpu_to_##_end##_bits(val); \
> +        return dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
>       }
>   
>   static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs attrs)
> @@ -266,10 +266,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs att
>       return val;
>   }
>   
> -static inline void stb_dma(AddressSpace *as, dma_addr_t addr,
> -                           uint8_t val, MemTxAttrs attrs)
> +static inline MemTxResult stb_dma(AddressSpace *as, dma_addr_t addr,
> +                                  uint8_t val, MemTxAttrs attrs)
>   {
> -    dma_memory_write(as, addr, &val, 1, attrs);
> +    return dma_memory_write(as, addr, &val, 1, attrs);
>   }
>   
>   DEFINE_LDST_DMA(uw, w, 16, le);
> 


