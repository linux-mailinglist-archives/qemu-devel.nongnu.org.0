Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9129F55BB23
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:31:12 +0200 (CEST)
Received: from localhost ([::1]:59070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rdn-0005WK-KO
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o5rZ1-0001dD-1j
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:26:15 -0400
Received: from [200.168.210.66] (port=12140 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>) id 1o5rYy-0003ac-Cm
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:26:14 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 13:25:13 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 686E18001D4;
 Mon, 27 Jun 2022 13:25:13 -0300 (-03)
Message-ID: <3d58770e-d05c-3bac-f71b-39a3ce14cef0@eldorado.org.br>
Date: Mon, 27 Jun 2022 13:25:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/7] target/ppc: use int128.h methods in vaddecuq and
 vaddeuqm
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org
References: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
 <20220606150037.338931-4-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <20220606150037.338931-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 16:25:13.0828 (UTC)
 FILETIME=[7AB05240:01D88A42]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 06/06/2022 12:00, Matheus Ferst wrote:
> And also move the insns to decodetree and remove the now unused
> avr_qw_addc method.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  4 +--
>   target/ppc/insn32.decode            |  3 ++
>   target/ppc/int_helper.c             | 53 +++++------------------------
>   target/ppc/translate/vmx-impl.c.inc |  7 ++--
>   target/ppc/translate/vmx-ops.c.inc  |  1 -
>   5 files changed, 17 insertions(+), 51 deletions(-)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index c6fbe4b6da..f699adbedc 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -205,8 +205,8 @@ DEF_HELPER_FLAGS_5(vsububs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
>   DEF_HELPER_FLAGS_5(vsubuhs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
>   DEF_HELPER_FLAGS_5(vsubuws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
>   DEF_HELPER_FLAGS_3(VADDUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
> -DEF_HELPER_FLAGS_4(vaddecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
> -DEF_HELPER_FLAGS_4(vaddeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
> +DEF_HELPER_FLAGS_4(VADDECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
> +DEF_HELPER_FLAGS_4(VADDEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
>   DEF_HELPER_FLAGS_3(vaddcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
>   DEF_HELPER_FLAGS_3(vsubuqm, TCG_CALL_NO_RWG, void, avr, avr, avr)
>   DEF_HELPER_FLAGS_4(vsubecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index d6bfc2c768..139aa3caeb 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -552,6 +552,9 @@ VRLQNM          000100 ..... ..... ..... 00101000101    @VX
> 
>   VADDUQM         000100 ..... ..... ..... 00100000000    @VX
> 
> +VADDEUQM        000100 ..... ..... ..... ..... 111100   @VA
> +VADDECUQ        000100 ..... ..... ..... ..... 111101   @VA
> +
>   VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
>   VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
>   VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index c32b252639..c5d820f4b1 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -2212,16 +2212,6 @@ static void avr_qw_add(ppc_avr_t *t, ppc_avr_t a, ppc_avr_t b)
>                        (~a.VsrD(1) < b.VsrD(1));
>   }
> 
> -static int avr_qw_addc(ppc_avr_t *t, ppc_avr_t a, ppc_avr_t b)
> -{
> -    ppc_avr_t not_a;
> -    t->VsrD(1) = a.VsrD(1) + b.VsrD(1);
> -    t->VsrD(0) = a.VsrD(0) + b.VsrD(0) +
> -                     (~a.VsrD(1) < b.VsrD(1));
> -    avr_qw_not(&not_a, a);
> -    return avr_qw_cmpu(not_a, b) < 0;
> -}
> -
>   #endif
> 
>   void helper_VADDUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> @@ -2229,23 +2219,10 @@ void helper_VADDUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>       r->s128 = int128_add(a->s128, b->s128);
>   }
> 
> -void helper_vaddeuqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
> +void helper_VADDEUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
>   {
> -#ifdef CONFIG_INT128
> -    r->u128 = a->u128 + b->u128 + (c->u128 & 1);
> -#else
> -
> -    if (c->VsrD(1) & 1) {
> -        ppc_avr_t tmp;
> -
> -        tmp.VsrD(0) = 0;
> -        tmp.VsrD(1) = c->VsrD(1) & 1;
> -        avr_qw_add(&tmp, *a, tmp);
> -        avr_qw_add(r, tmp, *b);
> -    } else {
> -        avr_qw_add(r, *a, *b);
> -    }
> -#endif
> +    r->s128 = int128_add(int128_add(a->s128, b->s128),
> +                         int128_make64(int128_getlo(c->s128) & 1));
>   }
> 
>   void helper_vaddcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> @@ -2262,30 +2239,18 @@ void helper_vaddcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   #endif
>   }
> 
> -void helper_vaddecuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
> +void helper_VADDECUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
>   {
> -#ifdef CONFIG_INT128
> -    int carry_out = (~a->u128 < b->u128);
> -    if (!carry_out && (c->u128 & 1)) {
> -        carry_out = ((a->u128 + b->u128 + 1) == 0) &&
> -                    ((a->u128 != 0) || (b->u128 != 0));
> -    }
> -    r->u128 = carry_out;
> -#else
> -
> -    int carry_in = c->VsrD(1) & 1;
> -    int carry_out = 0;
> -    ppc_avr_t tmp;
> -
> -    carry_out = avr_qw_addc(&tmp, *a, *b);
> +    bool carry_out = int128_ult(int128_not(a->s128), b->s128),
> +         carry_in = int128_getlo(c->s128) & 1;
> 
>       if (!carry_out && carry_in) {
> -        ppc_avr_t one = QW_ONE;
> -        carry_out = avr_qw_addc(&tmp, tmp, one);
> +        carry_out = (int128_nz(a->s128) || int128_nz(b->s128)) &&
> +                    int128_eq(int128_add(a->s128, b->s128), int128_makes64(-1));
>       }
> +
>       r->VsrD(0) = 0;
>       r->VsrD(1) = carry_out;
> -#endif
>   }
> 
>   void helper_vsubuqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 3fb48404d9..4ec6b841b3 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1235,10 +1235,6 @@ GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
>   GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
>   GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
>   GEN_VXFORM(vaddcuq, 0, 5);
> -GEN_VXFORM3(vaddeuqm, 30, 0);
> -GEN_VXFORM3(vaddecuq, 30, 0);
> -GEN_VXFORM_DUAL(vaddeuqm, PPC_NONE, PPC2_ALTIVEC_207, \
> -            vaddecuq, PPC_NONE, PPC2_ALTIVEC_207)
>   GEN_VXFORM(vsubuqm, 0, 20);
>   GEN_VXFORM(vsubcuq, 0, 21);
>   GEN_VXFORM3(vsubeuqm, 31, 0);
> @@ -2571,6 +2567,9 @@ static bool do_va_helper(DisasContext *ctx, arg_VA *a,
>       return true;
>   }
> 
> +TRANS_FLAGS2(ALTIVEC_207, VADDECUQ, do_va_helper, gen_helper_VADDECUQ)
> +TRANS_FLAGS2(ALTIVEC_207, VADDEUQM, do_va_helper, gen_helper_VADDEUQM)
> +
>   TRANS_FLAGS(ALTIVEC, VPERM, do_va_helper, gen_helper_VPERM)
>   TRANS_FLAGS2(ISA300, VPERMR, do_va_helper, gen_helper_VPERMR)
> 
> diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
> index 065b0ba414..f8a512f920 100644
> --- a/target/ppc/translate/vmx-ops.c.inc
> +++ b/target/ppc/translate/vmx-ops.c.inc
> @@ -127,7 +127,6 @@ GEN_VXFORM_DUAL(vsubsbs, bcdtrunc, 0, 28, PPC_ALTIVEC, PPC2_ISA300),
>   GEN_VXFORM(vsubshs, 0, 29),
>   GEN_VXFORM_DUAL(vsubsws, xpnd04_2, 0, 30, PPC_ALTIVEC, PPC_NONE),
>   GEN_VXFORM_207(vaddcuq, 0, 5),
> -GEN_VXFORM_DUAL(vaddeuqm, vaddecuq, 30, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
>   GEN_VXFORM_DUAL(vsubuqm, bcdtrunc, 0, 20, PPC2_ALTIVEC_207, PPC2_ISA300),
>   GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300),
>   GEN_VXFORM_DUAL(vsubeuqm, vsubecuq, 31, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
> --
> 2.25.1
> 
> 

Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>

-- 
Víctor Cora Colombo
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

