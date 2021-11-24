Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD445CDAA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 21:11:19 +0100 (CET)
Received: from localhost ([::1]:46164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpybu-0007zW-G1
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 15:11:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mpya9-0006su-35; Wed, 24 Nov 2021 15:09:32 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:58843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mpya6-00037k-VH; Wed, 24 Nov 2021 15:09:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 11D1DCDC1910;
 Wed, 24 Nov 2021 21:09:24 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 24 Nov
 2021 21:09:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0052d49b720-e0b0-4dbd-a469-6384063025f7,
 91DCD1862618CD88E95BCEF119A98FE4AA8C2BE1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.17
Message-ID: <3fab116d-a495-ac79-7b01-2adea5eaaaae@kaod.org>
Date: Wed, 24 Nov 2021 21:09:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/ppc: fix Hash64 MMU update of PTE bit R
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <20211124120046.6831-1-leandro.lupori@eldorado.org.br>
 <00546896-2466-007f-b73c-fe4f889fac2f@gmail.com>
 <1dae4d80-6b0b-5542-b783-7a3bb434bc16@kaod.org>
 <CP2PR80MB35865D04C82D81F7BCBA351CC6619@CP2PR80MB3586.lamprd80.prod.outlook.com>
 <1d71936e-0ede-811d-fa72-ca70dcbae068@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1d71936e-0ede-811d-fa72-ca70dcbae068@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3d4343c1-3fcf-4083-a8c1-781589736bf4
X-Ovh-Tracer-Id: 11237325495628172070
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrgeekgddufeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgfektdefveffieejheeihfffhefguedvfeefueeiteffkefgudetjeetkeekfeeunecuffhomhgrihhnpehfrhgvvggsshgurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.1,
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
Cc: "groug@kaod.org" <groug@kaod.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 20:42, Daniel Henrique Barboza wrote:
> 
> 
> On 11/24/21 16:17, Leandro Lupori wrote:
>> ​​
>>
>>
>>     On 11/24/21 14:40, Daniel Henrique Barboza wrote:
>>     >
>>     >
>>     > On 11/24/21 09:00, Leandro Lupori wrote:
>>     >> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
>>     >> offset, causing the first byte of the adjacent PTE to be corrupted.
>>     >> This caused a panic when booting FreeBSD, using the Hash MMU.
>>
>>     I wonder how we never hit this issue before. Are you testing PowerNV
>>     and/or pSeries  ?
>>
>>     Could you share a FreeBDS image with us ?
>>
>> ​I've hit this issue while testing PowerNV. With pSeries it doesn't happen.
>>
>> It can be reproduced by trying to boot this iso: https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64/ISO-IMAGES/14.0/FreeBSD-14.0-CURRENT-powerpc-powerpc64-20211028-4827bf76bce-250301-disc1.iso.xz
>>
>> It is easier to reproduce it using power8/powernv8.
>> ​
>>
>>     > If you add a "Fixes:" tag with the commit that introduced the code you're
>>     > fixing, we can push it right away as a bug fix in 6.2 (assuming it doesn't
>>     > break anything else, of course).
>>     >
>>     > The commit to be fixed in the case seems to be a2dd4e83e76b ("ppc/hash64:
>>     > Rework R and C bit  updates")
>>
>>     Indeed.
>>
>> ​​Right.
>>
>>     > One more comment below:
>>     >
>>     >>
>>     >> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>>     >> ---
>>     >>   target/ppc/mmu-hash64.c | 2 +-
>>     >>   1 file changed, 1 insertion(+), 1 deletion(-)
>>     >>
>>     >> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
>>     >> index 19832c4b46..f165ac691a 100644
>>     >> --- a/target/ppc/mmu-hash64.c
>>     >> +++ b/target/ppc/mmu-hash64.c
>>     >> @@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, uint64_t
>>     >>   static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>>     >>   {
>>     >> -    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 16;
>>     >> +    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 14;
>>     >
>>     > Instead of adding a '14' you should add a new #define in mmu-hash64.h with this
>>     > value, something like "HPTE64_R_R_SHIFT". This will avoid hardcoding literals
>>     > around the code and forcing us to go to the ISA every time we wonder what's
>>     > an apparently random number represents. There's also a "HPTE64_R_R" defined
>>     > there but I'm not sure if it's usable here, so feel free to create a new
>>     > macro if needed.
>>     >
>>     > In that note, the original commit that added this code also added a lot of
>>     > hardcoded "15" values for the C bit update in spapr_hpte_set_c() and
>>     > ppc_hash64_set_c(), and a "14" value like you're changing here in spapr_hpte_set_r().
>>     > If you're feeling generous I believe that another patch replacing these hardcoded values
>>     > with bit shift macros  is warranted as well.
>>
>> ​What about creating HPTE64_R_R_BYTEand HPTE64_R_C_BYTE, with the values 14 and 15, respectively,
>> to make it clear that these are byte offsets within a PTE?

  _BYTE_OFFSET may be ?

> Looks good to me.

Please update pSeries while you are it. I think HASH_PTE_SIZE_64 / 2
deserves an offset.

Thanks,

C.

