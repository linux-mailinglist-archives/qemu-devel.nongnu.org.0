Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C24144C58C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:59:13 +0100 (CET)
Received: from localhost ([::1]:52598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqwJ-00040v-U0
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:59:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mkqu5-000252-JE
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:56:53 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:60765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mkqu2-0000lk-DM
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:56:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0941C21984;
 Wed, 10 Nov 2021 16:56:40 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 10 Nov
 2021 17:56:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00577042a2d-159f-4298-b4a6-7de897a7be6e,
 FF02C7A8D8E58AFC286F2B1DBFB5F34314452EF1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e69dd6b9-dc86-7887-8374-0caa196705ce@kaod.org>
Date: Wed, 10 Nov 2021 17:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 03/54] target/ppc: Move load and store floating point
 instructions to decodetree
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, David Gibson
 <david@gibson.dropbear.id.au>, <peter.maydell@linaro.org>,
 <danielhb413@gmail.com>, <groug@kaod.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
 <20211109055204.230765-4-david@gibson.dropbear.id.au>
 <fed70819-21be-b375-b2b8-2c34618f3d11@vivier.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <fed70819-21be-b375-b2b8-2c34618f3d11@vivier.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0668c28f-43c1-4367-8d88-ca5e813e75a1
X-Ovh-Tracer-Id: 17998354437670079480
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudekgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fernando Eckhardt Valle <phervalle@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 17:33, Laurent Vivier wrote:
> On 09/11/2021 06:51, David Gibson wrote:
>> From: Fernando Eckhardt Valle <phervalle@gmail.com>
>>
>> Move load floating point instructions (lfs, lfsu, lfsx, lfsux, lfd, lfdu, lfdx, lfdux)
>> and store floating point instructions(stfs, stfsu, stfsx, stfsux, stfd, stfdu, stfdx,
>> stfdux) from legacy system to decodetree.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> Message-Id: <20211029202424.175401-4-matheus.ferst@eldorado.org.br>
>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> ---
>>   target/ppc/insn32.decode           |  24 +++
>>   target/ppc/translate/fp-impl.c.inc | 247 +++++++++--------------------
>>   target/ppc/translate/fp-ops.c.inc  |  29 ----
>>   3 files changed, 95 insertions(+), 205 deletions(-)
>>
> 
> This patch breaks qemu linux-user with an ubuntu bionic chroot.
> 
> The fix proposed by Matheus [1] fixes it for me.
> When will it be merged?
> It's needed in 6.2


It's queued for 6.2 :

   https://github.com/legoater/qemu/commits/ppc-6.2

I wanted to wait the end of the week before sending a PR. Unless
this is critical for you of course.

Thanks,

C.


