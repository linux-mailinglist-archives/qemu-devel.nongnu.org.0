Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0237D53A8E9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 16:17:01 +0200 (CEST)
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwP9g-00051j-3k
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 10:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nwP5l-0003Dg-UT
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 10:12:58 -0400
Received: from [187.72.171.209] (port=42702 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1nwP5j-0007oo-TT
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 10:12:57 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 1 Jun 2022 11:12:48 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 4C5A780006A;
 Wed,  1 Jun 2022 11:12:48 -0300 (-03)
Message-ID: <62dfa218-f61c-7fd3-6ee9-8e5b11598750@eldorado.org.br>
Date: Wed, 1 Jun 2022 11:12:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] tcg: Add tcg_gen_mov_ptr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220531032103.406203-1-richard.henderson@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20220531032103.406203-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 01 Jun 2022 14:12:48.0632 (UTC)
 FILETIME=[AC3E1F80:01D875C1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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

On 31/05/2022 00:21, Richard Henderson wrote:
> Add an interface to perform moves between TCGv_ptr.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> This will be required for target/arm FEAT_SME.
> 
> r~
> 
> ---
>   include/tcg/tcg-op.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
> index b09b8b4a05..209e168305 100644
> --- a/include/tcg/tcg-op.h
> +++ b/include/tcg/tcg-op.h
> @@ -1288,6 +1288,11 @@ static inline void tcg_gen_addi_ptr(TCGv_ptr r, TCGv_ptr a, intptr_t b)
>       glue(tcg_gen_addi_,PTR)((NAT)r, (NAT)a, b);
>   }
> 
> +static inline void tcg_gen_mov_ptr(TCGv_ptr d, TCGv_ptr s)
> +{
> +    glue(tcg_gen_mov_,PTR)((NAT)d, (NAT)s);
> +}
> +
>   static inline void tcg_gen_brcondi_ptr(TCGCond cond, TCGv_ptr a,
>                                          intptr_t b, TCGLabel *label)
>   {
> --
> 2.34.1
> 
> 

Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

