Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15810614448
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 06:32:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opjsS-0004es-23; Tue, 01 Nov 2022 01:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1opjsD-0004YZ-Qg
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 01:31:45 -0400
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1opjsC-0006v2-7e
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 01:31:41 -0400
Received: from [10.199.1.165] (unknown [89.252.109.106])
 by mail.ispras.ru (Postfix) with ESMTPSA id 5BB06419E9D8;
 Tue,  1 Nov 2022 05:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 5BB06419E9D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1667280698;
 bh=BejDUOjltdrt59nie1gDhQYm6SMIjKxReDrAhWKNtoA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a17Rp5KGgAjvJq7yr/EJqHmT0IXKuvX5AblyWTfpgqp4ich/f+F4+TPCcaD8vxbDu
 vjBU6eltLg+5V+d+yrQ2LzWwgOrQFzIEVEBPzBT2vlTHTMZIxeb2m7C3ftq46e3uCl
 QD76mKFIDGR7XIrSpdY3or6eErWBrA6KAL/Wq4TI=
Message-ID: <5cc6d587-a441-de95-851e-72fa1399970b@ispras.ru>
Date: Tue, 1 Nov 2022 08:31:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] target/mips: Disable DSP ASE for Octeon68XX
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Richard Henderson <richard.henderson@linaro.org>
References: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
 <20221031132531.18122-4-jiaxun.yang@flygoat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <20221031132531.18122-4-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 31.10.2022 16:25, Jiaxun Yang wrote:
> I don't have access to Octeon68XX hardware but accroading to
> my investigation Octeon never had DSP ASE support.
> 
> As per "Cavium Networks OCTEON Plus CN50XX Hardware Reference
> Manual" CP0C3_DSPP is reserved bit and read as 0. Also I do have
> access to a Ubiquiti Edgerouter 4 which has Octeon CN7130 processor
> and I can confirm CP0C3_DSPP is read as 0 on that processor.
> 
> Further more, in linux kernel:
> arch/mips/include/asm/mach-cavium-octeon/cpu-feature-overrides.h
> cpu_has_dsp is overridden as 0.
> 
> So I believe we shouldn't emulate DSP in QEMU as well.

That's true. But there is one exception: LBX/LWX/LDX instruction.
These are grouped into DSP extension in QEMU, but Octeon supports them.
I've sent a patch for enabling these instructions.

Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/cpu-defs.c.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
> index 7f53c94ec8..480e60aeec 100644
> --- a/target/mips/cpu-defs.c.inc
> +++ b/target/mips/cpu-defs.c.inc
> @@ -934,7 +934,7 @@ const mips_def_t mips_defs[] =
>                          (1 << CP0C1_DS) | (4 << CP0C1_DL) | (1 << CP0C1_DA) |
>                          (1 << CP0C1_PC) | (1 << CP0C1_WR) | (1 << CP0C1_EP),
>           .CP0_Config2 = MIPS_CONFIG2,
> -        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_LPA) | (1 << CP0C3_DSPP) ,
> +        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_LPA),
>           .CP0_Config4 = MIPS_CONFIG4 | (1U << CP0C4_M) |
>                          (0x3c << CP0C4_KScrExist) | (1U << CP0C4_MMUExtDef) |
>                          (3U << CP0C4_MMUSizeExt),
> @@ -946,7 +946,7 @@ const mips_def_t mips_defs[] =
>           .CP0_Status_rw_bitmask = 0x12F8FFFF,
>           .SEGBITS = 42,
>           .PABITS = 49,
> -        .insn_flags = CPU_MIPS64R2 | INSN_OCTEON | ASE_DSP,
> +        .insn_flags = CPU_MIPS64R2 | INSN_OCTEON,
>           .mmu_type = MMU_TYPE_R4000,
>       },
>   


