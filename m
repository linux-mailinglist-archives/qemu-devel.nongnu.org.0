Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC2856520A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:21:12 +0200 (CEST)
Received: from localhost ([::1]:51792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8JCZ-00065M-FN
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pali@kernel.org>)
 id 1o8JAT-0004hR-9G; Mon, 04 Jul 2022 06:19:01 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:37424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pali@kernel.org>)
 id 1o8JAQ-0003VI-W2; Mon, 04 Jul 2022 06:19:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54DB7B80E89;
 Mon,  4 Jul 2022 10:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D72C3411E;
 Mon,  4 Jul 2022 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656929935;
 bh=74ZTk5iaK8jFc2HkP0PAeluOyOsMFca78Mhxuvtwk1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FVLLJGbJ5jKQGLHnz1rabYA6PTy5qKhrSy1sazI5yUVVtvTpg1p1uWEjRdHOQMNbE
 sZEyboxdffl5q0L1tyTJwrg1Twwlm/EgS7+m0/P8XOJjO4K21s/B7/Kj8R/7Wpve58
 17vIX4FHt/pj93bXyZNBnlyIx+L35hQVRleF/99iehmf9XizKJQbyo4m5wAbt+RvYv
 ETGi9RIz751i+vU7BiTUGT/eq9sELPT/1j9b3mF8ywyOUNMvaZkQRVjHiE24B0oR4e
 vk1dNX+YtI8+F+UcGH3P3UZK5hIPy+bhAaGvqEMMJQzR+fZDAU4RESRm7D5ddl8+X0
 SrKOp3qcNHI5A==
Received: by pali.im (Postfix)
 id 9A1D76E8; Mon,  4 Jul 2022 12:18:51 +0200 (CEST)
Date: Mon, 4 Jul 2022 12:18:51 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: Fix MPC8555 and MPC8560 core type to e500v1
Message-ID: <20220704101851.lgbeojdntx2bzm4f@pali>
References: <20220703195029.23793-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220703195029.23793-1-pali@kernel.org>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=145.40.68.75; envelope-from=pali@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sunday 03 July 2022 21:50:29 Pali Rohár wrote:
> Commit 80d11f4467c4 ("Add definitions for Freescale PowerPC implementations")
> changed core type of MPC8555 and MPC8560 from e500v1 to e500v2.
> 
> But both MPC8555 and MPC8560 have just e500v1 cores, there are no features
> of e500v2 cores. It can be verified by reading NXP documentations:
> https://www.nxp.com/docs/en/data-sheet/MPC8555EEC.pdf
> https://www.nxp.com/docs/en/data-sheet/MPC8560EC.pdf
> https://www.nxp.com/docs/en/reference-manual/MPC8555ERM.pdf
> https://www.nxp.com/docs/en/reference-manual/MPC8560RM.pdf
> 
> Therefore fix core type of MPC8555 and MPC8560 back to e500v1.
> 
> Fixes: 80d11f4467c4 ("Add definitions for Freescale PowerPC implementations")
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---

Just for completeness, here is list of all Motorola/Freescale/NXP
processors which were released and have e500v1 or e500v2 cores.

e500v1:
MPC8540
MPC8541
MPC8555
MPC8560

e500v2:
BSC9131
BSC9132
C291
C292
C293
MPC8533
MPC8535
MPC8536
MPC8543
MPC8544
MPC8545
MPC8547
MPC8548
MPC8567
MPC8568
MPC8569
MPC8572
P1010
P1011
P1012
P1013
P1014
P1015
P1016
P1020
P1021
P1022
P1024
P1025
P2010
P2020

(sorted alphabetically; not by release date / generation / feature set)

All this is from public information available on NXP website.

Seems that qemu has support only for some subset of MPC85?? processors.

Historically processors with e500 cores have mpc85xx family codename and
lot of software have them in mpc85xx architecture subdirectory.

Note that GCC uses -mcpu=8540 option for specifying e500v1 core and
-mcpu=8548 option for specifying e500v2 core.

So sometimes (mpc)8540 is alias for e500v1 and (mpc)8548 is alias for
e500v2.

