Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3E56BBBD7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 19:17:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVgI-00019t-0b; Wed, 15 Mar 2023 14:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pcVgE-00018V-Qa
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:16:55 -0400
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pcVgC-0007B3-Ru
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:16:54 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N3Xvv-1qc4IL1SIV-010gco; Wed, 15 Mar 2023 19:16:50 +0100
Message-ID: <4f55ec67-2a20-9d99-1934-f7b20f3094fe@vivier.eu>
Date: Wed, 15 Mar 2023 19:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230309201604.3885359-1-richard.henderson@linaro.org>
 <20230309201604.3885359-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 2/2] linux-user/m68k: Handle EXCP_ADDRESS in cpu_loop
In-Reply-To: <20230309201604.3885359-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SOvlXw3JUlb97P1JqERFC2nYX6Q/OOWe6WxFhlP3AmZw0S0ARrD
 L674EyR1W75tIJDcv1KL/fyTEqsrLH0Jd2taeGC3uUw5akZxUvO2L3dNuUQBCiJYNgr5oRz
 F5l9q6hWeyqRrLPWbJ5GlxUMm7VFb3aLNotqUyNmMEN/h4uhSZ4Z68faI84H4t6WWzT/k1c
 fVJSfwa3G5kBtKpAWd+Vw==
UI-OutboundReport: notjunk:1;M01:P0:/t0G5VrZhhc=;yaHj6tKqs+GfA/VT9vlNrzqH3/V
 2+sJOhT4smcBtQFeDbHEqwWScxC8FVjJQEvOVArkUvZ+u7+ohPt3tfdC5VMhSZ10AhJ1XFS7P
 txns0tKkiQ2cYi3tOfwL3UJk2HX90CIoTOqbR2S0w+9J+/0O5a86/GoQzZ/VOtoOD5Va/u593
 V1J2YI8+l3UkSqhEAbyQMu4evwUHsIDkLGAsKWcwo73ONOpqVz84nyM/Hnz4dtau8lRRTNk0+
 GAt+hjTwZNBVAluxweoODsv90jW6YLNExMJk1EZ11EKao2sLHTu21CrFeAGzwjoLmLHJlyJG9
 miE7A1M18I3BxkRgzNtyVN4500wY1ixpLQUMiD5SMWg85gPCYM+iiCgC8/BV3b8hGr3oDEEtm
 PtBXktr29R4UhXMS0+NBOj7DSKvTbj4yk0dM2Q7+l1JNdNpM72SHt5ECABQgTG8Yyj7uoqdfE
 +yZzTtXuNypcCvDeXaMZhdiXzjnL92POZOXCsNDhucipk9NQ925r/PbO9qM2DC3Q++rESeA4m
 KerN5HXVbXhByJy2TFoLDtDNx3s1cHulzzmJ3MGSLTtODgzJIyqV8UHwMehB3mmJcYqcV89gA
 k90c9x+yxAf+5WgSRJvAWuecVyq65f2rotqVg6SjZQJT9ROYpHT1W2JpstN+PskpTLawc96lP
 Iv1mPHXTB+43R+mEjwgHjPUNdUawfXS2INYxQOFibg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 09/03/2023 à 21:16, Richard Henderson a écrit :
> This exception can be raised by illegal instructions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/m68k/cpu_loop.c     |  5 ++++-
>   tests/tcg/m68k/excp-address.c  | 32 ++++++++++++++++++++++++++++++++
>   tests/tcg/m68k/Makefile.target |  1 +
>   3 files changed, 37 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/m68k/excp-address.c
> 
> diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
> index caead1cb74..84b5d290c0 100644
> --- a/linux-user/m68k/cpu_loop.c
> +++ b/linux-user/m68k/cpu_loop.c
> @@ -35,7 +35,10 @@ void cpu_loop(CPUM68KState *env)
>           cpu_exec_end(cs);
>           process_queued_cpu_work(cs);
>   
> -        switch(trapnr) {
> +        switch (trapnr) {
> +        case EXCP_ADDRESS:
> +            force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, env->pc);
> +            break;
>           case EXCP_ILLEGAL:
>           case EXCP_LINEA:
>           case EXCP_LINEF:
> diff --git a/tests/tcg/m68k/excp-address.c b/tests/tcg/m68k/excp-address.c
> new file mode 100644
> index 0000000000..1dbdddef58
> --- /dev/null
> +++ b/tests/tcg/m68k/excp-address.c
> @@ -0,0 +1,32 @@
> +/*
> + * Test m68k address exception
> + */
> +
> +#define _GNU_SOURCE 1
> +#include <signal.h>
> +#include <stdlib.h>
> +
> +static void sig_handler(int sig, siginfo_t *si, void *puc)
> +{
> +    exit(0);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    struct sigaction act = {
> +        .sa_sigaction = sig_handler,
> +        .sa_flags = SA_SIGINFO
> +    };
> +
> +    sigaction(SIGBUS, &act, NULL);
> +
> +    /*
> +     * addl %d0,#0 -- with immediate as destination is illegal.
> +     * Buggy qemu interpreted the insn as 5 words: 2 for immediate source
> +     * and another 2 for immediate destination.  Provide all that padding
> +     * so that abort gets called.
> +     */
> +    asm volatile(".word 0xd1bc,0,0,0,0");
> +
> +    abort();
> +}
> diff --git a/tests/tcg/m68k/Makefile.target b/tests/tcg/m68k/Makefile.target
> index 1163c7ef03..d3b0bc48a3 100644
> --- a/tests/tcg/m68k/Makefile.target
> +++ b/tests/tcg/m68k/Makefile.target
> @@ -4,6 +4,7 @@
>   #
>   
>   VPATH += $(SRC_PATH)/tests/tcg/m68k
> +TESTS += excp-address
>   TESTS += trap
>   
>   # On m68k Linux supports 4k and 8k pages (but 8k is currently broken)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

I've tested tests/tcg/m68k/excp-address.c on a real hardware (Q800), and the result differs from the 
one from QEMU:

On Q800 (etch m68k, kernel 5.14.0):

$ ./excp-address
Illegal instruction
$ strace ./excp-address
...
rt_sigaction(SIGBUS, {0x80000478, [], SA_SIGINFO}, NULL, 8) = 0
--- SIGILL (Illegal instruction) @ 0 (0) ---
+++ killed by SIGILL +++

With QEMU, we have:

# QEMU_STRACE= ./excp-address
...
677354 rt_sigaction(SIGBUS,0x40800454,NULL) = 0
--- SIGBUS {si_signo=SIGBUS, si_code=1, si_addr=0x800004ce} ---
677354 exit_group(0)

Thanks,
Laurent

