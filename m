Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31494AE2FD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 22:10:01 +0100 (CET)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXkO-0005Iq-OZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 16:10:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nHXaW-0000rQ-2z
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:59:48 -0500
Received: from [187.72.171.209] (port=29752 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1nHXaT-0005qQ-3v
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:59:47 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 8 Feb 2022 17:57:09 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B9910801D19;
 Tue,  8 Feb 2022 17:57:08 -0300 (-03)
Message-ID: <b321310a-d843-a4e4-d2fa-60f03ae701a7@eldorado.org.br>
Date: Tue, 8 Feb 2022 17:57:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v2] Use long endian options for ppc64
To: Miroslav Rezanina <mrezanin@redhat.com>, qemu-devel@nongnu.org
References: <20220131091714.4825-1-mrezanin@redhat.com>
Content-Language: en-US
In-Reply-To: <20220131091714.4825-1-mrezanin@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 08 Feb 2022 20:57:09.0106 (UTC)
 FILETIME=[6FEEED20:01D81D2E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/01/2022 06:17, Miroslav Rezanina wrote:
> GCC options pairs -mlittle/-mlittle-endian and -mbig/-mbig-endian are
> equivalent on ppc64 architecture. However, Clang supports only long
> version of the options.
> 
> Use longer form in configure to properly support both GCC and Clang
> compiler. In addition, fix this issue in tcg test configure.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> 
> ---
> This is v2 of configure: Use -mlittle-endian instead of -mlittle for ppc64.
> 
> v2:
>   - handle both -mlittle and -mbig usage
>   - fix tests/tcg/configure.sh
> ---
>   configure              | 4 ++--
>   tests/tcg/configure.sh | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configure b/configure
> index e6cfc0e4be..066fa29b70 100755
> --- a/configure
> +++ b/configure
> @@ -655,10 +655,10 @@ case "$cpu" in
>     ppc)
>       CPU_CFLAGS="-m32" ;;
>     ppc64)
> -    CPU_CFLAGS="-m64 -mbig" ;;
> +    CPU_CFLAGS="-m64 -mbig-endian" ;;
>     ppc64le)
>       cpu="ppc64"
> -    CPU_CFLAGS="-m64 -mlittle" ;;
> +    CPU_CFLAGS="-m64 -mlittle-endian" ;;
> 
>     s390)
>       CPU_CFLAGS="-m31" ;;
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index 309335a2bd..21959e1fde 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -64,9 +64,9 @@ fi
>   : ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
>   : ${cross_cc_cflags_ppc="-m32"}
>   : ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
> -: ${cross_cc_cflags_ppc64="-m64 -mbig"}
> +: ${cross_cc_cflags_ppc64="-m64 -mbig-endian"}
>   : ${cross_cc_ppc64le="$cross_cc_ppc64"}
> -: ${cross_cc_cflags_ppc64le="-m64 -mlittle"}
> +: ${cross_cc_cflags_ppc64le="-m64 -mlittle-endian"}
>   : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
>   : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
>   : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
> --
> 2.34.1
> 
> 

The patch is fine, but some PPC tests are not compiling with Clang. I've 
sent an RFC about these issues: 
https://lists.gnu.org/archive/html/qemu-ppc/2022-02/msg00116.html

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

