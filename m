Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26680338874
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:19:46 +0100 (CET)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdxR-0003SX-6N
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lKdmZ-0000C3-NR
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:08:31 -0500
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:59150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lKdmX-00047G-Ce
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:08:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id E3D4C24F1D3;
 Fri, 12 Mar 2021 10:08:24 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 12 Mar
 2021 10:08:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0023dbf301a-6fab-4b43-806a-743be1a47f63,
 795EE61F3CDF5270877287A62BE336BF03444C93) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.91.229
Subject: Re: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org> <20210310194924.GF6530@xz-x1>
 <5e53b99f-548c-8da9-f6fd-9c764642350b@amsat.org>
 <20210310202919.GH6530@xz-x1>
 <a97eb0b5-d3fd-ca44-4490-c5e5bc796699@amsat.org>
 <a64ff8f0-5db1-c338-b99b-7a74a150a770@amsat.org>
 <20210311172710.GH194839@xz-x1>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <cf9ced7a-6ee0-8902-03cb-352b2b1c7902@kaod.org>
Date: Fri, 12 Mar 2021 10:08:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210311172710.GH194839@xz-x1>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8be833ef-0bfc-475e-b5f6-15e349b53c7e
X-Ovh-Tracer-Id: 3424987516735032126
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrgiesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 6:27 PM, Peter Xu wrote:
> On Thu, Mar 11, 2021 at 05:21:49PM +0100, Philippe Mathieu-Daudé wrote:
>> +Aspeed team
>>
>> On 3/11/21 1:18 PM, Philippe Mathieu-Daudé wrote:
>>> On 3/10/21 9:29 PM, Peter Xu wrote:
>>
>>>> Yeah no worry - it's just that I feel one memory_region_init_alias() call is
>>>> probably missing in your huge series somewhere, so that you'll take that alias
>>>> MR as subregion rather than the real MR (which is the root of one AS).
>>>
>>> OK, with your earlier comments start + Mark other comment I start
>>> to understand better.
>>>
>>> So far:
>>>
>>> (1a) AddressSpace is a physical view, its base address must be zero
>>>
>>> (1b) AddressSpace aperture is fixed (depends on hardware design,
>>> not changeable at runtime
>>>
>>> Therefore due to (1a):
>>> (2) AddressSpace root MemoryRegion is a container and must not be
>>> mmio-mapped anywhere (in particular not on SysBus).
>>>
>>> (3) If hardware has a MMIO view of an AddressSpace, it has to be
>>> via a MemoryRegion alias. That way the alias handles paddr offset
>>> adjustment to the zero-based AddressSpace root container MR.
>>> Aliasing allows resizing the alias size without modifying the AS
>>> aperture size (1b).
>>>
>>> I'll start adding assertions for (1a) and (2) in the code base and
>>> see if (3) adjustments are required.
>>
>> So using:
>>
>> -- >8 --
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 874a8fccdee..8ce2d7f83b9 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -713,6 +713,12 @@ static MemoryRegion
>> *memory_region_get_flatview_root(MemoryRegion *mr)
>>                  continue;
>>              }
>>          }
>> +        if (mr && mr->addr) {
>> +            error_report("Detected flatview root memory region '%s' with"
>> +                         " non-zero base address (0x%"HWADDR_PRIx"):
>> aborting",
>> +                         memory_region_name(mr), mr->addr);
>> +            abort();
>> +        }
>>
>>          return mr;
>>      }
>> ---
> 
> Maybe it works, but it looks a bit odd to test here.  What I meant was
> something like attached.
> 
>>
>> I get:
>>
>> $ ./qemu-system-arm -M ast2600-evb
>> qemu-system-arm: Detected flatview root memory region
>> 'aspeed.fmc-ast2600.flash' with non-zero base address (0x20000000): aborting
>> Aborted (core dumped)
>>
>> Indeed:
>>
>> $ ./qemu-system-arm -M ast2600-evb -S -monitor stdio
>> QEMU 5.2.50 monitor - type 'help' for more information
>> (qemu) info mtree
>> address-space: dma-dram
>>   0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>>     0000000080000000-00000000bfffffff (prio 0, ram): ram
>>     00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram
>>
>> address-space: aspeed.fmc-ast2600-dma-flash
>>   0000000020000000-000000002fffffff (prio 0, i/o): aspeed.fmc-ast2600.flash
>>     0000000020000000-0000000027ffffff (prio 0, i/o): aspeed.fmc-ast2600.0
>>     0000000028000000-000000002fffffff (prio 0, i/o): aspeed.fmc-ast2600.1
>>
>> address-space: aspeed.fmc-ast2600-dma-dram
>>   0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>>     0000000080000000-00000000bfffffff (prio 0, ram): ram
>>     00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram
>>
>> address-space: aspeed.spi1-ast2600-dma-flash
>>   0000000030000000-000000003fffffff (prio 0, i/o): aspeed.spi1-ast2600.flash
>>     0000000030000000-0000000037ffffff (prio 0, i/o): aspeed.spi1-ast2600.0
>>
>> address-space: aspeed.spi1-ast2600-dma-dram
>>   0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>>     0000000080000000-00000000bfffffff (prio 0, ram): ram
>>     00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram
>>
>> address-space: aspeed.spi2-ast2600-dma-flash
>>   0000000050000000-000000005fffffff (prio 0, i/o): aspeed.spi2-ast2600.flash
>>     0000000050000000-0000000057ffffff (prio 0, i/o): aspeed.spi2-ast2600.0
>>
>> address-space: aspeed.spi2-ast2600-dma-dram
>>   0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>>     0000000080000000-00000000bfffffff (prio 0, ram): ram
>>     00000000c0000000-00000000ffffffff (prio 0, i/o): max_ram
>>
>> Many address spaces not zero-based...
> 
> Maybe it's still legal to make the root mr a subregion of another, so maybe I'm
> completely wrong... 

what is the problem you are trying to solve ? 

C. 




> then the patch attached won't make any sense either.  It's
> just that in my mind each MR should have a "parent" - for normal MR it's the
> container MR, then for root MR it's easier to see the AS as its "parent".
> 
> Maybe Paolo could clarify this..
> 
> Thanks,
> 


