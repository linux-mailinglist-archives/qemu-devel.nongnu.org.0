Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B66589FAF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:07:17 +0200 (CEST)
Received: from localhost ([::1]:39308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJeJY-0003Is-NL
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oJeBi-0005JP-2r; Thu, 04 Aug 2022 12:59:10 -0400
Received: from [200.168.210.66] (port=10074 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oJeBf-0005Kw-MH; Thu, 04 Aug 2022 12:59:09 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 4 Aug 2022 13:59:02 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 7E1A88002BE;
 Thu,  4 Aug 2022 13:59:02 -0300 (-03)
Message-ID: <d45c839d-7c9c-fdec-ed08-74501a44ce66@eldorado.org.br>
Date: Thu, 4 Aug 2022 13:59:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/1] target/ppc: fix unreachable code in do_ldst_quad()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220725202122.1810709-1-danielhb413@gmail.com>
 <20220725202122.1810709-2-danielhb413@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20220725202122.1810709-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 04 Aug 2022 16:59:02.0792 (UTC)
 FILETIME=[7FBE2880:01D8A823]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
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

On 25/07/2022 17:21, Daniel Henrique Barboza wrote:
> Coverity reports that commit fc34e81acd51 ("target/ppc: add macros to
> check privilege level") turned the following code unreachable:
> 
> if (!prefixed && !(ctx->insns_flags2 & PPC2_LSQ_ISA207)) {
>      /* lq and stq were privileged prior to V. 2.07 */
>      REQUIRE_SV(ctx);
> 
>>>>      CID 1490757:  Control flow issues  (UNREACHABLE)
>>>>      This code cannot be reached: "if (ctx->le_mode) {
>      if (ctx->le_mode) {
>          gen_align_no_le(ctx);
>          return true;
>      }
> }
> 
> This happens because the macro REQUIRE_SV(), in CONFIG_USER_MODE, will
> always result in a 'return true' statement. In fact, all REQUIRE_*
> macros for target/ppc/translate.c behave the same way: if a condition
> isn't met, an exception is generated and a 'return' statement is issued.
> 
> The difference is that all other callers are using it in insns that are
> not implemented in user mode. do_ldst_quad(), on the other hand, is user
> mode compatible.
> 
> Fixes include wrapping these lines in "if !defined(CONFIG_USER_MODE)",
> making it explicit that these lines are not user mode anymore. Another
> fix would be, for example, to change REQUIRE_SV() to not issue a
> 'return' and check if we're running in privileged mode or not by hand,
> but this would change all other callers of the macro that are using it
> in an adequate manner.
> 
> The code that was in place before fc34e81acd51 was good enough, so let's
> go back to that: open code the ctx->pr condition and fire the exception
> if we're not privileged. The difference from the code back then to what
> we're doing now is an 'unlikely' compiler hint to ctx->pr and the use of
> gen_priv_opc() instead of gen_priv_exception().
> 
> Fixes: Coverity CID 1490757
> Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/translate/fixedpoint-impl.c.inc | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
> index db14d3bebc..a3ade4fe2b 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -79,8 +79,11 @@ static bool do_ldst_quad(DisasContext *ctx, arg_D *a, bool store, bool prefixed)
>       REQUIRE_INSNS_FLAGS(ctx, 64BX);
> 
>       if (!prefixed && !(ctx->insns_flags2 & PPC2_LSQ_ISA207)) {
> -        /* lq and stq were privileged prior to V. 2.07 */
> -        REQUIRE_SV(ctx);
> +        if (unlikely(ctx->pr)) {
> +            /* lq and stq were privileged prior to V. 2.07 */
> +            gen_priv_opc(ctx);
> +            return true;
> +        }
> 
>           if (ctx->le_mode) {
>               gen_align_no_le(ctx);
> --
> 2.36.1
> 

Since the remaining code in this branch is dead code in user-mode, I'd 
personally prefer the v1 approach, but the difference is unlikely to 
have any meaningful impact, so either way is good.

Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

