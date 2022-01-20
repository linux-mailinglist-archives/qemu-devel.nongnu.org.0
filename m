Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1E64957A0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 02:08:20 +0100 (CET)
Received: from localhost ([::1]:34592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAiPa-0003cU-LC
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 20:08:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAfTD-0001fP-Vw
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 16:59:52 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:60083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAfTB-0006wV-Td
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 16:59:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3426621B84;
 Thu, 20 Jan 2022 21:59:47 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 20 Jan
 2022 22:59:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0054c67ac6a-f64b-4eac-b94e-85ee88fd722d,
 55E834D54A8FC5F4505B49AAC2A2F9003410B5FE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b745d33e-1258-035a-184b-28ad35e70c8c@kaod.org>
Date: Thu, 20 Jan 2022 22:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: 603: fix restore of GPRs 0-3 on rfi
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20220120103824.239573-1-christophe.leroy@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220120103824.239573-1-christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9e08345f-b79a-411f-93c6-39dda69eff3f
X-Ovh-Tracer-Id: 15803694043573423072
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdduheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgrrhhoshgrsheslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/22 11:39, Christophe Leroy wrote:
> After a TLB miss exception, GPRs 0-3 must be restored on rfi.
> 
> This is managed by hreg_store_msr() which is called by do_rfi()
> 
> However, hreg_store_msr() does it if MSR[TGPR] is unset in the
> passed MSR value.
> 
> The problem is that do_rfi() is given the content of SRR1 as
> the value to be set in MSR, but TGPR bit is not part of SRR1
> and that bit is used for something else and is sometimes set
> to 1, leading to hreg_store_msr() not restoring GPRs.
> 
> So, do the same way as for POW bit, force clearing it.

 From the specs :

   "The TGPR bit is cleared by an rfi instruction."

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Cedric Le Goater <clg@kaod.org>
> Cc: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index bc646c67a0..980f62fd79 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1164,6 +1164,10 @@ static void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
>       /* MSR:POW cannot be set by any form of rfi */
>       msr &= ~(1ULL << MSR_POW);
>   
> +    /* MSR:TGPR cannot be set by any form of rfi */
> +    if (env->flags & POWERPC_FLAG_TGPR)
> +        msr &= ~(1ULL << MSR_TGPR);
> +
>   #if defined(TARGET_PPC64)
>       /* Switching to 32-bit ? Crop the nip */
>       if (!msr_is_64bit(env, msr)) {
> 


