Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8E044593D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 19:02:29 +0100 (CET)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mih4G-0006ZI-5T
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 14:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mih3J-0005eH-8n; Thu, 04 Nov 2021 14:01:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56354
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mih3H-00046v-A9; Thu, 04 Nov 2021 14:01:29 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mih36-0001E9-NJ; Thu, 04 Nov 2021 18:01:21 +0000
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211104140958.445304-2-pbonzini@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ee70d2ff-a169-8d62-49ac-5d08939d4b22@ilande.co.uk>
Date: Thu, 4 Nov 2021 18:01:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211104140958.445304-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] target-i386: mmu: fix handling of noncanonical virtual
 addresses
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/11/2021 14:09, Paolo Bonzini wrote:

> mmu_translate is supposed to return an error code for page faults; it is
> not able to handle other exceptions.  The #GP case for noncanonical
> virtual addresses is not handled correctly, and incorrectly raised as
> a page fault with error code 1.  Since it cannot happen for nested
> page tables, move it directly to handle_mmu_fault, even before the
> invocation of mmu_translate.
> 
> Fixes: 661ff4879e ("target/i386: extract mmu_translate", 2021-05-11)
> Cc: qemu-stable@nongnu.org
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: #676
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/sysemu/excp_helper.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
> index 492b777de9..5ba739fbed 100644
> --- a/target/i386/tcg/sysemu/excp_helper.c
> +++ b/target/i386/tcg/sysemu/excp_helper.c
> @@ -94,15 +94,6 @@ static int mmu_translate(CPUState *cs, hwaddr addr, MMUTranslateFunc get_hphys_f
>               bool la57 = pg_mode & PG_MODE_LA57;
>               uint64_t pml5e_addr, pml5e;
>               uint64_t pml4e_addr, pml4e;
> -            int32_t sext;
> -
> -            /* test virtual address sign extension */
> -            sext = la57 ? (int64_t)addr >> 56 : (int64_t)addr >> 47;
> -            if (get_hphys_func && sext != 0 && sext != -1) {
> -                env->error_code = 0;
> -                cs->exception_index = EXCP0D_GPF;
> -                return 1;
> -            }
>   
>               if (la57) {
>                   pml5e_addr = ((cr3 & ~0xfff) +
> @@ -423,6 +414,18 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
>           page_size = 4096;
>       } else {
>           pg_mode = get_pg_mode(env);
> +        if (pg_mode & PG_MODE_LMA) {
> +            int32_t sext;
> +
> +            /* test virtual address sign extension */
> +            sext = (int64_t)addr >> (pg_mode & PG_MODE_LA57 ? 56 : 47);
> +            if (sext != 0 && sext != -1) {
> +                env->error_code = 0;
> +                cs->exception_index = EXCP0D_GPF;
> +                return 1;
> +            }
> +        }
> +
>           error_code = mmu_translate(cs, addr, get_hphys, env->cr[3], is_write1,
>                                      mmu_idx, pg_mode,
>                                      &paddr, &page_size, &prot);

I just gave this patch a quick test with my Windows 7 image and it now boots without 
issue. Thanks Paolo!

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> (Windows 7)


ATB,

Mark.

