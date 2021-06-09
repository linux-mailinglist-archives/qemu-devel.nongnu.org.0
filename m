Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9893A1023
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:31:36 +0200 (CEST)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvUf-00073C-VI
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqvSB-0005LF-9y
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:28:55 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqvS9-00054b-3f
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:28:54 -0400
Received: by mail-wr1-x430.google.com with SMTP id c9so16195614wrt.5
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b/6P0z/DLEDyId05hUbqo6VmYjuA4NZAsDVpEkHNvwc=;
 b=oG08jFJItFFeKm1rSUN4wNXJgNri2s9Ac5OqtoPq4BuEdSMeFqveYyxLEWlPcx0iZ6
 8C64OesPPxwtRlmoNPWLpqXe6mWQB4n91QNMPdfK8nzCpewNvIi9HLaRmn0M/X/hfPjX
 aeyBTGm44DUgJEbgYLleh+q7eBCHaYyZMlB8YFEDXlzgMl3+ccxJVJc+anmXiLLh7VUt
 ek9XAaYAAtoK6VpPTxx0jjLNXl2APW03VZcBF4bdPhmiNbcOIr9NAKOJ2yMyUud+XIuQ
 ND23zRgW7mj7n1lDSLWze60GVm9uQngNFfYzS1a4RbVt76tThvEzxR0MuCwSGVWvelxc
 k71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b/6P0z/DLEDyId05hUbqo6VmYjuA4NZAsDVpEkHNvwc=;
 b=t2uIn4WheUcHOnIF23Of4cq90tN9FfGhTQbvdzbm1VLcPW1RYyQpocSUrkRZo4yN1q
 azYvIaHYsOVmIFvmdE/3aHsB0Vlj8p4CQVufS9WveXLe1sTKbM41ve+/hETS2jP+TRYt
 CGQvXTZJBr/4Zn7xuYFg42xw8lMJyLzXQic+PQMcNlo55NrQkxBSMWpyNmBkgmNJ9PD/
 uKzWWBAx3vTNvs7n/hV6Hew2b0aJ94NCxLJ89QlS0vRF35KUoeNab+m2zZ7bhZ2dVNaY
 zBX2rPGbyNyo+gC5lA1DeUfXFn7+BgDZi9L/HTvUHDAyxZ8jScDrbSoppRtp8A9AqOpX
 oz9Q==
X-Gm-Message-State: AOAM533GMBUQqzxvYQUmzNPCxiCeMldpvYINilY+hAvp9kLCmGDVqngN
 dds2la1dKU8SH7148tXFGy4=
X-Google-Smtp-Source: ABdhPJz31KSbknqP4aSqMrPzcOyiE/0zrwAOAT/wKmzIejtW16Dtb2frhGJ8j6htJGHJsNqto8gNrg==
X-Received: by 2002:adf:d227:: with SMTP id k7mr27362996wrh.271.1623234530659; 
 Wed, 09 Jun 2021 03:28:50 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id b188sm7645446wmh.18.2021.06.09.03.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:28:50 -0700 (PDT)
Subject: Re: [RFC PATCH] cputlb: implement load_helper_unaligned() for
 unaligned loads
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20210609093528.9616-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f5a00786-36ad-0346-942c-a6cfe1a7d0eb@amsat.org>
Date: Wed, 9 Jun 2021 12:28:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609093528.9616-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 11:35 AM, Mark Cave-Ayland wrote:
> [RFC because this is currently only lightly tested and there have been some
> discussions about whether this should be handled elsewhere in the memory API]
> 
> If an unaligned load is required then the load is split into 2 separate accesses
> and combined together within load_helper(). This does not work correctly with
> MMIO accesses because the original access size is used for both individual
> accesses causing the little and big endian combine to return the wrong result.
> 
> There is already a similar solution in place for store_helper() where an unaligned
> access is handled by a separate store_helper_unaligned() function which instead
> of using the original access size, uses a single-byte access size to shift and
> combine the result correctly regardless of the orignal access size or endian.
> 
> Implement a similar load_helper_unaligned() function which uses the same approach
> for unaligned loads to return the correct result according to the original test
> case.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/360
> ---
>  accel/tcg/cputlb.c | 99 ++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 82 insertions(+), 17 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index f24348e979..1845929e99 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1851,6 +1851,85 @@ load_memop(const void *haddr, MemOp op)
>      }
>  }
>  
> +static uint64_t __attribute__((noinline))
> +load_helper_unaligned(CPUArchState *env, target_ulong addr, uintptr_t retaddr,
> +                      size_t size, uintptr_t mmu_idx, bool code_read,
> +                      bool big_endian)
> +{
...

> +}
> +
>  static inline uint64_t QEMU_ALWAYS_INLINE
>  load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>              uintptr_t retaddr, MemOp op, bool code_read,
> @@ -1893,7 +1972,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>          CPUIOTLBEntry *iotlbentry;
>          bool need_swap;
>  
> -        /* For anything that is unaligned, recurse through full_load.  */
> +        /* For anything that is unaligned, recurse through byte loads.  */
>          if ((addr & (size - 1)) != 0) {
>              goto do_unaligned_access;
>          }
> @@ -1932,23 +2011,9 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>      if (size > 1
>          && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
>                      >= TARGET_PAGE_SIZE)) {

It would be easier to review extracting load_helper_unaligned() first.

> +        res = load_helper_unaligned(env, addr, retaddr, size, mmu_idx,
> +                                    code_read, memop_big_endian(op));
>          return res & MAKE_64BIT_MASK(0, size * 8);
>      }
>  
> 

