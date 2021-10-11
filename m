Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BDB4285F3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 06:34:43 +0200 (CEST)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZn1O-0001b1-2y
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 00:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mZmx3-00037c-0p
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:30:13 -0400
Received: from [115.28.160.31] (port=50216 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mZmx0-0005yg-L3
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:30:12 -0400
Received: from [100.100.57.93] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0F67760184;
 Mon, 11 Oct 2021 12:30:06 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1633926606; bh=6FkeDPZfIZV+bqJQ+Ew7tm0h7c+0HndvFCYcBYm5SuE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jxwKhMqJ+lcFydL4/jRi2d6PX/klFG6pimNUxQcqHsPKJVjNPvV9dQwxi5aEGPATX
 jVMcezoIKVURkXTa32kPATBLQHLackixtJCTjJesk715swzV61ZkncMRDB1MgmQoLf
 Je91oEm0P5rCtnE4/rLovk+IWdY70vD9/HIHdrXM=
Message-ID: <ded6a5f0-dfcd-d908-afce-491b0273e531@xen0n.name>
Date: Mon, 11 Oct 2021 12:30:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0)
 Gecko/20100101 Thunderbird/95.0a1
Subject: Re: [PATCH 3/8] accel/tcg: Support TCG_TARGET_SIGNED_ADDR32 for
 softmmu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-4-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20211010174401.141339-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 2021/10/11 01:43, Richard Henderson wrote:
> When TCG_TARGET_SIGNED_ADDR32 is set, adjust the tlb addend to
> allow the 32-bit guest address to be sign extended within the
> 64-bit host register instead of zero extended.
>
> This will simplify tcg hosts like MIPS, RISC-V, and LoongArch,
> which naturally sign-extend 32-bit values, in contrast to x86_64
> and AArch64 which zero-extend them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 761f726722..d12621c60e 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -39,6 +39,7 @@
>  #ifdef CONFIG_PLUGIN
>  #include "qemu/plugin-memory.h"
>  #endif
> +#include "tcg-target-sa32.h"
>  
>  /* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target */
>  /* #define DEBUG_TLB */
> @@ -92,6 +93,9 @@ static inline size_t sizeof_tlb(CPUTLBDescFast *fast)
>  
>  static inline uintptr_t g2h_tlbe(const CPUTLBEntry *tlb, target_ulong gaddr)
>  {
> +    if (TCG_TARGET_SIGNED_ADDR32 && TARGET_LONG_BITS == 32) {
It seems this branch's direction should always match that of the branch
added below, so if TARGET_LONG_BITS == TARGET_LONG_BITS == 32 this
invariant is broken? Or is this expected behavior?
> +        return tlb->addend + (int32_t)gaddr;
> +    }
>      return tlb->addend + (uintptr_t)gaddr;
>  }
>  
> @@ -1234,7 +1238,13 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>      desc->iotlb[index].attrs = attrs;
>  
>      /* Now calculate the new entry */
> -    tn.addend = addend - vaddr_page;
> +
> +    if (TCG_TARGET_SIGNED_ADDR32 && TARGET_LONG_BITS < TCG_TARGET_REG_BITS) {
> +        tn.addend = addend - (int32_t)vaddr_page;
> +    } else {
> +        tn.addend = addend - vaddr_page;
> +    }
> +
>      if (prot & PAGE_READ) {
>          tn.addr_read = address;
>          if (wp_flags & BP_MEM_READ) {

