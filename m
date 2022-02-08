Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524604AD57E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:29:36 +0100 (CET)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNkd-0000oc-EU
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:29:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHMY2-00009r-SO
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 04:12:30 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:52717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHMY0-0001g9-C2
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 04:12:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E75BF2233F;
 Tue,  8 Feb 2022 09:12:25 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Feb
 2022 10:12:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006289038e1-8c83-4c6d-bf04-912f4814fa1a,
 A9EFA83ADB8598AD7F1759910761E0E5CF6DF637) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <67b4a230-86ec-e214-f074-0e93221c766c@kaod.org>
Date: Tue, 8 Feb 2022 10:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/4] target/ppc: powerpc_excp: Move common code to the
 caller function
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220207183036.1507882-1-farosas@linux.ibm.com>
 <20220207183036.1507882-3-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220207183036.1507882-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3804b0fb-2c03-4c1a-8cb3-8b78c54f34c1
X-Ovh-Tracer-Id: 3745024565436320675
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/22 19:30, Fabiano Rosas wrote:
> Make the cpu-specific powerpc_excp_* functions a bit simpler by moving
> the bounds check and logging to powerpc_excp.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/excp_helper.c | 57 +++++++---------------------------------
>   1 file changed, 9 insertions(+), 48 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index c6646503aa..206314aaa2 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -396,14 +396,6 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>       target_ulong msr, new_msr, vector;
>       int srr0, srr1;
>   
> -    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
> -        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> -    }
> -
> -    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> -                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
> -                  excp, env->error_code);
> -
>       /* new srr1 value excluding must-be-zero bits */
>       msr = env->msr & ~0x783f0000ULL;
>   
> @@ -554,14 +546,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
>       CPUPPCState *env = &cpu->env;
>       target_ulong msr, new_msr, vector;
>   
> -    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
> -        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> -    }
> -
> -    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> -                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
> -                  excp, env->error_code);
> -
>       /* new srr1 value excluding must-be-zero bits */
>       msr = env->msr & ~0x783f0000ULL;
>   
> @@ -746,14 +730,6 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
>       CPUPPCState *env = &cpu->env;
>       target_ulong msr, new_msr, vector;
>   
> -    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
> -        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> -    }
> -
> -    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> -                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
> -                  excp, env->error_code);
> -
>       /* new srr1 value excluding must-be-zero bits */
>       msr = env->msr & ~0x783f0000ULL;
>   
> @@ -926,14 +902,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
>       CPUPPCState *env = &cpu->env;
>       target_ulong msr, new_msr, vector;
>   
> -    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
> -        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> -    }
> -
> -    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> -                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
> -                  excp, env->error_code);
> -
>       /* new srr1 value excluding must-be-zero bits */
>       msr = env->msr & ~0x783f0000ULL;
>   
> @@ -1121,14 +1089,6 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
>       target_ulong msr, new_msr, vector;
>       int srr0, srr1;
>   
> -    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
> -        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> -    }
> -
> -    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> -                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
> -                  excp, env->error_code);
> -
>       msr = env->msr;
>   
>       /*
> @@ -1348,14 +1308,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>       target_ulong msr, new_msr, vector;
>       int srr0, srr1, lev = -1;
>   
> -    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
> -        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> -    }
> -
> -    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> -                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
> -                  excp, env->error_code);
> -
>       /* new srr1 value excluding must-be-zero bits */
>       msr = env->msr & ~0x783f0000ULL;
>   
> @@ -1642,8 +1594,17 @@ static inline void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>   
>   static void powerpc_excp(PowerPCCPU *cpu, int excp)
>   {
> +    CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
>   
> +    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
> +        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> +    }
> +
> +    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
> +                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
> +                  excp, env->error_code);
> +
>       switch (env->excp_model) {
>       case POWERPC_EXCP_40x:
>           powerpc_excp_40x(cpu, excp);
> 


