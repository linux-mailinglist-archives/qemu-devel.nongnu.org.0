Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF1A64E347
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 22:35:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5vrg-0000fb-Iz; Thu, 15 Dec 2022 16:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1p5vrd-0000fL-Uv
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 16:34:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1p5vrc-00028N-1i
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 16:34:01 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4850C4013E;
 Fri, 16 Dec 2022 00:33:56 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 920813B9;
 Fri, 16 Dec 2022 00:33:54 +0300 (MSK)
Message-ID: <752b9f2a-0276-2685-8e28-821aaf626437@msgid.tls.msk.ru>
Date: Fri, 16 Dec 2022 00:33:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PULL 19/20] tcg/ppc: Optimize 26-bit jumps
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Leandro Lupori <leandro.lupori@eldorado.org.br>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
 <20221004195241.46491-20-richard.henderson@linaro.org>
Content-Language: en-US
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20221004195241.46491-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

04.10.2022 22:52, Richard Henderson wrote:
> From: Leandro Lupori <leandro.lupori@eldorado.org.br>
> 
> PowerPC64 processors handle direct branches better than indirect
> ones, resulting in less stalled cycles and branch misses.
> 
> However, PPC's tb_target_set_jmp_target() was only using direct
> branches for 16-bit jumps, while PowerPC64's unconditional branch
> instructions are able to handle displacements of up to 26 bits.
> To take advantage of this, now jumps whose displacements fit in
> between 17 and 26 bits are also converted to direct branches.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> [rth: Expanded some commentary.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/ppc/tcg-target.c.inc | 119 +++++++++++++++++++++++++++++----------
>   1 file changed, 88 insertions(+), 31 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 1cbd047ab3..e3dba47697 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
...

> +    /*
> +     * There's no convenient way to get the compiler to allocate a pair
> +     * of registers at an even index, so copy into r6/r7 and clobber.
> +     */
> +    asm("mr  %%r6, %1\n\t"
> +        "mr  %%r7, %2\n\t"
> +        "stq %%r6, %0"
> +        : "=Q"(*(__int128 *)rw) : "r"(p[0]), "r"(p[1]) : "r6", "r7");

This is the only place in qemu where __int128 is used (other places name
it __int128_t), and is used *unconditionally*.  Is it right?

In particular, this breaks compilation on powerpc:

cc -m32 -Ilibqemu-aarch64-softmmu.fa.p... -c ../../tcg/tcg.c
In file included from ../../tcg/tcg.c:432:
/<<PKGBUILDDIR>>/tcg/ppc/tcg-target.c.inc: In function ‘ppc64_replace4’:
/<<PKGBUILDDIR>>/tcg/ppc/tcg-target.c.inc:1885:18: error: expected expression before ‘__int128’
  1885 |         : "=Q"(*(__int128 *)rw) : "r"(p[0]), "r"(p[1]) : "r6", "r7");
       |                  ^~~~~~~~
/<<PKGBUILDDIR>>/tcg/ppc/tcg-target.c.inc:1885:29: error: expected ‘)’ before ‘rw’
  1885 |         : "=Q"(*(__int128 *)rw) : "r"(p[0]), "r"(p[1]) : "r6", "r7");
       |               ~             ^~

Thanks,

/mjt

