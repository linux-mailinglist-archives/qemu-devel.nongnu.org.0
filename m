Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FEA4D8802
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:24:17 +0100 (CET)
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmYS-0006TQ-JU
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:24:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nTmWb-0003vi-Dt
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:22:22 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:56317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nTmWZ-0003nK-69
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:22:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 80F88E9C7D36;
 Mon, 14 Mar 2022 16:22:17 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 14 Mar
 2022 16:22:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005e51afb9d-bf39-4a2a-a81d-2f851d4c6377,
 00B622A560025FB732B9BA5E5C4E2A2293E53F9D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a0549d3e-6acc-b6b3-8df6-e8cbd32b734e@kaod.org>
Date: Mon, 14 Mar 2022 16:22:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] target/ppc: fix ISI fault cause for Radix MMU
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, <qemu-devel@nongnu.org>, 
 <qemu-ppc@nongnu.org>
References: <20220309192756.145283-1-leandro.lupori@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220309192756.145283-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7054284a-2635-42ba-b22b-4b2151debb74
X-Ovh-Tracer-Id: 6748925517048548134
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvkedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/22 20:27, Leandro Lupori wrote:
> Fix Instruction Storage Interrupt (ISI) fault cause for Radix MMU,
> when caused by missing PAGE_EXEC permission, to be
> SRR1_NOEXEC_GUARD instead of DSISR_PROTFAULT.
> This matches POWER9 hardware behavior.
> 
> Fixes: d5fee0bbe68 ("target/ppc: Implement ISA V3.00 radix page fault handler")
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   target/ppc/mmu-radix64.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)


Queued for 7.0

Thanks,

C.

