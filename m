Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D8B2DAF7E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:56:28 +0100 (CET)
Received: from localhost ([::1]:47720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBkY-0000dM-Lu
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpBjV-0008Oz-0k
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:55:21 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpBjS-0004qY-Ut
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:55:20 -0500
Received: by mail-ot1-x341.google.com with SMTP id d20so1625293otl.3
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TzmWxc55AliOfScOu1h3U2D27x+VqwgJnj20sgJkp/w=;
 b=rKW1OfMKWKa6t8jCIFo3iEXdfcGVlCmrx1s+SV/dqb4vSVdAT6Zs2WParZ8cYcsaqJ
 04VM0KOKzl9At4E/c+DybXrUtd4jkKCsqj9k615pfElSVFYZfKrCDlxehjdDTVXSw+3W
 qwny70H6vzdiH6r1tIeLYcqpWo0T+ZhzYJsTC/qRoV77HpqwIYvGTWCFgTJPLGtxvUtu
 f124D7q10Sc9fqU9qTNfdCd7GnBRwyN4rHkxnxeOtMRrc2Dma5+KXw8KVzdgG52TWfhv
 4lODi7bXzNG1angbOVW1p7xOa6Ph4Lmpz9hYiVxUdeDrc/dcmVD0VHq5gJ9syYTp/I+u
 5oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TzmWxc55AliOfScOu1h3U2D27x+VqwgJnj20sgJkp/w=;
 b=ZQ/nuAhcDrLSs7dqBZH4Cmdru5OMOt/3WQWwdB8eS9es5qVHG0RtLMD786PuWwxpqu
 gNkbnA0aNLel07qaiEvIjwdu92/mL5kvBYyk3zwr9re6yPul6lW92ptb5CnZgkk77BB6
 k8OAi5tVsImTdANSQTYY8rBfjOd56/gLSKtA0/mYdBRjS9Qoym8vD1IKwEnJurlIUlGS
 ceS35Bu8BCM+yNw2ot41pGQspIwSMaXfANhYpizoGJ0EzRn5Op9wPcjpTISFb1vETS50
 CW7AtSbTElkNHzxw+q0wRZbR/sG6OH+fFaCngJENuQm5F9kSvfI8tkKlfZM/L6VN4ezQ
 zFJQ==
X-Gm-Message-State: AOAM530WqJe5xpFX7BRiGRf88Isabt4rlbRTEsTn6oeyRoblC+zvHaQZ
 WSY466O7LUgBe00jHr/isR/YMA==
X-Google-Smtp-Source: ABdhPJwJu/FzhZOVdhTrTisVL/T6VkJCx0zxXfQoKuFFUq+LlzHyll8G1VPTzP2+nzCSWewkR2L2rw==
X-Received: by 2002:a9d:5e97:: with SMTP id f23mr22938331otl.204.1608044117568; 
 Tue, 15 Dec 2020 06:55:17 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q127sm5265783oia.18.2020.12.15.06.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 06:55:16 -0800 (PST)
Subject: Re: [PATCH 2/3] target/arm: add FEAT_TLBIRANGE support
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20201214202329.26765-1-rebecca@nuviainc.com>
 <20201214202329.26765-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <159e860a-206e-483c-4c31-40d8ada6f05e@linaro.org>
Date: Tue, 15 Dec 2020 08:55:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214202329.26765-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 2:23 PM, Rebecca Cran wrote:
> ARMv8.4 adds the mandatory FEAT_TLBIRANGE, which provides instructions
> for invalidating ranges of entries.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  accel/tcg/cputlb.c      |  24 ++
>  include/exec/exec-all.h |  39 +++
>  target/arm/helper.c     | 273 ++++++++++++++++++++
>  3 files changed, 336 insertions(+)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 42ab79c1a582..103f363b42f3 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -603,6 +603,30 @@ void tlb_flush_page(CPUState *cpu, target_ulong addr)
>      tlb_flush_page_by_mmuidx(cpu, addr, ALL_MMUIDX_BITS);
>  }
>  
> +void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
> +                                    int num_pages, uint16_t idxmap)
> +{
> +    int i;
> +
> +    for (i = 0; i < num_pages; i++) {
> +        tlb_flush_page_by_mmuidx(cpu, addr + (i * TARGET_PAGE_SIZE), idxmap);
> +    }
> +}
> +
> +void tlb_flush_page_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
> +                                                    target_ulong addr,
> +                                                    int num_pages,
> +                                                    uint16_t idxmap)
> +{
> +    int i;
> +
> +    for (i = 0; i < num_pages; i++) {
> +        tlb_flush_page_by_mmuidx_all_cpus_synced(src_cpu,
> +                                                 addr + (i * TARGET_PAGE_SIZE),
> +                                                 idxmap);
> +    }
> +}

This is a poor way to structure these functions, because each of these calls is
synchronized.  You want to do the cross-cpu call once for the entire set of
pages, synchronizing once at the end.

In addition, tlb_flush_page is insufficient for aarch64, because of TBI.  We
need a version of tlb_flush_page_bits that takes the length of the flush.

This *could* be implemented as a full flush, in the short term.

You could round the length outward to a mask, then merge the low-bit mask of
the length with the high-bit mask of TBI.  That will catch a few more pages
than architecturally required, but less than a full flush.

Certainly I don't think you ever want to perform this loop 32 (max num) * 16
(max scale) * 64 (max page size) = 32768 times.


r~

