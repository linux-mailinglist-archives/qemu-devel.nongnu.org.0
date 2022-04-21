Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0CE50979F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:31:40 +0200 (CEST)
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQLr-00070D-IG
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nhQDz-0002GQ-VZ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:23:35 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:44121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nhQDu-0005oC-CF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:23:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.42])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BA2452295F;
 Thu, 21 Apr 2022 06:23:23 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 21 Apr
 2022 08:23:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00310994873-d46e-4ffd-b134-fc5fe3bf9651,
 FFC778467988C6DD564F10F4CBD504D71298CE84) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9ddd8d9c-c97e-9a77-b2f1-7769c50db8da@kaod.org>
Date: Thu, 21 Apr 2022 08:23:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] target/ppc: Fix BookE debug interrupt generation
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>
References: <20220421011729.1148727-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220421011729.1148727-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 388098c1-9a13-4902-b876-f3774db3baf0
X-Ovh-Tracer-Id: 17895897547982343020
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrtddugddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetieekudeifeejleejfeevhfejkeetfeelheevueegjeefheeuvefhleefleeiffenucffohhmrghinhepnhigphdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 03:17, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Per E500 core reference manual [1], chapter 8.4.4 "Branch Taken Debug
> Event" and chapter 8.4.5 "Instruction Complete Debug Event":
> 
>    "A branch taken debug event occurs if both MSR[DE] and DBCR0[BRT]
>    are set ... Branch taken debug events are not recognized if MSR[DE]
>    is cleared when the branch instruction executes."
> 
>    "An instruction complete debug event occurs when any instruction
>    completes execution so long as MSR[DE] and DBCR0[ICMP] are both
>    set ... Instruction complete debug events are not recognized if
>    MSR[DE] is cleared at the time of the instruction execution."
> 
> Current codes do not check MSR.DE bit before setting HFLAGS_SE and
> HFLAGS_BE flag, which would cause the immediate debug interrupt to
> be generated, e.g.: when DBCR0.ICMP bit is set by guest software
> and MSR.DE is not set.
> 
> [1] https://www.nxp.com/docs/en/reference-manual/E500CORERM.pdf
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> 
> Changes in v2:
> - update commit message to use E500CORERM instead of PowerISA 2.07
> 
>   target/ppc/helper_regs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 9a691d6833..77bc57415c 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -63,10 +63,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>   
>       if (ppc_flags & POWERPC_FLAG_DE) {
>           target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
> -        if (dbcr0 & DBCR0_ICMP) {
> +        if ((dbcr0 & DBCR0_ICMP) && msr_de) {
>               hflags |= 1 << HFLAGS_SE;
>           }
> -        if (dbcr0 & DBCR0_BRT) {
> +        if ((dbcr0 & DBCR0_BRT) && msr_de) {
>               hflags |= 1 << HFLAGS_BE;
>           }
>       } else {


