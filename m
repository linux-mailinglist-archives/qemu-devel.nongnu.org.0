Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116B133CF68
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:13:22 +0100 (CET)
Received: from localhost ([::1]:35018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4pN-0001Mh-0m
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lM4np-0000R0-LR; Tue, 16 Mar 2021 04:11:45 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:33023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lM4nm-0006x9-0x; Tue, 16 Mar 2021 04:11:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 078D4909E623;
 Tue, 16 Mar 2021 09:11:28 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 16 Mar
 2021 09:11:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004d026df60-154f-4dd6-97d5-eddadc26c102,
 F4745E3E32A08DF6AE8813652EB4480BB0CFD8A0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v4 00/17] target/ppc: Fix truncation of env->hflags
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <40ec897a-8521-bf35-410f-2f47e3481f9c@kaod.org>
Date: Tue, 16 Mar 2021 09:11:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 30d98698-e9ac-488f-b38e-a66523209451
X-Ovh-Tracer-Id: 7507500579260238697
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I gave this series a try on some PPC machines : mac99, g3beige, 
sam460ex, pseries, powernv, with linux, macos, darwin, aix and 
didn't see any regression. Migration seems to work for pseries.

C.

On 3/15/21 7:45 PM, Richard Henderson wrote:
> Changes for v4:
>  * Use hregs_recompute_hflags for hw/ppc/ reset.
>    -- Incorporate Cedric's feedback.
> 
> Changes for v3:
>  * Fixes for linux-user, signal handling and startup.
>    -- Oops, the directory in which I did testing for v2
>       had a reduced set of targets.
> 
> Changes for v2:
>  * Do not put tcg internal state into migration, except to
>    retain backward compatibility.
>  * Do not touch anything in env in ppc_tr_init_disas_context.
>  * Do make sure that hflags contains everything that it should.
>  * Do verify that hflags is properly updated.
> 
> 
> r~
> 
> 
> Richard Henderson (17):
>   target/ppc: Move helper_regs.h functions out-of-line
>   target/ppc: Move 601 hflags adjustment to hreg_compute_hflags
>   target/ppc: Properly sync cpu state with new msr in cpu_load_old
>   target/ppc: Do not call hreg_compute_mem_idx after ppc_store_msr
>   target/ppc: Retain hflags_nmsr only for migration
>   target/ppc: Fix comment for MSR_FE{0,1}
>   target/ppc: Disconnect hflags from MSR
>   target/ppc: Reduce env->hflags to uint32_t
>   target/ppc: Put dbcr0 single-step bits into hflags
>   target/ppc: Create helper_scv
>   target/ppc: Put LPCR[GTSE] in hflags
>   target/ppc: Remove MSR_SA and MSR_AP from hflags
>   target/ppc: Remove env->immu_idx and env->dmmu_idx
>   hw/ppc/pnv_core: Update hflags after setting msr
>   hw/ppc/spapr_rtas: Update hflags after setting msr
>   linux-user/ppc: Fix msr updates for signal handling
>   target/ppc: Validate hflags with CONFIG_DEBUG_TCG
> 
>  target/ppc/cpu.h                |  50 +++++-
>  target/ppc/helper.h             |   1 +
>  target/ppc/helper_regs.h        | 183 +--------------------
>  hw/ppc/pnv_core.c               |   3 +-
>  hw/ppc/spapr_rtas.c             |   2 +
>  linux-user/ppc/cpu_loop.c       |   5 +-
>  linux-user/ppc/signal.c         |  23 ++-
>  target/ppc/excp_helper.c        |   9 ++
>  target/ppc/helper_regs.c        | 272 ++++++++++++++++++++++++++++++++
>  target/ppc/int_helper.c         |   1 +
>  target/ppc/machine.c            |  27 ++--
>  target/ppc/mem_helper.c         |   2 +-
>  target/ppc/misc_helper.c        |  13 +-
>  target/ppc/mmu-hash64.c         |   3 +
>  target/ppc/translate.c          |  98 ++++--------
>  target/ppc/translate_init.c.inc |   4 +-
>  target/ppc/meson.build          |   1 +
>  17 files changed, 410 insertions(+), 287 deletions(-)
>  create mode 100644 target/ppc/helper_regs.c
> 


