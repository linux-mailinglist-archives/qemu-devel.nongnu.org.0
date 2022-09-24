Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A415E8CFC
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 15:13:28 +0200 (CEST)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc4yF-0006ti-NX
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 09:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oc4uU-0001at-P6
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 09:09:34 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:35341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oc4uS-0006tK-Nj
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 09:09:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D759C20F92;
 Sat, 24 Sep 2022 13:09:18 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Sat, 24 Sep
 2022 15:09:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006da63f5e6-b819-4cf1-8c2e-9c38e1acb334,
 81A8F35BB926CC183C4AAFAE2266FFD260055B7E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <65c462fb-3206-c0bd-d452-221a6b5f4c97@kaod.org>
Date: Sat, 24 Sep 2022 15:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] target/ppc: restore powerpc_excp_booke doorbell interrupts
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
CC: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220924114436.1422786-1-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220924114436.1422786-1-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 312894ad-041d-4a99-be60-dbc9e44350c8
X-Ovh-Tracer-Id: 107523444662373283
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.118,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/22 13:44, Nicholas Piggin wrote:
> This partially reverts commit 9dc20cc37db9 ("target/ppc: Simplify
> powerpc_excp_booke"), which removed DOORI and DOORCI interrupts.
> Without this patch, a -cpu e5500 -smp 2 machine booting Linux
> crashes with:
> 
>    qemu: fatal: Invalid PowerPC exception 36. Aborting
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/excp_helper.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 214acf5ac4..43f2480e94 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1247,6 +1247,12 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
>       case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
>           env->spr[SPR_BOOKE_ESR] = ESR_SPV;
>           break;
> +    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
> +        break;
> +    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
> +        srr0 = SPR_BOOKE_CSRR0;
> +        srr1 = SPR_BOOKE_CSRR1;
> +        break;
>       case POWERPC_EXCP_RESET:     /* System reset exception                   */
>           if (FIELD_EX64(env->msr, MSR, POW)) {
>               cpu_abort(cs, "Trying to deliver power-saving system reset "


