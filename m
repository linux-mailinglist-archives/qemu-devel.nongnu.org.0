Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7726EF9CD
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:06:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prjXE-0000Jt-Fr; Wed, 26 Apr 2023 14:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1prjXB-0000JR-P8
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:06:29 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1prjX9-0008C2-GD
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0S2GCoWBtCXTQTMqcGt5IzLNJ2q8Ul/qbMPapbOnTYI=; b=ZEwRO2jo6W/eVjldKktlY1Q1Pb
 jXZdZEiGLWdaq1eujjEWPPXXqGoqkAh16REEUBxnrup/BDPiq48H3Pp6krHXrzVO8N2vzSK+EjAzX
 Bnf+ahJS44P7f1owd8kIn/eTiMXCJVQXMhRzO5q91DZ0bEJe/GKCprFwDbtkOXRX8aT0=;
Message-ID: <31939260-4679-f582-f46b-ff79673b085a@rev.ng>
Date: Wed, 26 Apr 2023 20:06:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/9] Hexagon (target/hexagon) Add support for
 v68/v69/v71/v73
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230426023018.1742266-1-tsimpson@quicinc.com>
 <20230426023018.1742266-2-tsimpson@quicinc.com>
Organization: rev.ng
In-Reply-To: <20230426023018.1742266-2-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/26/23 04:30, Taylor Simpson wrote:
> Add support for the ELF flags
> Move target/hexagon/cpu.[ch] to be v73
> Change the compiler flag used by "make check-tcg"
>
> The decbin instruction is removed in Hexagon v73, so check the
> version before trying to compile the instruction.
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   configure                         |  2 +-
>   linux-user/hexagon/target_elf.h   | 13 +++++++++----
>   target/hexagon/cpu.h              |  4 ++++
>   target/hexagon/cpu.c              | 20 ++++++++++++++++++++
>   tests/tcg/hexagon/misc.c          | 12 ++++++++++++
>   tests/tcg/hexagon/Makefile.target |  3 +++
>   6 files changed, 49 insertions(+), 5 deletions(-)
>
> diff --git a/configure b/configure
> index 77c03315f8..01fa77f6c7 100755
> --- a/configure
> +++ b/configure
> @@ -1857,7 +1857,7 @@ fi
>   : ${cross_cc_armeb="$cross_cc_arm"}
>   : ${cross_cc_cflags_armeb="-mbig-endian"}
>   : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
> -: ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
> +: ${cross_cc_cflags_hexagon="-mv73 -O2 -static"}
>   : ${cross_cc_cflags_i386="-m32"}
>   : ${cross_cc_cflags_ppc="-m32 -mbig-endian"}
>   : ${cross_cc_cflags_ppc64="-m64 -mbig-endian"}
> diff --git a/linux-user/hexagon/target_elf.h b/linux-user/hexagon/target_elf.h
> index b4e9f40527..a0271a0a2a 100644
> --- a/linux-user/hexagon/target_elf.h
> +++ b/linux-user/hexagon/target_elf.h
> @@ -1,5 +1,5 @@
>   /*
> - *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *  Copyright(c) 2019-2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
>    *
>    *  This program is free software; you can redistribute it and/or modify
>    *  it under the terms of the GNU General Public License as published by
> @@ -20,7 +20,7 @@
>   
>   static inline const char *cpu_get_model(uint32_t eflags)
>   {
> -    /* For now, treat anything newer than v5 as a v67 */
> +    /* For now, treat anything newer than v5 as a v73 */
>       /* FIXME - Disable instructions that are newer than the specified arch */
>       if (eflags == 0x04 ||    /* v5  */
>           eflags == 0x05 ||    /* v55 */
> @@ -30,9 +30,14 @@ static inline const char *cpu_get_model(uint32_t eflags)
>           eflags == 0x65 ||    /* v65 */
>           eflags == 0x66 ||    /* v66 */
>           eflags == 0x67 ||    /* v67 */
> -        eflags == 0x8067     /* v67t */
> +        eflags == 0x8067 ||  /* v67t */
> +        eflags == 0x68 ||    /* v68 */
> +        eflags == 0x69 ||    /* v69 */
> +        eflags == 0x71 ||    /* v71 */
> +        eflags == 0x8071 ||  /* v71t */
> +        eflags == 0x73       /* v73 */
>          ) {
> -        return "v67";
> +        return "v73";
>       }
>       return "unknown";
>   }
> diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
> index 81b663ecfb..4d8981d862 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -43,6 +43,10 @@
>   #define CPU_RESOLVING_TYPE TYPE_HEXAGON_CPU
>   
>   #define TYPE_HEXAGON_CPU_V67 HEXAGON_CPU_TYPE_NAME("v67")
> +#define TYPE_HEXAGON_CPU_V68 HEXAGON_CPU_TYPE_NAME("v68")
> +#define TYPE_HEXAGON_CPU_V69 HEXAGON_CPU_TYPE_NAME("v69")
> +#define TYPE_HEXAGON_CPU_V71 HEXAGON_CPU_TYPE_NAME("v71")
> +#define TYPE_HEXAGON_CPU_V73 HEXAGON_CPU_TYPE_NAME("v73")
>   
>   #define MMU_USER_IDX 0
>   
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index ab40cfc283..8699db8c24 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -29,6 +29,22 @@ static void hexagon_v67_cpu_init(Object *obj)
>   {
>   }
>   
> +static void hexagon_v68_cpu_init(Object *obj)
> +{
> +}
> +
> +static void hexagon_v69_cpu_init(Object *obj)
> +{
> +}
> +
> +static void hexagon_v71_cpu_init(Object *obj)
> +{
> +}
> +
> +static void hexagon_v73_cpu_init(Object *obj)
> +{
> +}
> +
>   static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
>   {
>       ObjectClass *oc;
> @@ -382,6 +398,10 @@ static const TypeInfo hexagon_cpu_type_infos[] = {
>           .class_init = hexagon_cpu_class_init,
>       },
>       DEFINE_CPU(TYPE_HEXAGON_CPU_V67,              hexagon_v67_cpu_init),
> +    DEFINE_CPU(TYPE_HEXAGON_CPU_V68,              hexagon_v68_cpu_init),
> +    DEFINE_CPU(TYPE_HEXAGON_CPU_V69,              hexagon_v69_cpu_init),
> +    DEFINE_CPU(TYPE_HEXAGON_CPU_V71,              hexagon_v71_cpu_init),
> +    DEFINE_CPU(TYPE_HEXAGON_CPU_V73,              hexagon_v73_cpu_init),

The large spacing to hexagon_v*_cpu_init looks a bit odd.

Also, do we need to provide a *_cpu_init() stub for each version? Seems 
from qom/object.c like we should be able to
just default initialize it

Otherwise,

Reviewed-by: Anton Johansson <anjo@rev.ng>


