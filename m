Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7547336D86C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:39:04 +0200 (CEST)
Received: from localhost ([::1]:47212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkP9-0008KJ-GP
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lbkIq-0004n8-II; Wed, 28 Apr 2021 09:32:32 -0400
Received: from [201.28.113.2] (port=55124 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lbkIo-0001x1-Gk; Wed, 28 Apr 2021 09:32:32 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 28 Apr 2021 10:31:20 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id B8D918013BA;
 Wed, 28 Apr 2021 10:31:19 -0300 (-03)
Subject: Re: [PATCH v2 11/15] target/ppc: Move D/DS/X-form integer loads to
 decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
 <20210427171649.364699-12-luis.pires@eldorado.org.br>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <756a8039-02a8-2cfd-a7ad-d73df9d50438@eldorado.org.br>
Date: Wed, 28 Apr 2021 10:31:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210427171649.364699-12-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 Apr 2021 13:31:20.0196 (UTC)
 FILETIME=[C632AC40:01D73C32]
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
> These are all connected by macros in the legacy decoding.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode                   |  37 ++++
>   target/ppc/translate.c                     | 136 ++-------------
>   target/ppc/translate/fixedpoint-impl.c.inc | 188 +++++++++++++++++++++
>   3 files changed, 238 insertions(+), 123 deletions(-)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 878d2f2f66..bf39ce5c15 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -20,6 +20,43 @@
>   &D              rt ra si
>   @D              ...... rt:5 ra:5 si:s16                 &D
>   
> +%ds_si          2:s14  !function=times_4
> +@DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
> +
> +&X              rt ra rb
> +@X              ...... rt:5 ra:5 rb:5 .......... .      &X
> +

This is a bit problematic, the instruction form isn't enough to decide its
fields. Eg. setb is X-form, but the fields are rt:5 bfa:3, setbc is also 
X-form
and the fields are rt:5 ba:5. In fact, for the X-form, there is a whole 
page of
field designations in PowerISA v3.1.

I would break this into three cases:
  - Some forms have single field designations. Eg. B, XLS, XX4;
  - Others have multiple designations but are just alternative names for the
    fields. Eg. DQ, DS, M;
  - And there are forms with multiple designations, with a variable 
number of
    fields that may overlap each other. Eg. X, XFX, XX2.

The first is a non-issue, just use the form name as done here. The 
second seems
tractable, we could pick one field name for each part of the insn and 
still use
the form name as the identifier for args_def/fmt_def. The last case will 
likely
require multiple fmt_defs for each form, in which case we would need to 
come up
with a pattern to name them.

Looking at what Binutils did when they added Power10 support, it seems 
that the
insn form is just a hint for opcode positions, and fields are specified 
for each
insn. The sad part of this kind of approach is that it would leave us 
with, eg.
arg_LBZX and arg_LBZUX instead of a single arg_X, making it harder to put
multiple insns under the same implementation.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

