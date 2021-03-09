Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85668332768
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:43:04 +0100 (CET)
Received: from localhost ([::1]:41676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcdb-0000Cv-KP
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJcbo-00084E-Pp; Tue, 09 Mar 2021 08:41:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:36526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJcbk-0001Zp-E2; Tue, 09 Mar 2021 08:41:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EAD7AC17;
 Tue,  9 Mar 2021 13:41:05 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] target/arm: Restrict v8M IDAU to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-2-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <51ae2fad-f20e-27f2-2f7b-b7dca331dea3@suse.de>
Date: Tue, 9 Mar 2021 14:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210221222617.2579610-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
> IDAU is specific to M-profile. KVM only supports A-profile.
> Restrict this interface to TCG, as it is pointless (and
> confusing) on a KVM-only build.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


This one breaks the KVM tests hard though (most of them).

I will try to figure out why.

Ciao,

Claudio


> ---
>  target/arm/cpu.c     | 7 -------
>  target/arm/cpu_tcg.c | 8 ++++++++
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b8bc89e71fc..a772fd4926f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2380,12 +2380,6 @@ static const TypeInfo arm_cpu_type_info = {
>      .class_init = arm_cpu_class_init,
>  };
>  
> -static const TypeInfo idau_interface_type_info = {
> -    .name = TYPE_IDAU_INTERFACE,
> -    .parent = TYPE_INTERFACE,
> -    .class_size = sizeof(IDAUInterfaceClass),
> -};
> -
>  static void arm_cpu_register_types(void)
>  {
>      const size_t cpu_count = ARRAY_SIZE(arm_cpus);
> @@ -2399,7 +2393,6 @@ static void arm_cpu_register_types(void)
>      if (cpu_count) {
>          size_t i;
>  
> -        type_register_static(&idau_interface_type_info);
>          for (i = 0; i < cpu_count; ++i) {
>              arm_cpu_register(&arm_cpus[i]);
>          }
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index c29b434c60d..fb07a336939 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -14,6 +14,7 @@
>  #include "hw/core/tcg-cpu-ops.h"
>  #endif /* CONFIG_TCG */
>  #include "internals.h"
> +#include "target/arm/idau.h"
>  
>  /* CPU models. These are not needed for the AArch64 linux-user build. */
>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
> @@ -739,10 +740,17 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
>      { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
>  };
>  
> +static const TypeInfo idau_interface_type_info = {
> +    .name = TYPE_IDAU_INTERFACE,
> +    .parent = TYPE_INTERFACE,
> +    .class_size = sizeof(IDAUInterfaceClass),
> +};
> +
>  static void arm_tcg_cpu_register_types(void)
>  {
>      size_t i;
>  
> +    type_register_static(&idau_interface_type_info);
>      for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
>          arm_cpu_register(&arm_tcg_cpus[i]);
>      }
> 


