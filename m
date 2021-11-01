Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB11C44227D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 22:19:16 +0100 (CET)
Received: from localhost ([::1]:33088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhei3-0002tN-Vz
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 17:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhead-0006x8-A1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 17:11:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43542
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mheab-0005rT-5H
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 17:11:35 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mheaB-0003Bj-Bx; Mon, 01 Nov 2021 21:11:11 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20211030132943.21362-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <cd066a83-176c-dd63-4a26-81c3638cefc8@ilande.co.uk>
Date: Mon, 1 Nov 2021 21:11:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211030132943.21362-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] target/i386: ensure EXCP0D_GPF is propagated back to the
 guest
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.14,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 30/10/2021 14:29, Mark Cave-Ayland wrote:

> In the case where mmu_translate() returns EXCP0D_GPF ensure that handle_mmu_fault()
> returns immediately to propagate the fault back to the guest instead of returning
> EXCP0E_PAGE.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 661ff4879e ("target/i386: extract mmu_translate")
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/394
> ---
> 
> [Paolo: this appears to fix the regression booting Windows 7 on TCG that appeared in 6.1
>   as per the above Gitlab issue. Unfortunately as I'm not really familiar with x86 it will
>   probably need a better implementation/description but it should at least indicate what
>   the problem is.]
> 
>   target/i386/tcg/sysemu/excp_helper.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
> index 7af887be4d..0170f7f791 100644
> --- a/target/i386/tcg/sysemu/excp_helper.c
> +++ b/target/i386/tcg/sysemu/excp_helper.c
> @@ -439,6 +439,10 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
>                                   prot, mmu_idx, page_size);
>           return 0;
>       } else {
> +        if (cs->exception_index == EXCP0D_GPF) {
> +            return 1;
> +        }
> +
>           if (env->intercept_exceptions & (1 << EXCP0E_PAGE)) {
>               /* cr2 is not modified in case of exceptions */
>               x86_stq_phys(cs,

Revisiting this I think the real issue is that mmu_translate() sets env->error_code 
to 0 and cs->exception_index to EXCP0D_GPF in target/i386/tcg/sysemu/excp_helper.c at 
line 102, so if this path is taken then mmu_translate() can change the vCPU state 
which doesn't seem right.

Presumably the real solution is to update the code in handle_mmu_fault() to detect 
when mmu_translate() returns 1 and check certain flags in env to determine whether 
either a EXCP0D_GPF or EXCP0E_PAGE exception should be generated?


ATB,

Mark.

