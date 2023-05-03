Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B5C6F52E1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:14:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu7bs-0005dJ-IS; Wed, 03 May 2023 04:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu7bo-0005cn-Hg
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:13:09 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu7bi-00046G-As
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:13:08 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso32125435e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683101580; x=1685693580;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KWhqzyaf+UQoW+jqEBCHpaVht5eLyfSz4NQGOo3M594=;
 b=iRULUnqg9H85ROOYplNwscghg11Rjf2VQclRHaUS4a/s05JP+kh2FDHQp4nBAVipSw
 i4mm/wWq2kPn/vErmai6gW6OZ0Nu+f23UTuANkFFvD92c1yqAFfp6rN19ua8+ucYvcya
 dqs+3KhP7ne4ZFl41p4sPeYE7PbX0lnq/1ZxHdpejt7Xom0flYgU74Fb0INQ8zVhB8FJ
 P0Ozu6dTPhUcqweWyMxkpPe57Us7iYximbzhPPHto5FOmkVZ8CSvLbNrZPRBWt3b6e0r
 YQ4fE8FodEX0qZSryWdQhkSf8AEKcZZ3O0fU1QQxwxlZemyoXWGSt25CAFInOI8fseFG
 YL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683101580; x=1685693580;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KWhqzyaf+UQoW+jqEBCHpaVht5eLyfSz4NQGOo3M594=;
 b=U0AK0GZ0wIN0T/mkPHR/fDvhIbKk0TzFmaf8HTQhhB07JmHLEggYjEpiJljh+MIvtt
 fJsfQznul2+zl+RcyU7S2r/PBTBnRFYarVVppyuHn1i5snZiySXr+yEqo9B/i9QpiSCJ
 gOtluaXGWLalfMKabTCHsz3wDeCXxnr9qQZYrbKgn9kOdfc14iMVb2ja2GRB7tYtYFhT
 DQgr1ibC+e9/XDOGV6nSr76elkg9cMfTpAuMJbuT222dlZ+k18ZB/vsXaRGhYucnG2sJ
 hsW+MkAW7WnEBH/WoxkYjjCNIPKuamGWIn17ka0eUm0R8RGwK2JmSB81c0YtFSBwYQ8B
 uvog==
X-Gm-Message-State: AC+VfDztHkrWnscHV+S8NYQxK8n9axyCEns8FmgQAZVdHt9zInePNtuQ
 2d13dPKpM9z+ghmJ6aiiupORdA==
X-Google-Smtp-Source: ACHHUZ4mAGpSjL4bpz437vQNECFatoBZk82FRhs9pLZUGaqZUvcCP8h5YZNGSVhViztAucvGX/jbiQ==
X-Received: by 2002:a1c:4b0a:0:b0:3f1:6757:6243 with SMTP id
 y10-20020a1c4b0a000000b003f167576243mr13906774wma.35.1683101580456; 
 Wed, 03 May 2023 01:13:00 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1c7404000000b003f1739a0116sm1084161wmc.33.2023.05.03.01.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 01:13:00 -0700 (PDT)
Message-ID: <483b6a5d-ab8a-c30f-5232-6b575a4c7bed@linaro.org>
Date: Wed, 3 May 2023 09:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 01/14] accel/tcg: introduce TBStatistics structure
Content-Language: en-US
To: Fei Wu <fei2.wu@intel.com>, alex.bennee@linaro.org, qemu-devel@nongnu.org
Cc: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230421132421.1617479-1-fei2.wu@intel.com>
 <20230421132421.1617479-2-fei2.wu@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230421132421.1617479-2-fei2.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/21/23 14:24, Fei Wu wrote:
> From: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>
> 
> To store statistics for each TB, we created a TBStatistics structure
> which is linked with the TBs. TBStatistics can stay alive after
> tb_flush and be relinked to a regenerated TB. So the statistics can
> be accumulated even through flushes.
> 
> The goal is to have all present and future qemu/tcg statistics and
> meta-data stored in this new structure.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
> Message-Id: <20190829173437.5926-2-vandersonmr2@gmail.com>
> [AJB: fix git author, review comments]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/meson.build     |  1 +
>   accel/tcg/tb-context.h    |  1 +
>   accel/tcg/tb-hash.h       |  7 +++++
>   accel/tcg/tb-maint.c      | 19 ++++++++++++
>   accel/tcg/tb-stats.c      | 58 +++++++++++++++++++++++++++++++++++++
>   accel/tcg/translate-all.c | 43 +++++++++++++++++++++++++++
>   include/exec/exec-all.h   |  3 ++
>   include/exec/tb-stats.h   | 61 +++++++++++++++++++++++++++++++++++++++
>   8 files changed, 193 insertions(+)
>   create mode 100644 accel/tcg/tb-stats.c
>   create mode 100644 include/exec/tb-stats.h
> 
> diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
> index aeb20a6ef0..9263bdde11 100644
> --- a/accel/tcg/meson.build
> +++ b/accel/tcg/meson.build
> @@ -4,6 +4,7 @@ tcg_ss.add(files(
>     'cpu-exec-common.c',
>     'cpu-exec.c',
>     'tb-maint.c',
> +  'tb-stats.c',
>     'tcg-runtime-gvec.c',
>     'tcg-runtime.c',
>     'translate-all.c',
> diff --git a/accel/tcg/tb-context.h b/accel/tcg/tb-context.h
> index cac62d9749..d7910d586b 100644
> --- a/accel/tcg/tb-context.h
> +++ b/accel/tcg/tb-context.h
> @@ -35,6 +35,7 @@ struct TBContext {
>       /* statistics */
>       unsigned tb_flush_count;
>       unsigned tb_phys_invalidate_count;
> +    struct qht tb_stats;
>   };
>   
>   extern TBContext tb_ctx;
> diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
> index 83dc610e4c..87d657a1c6 100644
> --- a/accel/tcg/tb-hash.h
> +++ b/accel/tcg/tb-hash.h
> @@ -67,4 +67,11 @@ uint32_t tb_hash_func(tb_page_addr_t phys_pc, target_ulong pc, uint32_t flags,
>       return qemu_xxhash7(phys_pc, pc, flags, cf_mask, trace_vcpu_dstate);
>   }
>   
> +static inline
> +uint32_t tb_stats_hash_func(tb_page_addr_t phys_pc, target_ulong pc,
> +                            uint32_t flags)
> +{
> +    return qemu_xxhash5(phys_pc, pc, flags);
> +}
> +

Why are you avoiding the hash of cs_base?
It certainly changes the comparison for a number of guests.

> +/*
> + * This is the more or less the same compare as tb_cmp(), but the
> + * data persists over tb_flush. We also aggregate the various
> + * variations of cflags under one record and ignore the details of
> + * page overlap (although we can count it).
> + */
> +bool tb_stats_cmp(const void *ap, const void *bp)
> +{
> +    const TBStatistics *a = ap;
> +    const TBStatistics *b = bp;
> +
> +    return a->phys_pc == b->phys_pc &&
> +        a->pc == b->pc &&
> +        a->cs_base == b->cs_base &&
> +        a->flags == b->flags;
> +}

So, comparing cs_base, but not hashing it?

> +void disable_collect_tb_stats(void)
> +{
> +    tcg_collect_tb_stats = TB_STATS_PAUSED;
> +}
> +
> +void pause_collect_tb_stats(void)
> +{
> +    tcg_collect_tb_stats = TB_STATS_STOPPED;
> +}

These two seem swapped.


r~

