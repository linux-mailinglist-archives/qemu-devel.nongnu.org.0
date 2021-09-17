Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E2940F6BA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:29:33 +0200 (CEST)
Received: from localhost ([::1]:38580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRC3h-0000BS-0n
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mRBz9-0004F7-3b
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:24:52 -0400
Received: from [201.28.113.2] (port=48354 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1mRBz6-0002HG-Dy
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:24:50 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 17 Sep 2021 08:24:43 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id C4BB680130D;
 Fri, 17 Sep 2021 08:24:42 -0300 (-03)
Subject: Re: [PATCH v5 01/16] tcg: Expand usadd/ussub with umin/umax
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
 <20210915213114.1923776-2-richard.henderson@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <d5d876e5-e22b-290c-1510-3c77cc29f357@eldorado.org.br>
Date: Fri, 17 Sep 2021 08:24:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915213114.1923776-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Sep 2021 11:24:43.0185 (UTC)
 FILETIME=[9CAF4A10:01D7ABB6]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_40=-0.001, NICE_REPLY_A=-1.488,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/09/2021 18:30, Richard Henderson wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> For usadd, we only have to consider overflow.  Since ~B + B == -1,
> the maximum value for A that saturates is ~B.
> 
> For ussub, we only have to consider underflow.  The minimum value
> that saturates to 0 from A - B is B.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-op-vec.c | 37 +++++++++++++++++++++++++++++++++++--
>   1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
> index 15e026ae49..7705a49c0b 100644
> --- a/tcg/tcg-op-vec.c
> +++ b/tcg/tcg-op-vec.c
> @@ -119,6 +119,18 @@ bool tcg_can_emit_vecop_list(const TCGOpcode *list,
>                   continue;
>               }
>               break;
> +        case INDEX_op_usadd_vec:
> +            if (tcg_can_emit_vec_op(INDEX_op_umin_vec, type, vece) ||
> +                tcg_can_emit_vec_op(INDEX_op_cmp_vec, type, vece)) {
> +                continue;
> +            }
> +            break;
> +        case INDEX_op_ussub_vec:
> +            if (tcg_can_emit_vec_op(INDEX_op_umax_vec, type, vece) ||
> +                tcg_can_emit_vec_op(INDEX_op_cmp_vec, type, vece)) {
> +                continue;
> +            }
> +            break;
>           case INDEX_op_cmpsel_vec:
>           case INDEX_op_smin_vec:
>           case INDEX_op_smax_vec:
> @@ -603,7 +615,18 @@ void tcg_gen_ssadd_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
> 
>   void tcg_gen_usadd_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
>   {
> -    do_op3_nofail(vece, r, a, b, INDEX_op_usadd_vec);
> +    if (!do_op3(vece, r, a, b, INDEX_op_usadd_vec)) {
> +        const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
> +        TCGv_vec t = tcg_temp_new_vec_matching(r);
> +
> +        /* usadd(a, b) = min(a, ~b) + b */
> +        tcg_gen_not_vec(vece, t, b);
> +        tcg_gen_umin_vec(vece, t, t, a);
> +        tcg_gen_add_vec(vece, r, r, b);

I think it should be

tcg_gen_add_vec(vece, r, t, b);

> +
> +        tcg_temp_free_vec(t);
> +        tcg_swap_vecop_list(hold_list);
> +    }
>   }
> 
>   void tcg_gen_sssub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
> @@ -613,7 +636,17 @@ void tcg_gen_sssub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
> 
>   void tcg_gen_ussub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
>   {
> -    do_op3_nofail(vece, r, a, b, INDEX_op_ussub_vec);
> +    if (!do_op3(vece, r, a, b, INDEX_op_ussub_vec)) {
> +        const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
> +        TCGv_vec t = tcg_temp_new_vec_matching(r);
> +
> +        /* ussub(a, b) = max(a, b) - b */
> +        tcg_gen_umax_vec(vece, t, a, b);
> +        tcg_gen_sub_vec(vece, r, t, b);
> +
> +        tcg_temp_free_vec(t);
> +        tcg_swap_vecop_list(hold_list);
> +    }
>   }
> 
>   static void do_minmax(unsigned vece, TCGv_vec r, TCGv_vec a,
> --
> 2.25.1
> 
> 


Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

