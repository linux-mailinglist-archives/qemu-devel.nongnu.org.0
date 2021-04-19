Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C7F364835
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:29:07 +0200 (CEST)
Received: from localhost ([::1]:51752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWln-0007Wn-2D
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:29:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWkQ-0006Y7-I8
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:27:43 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWkM-0003ty-C6
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:27:42 -0400
Received: by mail-ej1-x631.google.com with SMTP id l4so53837612ejc.10
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iXiln74EBli/4LWl4e3OhhlR3ZGOoKOSfNhbioF1XjE=;
 b=Owqwbfl0BJC6gdRwWPFWh7YzhhA16+IcVekGwcad/EheKFr/EnrZDgQ+ZQLDozqsDa
 uxLyh2Twz7TQuW4ZG+spG7FzGWZD7vUqVSyd6aDgTk5b9ZOPZboe6hlN/74GrH7GodaA
 PNi1L+scx5iwT1GLjui4c2bdQKj9ApMd3NNWpiBYlQg3r2cU8wnxRo5pUGrBjbY2FKmx
 YPC4fiHmdPfVupQOS0tvu8cKMDgnTXcgPIM9/tOMp67fsHiFjNE3TRUPn6UtFGX/7Apv
 xOZzjbZ5pOdniY4gw+tN6rK8ffx9F3TwMOFlyuN3z8vYMBnEDwEBwFJ0QYUjF7YNs6Ge
 IKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXiln74EBli/4LWl4e3OhhlR3ZGOoKOSfNhbioF1XjE=;
 b=aeDq2OVRQVQB6549qqsQ9tp6FQMT/jbrJjY/C4qe9Y1T9EXucGEpPyEz5Qg2LYFh5L
 JWi4+isxVcLj+TNPa7fLHUf/mYOWQD1yUn6xst4/AYzFX4HKRaRa66oxAehC8vCGAFnM
 OrjGsGylDNxjX6BM1cbw78advnspWo17xv0D80Bg2mHKVAVqFo6KsYAcPm+oCN6FDYmN
 KfOU2Mjh1UdkPmmXRR8+3WmurNpws7qHzvMm9B1HJVqEpgrjzxTQQ1eQvyMjYGanD4Y9
 H7Hk2bjOho3Q+ZJKNutfsDZvDVQtDR491Ja8ryZC3gOHmdyEUN5nwv5HN4eB0w7D4VAQ
 +G6A==
X-Gm-Message-State: AOAM531jx/Ur1qgBcgRAw3BRjEyerBSmmhnv7kRmmW0eTBE1on/VDER0
 rayBok2WUp2Yyc2ROFdzqfllekUaG941s9IF2GcDxQ==
X-Google-Smtp-Source: ABdhPJxbxe6sEwvsHdSeHyJ1bQr4DxHpMyIH5TaST8DOiE6MV8PDFM4gyvurhlHJdoDL2KDY0JwKfdSoF334gfp4EBo=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr22765469ejc.407.1618849656555; 
 Mon, 19 Apr 2021 09:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
 <20210416183106.1516563-2-richard.henderson@linaro.org>
In-Reply-To: <20210416183106.1516563-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 17:26:44 +0100
Message-ID: <CAFEAcA_XdxxuDSi7nwwB2JPMYFDxJYWv7fv1f-ySuwWnTmVaLg@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] target/arm: Fix mte_checkN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were incorrectly assuming that only the first byte of an MTE access
> is checked against the tags.  But per the ARM, unaligned accesses are
> pre-decomposed into single-byte accesses.  So by the time we reach the
> actual MTE check in the ARM pseudocode, all accesses are aligned.
>
> Therefore, the first failure is always either the first byte of the
> access, or the first byte of the granule.
>
> In addition, some of the arithmetic is off for last-first -> count.
> This does not become directly visible until a later patch that passes
> single bytes into this function, so ptr == ptr_last.
>
> Buglink: https://bugs.launchpad.net/bugs/1921948
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 38 +++++++++++++++++---------------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
>
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 8be17e1b70..c87717127c 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -757,10 +757,10 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>                      uint64_t ptr, uintptr_t ra)
>  {
>      int mmu_idx, ptr_tag, bit55;
> -    uint64_t ptr_last, ptr_end, prev_page, next_page;
> -    uint64_t tag_first, tag_end;
> -    uint64_t tag_byte_first, tag_byte_end;
> -    uint32_t esize, total, tag_count, tag_size, n, c;
> +    uint64_t ptr_last, prev_page, next_page;
> +    uint64_t tag_first, tag_last;
> +    uint64_t tag_byte_first, tag_byte_last;
> +    uint32_t total, tag_count, tag_size, n, c;
>      uint8_t *mem1, *mem2;
>      MMUAccessType type;
>
> @@ -779,29 +779,27 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>
>      mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
>      type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
> -    esize = FIELD_EX32(desc, MTEDESC, ESIZE);
>      total = FIELD_EX32(desc, MTEDESC, TSIZE);
>
>      /* Find the addr of the end of the access, and of the last element. */
> -    ptr_end = ptr + total;
> -    ptr_last = ptr_end - esize;
> +    ptr_last = ptr + total - 1;

Code change means the comment needs updating, since we're no longer
finding two things. Change to just
 /* Find the addr of the end of the access */

?

>
>      /* Round the bounds to the tag granule, and compute the number of tags. */
>      tag_first = QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
> -    tag_end = QEMU_ALIGN_UP(ptr_last, TAG_GRANULE);
> -    tag_count = (tag_end - tag_first) / TAG_GRANULE;
> +    tag_last = QEMU_ALIGN_DOWN(ptr_last, TAG_GRANULE);
> +    tag_count = ((tag_last - tag_first) / TAG_GRANULE) + 1;
>
>      /* Round the bounds to twice the tag granule, and compute the bytes. */
>      tag_byte_first = QEMU_ALIGN_DOWN(ptr, 2 * TAG_GRANULE);
> -    tag_byte_end = QEMU_ALIGN_UP(ptr_last, 2 * TAG_GRANULE);
> +    tag_byte_last = QEMU_ALIGN_DOWN(ptr_last, 2 * TAG_GRANULE);
>
>      /* Locate the page boundaries. */
>      prev_page = ptr & TARGET_PAGE_MASK;
>      next_page = prev_page + TARGET_PAGE_SIZE;
>
> -    if (likely(tag_end - prev_page <= TARGET_PAGE_SIZE)) {
> +    if (likely(tag_last - prev_page <= TARGET_PAGE_SIZE)) {
>          /* Memory access stays on one page. */
> -        tag_size = (tag_byte_end - tag_byte_first) / (2 * TAG_GRANULE);
> +        tag_size = ((tag_byte_last - tag_byte_first) / (2 * TAG_GRANULE)) + 1;
>          mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, total,
>                                    MMU_DATA_LOAD, tag_size, ra);
>          if (!mem1) {
> @@ -815,9 +813,9 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>          mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, next_page - ptr,
>                                    MMU_DATA_LOAD, tag_size, ra);
>
> -        tag_size = (tag_byte_end - next_page) / (2 * TAG_GRANULE);
> +        tag_size = ((tag_byte_last - next_page) / (2 * TAG_GRANULE)) + 1;
>          mem2 = allocation_tag_mem(env, mmu_idx, next_page, type,
> -                                  ptr_end - next_page,
> +                                  ptr_last - next_page + 1,
>                                    MMU_DATA_LOAD, tag_size, ra);
>
>          /*
> @@ -838,15 +836,13 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>      }
>
>      /*
> -     * If we failed, we know which granule.  Compute the element that
> -     * is first in that granule, and signal failure on that element.
> +     * If we failed, we know which granule.  For the first granule, the
> +     * failure address is @ptr, the first byte accessed.  Otherwise the
> +     * failure address is the first byte of the nth granule.
>       */
>      if (unlikely(n < tag_count)) {
> -        uint64_t fail_ofs;
> -
> -        fail_ofs = tag_first + n * TAG_GRANULE - ptr;
> -        fail_ofs = ROUND_UP(fail_ofs, esize);
> -        mte_check_fail(env, desc, ptr + fail_ofs, ra);
> +        uint64_t fault = (n == 0 ? ptr : tag_first + n * TAG_GRANULE);
> +        mte_check_fail(env, desc, fault, ra);
>      }
>

This pointer arithmetic makes my head hurt. But I think it's right now.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

