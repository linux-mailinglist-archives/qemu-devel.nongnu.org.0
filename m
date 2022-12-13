Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C79364BA6F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:57:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58Zk-0003EM-Dl; Tue, 13 Dec 2022 11:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p58Zj-0003E7-6t
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:56:15 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p58Zh-0002iQ-Do
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:56:14 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.192])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9D9C914B6B03E;
 Tue, 13 Dec 2022 17:56:09 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 13 Dec
 2022 17:56:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005986bb520-a460-41c4-a360-4cc4dea0102a,
 70F1EFD4CFA2BAC2768C5AFE190B601EEBA8C420) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ccc834cd-0cf7-5a19-58a3-c933e2923834@kaod.org>
Date: Tue, 13 Dec 2022 17:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 0/3] hw/ppc: Remove tswap() calls
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, David Gibson
 <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>, Greg Kurz
 <groug@kaod.org>, <qemu-arm@nongnu.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, <qemu-ppc@nongnu.org>
References: <20221213125218.39868-1-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221213125218.39868-1-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 82a7e182-b913-4738-a25b-43c9adfb0cfc
X-Ovh-Tracer-Id: 12585590633924758459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdgsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpuggrvhhiugesghhisghsoh
 hnrdgurhhophgsvggrrhdrihgurdgruhdpjhgrshhofigrnhhgsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/13/22 13:52, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I am trying to remove the tswap() API from system
> emulation and replace it by more meaningful calls,
> because tswap depends on the host endianness, and
> this detail should be irrelevant from the system
> emulation PoV.
> 
> In this RFC series I'm trying to convert the PPC
> calls.

Here are some simple images for tests:

   https://github.com/legoater/qemu-ppc-boot/tree/main/buildroot

Cheers,

C.


> 
> Any help in understanding what was the original
> author intention is welcomed :)
> 
> Thanks,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (3):
>    hw/ppc: Replace tswap32() by const_le32()
>    hw/ppc/spapr: Replace tswap64(HPTE) by cpu_to_be64(HPTE)
>    hw/net/xilinx_ethlite: Replace tswap32() by be32_to_cpu()
> 
>   hw/net/xilinx_ethlite.c | 10 +++++-----
>   hw/ppc/sam460ex.c       |  3 ++-
>   hw/ppc/spapr.c          |  9 +++++----
>   hw/ppc/virtex_ml507.c   |  3 ++-
>   4 files changed, 14 insertions(+), 11 deletions(-)
> 


