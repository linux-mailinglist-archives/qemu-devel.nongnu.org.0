Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B933693A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:50:45 +0100 (CET)
Received: from localhost ([::1]:34566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9XI-0000Qd-7i
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lK9Pi-0002Hy-0k
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:42:54 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:65193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lK9Pc-0001N5-E7
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:42:52 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 822497456E3;
 Thu, 11 Mar 2021 01:42:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 482667456B8; Thu, 11 Mar 2021 01:42:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 46FAA7456B7;
 Thu, 11 Mar 2021 01:42:43 +0100 (CET)
Date: Thu, 11 Mar 2021 01:42:43 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 16/26] tcg: Move MAX_CODE_GEN_BUFFER_SIZE to tcg-target.h
In-Reply-To: <20210311002156.253711-17-richard.henderson@linaro.org>
Message-ID: <c9ff5811-353-b226-d338-2df1a9fed4b@eik.bme.hu>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-17-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: r.bolshakov@yadro.com, qemu-devel@nongnu.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Mar 2021, Richard Henderson wrote:
> Remove the ifdef ladder and move each define into the
> appropriate header file.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> tcg/aarch64/tcg-target.h |  1 +
> tcg/arm/tcg-target.h     |  1 +
> tcg/i386/tcg-target.h    |  2 ++
> tcg/mips/tcg-target.h    |  6 ++++++
> tcg/ppc/tcg-target.h     |  2 ++
> tcg/riscv/tcg-target.h   |  1 +
> tcg/s390/tcg-target.h    |  3 +++
> tcg/sparc/tcg-target.h   |  1 +
> tcg/tci/tcg-target.h     |  1 +
> tcg/region.c             | 32 ++++++--------------------------
> 10 files changed, 24 insertions(+), 26 deletions(-)
>
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index 5ec30dba25..ef55f7c185 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -15,6 +15,7 @@
>
> #define TCG_TARGET_INSN_UNIT_SIZE  4
> #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
> +#define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
> #undef TCG_TARGET_STACK_GROWSUP
>
> typedef enum {
> diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
> index 8d1fee6327..b9a85d0f83 100644
> --- a/tcg/arm/tcg-target.h
> +++ b/tcg/arm/tcg-target.h
> @@ -60,6 +60,7 @@ extern int arm_arch;
> #undef TCG_TARGET_STACK_GROWSUP
> #define TCG_TARGET_INSN_UNIT_SIZE 4
> #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
> +#define MAX_CODE_GEN_BUFFER_SIZE  UINT32_MAX
>
> typedef enum {
>     TCG_REG_R0 = 0,
> diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
> index b693d3692d..ac10066c3e 100644
> --- a/tcg/i386/tcg-target.h
> +++ b/tcg/i386/tcg-target.h
> @@ -31,9 +31,11 @@
> #ifdef __x86_64__
> # define TCG_TARGET_REG_BITS  64
> # define TCG_TARGET_NB_REGS   32
> +# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
> #else
> # define TCG_TARGET_REG_BITS  32
> # define TCG_TARGET_NB_REGS   24
> +# define MAX_CODE_GEN_BUFFER_SIZE  UINT32_MAX
> #endif
>
> typedef enum {
> diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
> index c2c32fb38f..e81e824cab 100644
> --- a/tcg/mips/tcg-target.h
> +++ b/tcg/mips/tcg-target.h
> @@ -39,6 +39,12 @@
> #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
> #define TCG_TARGET_NB_REGS 32
>
> +/*
> + * We have a 256MB branch region, but leave room to make sure the
> + * main executable is also within that region.
> + */
> +#define MAX_CODE_GEN_BUFFER_SIZE  (128 * MiB)
> +
> typedef enum {
>     TCG_REG_ZERO = 0,
>     TCG_REG_AT,
> diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
> index d1339afc66..c13ed5640a 100644
> --- a/tcg/ppc/tcg-target.h
> +++ b/tcg/ppc/tcg-target.h
> @@ -27,8 +27,10 @@
>
> #ifdef _ARCH_PPC64
> # define TCG_TARGET_REG_BITS  64
> +# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
> #else
> # define TCG_TARGET_REG_BITS  32
> +# define MAX_CODE_GEN_BUFFER_SIZE  (32 * MiB)
> #endif
>
> #define TCG_TARGET_NB_REGS 64
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 727c8df418..87ea94666b 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -34,6 +34,7 @@
> #define TCG_TARGET_INSN_UNIT_SIZE 4
> #define TCG_TARGET_TLB_DISPLACEMENT_BITS 20
> #define TCG_TARGET_NB_REGS 32
> +#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>
> typedef enum {
>     TCG_REG_ZERO,
> diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
> index 641464eea4..b04b72b7eb 100644
> --- a/tcg/s390/tcg-target.h
> +++ b/tcg/s390/tcg-target.h
> @@ -28,6 +28,9 @@
> #define TCG_TARGET_INSN_UNIT_SIZE 2
> #define TCG_TARGET_TLB_DISPLACEMENT_BITS 19
>
> +/* We have a +- 4GB range on the branches; leave some slop.  */
> +#define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
> +
> typedef enum TCGReg {
>     TCG_REG_R0 = 0,
>     TCG_REG_R1,
> diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
> index f66f5d07dc..86bb9a2d39 100644
> --- a/tcg/sparc/tcg-target.h
> +++ b/tcg/sparc/tcg-target.h
> @@ -30,6 +30,7 @@
> #define TCG_TARGET_INSN_UNIT_SIZE 4
> #define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
> #define TCG_TARGET_NB_REGS 32
> +#define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
>
> typedef enum {
>     TCG_REG_G0 = 0,
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index 9c0021a26f..03cf527cb4 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -43,6 +43,7 @@
> #define TCG_TARGET_INTERPRETER 1
> #define TCG_TARGET_INSN_UNIT_SIZE 1
> #define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
> +#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>
> #if UINTPTR_MAX == UINT32_MAX
> # define TCG_TARGET_REG_BITS 32
> diff --git a/tcg/region.c b/tcg/region.c
> index e3fbf6a7e7..8fba0724e5 100644
> --- a/tcg/region.c
> +++ b/tcg/region.c
> @@ -398,34 +398,14 @@ static size_t tcg_n_regions(unsigned max_cpus)
> #endif
> }
>
> -/* Minimum size of the code gen buffer.  This number is randomly chosen,
> -   but not so small that we can't have a fair number of TB's live.  */
> +/*
> + * Minimum size of the code gen buffer.  This number is randomly chosen,
> + * but not so small that we can't have a fair number of TB's live.
> + *
> + * Maximum size is defined in tcg-target.h.
> + */
> #define MIN_CODE_GEN_BUFFER_SIZE     (1 * MiB)
>
> -/* Maximum size of the code gen buffer we'd like to use.  Unless otherwise
> -   indicated, this is constrained by the range of direct branches on the
> -   host cpu, as used by the TCG implementation of goto_tb.  */

This comment about constraints seems to have been lost. Should it be 
preserved above?

Regards,
BALATON Zoltan

> -#if defined(__x86_64__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
> -#elif defined(__sparc__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
> -#elif defined(__powerpc64__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
> -#elif defined(__powerpc__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (32 * MiB)
> -#elif defined(__aarch64__)
> -# define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
> -#elif defined(__s390x__)
> -  /* We have a +- 4GB range on the branches; leave some slop.  */
> -# define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
> -#elif defined(__mips__)
> -  /* We have a 256MB branch region, but leave room to make sure the
> -     main executable is also within that region.  */
> -# define MAX_CODE_GEN_BUFFER_SIZE  (128 * MiB)
> -#else
> -# define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
> -#endif
> -
> #if TCG_TARGET_REG_BITS == 32
> #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
> #ifdef CONFIG_USER_ONLY
>

