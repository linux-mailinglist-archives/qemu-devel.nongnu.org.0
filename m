Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C7545CCAE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:04:03 +0100 (CET)
Received: from localhost ([::1]:33594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxYn-0005v3-Oz
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:04:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mpxDp-0000a6-DT
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:42:22 -0500
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:38553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mpxDm-00065F-Hu
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:42:21 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.174])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 65412202F0;
 Wed, 24 Nov 2021 18:42:15 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 24 Nov
 2021 19:42:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0045b36e481-f15f-4732-900b-84b0b859fcec,
 91DCD1862618CD88E95BCEF119A98FE4AA8C2BE1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.17
Message-ID: <1dae4d80-6b0b-5542-b783-7a3bb434bc16@kaod.org>
Date: Wed, 24 Nov 2021 19:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/ppc: fix Hash64 MMU update of PTE bit R
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20211124120046.6831-1-leandro.lupori@eldorado.org.br>
 <00546896-2466-007f-b73c-fe4f889fac2f@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <00546896-2466-007f-b73c-fe4f889fac2f@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b3d8b786-6ff1-40c4-9e23-44a2dc2af555
X-Ovh-Tracer-Id: 9765774320114567974
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrgeekgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:40, Daniel Henrique Barboza wrote:
> 
> 
> On 11/24/21 09:00, Leandro Lupori wrote:
>> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
>> offset, causing the first byte of the adjacent PTE to be corrupted.
>> This caused a panic when booting FreeBSD, using the Hash MMU.

I wonder how we never hit this issue before. Are you testing PowerNV
and/or pSeries  ?

Could you share a FreeBDS image with us ?

> If you add a "Fixes:" tag with the commit that introduced the code you're
> fixing, we can push it right away as a bug fix in 6.2 (assuming it doesn't
> break anything else, of course).
>
> The commit to be fixed in the case seems to be a2dd4e83e76b ("ppc/hash64:
> Rework R and C bit updates")

Indeed.

> One more comment below:
> 
>>
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
>>   target/ppc/mmu-hash64.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
>> index 19832c4b46..f165ac691a 100644
>> --- a/target/ppc/mmu-hash64.c
>> +++ b/target/ppc/mmu-hash64.c
>> @@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, uint64_t
>>   static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>>   {
>> -    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 16;
>> +    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 14;
> 
> Instead of adding a '14' you should add a new #define in mmu-hash64.h with this
> value, something like "HPTE64_R_R_SHIFT". This will avoid hardcoding literals
> around the code and forcing us to go to the ISA every time we wonder what's
> an apparently random number represents. There's also a "HPTE64_R_R" defined
> there but I'm not sure if it's usable here, so feel free to create a new
> macro if needed.
> 
> In that note, the original commit that added this code also added a lot of
> hardcoded "15" values for the C bit update in spapr_hpte_set_c() and
> ppc_hash64_set_c(), and a "14" value like you're changing here in spapr_hpte_set_r().
> If you're feeling generous I believe that another patch replacing these hardcoded values
> with bit shift macros is warranted as well.

May be for 7.0 though ?

Thanks,

C.


