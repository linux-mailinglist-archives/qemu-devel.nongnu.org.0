Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E6E3E0B34
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 02:32:21 +0200 (CEST)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBRJ6-0005R5-K3
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 20:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBRHm-00043F-KR
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:30:58 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBRHk-0006m4-3L
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:30:57 -0400
Received: by mail-pl1-x630.google.com with SMTP id c16so4979853plh.7
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 17:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OocFKKEwW5R0T2fxDuQEwmPtTcQJyAClPgU5jGzahes=;
 b=EXKyNMtxNimn0h7UmCfLUX3kmpi7lbqqtTrVVIM5uvYvRR5eYqRHH9c2uHHxOhTThP
 P3Z6dnEPeWmNepyGqJFhLi0DLy98p95LYovHK6IF9t//mZU2222jJUz7GLc1GsdwZd/x
 k50XaF5yiephqtfrTavaNWCOYT0WV0ej0IEokwDGhQdpHHhr5UWXZ3H10kOt7iujd6If
 arLNu+WGyGxuGlYYTsyWFLN4midg/u6xLqgnBMTgyCt1q9Z4mHJZ6aYMnd0mB0rqM+xL
 Q/j2VEEkdZOdtrVUHD3OrBkyDRiUM+POudd1GAOHJHyDPWTl+wmgpoEkSIK8vcP93L+p
 IsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OocFKKEwW5R0T2fxDuQEwmPtTcQJyAClPgU5jGzahes=;
 b=IQ9EdjQj5+gKcPzCgjX3+rwybzEgP/67suWCt1Uw/MhLINn7Z2z81TTeyOzk+NfsIa
 iKkt0kzuKnu/VNO5k6ZFzA9X0Vk1M8Od+DvHJMfXjl7GZJPTMB/xS/ub6xbvIoDOXenJ
 AsniQ3Ga8Xj3MryCJcT84nMS0d+5+y5ckdiT+qD0TY5r+qV/dQjiDgOejDgq5aqHr9JP
 VG/t4alqBkxpHjO73vnu30BB5sYnfPCc/YHUFcFG0gA5djevpoirkWkN8G8GcndBS4I1
 jg+JvnVCd5TEP2NSRwKwDOjShwIvrOATMtI5ezp3SUjqJG3JBvnECOSzg44QH+2eEyX7
 ttog==
X-Gm-Message-State: AOAM532Ku/6zNblmWyvtHANO2HD6u3SGusac90K04595HvIPacWd69Hy
 rBaMFMDUzc6gFiK61rd22QivLw==
X-Google-Smtp-Source: ABdhPJx5siXeUHo0fQKECZ9yMvTlbT39YRcYa2q3cVX2M9FNPXpijrX2yV+8LsFqZHAAwtbSLOnfSA==
X-Received: by 2002:a17:90b:a4c:: with SMTP id
 gw12mr12121347pjb.187.1628123454433; 
 Wed, 04 Aug 2021 17:30:54 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id x189sm4889375pfx.99.2021.08.04.17.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 17:30:54 -0700 (PDT)
Subject: Re: [PATCH RFC 1/1] accel/tcg: Clear PAGE_WRITE before translation
To: Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210804224633.154083-1-iii@linux.ibm.com>
 <20210804224633.154083-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <507a0eae-6dcf-68c0-ee5f-40499788e2b4@linaro.org>
