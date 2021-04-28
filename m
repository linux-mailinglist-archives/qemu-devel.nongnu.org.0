Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D10036D95B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:15:07 +0200 (CEST)
Received: from localhost ([::1]:58888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkxw-0003m4-94
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lbkub-00033i-GK; Wed, 28 Apr 2021 10:11:35 -0400
Received: from [201.28.113.2] (port=18497 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lbkuY-0008J5-Db; Wed, 28 Apr 2021 10:11:33 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 28 Apr 2021 11:10:24 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 37F078013BA;
 Wed, 28 Apr 2021 11:10:24 -0300 (-03)
Subject: Re: [PATCH v2 09/15] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
 <20210427171649.364699-10-luis.pires@eldorado.org.br>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <6cad49f6-6716-9291-f478-4e0d80034acd@eldorado.org.br>
Date: Wed, 28 Apr 2021 11:10:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210427171649.364699-10-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 Apr 2021 14:10:24.0564 (UTC)
 FILETIME=[3B8CD740:01D73C38]
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 richard.henderson@linaro.org, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/04/2021 14:16, Luis Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/insn32.decode                   |  8 +++++
>   target/ppc/insn64.decode                   | 14 ++++++++
>   target/ppc/translate.c                     | 29 ---------------
>   target/ppc/translate/fixedpoint-impl.c.inc | 42 ++++++++++++++++++++++
>   4 files changed, 64 insertions(+), 29 deletions(-)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index b175441209..878d2f2f66 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -16,3 +16,11 @@
>   # You should have received a copy of the GNU Lesser General Public
>   # License along with this library; if not, see <http://www.gnu.org/licenses/>.
>   #
> +
> +&D              rt ra si
> +@D              ...... rt:5 ra:5 si:s16                 &D
> +
> +### Fixed-Point Arithmetic Instructions
> +
> +ADDI            001110 ..... ..... ................     @D
> +ADDIS           001111 ..... ..... ................     @D
> diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
> index 9fc45d0614..68ed2cbff8 100644
> --- a/target/ppc/insn64.decode
> +++ b/target/ppc/insn64.decode
> @@ -16,3 +16,17 @@
>   # You should have received a copy of the GNU Lesser General Public
>   # License along with this library; if not, see <http://www.gnu.org/licenses/>.
>   #
> +
> +# Format MLS:D and 8LS:D
> +&PLS_D          rt ra si r
> +
> +%pls_si         32:s18 0:16
> +
> +@PLS_D          ...... .. ... r:1 .. .................. \
> +                ...... rt:5 ra:5 ................       \
> +                &PLS_D si=%pls_si
> +
> +### Fixed-Point Arithmetic Instructions
> +
> +PADDI           000001 10 0--.-- ..................     \
> +                001110 ..... ..... ................     @PLS_D

<snip>

> +
> +static bool trans_ADDI(DisasContext *ctx, arg_D *a)
> +{
> +    if (a->ra) {
> +        tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_gpr[a->ra], a->si);
> +    } else {
> +        tcg_gen_movi_tl(cpu_gpr[a->rt], a->si);
> +    }
> +    return true;
> +}
> +
> +static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
> +{
> +    a->si <<= 16;
> +    return trans_ADDI(ctx, a);
> +}
> +
> +static bool trans_PADDI(DisasContext *ctx, arg_PLS_D *a)
> +{
> +    if (!resolve_PLS_D(ctx, a)) {
> +        return false;
> +    }
> +    if (a->ra) {
> +        tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_gpr[a->ra], a->si);
> +    } else {
> +        tcg_gen_movi_tl(cpu_gpr[a->rt], a->si);
> +    }
> +    return true;
> +}
> 

In our first attempt, we did some efforts to keep prefixed instructions 
type 0b10 and 0b11 under the same implementation as their word-size 
counterpart, i.e. trans_ADDI and trans_PADDI had the same signature and 
just forwarded their arguments to a third method that does the real 
work. Is this kind of approach desirable? We initially achieved this by 
using const_elt to set r=0 for addi, which is not particularly nice, but 
we can look for other solutions.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

