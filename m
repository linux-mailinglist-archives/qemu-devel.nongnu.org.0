Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8883855BB27
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:36:24 +0200 (CEST)
Received: from localhost ([::1]:40574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rip-0003t9-L0
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o5rZ3-0001hM-Rh
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:26:18 -0400
Received: from [200.168.210.66] (port=12140 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>) id 1o5rZ2-0003ac-4q
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:26:17 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 13:25:37 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 5D8988001D4;
 Mon, 27 Jun 2022 13:25:37 -0300 (-03)
Message-ID: <b4cb4de4-467c-affb-e0b0-7b0c057dd4cb@eldorado.org.br>
Date: Mon, 27 Jun 2022 13:25:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/7] target/ppc: use int128.h methods in vaddcuq
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org
References: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
 <20220606150037.338931-5-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <20220606150037.338931-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 16:25:37.0776 (UTC)
 FILETIME=[88F67F00:01D88A42]
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
> And also move the insn to decodetree.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  2 +-
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/int_helper.c             | 12 ++----------
>   target/ppc/translate/vmx-impl.c.inc |  2 +-
>   target/ppc/translate/vmx-ops.c.inc  |  1 -
>   5 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index f699adbedc..f6b1b2fad2 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -207,7 +207,7 @@ DEF_HELPER_FLAGS_5(vsubuws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
>   DEF_HELPER_FLAGS_3(VADDUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
>   DEF_HELPER_FLAGS_4(VADDECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
>   DEF_HELPER_FLAGS_4(VADDEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
> -DEF_HELPER_FLAGS_3(vaddcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
> +DEF_HELPER_FLAGS_3(VADDCUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
>   DEF_HELPER_FLAGS_3(vsubuqm, TCG_CALL_NO_RWG, void, avr, avr, avr)
>   DEF_HELPER_FLAGS_4(vsubecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
>   DEF_HELPER_FLAGS_4(vsubeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 139aa3caeb..35252ddd4f 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -550,6 +550,7 @@ VRLQNM          000100 ..... ..... ..... 00101000101    @VX
> 
>   ## Vector Integer Arithmetic Instructions
> 
> +VADDCUQ         000100 ..... ..... ..... 00101000000    @VX
>   VADDUQM         000100 ..... ..... ..... 00100000000    @VX
> 
>   VADDEUQM        000100 ..... ..... ..... ..... 111100   @VA
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index c5d820f4b1..a12f2831ac 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -2225,18 +2225,10 @@ void helper_VADDEUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
>                            int128_make64(int128_getlo(c->s128) & 1));
>   }
> 
> -void helper_vaddcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> +void helper_VADDCUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>   {
> -#ifdef CONFIG_INT128
> -    r->u128 = (~a->u128 < b->u128);
> -#else
> -    ppc_avr_t not_a;
> -
> -    avr_qw_not(&not_a, *a);
> -
> +    r->VsrD(1) = int128_ult(int128_not(a->s128), b->s128);
>       r->VsrD(0) = 0;
> -    r->VsrD(1) = (avr_qw_cmpu(not_a, *b) < 0);
> -#endif
>   }
> 
>   void helper_VADDECUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 4ec6b841b3..8c0e5bcc03 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1234,7 +1234,6 @@ GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);
>   GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
>   GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
>   GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
> -GEN_VXFORM(vaddcuq, 0, 5);
>   GEN_VXFORM(vsubuqm, 0, 20);
>   GEN_VXFORM(vsubcuq, 0, 21);
>   GEN_VXFORM3(vsubeuqm, 31, 0);
> @@ -3098,6 +3097,7 @@ static bool do_vx_helper(DisasContext *ctx, arg_VX *a,
>       return true;
>   }
> 
> +TRANS_FLAGS2(ALTIVEC_207, VADDCUQ, do_vx_helper, gen_helper_VADDCUQ)
>   TRANS_FLAGS2(ALTIVEC_207, VADDUQM, do_vx_helper, gen_helper_VADDUQM)
> 
>   TRANS_FLAGS2(ALTIVEC_207, VPMSUMD, do_vx_helper, gen_helper_VPMSUMD)
> diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
> index f8a512f920..33e05929cb 100644
> --- a/target/ppc/translate/vmx-ops.c.inc
> +++ b/target/ppc/translate/vmx-ops.c.inc
> @@ -126,7 +126,6 @@ GEN_VXFORM(vsubuws, 0, 26),
>   GEN_VXFORM_DUAL(vsubsbs, bcdtrunc, 0, 28, PPC_ALTIVEC, PPC2_ISA300),
>   GEN_VXFORM(vsubshs, 0, 29),
>   GEN_VXFORM_DUAL(vsubsws, xpnd04_2, 0, 30, PPC_ALTIVEC, PPC_NONE),
> -GEN_VXFORM_207(vaddcuq, 0, 5),
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