Date: Wed, 4 Aug 2021 14:30:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804224633.154083-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/21 12:46 PM, Ilya Leoshkevich wrote:
> translate_insn() implementations fetch instruction bytes piecemeal,
> which can cause qemu-user to generate inconsistent translations if
> another thread modifies them concurrently [1].
> 
> Fix by marking translation block pages non-writable earlier.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00644.html
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   accel/tcg/translate-all.c    | 59 +++++++++++++++++++++---------------
>   accel/tcg/translator.c       | 26 ++++++++++++++--
>   include/exec/translate-all.h |  1 +
>   3 files changed, 59 insertions(+), 27 deletions(-)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index bbfcfb698c..fb9ebfad9e 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1297,31 +1297,8 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
>       invalidate_page_bitmap(p);
>   
>   #if defined(CONFIG_USER_ONLY)
> -    if (p->flags & PAGE_WRITE) {
> -        target_ulong addr;
> -        PageDesc *p2;
> -        int prot;
> -
> -        /* force the host page as non writable (writes will have a
> -           page fault + mprotect overhead) */
> -        page_addr &= qemu_host_page_mask;
> -        prot = 0;
> -        for (addr = page_addr; addr < page_addr + qemu_host_page_size;
> -            addr += TARGET_PAGE_SIZE) {
> -
> -            p2 = page_find(addr >> TARGET_PAGE_BITS);
> -            if (!p2) {
> -                continue;
> -            }
> -            prot |= p2->flags;
> -            p2->flags &= ~PAGE_WRITE;
> -          }
> -        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
> -                 (prot & PAGE_BITS) & ~PAGE_WRITE);
> -        if (DEBUG_TB_INVALIDATE_GATE) {
> -            printf("protecting code page: 0x" TB_PAGE_ADDR_FMT "\n", page_addr);
> -        }
> -    }
> +    /* translator_loop() must have made all TB pages non-writable */
> +    assert(!(p->flags & PAGE_WRITE));
>   #else
>       /* if some code is already present, then the pages are already
>          protected. So we handle the case where only the first TB is
> @@ -2394,6 +2371,38 @@ int page_check_range(target_ulong start, target_ulong len, int flags)
>       return 0;
>   }
>   
> +void page_protect(tb_page_addr_t page_addr)
> +{
> +    target_ulong addr;
> +    PageDesc *p;
> +    int prot;
> +
> +    p = page_find(page_addr >> TARGET_PAGE_BITS);
> +    if (p && (p->flags & PAGE_WRITE)) {
> +        /*
> +         * Force the host page as non writable (writes will have a page fault +
> +         * mprotect overhead).
> +         */
> +        page_addr &= qemu_host_page_mask;
> +        prot = 0;
> +        for (addr = page_addr; addr < page_addr + qemu_host_page_size;
> +             addr += TARGET_PAGE_SIZE) {
> +
> +            p = page_find(addr >> TARGET_PAGE_BITS);
> +            if (!p) {
> +                continue;
> +            }
> +            prot |= p->flags;
> +            p->flags &= ~PAGE_WRITE;
> +        }
> +        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
> +                 (prot & PAGE_BITS) & ~PAGE_WRITE);
> +        if (DEBUG_TB_INVALIDATE_GATE) {
> +            printf("protecting code page: 0x" TB_PAGE_ADDR_FMT "\n", page_addr);
> +        }
> +    }
> +}
> +
>   /* called from signal handler: invalidate the code and unprotect the
>    * page. Return 0 if the fault was not handled, 1 if it was handled,
>    * and 2 if it was handled but the caller must cause the TB to be
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index c53a7f8e44..bfbe7d7ccf 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -14,6 +14,7 @@
>   #include "exec/exec-all.h"
>   #include "exec/gen-icount.h"
>   #include "exec/log.h"
> +#include "exec/translate-all.h"
>   #include "exec/translator.h"
>   #include "exec/plugin-gen.h"
>   #include "sysemu/replay.h"
> @@ -47,6 +48,10 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>   {
>       uint32_t cflags = tb_cflags(tb);
>       bool plugin_enabled;
> +    bool stop = false;
> +#ifdef CONFIG_USER_ONLY
> +    target_ulong page_addr = -1;
> +#endif
>   
>       /* Initialize DisasContext */
>       db->tb = tb;
> @@ -71,6 +76,21 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>       plugin_enabled = plugin_gen_tb_start(cpu, tb, cflags & CF_MEMI_ONLY);
>   
>       while (true) {
> +#ifdef CONFIG_USER_ONLY
> +        /*
> +         * Make the page containing the next instruction non-writable in order
> +         * to get a consistent translation if another thread is modifying the
> +         * code while translate_insn() fetches the instruction bytes piecemeal.
> +         * Writer threads will wait for mmap_lock() in page_unprotect().
> +         */
> +        if ((db->pc_next & TARGET_PAGE_MASK) != page_addr) {
> +            page_addr = db->pc_next & TARGET_PAGE_MASK;
> +            page_protect(page_addr);
> +        }
> +#endif
> +        if (stop) {
> +            break;
> +        }

So... I think this isn't quite right.

(1) If we stop exactly at the page break, this protects the *next* page unnecessarily.

(2) This only protects the page of the start of the insn.  If the instruction crosses the 
page boundary, then the latter part of the insn is still victim to the race we're trying 
to fix.

I think a protect needs to happen in translator_ld*_swap, before reading the data.

I think that the translator_ld*_swap functions should be moved out of 
include/exec/translator.h into accel/tcg/translator.c.

I think that the translator_ld* functions should add a DisasContextBase argument, which 
should then contain the cache for the protection.  This will be a moderately large change, 
but it should be mostly mechanical.

I think that we should initialize the protection cache before translating the first insn, 
outside of that loop.  This will mean that you need not check for two pages 
simultaneously, when a single read crosses the page boundary.  You'll know that (at 
minimum) the first byte of the first read is already covered, and only need to check the 
last byte of each subsequent read.  I think the value you use for your cache should be the 
end of the page for which protection is known to apply, so that the check reduces to

   end = pc + len - 1;
   if (end > dcbase->page_protect_end) {
     dcbase->page_protect_end = end | ~TARGET_PAGE_MASK;
     page_protect(end);
   }


r~

