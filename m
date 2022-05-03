Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF27518A96
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:57:46 +0200 (CEST)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvqK-0003aL-Gf
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nlvnc-0001B6-AI
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:54:56 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:37187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nlvna-0006dD-5e
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:54:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CCD08FC4670E;
 Tue,  3 May 2022 18:54:43 +0200 (CEST)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 3 May 2022
 18:54:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00184bed93e-b44b-4026-ba9b-184bd46e5846,
 F6B89E566DA044E9E2FB2CFEBB669705F2CEA7ED) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <cd1ae42e-6824-c160-4c41-75eef16dbae0@kaod.org>
Date: Tue, 3 May 2022 18:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/ppc: Fix tlbie
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, <qemu-devel@nongnu.org>, 
 <qemu-ppc@nongnu.org>
CC: <danielhb413@gmail.com>, <david@gibson.dropbear.id.au>, <groug@kaod.org>
References: <20220503163904.22575-1-leandro.lupori@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220503163904.22575-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9a36f438-aeab-45b5-8356-2bf912a86796
X-Ovh-Tracer-Id: 6796776264457292582
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/22 18:39, Leandro Lupori wrote:
> Commit 74c4912f097bab98 changed check_tlb_flush() to use
> tlb_flush_all_cpus_synced() instead of calling tlb_flush() on each
> CPU. However, as side effect of this, a CPU executing a ptesync
> after a tlbie will have its TLB flushed only after exiting its
> current Translation Block (TB).
> 
> This causes memory accesses to invalid pages to succeed, if they
> happen to be on the same TB as the ptesync.

How did you track the issue ? Do you have a test case ?

Thanks,

C.


> To fix this, use tlb_flush_all_cpus() instead, that immediately
> flushes the TLB of the CPU executing the ptesync instruction.
> 
> Fixes: 74c4912f097bab98 ("target/ppc: Fix synchronization of mttcg with broadcast TLB flushes")
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   target/ppc/helper_regs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 9a691d6833..1fa032e4d0 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -293,7 +293,7 @@ void check_tlb_flush(CPUPPCState *env, bool global)
>       if (global && (env->tlb_need_flush & TLB_NEED_GLOBAL_FLUSH)) {
>           env->tlb_need_flush &= ~TLB_NEED_GLOBAL_FLUSH;
>           env->tlb_need_flush &= ~TLB_NEED_LOCAL_FLUSH;
> -        tlb_flush_all_cpus_synced(cs);
> +        tlb_flush_all_cpus(cs);
>           return;
>       }
>   


