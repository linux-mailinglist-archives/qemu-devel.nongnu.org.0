Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4F642DDA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 17:52:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Efp-0000Ya-43; Mon, 05 Dec 2022 11:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2Efn-0000Xp-Ju
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 11:50:31 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2Efl-0000Mu-Q1
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 11:50:31 -0500
Received: by mail-pf1-x431.google.com with SMTP id h28so11927345pfq.9
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 08:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6C6MAUioop+DtdSfdnLhzwpeD9w+vPUAVhC0ElJtXo=;
 b=uhRLgoP77qUV+Y0hOxwUTnI9CUdA9o4uL0X+pi8RnLe49s7JJOIhcu+h7OUfMuHtAJ
 oXVp5BtvAT4Vj+mgU44zT34uGEXtpAPQsLA8QhxTKxvOCVj/fCGYhdXPl9aezWleeuQW
 bCRIxtMWJrV58UtL1e7gbE9mBMi8gud/CmYDbQghLcMZwIso/g0JrIKS0p4aAcLJrfpN
 gkUFRfWjqUhvRrTuu74MKD3XV8J0IRR9sRvZuMyWccBYs3+ErE+YPBsdW+81gYZqjZmY
 wAr98MlLeHxL9fNssCeGx0jYbPow+N27lgeH8pGiwqK+HGQ2kd5QQM7QgFWZa0kOYC+/
 RLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y6C6MAUioop+DtdSfdnLhzwpeD9w+vPUAVhC0ElJtXo=;
 b=mq9MojEPo5EOp5+ZGAgUv6D0xOWnusiePvmdds+wDZdzYq3ds0IdZraB2iDscLVVEw
 ArOWR793LCPeG+4UdjAoJyry4+j8+f2ukUeSuaCzwmfxt3+NuvwPFscyNiDkDTMIS4SF
 55szBE9BfgXKvX3GTFW8xYy8HLE597KUByiv0sjJGn+KVpoyyls2uzd0SCjPhjQCS+Xm
 5V0uLz4HjXcNmso+KMCYtb8N99G2hFLzP6a9ESLxnWJ9TYHE2MUE7nAbOhUmkwyJBWiC
 c8bCWhEFdZj/ElQRLvImUKee4hofWRgO5SdbGgZ49qDmJ4GePjIfgkrndN8ZFThCinxk
 LCjA==
X-Gm-Message-State: ANoB5pl1mzPnbt1bFG/4nQGzf/yhbzqZSSVjTgbc+3pSD64UJ6D/aNbD
 13uEm0dqbAyDDsjXXOsExDRv458hxVd0JGde9HbD3w==
X-Google-Smtp-Source: AA0mqf6jvqG5tyCNoI9IO5WkSyqGigeS8PPSjxNMZN3d/hxZKSzP4iboXTaGsreC/VMSURdOfPqJdQuNHkrvaz+b7OQ=
X-Received: by 2002:aa7:8502:0:b0:576:9786:94c2 with SMTP id
 v2-20020aa78502000000b00576978694c2mr11807252pfn.26.1670259028234; Mon, 05
 Dec 2022 08:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-15-richard.henderson@linaro.org>
In-Reply-To: <20221024051851.3074715-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 16:50:16 +0000
Message-ID: <CAFEAcA_5P+HgDjNJE6XZ7hN0TcOPOJfxzMANN9HQ8+b7R+34bw@mail.gmail.com>
Subject: Re: [PATCH v6 14/14] target/arm: Use the max page size in a 2-stage
 ptw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 24 Oct 2022 at 06:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had only been reporting the stage2 page size.  This causes
> problems if stage1 is using a larger page size (16k, 2M, etc),
> but stage2 is using a smaller page size, because cputlb does
> not set large_page_{addr,mask} properly.
>
> Fix by using the max of the two page sizes.
>
> Reported-by: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

So when I was reviewing the v8R patchset I re-found this
change in the code, and had some questions about it that
I wasn't thinking about the first time...

> @@ -2639,6 +2640,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>          return ret;
>      }
>
> +    /*
> +     * Use the maximum of the S1 & S2 page size, so that invalidation
> +     * of pages > TARGET_PAGE_SIZE works correctly.
> +     */
> +    if (result->f.lg_page_size < s1_lgpgsz) {
> +        result->f.lg_page_size = s1_lgpgsz;
> +    }
> +
>      /* Combine the S1 and S2 cache attributes. */
>      hcr = arm_hcr_el2_eff_secstate(env, is_secure);
>      if (hcr & HCR_DC) {

Firstly, what if the lg_page_size is < TARGET_PAGE_SIZE ?
I think this can't happen for VMSA, but for PMSA it will
when the region (in either S1 or S2) is less than the page size
(in which case lg_page_size is 0). Presumably in this case we
want to set the result's lg_page_size to also be 0 to
preserve the "don't put this in the TLB" effect.

Secondly, how does this work for VMSA? Suppose that stage 1
is using 4K pages and stage 2 is using 64K pages. We will then
claim here that the result lg_page_size is 64K, but the
attributes and mapping in the result are only valid for
the 4K page that we looked up in stage 1 -- the surrounding
4K pages could have entirely different permissions/mapping.

thanks
-- PMM

