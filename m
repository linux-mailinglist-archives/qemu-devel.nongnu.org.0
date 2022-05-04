Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5FB5199AB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 10:23:23 +0200 (CEST)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmAI6-00010J-NS
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 04:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.zuepke@tum.de>)
 id 1nmAFx-0007bA-TL; Wed, 04 May 2022 04:21:11 -0400
Received: from postout1.mail.lrz.de ([2001:4ca0:0:103::81bb:ff89]:41813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.zuepke@tum.de>)
 id 1nmAFt-0007V2-Nh; Wed, 04 May 2022 04:21:09 -0400
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
 by postout1.mail.lrz.de (Postfix) with ESMTP id 4KtVBs2nmzzyTZ;
 Wed,  4 May 2022 10:20:37 +0200 (CEST)
Authentication-Results: postout.lrz.de (amavisd-new); dkim=pass (2048-bit key)
 reason="pass (just generated,
 assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tum.de; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:references:content-language:subject:subject
 :user-agent:mime-version:date:date:message-id:received:received;
 s=tu-postout21; t=1651652437; bh=UGDj/RhQAsv0psaJ7MM3PIMyq62okH
 oigxYEqDXQ7Cw=; b=B8u/dyeupgnWtOsS6aCscZ+pqEF45DT2pz4NAbahVljgBn
 MmCRzgdM2lyrINNGoh2Ch8mkztHEAvH+Uhyo9mccMl9jJwgglYti9tRIBXRzUIJG
 2WY7BqSZsHGfmQxfLdi2kqdB5HqWxxoN8HiQAt+Q6QWaCgSdlXg8oG1e0zP24igt
 JNDPNgfQCLsiX+P46/sNLksLH9fzf7S1LK+iskHXsCFhx40xRD2kxJ6R32azD3tu
 zgfrgp64cmhUe8jfFmtzU8XWezYwjiI8aEytkRyFiIqW4SH2h3kS4c9Y+YZ6V+SW
 SaHRC2Y1dSuqFHVg0cZw5hNl3clE2iRGx0s0n0aA==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Score: -5.398
Received: from postout1.mail.lrz.de ([127.0.0.1])
 by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new,
 port 20024)
 with LMTP id iPh8wJiJjth5; Wed,  4 May 2022 10:20:37 +0200 (CEST)
Received: from [10.162.12.216] (unknown [10.162.12.216])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4KtVBr5vb1zyTJ;
 Wed,  4 May 2022 10:20:36 +0200 (CEST)
Message-ID: <243a815b-8aa6-6862-33de-81e00ca5c468@tum.de>
Date: Wed, 4 May 2022 10:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] target/arm: read access to performance counters from EL0
Content-Language: en-US
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220428132717.84190-1-alex.zuepke@tum.de>
To: Peter Maydell <peter.maydell@linaro.org>
From: Alex Zuepke <alex.zuepke@tum.de>
In-Reply-To: <20220428132717.84190-1-alex.zuepke@tum.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4ca0:0:103::81bb:ff89;
 envelope-from=alex.zuepke@tum.de; helo=postout1.mail.lrz.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi,

wanted to ping again on this issue before it gets lost.

Am 28.04.22 um 15:27 schrieb Alex Zuepke:
> The ARMv8 manual defines that PMUSERENR_EL0.ER enables read-access
> to both PMXEVCNTR_EL0 and PMEVCNTR<n>_EL0 registers, however,
> we only use it for PMXEVCNTR_EL0. Extend to PMEVCNTR<n>_EL0 as well.

I configure PMUSERENR_EL0.ER for read access to the performance counters 
in user space, but it only works when I use the indexed access via the 
PMXEVCNTR_EL0 register, and not the direct access via the 
PMEVCNTR<n>_EL0 registers.

Real Cortex-A53:
PMXEVCNTR_EL0    read access in user space OK
PMEVCNTR<n>_EL0  read access works

QEMU:
PMXEVCNTR_EL0    read access works
PMEVCNTR<n>_EL0  exception

The patch changes the access function for 32-bit mode PMEVCNTR<n> and 
64-bit mode PMEVCNTR<n>_EL0 registers to the one from the "X" variant.


Best regards
Alex


> Signed-off-by: Alex Zuepke <alex.zuepke@tum.de>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 63397bbac1..eb42b22766 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6679,10 +6679,10 @@ static void define_pmu_regs(ARMCPU *cpu)
>                 .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
>                 .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
>                 .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
> -              .accessfn = pmreg_access },
> +              .accessfn = pmreg_access_xevcntr },
>               { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
>                 .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 8 | (3 & (i >> 3)),
> -              .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
> +              .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access_xevcntr,
>                 .type = ARM_CP_IO,
>                 .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
>                 .raw_readfn = pmevcntr_rawread,

