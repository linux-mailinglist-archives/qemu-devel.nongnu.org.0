Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F0836FBEB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:11:25 +0200 (CEST)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTrY-0001Gl-DY
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lcTnO-00073h-VA; Fri, 30 Apr 2021 10:07:06 -0400
Received: from [201.28.113.2] (port=36837 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lcTnM-0001Pk-Ef; Fri, 30 Apr 2021 10:07:06 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 11:05:56 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 5E1248013C2;
 Fri, 30 Apr 2021 11:05:56 -0300 (-03)
Subject: Re: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-26-richard.henderson@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <0ed61faa-327c-68a9-d449-541a6a9f3224@eldorado.org.br>
Date: Fri, 30 Apr 2021 11:05:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430011543.1017113-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Apr 2021 14:05:56.0783 (UTC)
 FILETIME=[F0C433F0:01D73DC9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/04/2021 22:15, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/insn32.decode                   | 12 +++++++
>   target/ppc/insn64.decode                   | 15 +++++++++
>   target/ppc/translate.c                     | 29 ----------------
>   target/ppc/translate/fixedpoint-impl.c.inc | 39 ++++++++++++++++++++++
>   4 files changed, 66 insertions(+), 29 deletions(-)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index b175441209..52d9b355d4 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -16,3 +16,15 @@
>   # You should have received a copy of the GNU Lesser General Public
>   # License along with this library; if not, see <http://www.gnu.org/licenses/>.
>   #
> +
> +&D              rt ra si
> +@D              ...... rt:5 ra:5 si:s16                 &D
> +
> +# If a prefix is allowed, decode with default values.
> +&PLS_D          rt ra si:int64_t r:bool
> +@PLS_D          ...... rt:5 ra:5 si:s16                 &PLS_D r=0
> +
> +### Fixed-Point Arithmetic Instructions
> +
> +ADDI            001110 ..... ..... ................     @PLS_D
> +ADDIS           001111 ..... ..... ................     @D
> diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
> index 9fc45d0614..f4272df724 100644
> --- a/target/ppc/insn64.decode
> +++ b/target/ppc/insn64.decode
> @@ -16,3 +16,18 @@
>   # You should have received a copy of the GNU Lesser General Public
>   # License along with this library; if not, see <http://www.gnu.org/licenses/>.
>   #
> +
> +# Many all of these instruction names would be prefixed by "P",
> +# but we share code with the non-prefixed instruction.
> +
> +# Format MLS:D and 8LS:D
> +&PLS_D          rt ra si:int64_t r:bool  !extern
> +%pls_si         32:s18 0:16
> +@PLS_D          ...... .. ... r:1 .. .................. \
> +                ...... rt:5 ra:5 ................       \
> +                &PLS_D si=%pls_si
> +
> +### Fixed-Point Arithmetic Instructions
> +
> +ADDI            000001 10 0--.-- ..................     \
> +                001110 ..... ..... ................     @PLS_D

I'm not sure about this. It's a bit surprising to find ADDI here, and 
the comment that explains why is likely to be ignored after the big 
copyright header.

<snip>

> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
> index b740083605..7af1b3bcf5 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -16,3 +16,42 @@
>    * You should have received a copy of the GNU Lesser General Public
>    * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>    */
> +
> +/*
> + * Incorporate CIA into the constant when R=1.
> + * Validate that when R=1, RA=0.
> + */
> +static bool resolve_PLS_D(DisasContext *ctx, arg_PLS_D *a)
> +{
> +    if (a->r) {
> +        if (unlikely(a->ra != 0)) {
> +            gen_invalid(ctx);
> +            return false;
> +        }
> +        a->si += ctx->cia;
> +    }
> +    return true;
> +}
> +
> +static bool trans_ADDI(DisasContext *ctx, arg_PLS_D *a)
> +{
> +    if (resolve_PLS_D(ctx, a)) {
> +        if (a->ra) {
> +            tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_gpr[a->ra], a->si);
> +        } else {
> +            tcg_gen_movi_tl(cpu_gpr[a->rt], a->si);
> +        }
> +    }
> +    return true;
> +}
> +

I'd prefer to keep a trans_PADDI like

 > static bool trans_PADDI(DisasContext *ctx, arg_PLS_D *a)
 > {
 >     if(!resolve_PLS_D(ctx, a)) {
 >         return false;
 >     }
 >     return trans_ADDI(ctx, a);
 > }

It's the middle way between v2 and v3. trans_ADDI code is reused, it'll 
probably be optimized as a tail call, and resolve_PLS_D is not called 
when it's not needed.

> +static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
> +{
> +    int si = a->si << 16;
> +    if (a->ra) {
> +        tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_gpr[a->ra], si);
> +    } else {
> +        tcg_gen_movi_tl(cpu_gpr[a->rt], si);
> +    }
> +    return true;
> +}
> 

I'd also keep this as in the last version, where trans_ADDI is called.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

