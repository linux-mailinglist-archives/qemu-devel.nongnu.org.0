Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27A25F41EB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:24:11 +0200 (CEST)
Received: from localhost ([::1]:40830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofg1y-0008U1-7a
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andre.przywara@arm.com>)
 id 1offlw-0002vc-BY; Tue, 04 Oct 2022 07:07:38 -0400
Received: from foss.arm.com ([217.140.110.172]:50854)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andre.przywara@arm.com>)
 id 1offlq-0004hF-KL; Tue, 04 Oct 2022 07:07:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02B1011FB;
 Tue,  4 Oct 2022 04:07:34 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5726A3F67D;
 Tue,  4 Oct 2022 04:07:26 -0700 (PDT)
Date: Tue, 4 Oct 2022 12:07:22 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jerome Forissier <jerome.forissier@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-stable@nongnu.org
Subject: Re: [PATCH] target/arm: allow setting SCR_EL3.EnTP2 when FEAT_SME
 is implemented
Message-ID: <20221004120722.65767188@donnerap.cambridge.arm.com>
In-Reply-To: <20221004072354.27037-1-jerome.forissier@linaro.org>
References: <20221004072354.27037-1-jerome.forissier@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=andre.przywara@arm.com; helo=foss.arm.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue,  4 Oct 2022 09:23:54 +0200
Jerome Forissier <jerome.forissier@linaro.org> wrote:

Hi,

> Updates write_scr() to allow setting SCR_EL3.EnTP2 when FEAT_SME is
> implemented. SCR_EL3 being a 64-bit register, valid_mask is changed
> to uint64_t and the SCR_* constants in target/arm/cpu.h are extended
> to 64-bit so that masking and bitwise not (~) behave as expected.
> 
> This enables booting Linux with Trusted Firmware-A at EL3 with
> "-M virt,secure=on -cpu max".
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>

Good catch!
So I can confirm that this fixes the issue, given a TF-A patch to actually
enable SME (and SVE).
Checked against the ARM ARM, also verified that the
defines don't accidentally changed their values.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

> ---
>  target/arm/cpu.h    | 54 ++++++++++++++++++++++-----------------------
>  target/arm/helper.c |  5 ++++-
>  2 files changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5168e3d837..d5e9949eb6 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1653,33 +1653,33 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
>  
>  #define HPFAR_NS      (1ULL << 63)
>  
> -#define SCR_NS                (1U << 0)
> -#define SCR_IRQ               (1U << 1)
> -#define SCR_FIQ               (1U << 2)
> -#define SCR_EA                (1U << 3)
> -#define SCR_FW                (1U << 4)
> -#define SCR_AW                (1U << 5)
> -#define SCR_NET               (1U << 6)
> -#define SCR_SMD               (1U << 7)
> -#define SCR_HCE               (1U << 8)
> -#define SCR_SIF               (1U << 9)
> -#define SCR_RW                (1U << 10)
> -#define SCR_ST                (1U << 11)
> -#define SCR_TWI               (1U << 12)
> -#define SCR_TWE               (1U << 13)
> -#define SCR_TLOR              (1U << 14)
> -#define SCR_TERR              (1U << 15)
> -#define SCR_APK               (1U << 16)
> -#define SCR_API               (1U << 17)
> -#define SCR_EEL2              (1U << 18)
> -#define SCR_EASE              (1U << 19)
> -#define SCR_NMEA              (1U << 20)
> -#define SCR_FIEN              (1U << 21)
> -#define SCR_ENSCXT            (1U << 25)
> -#define SCR_ATA               (1U << 26)
> -#define SCR_FGTEN             (1U << 27)
> -#define SCR_ECVEN             (1U << 28)
> -#define SCR_TWEDEN            (1U << 29)
> +#define SCR_NS                (1ULL << 0)
> +#define SCR_IRQ               (1ULL << 1)
> +#define SCR_FIQ               (1ULL << 2)
> +#define SCR_EA                (1ULL << 3)
> +#define SCR_FW                (1ULL << 4)
> +#define SCR_AW                (1ULL << 5)
> +#define SCR_NET               (1ULL << 6)
> +#define SCR_SMD               (1ULL << 7)
> +#define SCR_HCE               (1ULL << 8)
> +#define SCR_SIF               (1ULL << 9)
> +#define SCR_RW                (1ULL << 10)
> +#define SCR_ST                (1ULL << 11)
> +#define SCR_TWI               (1ULL << 12)
> +#define SCR_TWE               (1ULL << 13)
> +#define SCR_TLOR              (1ULL << 14)
> +#define SCR_TERR              (1ULL << 15)
> +#define SCR_APK               (1ULL << 16)
> +#define SCR_API               (1ULL << 17)
> +#define SCR_EEL2              (1ULL << 18)
> +#define SCR_EASE              (1ULL << 19)
> +#define SCR_NMEA              (1ULL << 20)
> +#define SCR_FIEN              (1ULL << 21)
> +#define SCR_ENSCXT            (1ULL << 25)
> +#define SCR_ATA               (1ULL << 26)
> +#define SCR_FGTEN             (1ULL << 27)
> +#define SCR_ECVEN             (1ULL << 28)
> +#define SCR_TWEDEN            (1ULL << 29)
>  #define SCR_TWEDEL            MAKE_64BIT_MASK(30, 4)
>  #define SCR_TME               (1ULL << 34)
>  #define SCR_AMVOFFEN          (1ULL << 35)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d7bc467a2a..5cde8a0425 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1669,7 +1669,7 @@ static void vbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  {
>      /* Begin with base v8.0 state.  */
> -    uint32_t valid_mask = 0x3fff;
> +    uint64_t valid_mask = 0x3fff;
>      ARMCPU *cpu = env_archcpu(env);
>  
>      /*
> @@ -1706,6 +1706,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>          if (cpu_isar_feature(aa64_doublefault, cpu)) {
>              valid_mask |= SCR_EASE | SCR_NMEA;
>          }
> +        if (cpu_isar_feature(aa64_sme, cpu)) {
> +            valid_mask |= SCR_ENTP2;
> +        }
>      } else {
>          valid_mask &= ~(SCR_RW | SCR_ST);
>          if (cpu_isar_feature(aa32_ras, cpu)) {


