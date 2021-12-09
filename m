Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0106446E399
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 08:59:53 +0100 (CET)
Received: from localhost ([::1]:53970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvELH-00016P-OV
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 02:59:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvEJB-00077i-KK
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:57:41 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:50155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvEJ4-0000LF-Uu
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:57:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.27])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5F0FB209F1;
 Thu,  9 Dec 2021 07:57:32 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 9 Dec
 2021 08:57:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003fb162b56-a895-4fef-8fbe-5bc59b595fee,
 8D04C9E66DC1FB38CABDD9E51B1330B7D999B631) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c62d3dcd-5b7c-8404-e235-83d5470fafc0@kaod.org>
Date: Thu, 9 Dec 2021 08:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] target/ppc: Fix MPCxxx FPU interrupt address
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211208123029.2052625-1-farosas@linux.ibm.com>
 <20211208123029.2052625-2-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211208123029.2052625-2-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 46fbfac5-481f-4e25-b767-ba8f01ab4154
X-Ovh-Tracer-Id: 13180910212241066915
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeelgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.803,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/21 13:30, Fabiano Rosas wrote:
> The Floating-point Unavailable and Decrementer interrupts are being
> registered at the same 0x900 address. The FPU should be at 0x800
> instead.
> 
> Verified on MPC555, MPC860 and MPC885 user manuals.
> 
> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/cpu_init.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 6695985e9b..55af48769a 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2180,7 +2180,7 @@ static void init_excp_MPC5xx(CPUPPCState *env)
>       env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
>       env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
>       env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000900;
> +    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
>       env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
>       env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
>       env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
> @@ -2207,7 +2207,7 @@ static void init_excp_MPC8xx(CPUPPCState *env)
>       env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
>       env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
>       env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000900;
> +    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
>       env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
>       env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
>       env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
> 


