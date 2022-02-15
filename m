Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5474B68FE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:15:46 +0100 (CET)
Received: from localhost ([::1]:42986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJus5-0000gr-HV
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:15:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJuh8-0002J4-Rn
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:04:27 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:52813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJuh5-0004qG-0H
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:04:26 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4DDCDDFF0946;
 Tue, 15 Feb 2022 11:04:19 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 11:04:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004e8e4f61b-e879-4113-ae3e-0c44f3b7073e,
 9E61FECBC99B7F84222AE0DB6991604CA8A139D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <493845ce-dd84-56a1-0ac7-97f71dc7a0e3@kaod.org>
Date: Tue, 15 Feb 2022 11:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 6/9] target/ppc: add helper for books vhyp hypercall
 handler
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-7-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220215031642.1691873-7-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 08d02614-1b67-4529-bc42-b36f7918270b
X-Ovh-Tracer-Id: 8836906897088351200
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfrghrohhsrghssehlihhnuhigrdhisghmrdgtohhm
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/22 04:16, Nicholas Piggin wrote:
> The virtual hypervisor currently always intercepts and handles
> hypercalls but with a future change this will not always be the case.
> 
> Add a helper for the test so the logic is abstracted from the mechanism.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/excp_helper.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index fcc83a7701..6b6ec71bc2 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1278,6 +1278,18 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
>   }
>   
>   #ifdef TARGET_PPC64
> +/*
> + * When running under vhyp, hcalls are always intercepted and sent to the
> + * vhc->hypercall handler.
> + */
> +static bool books_vhyp_handles_hcall(PowerPCCPU *cpu)
> +{
> +    if (cpu->vhyp) {
> +        return true;
> +    }
> +    return false;
> +}
> +
>   static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>   {
>       CPUState *cs = CPU(cpu);
> @@ -1439,7 +1451,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>           env->nip += 4;
>   
>           /* "PAPR mode" built-in hypercall emulation */
> -        if ((lev == 1) && cpu->vhyp) {
> +        if ((lev == 1) && books_vhyp_handles_hcall(cpu)) {
>               PPCVirtualHypervisorClass *vhc =
>                   PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
>               vhc->hypercall(cpu->vhyp, cpu);
> 


