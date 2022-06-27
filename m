Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AA755BB25
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:36:11 +0200 (CEST)
Received: from localhost ([::1]:39804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5ric-0003Mz-Kc
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o5rZC-0001oO-Sx
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:26:26 -0400
Received: from [200.168.210.66] (port=12140 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>) id 1o5rZB-0003ac-0n
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:26:26 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 13:26:16 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id BAF868001D4;
 Mon, 27 Jun 2022 13:26:15 -0300 (-03)
Message-ID: <02bb7ed6-3385-8789-c5e9-da41e3eebacb@eldorado.org.br>
Date: Mon, 27 Jun 2022 13:26:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 6/7] target/ppc: use int128.h methods in vsubecuq and
 vsubeuqm
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org
References: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
 <20220606150037.338931-7-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <20220606150037.338931-7-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 16:26:16.0219 (UTC)
 FILETIME=[9FE06EB0:01D88A42]
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
> And also move the insns to decodetree.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  4 +--
>   target/ppc/insn32.decode            |  3 +++
>   target/ppc/int_helper.c             | 38 +++++++----------------------
>   target/ppc/translate/vmx-impl.c.inc |  7 +++---
>   target/ppc/translate/vmx-ops.c.inc  |  1 -
>   5 files changed, 17 insertions(+), 36 deletions(-)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 1c02ad85e5..04ced6ef70 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -209,8 +209,8 @@ DEF_HELPER_FLAGS_4(VADDECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
>   DEF_HELPER_FLAGS_4(VADDEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
>   DEF_HELPER_FLAGS_3(VADDCUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
>   DEF_HELPER_FLAGS_3(VSUBUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
> -DEF_HELPER_FLAGS_4(vsubecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
> -DEF_HELPER_FLAGS_4(vsubeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
> +DEF_HELPER_FLAGS_4(VSUBECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
> +DEF_HELPER_FLAGS_4(VSUBEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
>   DEF_HELPER_FLAGS_3(vsubcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
>   DEF_HELPER_FLAGS_4(vsldoi, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
>   DEF_HELPER_FLAGS_3(vextractub, TCG_CALL_NO_RWG, void, avr, avr, i32)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index a8d3a5a8a1..5e6f3b668e 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -558,6 +558,9 @@ VADDECUQ        000100 ..... ..... ..... ..... 111101   @VA
> 
>   VSUBUQM         000100 ..... ..... ..... 10100000000    @VX
> 
> +VSUBECUQ        000100 ..... ..... ..... ..... 111111   @VA
> +VSUBEUQM        000100 ..... ..... ..... ..... 111110   @VA
> +
>   VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
>   VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
>   VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 625cc92a55..c995f8de77 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -2244,20 +2244,10 @@ void helper_VSUBUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>       r->s128 = int128_sub(a->s128, b->s128);
>   }
> 
> -void helper_vsubeuqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
> +void helper_VSUBEUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
>   {
> -#ifdef CONFIG_INT128
> -    r->u128 = a->u128 + ~b->u128 + (c->u128 & 1);
> -#else
> -    ppc_avr_t tmp, sum;
> -
> -    avr_qw_not(&tmp, *b);
> -    avr_qw_add(&sum, *a, tmp);
> -
> -    tmp.VsrD(0) = 0;
> -    tmp.VsrD(1) = c->VsrD(1) & 1;
> -    avr_qw_add(r, sum, tmp);
> -#endif
> +    r->s128 = int128_add(int128_add(a->s128, int128_not(b->s128)),
> +                         int128_make64(int128_getlo(c->s128) & 1));
>   }
> 
>   void helper_vsubcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> @@ -2278,25 +2268,15 @@ void helper_vsubcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   #endif
>   }
> 
> -void helper_vsubecuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
> +void helper_VSUBECUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
>   {
> -#ifdef CONFIG_INT128
> -    r->u128 =
> -        (~a->u128 < ~b->u128) ||
> -        ((c->u128 & 1) && (a->u128 + ~b->u128 == (__uint128_t)-1));
> -#else
> -    int carry_in = c->VsrD(1) & 1;
> -    int carry_out = (avr_qw_cmpu(*a, *b) > 0);
> -    if (!carry_out && carry_in) {
> -        ppc_avr_t tmp;
> -        avr_qw_not(&tmp, *b);
> -        avr_qw_add(&tmp, *a, tmp);
> -        carry_out = ((tmp.VsrD(0) == -1ull) && (tmp.VsrD(1) == -1ull));
> -    }
> +    Int128 tmp = int128_not(b->s128);
> +    bool carry_out = int128_ult(int128_not(a->s128), tmp),
> +         carry_in = int128_getlo(c->s128) & 1;
> 
> +    r->VsrD(1) = carry_out || (carry_in && int128_eq(int128_add(a->s128, tmp),
> +                                                     int128_makes64(-1)));
>       r->VsrD(0) = 0;
> -    r->VsrD(1) = carry_out;
> -#endif
>   }
> 
>   #define BCD_PLUS_PREF_1 0xC
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 1e665534c3..671992f7d1 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1235,10 +1235,6 @@ GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
>   GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
>   GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
>   GEN_VXFORM(vsubcuq, 0, 21);
> -GEN_VXFORM3(vsubeuqm, 31, 0);
> -GEN_VXFORM3(vsubecuq, 31, 0);
> -GEN_VXFORM_DUAL(vsubeuqm, PPC_NONE, PPC2_ALTIVEC_207, \
> -            vsubecuq, PPC_NONE, PPC2_ALTIVEC_207)
>   GEN_VXFORM_TRANS(vsl, 2, 7);
>   GEN_VXFORM_TRANS(vsr, 2, 11);
>   GEN_VXFORM_ENV(vpkuhum, 7, 0);
> @@ -2568,6 +2564,9 @@ static bool do_va_helper(DisasContext *ctx, arg_VA *a,
>   TRANS_FLAGS2(ALTIVEC_207, VADDECUQ, do_va_helper, gen_helper_VADDECUQ)
>   TRANS_FLAGS2(ALTIVEC_207, VADDEUQM, do_va_helper, gen_helper_VADDEUQM)
> 
> +TRANS_FLAGS2(ALTIVEC_207, VSUBEUQM, do_va_helper, gen_helper_VSUBEUQM)
> +TRANS_FLAGS2(ALTIVEC_207, VSUBECUQ, do_va_helper, gen_helper_VSUBECUQ)
> +
>   TRANS_FLAGS(ALTIVEC, VPERM, do_va_helper, gen_helper_VPERM)
>   TRANS_FLAGS2(ISA300, VPERMR, do_va_helper, gen_helper_VPERMR)
> 
> diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
> index 9feef9afee..9395806f3d 100644
> --- a/target/ppc/translate/vmx-ops.c.inc
> +++ b/target/ppc/translate/vmx-ops.c.inc
> @@ -128,7 +128,6 @@ GEN_VXFORM(vsubshs, 0, 29),
>   GEN_VXFORM_DUAL(vsubsws, xpnd04_2, 0, 30, PPC_ALTIVEC, PPC_NONE),
>   GEN_VXFORM_300(bcdtrunc, 0, 20),
>   GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300),
> -GEN_VXFORM_DUAL(vsubeuqm, vsubecuq, 31, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
>   GEN_VXFORM(vsl, 2, 7),
>   GEN_VXFORM(vsr, 2, 11),
>   GEN_VXFORM(vpkuhum, 7, 0),
> --
> 2.25.1
> 
> 

Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>

-- 
Víctor Cora Colombo
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

