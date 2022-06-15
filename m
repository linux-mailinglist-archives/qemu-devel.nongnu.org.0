Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F91654C11B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 07:26:18 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1LXl-0005SK-5M
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 01:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o1LUn-0004G2-C4
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 01:23:13 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:49565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o1LUk-00042L-N6
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 01:23:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.249])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 346E720AF7;
 Wed, 15 Jun 2022 05:23:07 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 15 Jun
 2022 07:23:06 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006b9d2443b-ca37-4891-b642-2d26a98776c5,
 3604600A7A17CF82FBB88DE7BC2BB74EF19CEDFF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <64d1330c-1996-622c-fc1a-ed81fd56cdda@kaod.org>
Date: Wed, 15 Jun 2022 07:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] target/ppc: cpu_init: Clean up stop state on cpu reset
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220614082912.378355-1-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220614082912.378355-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f5314c9a-2d64-4657-9ea1-5c10e03101fa
X-Ovh-Tracer-Id: 7834855978300574688
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvtddgkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/14/22 10:29, Frederic Barrat wrote:
> The 'resume_as_sreset' attribute of a cpu can be set when a thread is
> entering a stop state on ppc books. It causes the thread to be
> re-routed to vector 0x100 when woken up by an exception. So it must be
> cleaned on reset or a thread might be re-routed unexpectedly after a
> reset, when it was not in a stop state and/or when the appropriate
> exception handler isn't set up yet.

What is the test scenario ? and what are the symptoms ?


> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
> 
> I didn't find an appropriate commit to add a "Fixes:". It originates
> when adding support for power management states but the code looked
> quite different in 2016 and it's not clear whether we were supporting
> reset then.

It was added when we needed some support for the POWER8 stop states.
About that time.

Thanks,

C.

> 
> target/ppc/cpu_init.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 0f891afa04..c16cb8dbe7 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7186,6 +7186,9 @@ static void ppc_cpu_reset(DeviceState *dev)
>           }
>           pmu_update_summaries(env);
>       }
> +
> +    /* clean any pending stop state */
> +    env->resume_as_sreset = 0;
>   #endif
>       hreg_compute_hflags(env);
>       env->reserve_addr = (target_ulong)-1ULL;