>  target/ppc/cpu-models.c | 14 +++++++-------
>  target/ppc/cpu-models.h | 14 +++++++-------
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index 976be5e0d171..44a2710c5843 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -385,19 +385,19 @@
>      POWERPC_DEF_SVR("mpc8548e_v21", "MPC8548E v2.1",
>                      CPU_POWERPC_MPC8548E_v21, POWERPC_SVR_8548E_v21, e500v2)
>      POWERPC_DEF_SVR("mpc8555_v10", "MPC8555 v1.0",
> -                    CPU_POWERPC_MPC8555_v10,  POWERPC_SVR_8555_v10,  e500v2)
> +                    CPU_POWERPC_MPC8555_v10,  POWERPC_SVR_8555_v10,  e500v1)
>      POWERPC_DEF_SVR("mpc8555_v11", "MPC8555 v1.1",
> -                    CPU_POWERPC_MPC8555_v11,  POWERPC_SVR_8555_v11,  e500v2)
> +                    CPU_POWERPC_MPC8555_v11,  POWERPC_SVR_8555_v11,  e500v1)
>      POWERPC_DEF_SVR("mpc8555e_v10", "MPC8555E v1.0",
> -                    CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10, e500v2)
> +                    CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10, e500v1)
>      POWERPC_DEF_SVR("mpc8555e_v11", "MPC8555E v1.1",
> -                    CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11, e500v2)
> +                    CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11, e500v1)
>      POWERPC_DEF_SVR("mpc8560_v10", "MPC8560 v1.0",
> -                    CPU_POWERPC_MPC8560_v10,  POWERPC_SVR_8560_v10,  e500v2)
> +                    CPU_POWERPC_MPC8560_v10,  POWERPC_SVR_8560_v10,  e500v1)
>      POWERPC_DEF_SVR("mpc8560_v20", "MPC8560 v2.0",
> -                    CPU_POWERPC_MPC8560_v20,  POWERPC_SVR_8560_v20,  e500v2)
> +                    CPU_POWERPC_MPC8560_v20,  POWERPC_SVR_8560_v20,  e500v1)
>      POWERPC_DEF_SVR("mpc8560_v21", "MPC8560 v2.1",
> -                    CPU_POWERPC_MPC8560_v21,  POWERPC_SVR_8560_v21,  e500v2)
> +                    CPU_POWERPC_MPC8560_v21,  POWERPC_SVR_8560_v21,  e500v1)
>      POWERPC_DEF_SVR("mpc8567", "MPC8567",
>                      CPU_POWERPC_MPC8567,      POWERPC_SVR_8567,      e500v2)
>      POWERPC_DEF_SVR("mpc8567e", "MPC8567E",
> diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
> index 76775a74a9b6..1326493a9a05 100644
> --- a/target/ppc/cpu-models.h
> +++ b/target/ppc/cpu-models.h
> @@ -184,13 +184,13 @@ enum {
>  #define CPU_POWERPC_MPC8548E_v11     CPU_POWERPC_e500v2_v11
>  #define CPU_POWERPC_MPC8548E_v20     CPU_POWERPC_e500v2_v20
>  #define CPU_POWERPC_MPC8548E_v21     CPU_POWERPC_e500v2_v21
> -#define CPU_POWERPC_MPC8555_v10      CPU_POWERPC_e500v2_v10
> -#define CPU_POWERPC_MPC8555_v11      CPU_POWERPC_e500v2_v11
> -#define CPU_POWERPC_MPC8555E_v10     CPU_POWERPC_e500v2_v10
> -#define CPU_POWERPC_MPC8555E_v11     CPU_POWERPC_e500v2_v11
> -#define CPU_POWERPC_MPC8560_v10      CPU_POWERPC_e500v2_v10
> -#define CPU_POWERPC_MPC8560_v20      CPU_POWERPC_e500v2_v20
> -#define CPU_POWERPC_MPC8560_v21      CPU_POWERPC_e500v2_v21
> +#define CPU_POWERPC_MPC8555_v10      CPU_POWERPC_e500v1_v20
> +#define CPU_POWERPC_MPC8555_v11      CPU_POWERPC_e500v1_v20
> +#define CPU_POWERPC_MPC8555E_v10     CPU_POWERPC_e500v1_v20
> +#define CPU_POWERPC_MPC8555E_v11     CPU_POWERPC_e500v1_v20
> +#define CPU_POWERPC_MPC8560_v10      CPU_POWERPC_e500v1_v10
> +#define CPU_POWERPC_MPC8560_v20      CPU_POWERPC_e500v1_v20
> +#define CPU_POWERPC_MPC8560_v21      CPU_POWERPC_e500v1_v20
>  #define CPU_POWERPC_MPC8567          CPU_POWERPC_e500v2_v22
>  #define CPU_POWERPC_MPC8567E         CPU_POWERPC_e500v2_v22
>  #define CPU_POWERPC_MPC8568          CPU_POWERPC_e500v2_v22
> -- 
> 2.20.1
> 

