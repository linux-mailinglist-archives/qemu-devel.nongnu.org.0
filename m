Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DFA470586
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 17:22:40 +0100 (CET)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvifP-0006yR-6c
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 11:22:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mvicV-0005de-RQ; Fri, 10 Dec 2021 11:19:39 -0500
Received: from [201.28.113.2] (port=29490 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mvicU-0002y9-6k; Fri, 10 Dec 2021 11:19:39 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Dec 2021 13:19:33 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 5B74D8009F6;
 Fri, 10 Dec 2021 13:19:33 -0300 (-03)
Subject: Re: [PATCH 4/4] target/ppc: move xscvqpdp to decodetree
To: Victor Colombo <victor.colombo@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
 <20211210141347.38603-5-victor.colombo@eldorado.org.br>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <8c0ebcd9-6fe8-005e-b9ac-e6f8b10c6839@eldorado.org.br>
Date: Fri, 10 Dec 2021 13:19:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210141347.38603-5-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 10 Dec 2021 16:19:33.0590 (UTC)
 FILETIME=[B7AFDF60:01D7EDE1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.317,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2021 11:13, Victor Colombo wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 10 +++-------
>   target/ppc/helper.h                 |  2 +-
>   target/ppc/insn32.decode            |  4 ++++
>   target/ppc/translate/vsx-impl.c.inc | 24 +++++++++++++-----------
>   target/ppc/translate/vsx-ops.c.inc  |  1 -
>   5 files changed, 21 insertions(+), 20 deletions(-)

<snip>

> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index ab5cb21f13..f8669cae42 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -904,22 +904,24 @@ VSX_CMP(xvcmpgesp, 0x0C, 0x0A, 0, PPC2_VSX)
>   VSX_CMP(xvcmpgtsp, 0x0C, 0x09, 0, PPC2_VSX)
>   VSX_CMP(xvcmpnesp, 0x0C, 0x0B, 0, PPC2_VSX)
>   
> -static void gen_xscvqpdp(DisasContext *ctx)
> +static bool trans_XSCVQPDP(DisasContext *ctx, arg_X_tb_rc *a)
>   {
> -    TCGv_i32 opc;
> +    TCGv_i32 ro;
>       TCGv_ptr xt, xb;
> -    if (unlikely(!ctx->vsx_enabled)) {
> -        gen_exception(ctx, POWERPC_EXCP_VSXU);
> -        return;
> -    }
> -    opc = tcg_const_i32(ctx->opcode);
>   
> -    xt = gen_vsr_ptr(rD(ctx->opcode) + 32);
> -    xb = gen_vsr_ptr(rB(ctx->opcode) + 32);
> -    gen_helper_xscvqpdp(cpu_env, opc, xt, xb);
> -    tcg_temp_free_i32(opc);
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);

It's actually ISA300. We'll send a v2 fixing this.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

