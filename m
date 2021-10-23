Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026C438524
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:03:59 +0200 (CEST)
Received: from localhost ([::1]:57752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNFG-0007xQ-6C
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meND4-0006yM-MG
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:01:42 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:50820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meND2-0005Me-9n
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:01:42 -0400
Received: by mail-pj1-x102b.google.com with SMTP id gn3so5305473pjb.0
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l0hHHkfShpNYkgW8bvtwqR/X0dHysdHEBH5Thz2ngB4=;
 b=bprdY1l71JRSeYlGvFrdyd7om7q8yB0yaSGY6TM83n3OfCnkqjNImZMHBBcfohaNff
 Yn2HVbDT4Tw1CfkT9z+FH4wP3ew7YTVMpgDYmyFQmSKbvDxHAQ9dbWwwn2zwwkRWnsgU
 0OPhRPxEyzeo5OrdckCjGKMbfMPW3Jr0viijVqPdncCWcJaN79q1N3EFKyBSbZripSV7
 u7Ygowsvymye5BiXCNzs0FKdkteGNSPlhiC5PuVHDTmVMV9N9LQI3rEMn/AHmcXZxZbD
 boWhQgs9Lo7AXzPD6CBQjJXIhaZQsmNtCG3A0D1UwjhPT6UjGMe63J74wEFCAsEhMJsI
 mbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l0hHHkfShpNYkgW8bvtwqR/X0dHysdHEBH5Thz2ngB4=;
 b=7anUnS7Iz3JGv+m3qqVZN4Ulg81acc8zCh3NfHoa6mt1xspkDfmiwveMkbG5gPh+kj
 XzTo/Sj+NMY7GPHIPk1xML4M9ExWBc1kMjmcyIonxn9RcsItmdJ+NMPcebSKxClRPq1L
 nV+ro45MH9/eBpbKXoTwOcucXVcaR5uf20eiX7EUCMF3GEcFquxImOUndxm31dlvfbas
 fqwqJMCMD1kB4qQBpzD5tIlkmB/0VZLsvgi4R8RZrV7Ig9NHBD2s8l8VmBnQoseZ5wKL
 kvC+qfywaBkL0dfCAUBDvyge695mLavp7YKplDD+SL9Sphlan2pcx3xXDGdoG5bD1R/V
 Utvw==
X-Gm-Message-State: AOAM531RLwCblz86OeFG14xkhnHGm0KNrAVS6HqzcucrC5sRsHCAUeY0
 KXW5tVxfnefxMOpSjx+zF2I8+A==
X-Google-Smtp-Source: ABdhPJxTD86NUZpptxYQ+SORNcdXezhfP2pZaoPow+0LdRGeJmlnvHSnWSIzRMk4OYx5y2/bIlmNkQ==
X-Received: by 2002:a17:90b:4f90:: with SMTP id
 qe16mr9315801pjb.137.1635019298236; 
 Sat, 23 Oct 2021 13:01:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c4sm15945905pfv.144.2021.10.23.13.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 13:01:37 -0700 (PDT)
Subject: Re: [PATCH 19/33] target/ppc: Implement Vector Extract Double to VSR
 using GPR index insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-20-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c417d52e-6401-fa59-3dae-e51dfe523636@linaro.org>
Date: Sat, 23 Oct 2021 13:01:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-20-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vextdubvlx: Vector Extract Double Unsigned Byte to VSR using
>              GPR-specified Left-Index
> vextduhvlx: Vector Extract Double Unsigned Halfword to VSR using
>              GPR-specified Left-Index
> vextduwvlx: Vector Extract Double Unsigned Word to VSR using
>              GPR-specified Left-Index
> vextddvlx: Vector Extract Double Unsigned Doubleword to VSR using
>             GPR-specified Left-Index
> vextdubvrx: Vector Extract Double Unsigned Byte to VSR using
>              GPR-specified Right-Index
> vextduhvrx: Vector Extract Double Unsigned Halfword to VSR using
>              GPR-specified Right-Index
> vextduwvrx: Vector Extract Double Unsigned Word to VSR using
>              GPR-specified Right-Index
> vextddvrx: Vector Extract Double Unsigned Doubleword to VSR using
>             GPR-specified Right-Index
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  4 +++
>   target/ppc/insn32.decode            | 12 +++++++++
>   target/ppc/int_helper.c             | 41 ++++++++++++++++++++++++++++-
>   target/ppc/translate/vmx-impl.c.inc | 37 ++++++++++++++++++++++++++
>   4 files changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 53c65ca1c7..ac8ab7e436 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -336,6 +336,10 @@ DEF_HELPER_2(vextuwlx, tl, tl, avr)
>   DEF_HELPER_2(vextubrx, tl, tl, avr)
>   DEF_HELPER_2(vextuhrx, tl, tl, avr)
>   DEF_HELPER_2(vextuwrx, tl, tl, avr)
> +DEF_HELPER_5(VEXTDUBVLX, void, env, avr, avr, avr, tl)
> +DEF_HELPER_5(VEXTDUHVLX, void, env, avr, avr, avr, tl)
> +DEF_HELPER_5(VEXTDUWVLX, void, env, avr, avr, avr, tl)
> +DEF_HELPER_5(VEXTDDVLX, void, env, avr, avr, avr, tl)
>   
>   DEF_HELPER_2(vsbox, void, avr, avr)
>   DEF_HELPER_3(vcipher, void, avr, avr, avr)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 2eb7fb4e92..e438177b32 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -38,6 +38,9 @@
>   %dx_d           6:s10 16:5 0:1
>   @DX             ...... rt:5  ..... .......... ..... .   &DX d=%dx_d
>   
> +&VA             vrt vra vrb rc
> +@VA             ...... vrt:5 vra:5 vrb:5 rc:5 ......    &VA
> +
>   &VN             vrt vra vrb sh
>   @VN             ...... vrt:5 vra:5 vrb:5 .. sh:3 ......         &VN
>   
> @@ -347,6 +350,15 @@ VPEXTD          000100 ..... ..... ..... 10110001101    @VX
>   
>   ## Vector Permute and Formatting Instruction
>   
> +VEXTDUBVLX      000100 ..... ..... ..... ..... 011000   @VA
> +VEXTDUBVRX      000100 ..... ..... ..... ..... 011001   @VA
> +VEXTDUHVLX      000100 ..... ..... ..... ..... 011010   @VA
> +VEXTDUHVRX      000100 ..... ..... ..... ..... 011011   @VA
> +VEXTDUWVLX      000100 ..... ..... ..... ..... 011100   @VA
> +VEXTDUWVRX      000100 ..... ..... ..... ..... 011101   @VA
> +VEXTDDVLX       000100 ..... ..... ..... ..... 011110   @VA
> +VEXTDDVRX       000100 ..... ..... ..... ..... 011111   @VA
> +
>   VINSERTB        000100 ..... - .... ..... 01100001101   @VX_uim4
>   VINSERTH        000100 ..... - .... ..... 01101001101   @VX_uim4
>   VINSERTW        000100 ..... - .... ..... 01110001101   @VX_uim4
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 5a925a564d..1577ea8788 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -1673,8 +1673,47 @@ VINSX(B, uint8_t)
>   VINSX(H, uint16_t)
>   VINSX(W, uint32_t)
>   VINSX(D, uint64_t)
> -#undef ELEM_ADDR
>   #undef VINSX
> +#define VEXTDVLX(NAME, TYPE) \
> +void glue(glue(helper_VEXTD, NAME), VLX)(CPUPPCState *env, ppc_avr_t *t,       \
> +                                         ppc_avr_t *a, ppc_avr_t *b,           \
> +                                         target_ulong index)                   \
> +{                                                                              \
> +    const int array_size = ARRAY_SIZE(t->u8), elem_size = sizeof(TYPE);        \
> +    const target_long idx = index;                                             \
> +                                                                               \
> +    if (idx < 0) {                                                             \
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VEXTD" #NAME "VRX at"\
> +            " 0x" TARGET_FMT_lx ", RC = " TARGET_FMT_ld " > %d\n", env->nip,   \
> +            32 - elem_size - idx, 32 - elem_size);                             \
> +    } else if (idx + elem_size <= array_size) {                                \
> +        t->VsrD(0) = *(TYPE *)ELEM_ADDR(a, idx, elem_size);                    \

You need an unaligned load here.

> +        t->VsrD(1) = 0;                                                        \
> +    } else if (idx < array_size) {                                             \
> +        ppc_avr_t tmp = { .u64 = { 0, 0 } };                                   \
> +        const int len_a = array_size - idx, len_b = elem_size - len_a;         \
> +                                                                               \
> +        memmove(ELEM_ADDR(&tmp, array_size / 2 - elem_size, len_a),            \
> +                ELEM_ADDR(a, idx, len_a), len_a);                              \
> +        memmove(ELEM_ADDR(&tmp, array_size / 2 - len_b, len_b),                \
> +                ELEM_ADDR(b, 0, len_b), len_b);                                \

You know tmp does not overlap the source; memcpy will do.

> +                                                                               \
> +        *t = tmp;                                                              \
> +    } else if (idx + elem_size <= 2 * array_size) {                            \
> +        t->VsrD(0) = *(TYPE *)ELEM_ADDR(b, idx - array_size, elem_size);       \

Another unaligned load.

Or... we could set this up as

     ppc_avr_t tmp[2] = { *a, *b };
     memset(t, 0, sizeof(*t));
     if (idx >= 0 && idx + elem_size <= sizeof(tmp)) {
         memcpy(t + 8 - elem_size, (char *)&tmp + idx, elem_size);
     }

... with some sort of host-endian adjustment which I'm too lazy to work out at the moment.


r~

