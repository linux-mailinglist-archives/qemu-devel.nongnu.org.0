Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA93449ADFE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:28:46 +0100 (CET)
Received: from localhost ([::1]:54360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHC1-0001t4-Nl
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:28:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCGDM-00055p-72
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:26:04 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:56425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCGDJ-0002bm-Kz
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:26:03 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.83])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 54BB621B0D;
 Tue, 25 Jan 2022 07:25:57 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 08:25:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006f012c030-b80f-4eea-9c4d-b274ecd94a04,
 81DEFC5675B4A2B0B4575F732D37872089199EF9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b57436ae-7daa-0313-37c6-1c799f83e992@kaod.org>
Date: Tue, 25 Jan 2022 08:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 13/14] target/ppc: 405: Program exception cleanup
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-14-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220118184448.852996-14-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 08e88828-e8e4-46ad-8c51-23bb288f0b7a
X-Ovh-Tracer-Id: 11962967985466280742
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdekgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsggrlhgrthhonhesvghikhdrsghmvgdrhhhu
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 19:44, Fabiano Rosas wrote:
> The 405 Program Interrupt does not set SRR1 with any diagnostic bits,
> just a clean copy of the MSR.
> 
> We're using the BookE Exception Syndrome Register which is different
> from the 405.

I restored the setting of SPR_40x_ESR.

> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


Thanks,

C.


> ---
>   target/ppc/excp_helper.c | 16 ----------------
>   1 file changed, 16 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 13674a102f..2efec6d13b 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -484,30 +484,14 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>                   env->error_code = 0;
>                   return;
>               }
> -
> -            /*
> -             * FP exceptions always have NIP pointing to the faulting
> -             * instruction, so always use store_next and claim we are
> -             * precise in the MSR.
> -             */
> -            msr |= 0x00100000;
> -            env->spr[SPR_BOOKE_ESR] = ESR_FP;
>               break;
>           case POWERPC_EXCP_INVAL:
>               trace_ppc_excp_inval(env->nip);
> -            msr |= 0x00080000;
> -            env->spr[SPR_BOOKE_ESR] = ESR_PIL;
>               break;
>           case POWERPC_EXCP_PRIV:
> -            msr |= 0x00040000;
> -            env->spr[SPR_BOOKE_ESR] = ESR_PPR;
> -            break;
>           case POWERPC_EXCP_TRAP:
> -            msr |= 0x00020000;
> -            env->spr[SPR_BOOKE_ESR] = ESR_PTR;
>               break;
>           default:
> -            /* Should never occur */
>               cpu_abort(cs, "Invalid program exception %d. Aborting\n",
>                         env->error_code);
>               break;
> 


