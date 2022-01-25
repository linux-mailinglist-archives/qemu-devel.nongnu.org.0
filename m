Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE049ADBB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 08:44:02 +0100 (CET)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCGUi-0000vv-Sh
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 02:44:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCGES-0005LF-LK
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:27:17 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:56483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCGEN-0002fB-G8
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:27:12 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.159])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1CF58D9CF1B2;
 Tue, 25 Jan 2022 08:26:59 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 08:26:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005c23b9d93-68a0-4dc5-993e-6cf94da1a51e,
 81DEFC5675B4A2B0B4575F732D37872089199EF9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <748676c1-16a0-6c3b-9e0c-75a00d67c325@kaod.org>
Date: Tue, 25 Jan 2022 08:26:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 14/14] target/ppc: 405: Watchdog timer exception cleanup
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-15-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220118184448.852996-15-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e2f929aa-4bd7-445e-ab85-c356d2cb1503
X-Ovh-Tracer-Id: 11980419436275338022
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdekgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsggrlhgrthhonhesvghikhdrsghmvgdrhhhu
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
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
> Remove references to BookE.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

trace point is becoming redundant. Anyhow,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/excp_helper.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 2efec6d13b..a22b783ecb 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -396,7 +396,6 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
> -    int excp_model = env->excp_model;
>       target_ulong msr, new_msr, vector;
>       int srr0, srr1;
>   
> @@ -511,14 +510,6 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>           break;
>       case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
>           trace_ppc_excp_print("WDT");
> -        switch (excp_model) {
> -        case POWERPC_EXCP_BOOKE:
> -            srr0 = SPR_BOOKE_CSRR0;
> -            srr1 = SPR_BOOKE_CSRR1;
> -            break;
> -        default:
> -            break;
> -        }
>           break;
>       case POWERPC_EXCP_DTLB:      /* Data TLB error                           */
>       case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
> 


