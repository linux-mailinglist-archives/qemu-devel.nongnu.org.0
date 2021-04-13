Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B7D35E19D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 16:33:46 +0200 (CEST)
Received: from localhost ([::1]:47434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWK6q-0006bx-KK
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 10:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lWK50-0005vX-Mv; Tue, 13 Apr 2021 10:31:50 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:57473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lWK4y-0008CF-1L; Tue, 13 Apr 2021 10:31:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0D50C99F742E;
 Tue, 13 Apr 2021 16:31:44 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 13 Apr
 2021 16:31:43 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0028daa0037-ab39-41e9-a606-c92deda8a124,
 4BE79BB08BA9582E888D4556D96BF37B7B4E8F35) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [EXTERNAL] [PATCH v1 1/3] target/ppc: Fix POWER9 radix guest HV
 interrupt AIL behaviour
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20210413125448.1689545-1-npiggin@gmail.com>
 <20210413125448.1689545-2-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8605fe6a-a437-3a8f-a5dc-415b07bdf9ba@kaod.org>
Date: Tue, 13 Apr 2021 16:31:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413125448.1689545-2-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a5293580-5375-4ed7-b010-41f9ee40c80c
X-Ovh-Tracer-Id: 12344085104798239651
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudekledgjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 2:54 PM, Nicholas Piggin wrote:
> ISA v3.0 radix guest execution has a quirk in AIL behaviour such that
> the LPCR[AIL] value can apply to hypervisor interrupts.

Shouldn't we test for P9 ? But I think you are using a new exception 
model for P10 in the next patch. 

I guess it's ok for now.

> 
> This affects machines that emulate HV=1 mode (i.e., powernv9).
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  target/ppc/excp_helper.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 85de7e6c90..b8881c0f85 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -791,14 +791,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>  #endif
> 
>      /*
> -     * AIL only works if there is no HV transition and we are running
> -     * with translations enabled
> +     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
>       */
> -    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1) ||
> -        ((new_msr & MSR_HVB) && !(msr & MSR_HVB))) {
> +    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>          ail = 0;
>      }
> 
> +    /*
> +     * AIL does not work if there is a MSR[HV] 0->1 transition and the
> +     * partition is in HPT mode. For radix guests, such interrupts are
> +     * allowed to be delivered to the hypervisor in ail mode.
> +     */
> +    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
> +        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {

We have a ppc64_v3_radix() helper but this is minor.

C.

> +            ail = 0;
> +        }
> +    }
> +
>      vector = env->excp_vectors[excp];
>      if (vector == (target_ulong)-1ULL) {
>          cpu_abort(cs, "Raised an exception without defined vector %d\n",
> 


