Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052DE6A1424
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 01:08:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLby-0005KT-7J; Thu, 23 Feb 2023 19:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLbw-0005JZ-7Y
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:06:52 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLbt-0008Sz-Mw
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:06:51 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z20-20020a17090a8b9400b002372d7f823eso1036652pjn.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 16:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q+Eu6JPJ4UD+q+QkjKowfdV2kqoHkpy36E2ylleTmgo=;
 b=hgLwswEHTcL81O6L1tV7mqv2bezzAxkFP4JuCbc4MDy456c9HglV+4VdC4oUyVkJRG
 7Sl7TdiAjgUplHilWhOT+eq3zobLkmLZVK+h/BPW/B48iobLyhpyd2k9XUlkyRe+jKDX
 dvygMA1U7nNF1m/j9GOiBuC9ixBCXtLB/aTIcUxCyzWI4J/osrHR3yjBQWJHCViKMIZV
 5mmmhDrL/1spul3Drm+xTOjssn+BPQnemEZRGrvHJHzzospIiriPHgsuA7PjZtPifkt/
 3Zuufe6bi5UPsacKLXr7bU9DOoYs0kVEOVEWFa3HIdVxeIyAgu7KyL+ePeW86csF6tfh
 m9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q+Eu6JPJ4UD+q+QkjKowfdV2kqoHkpy36E2ylleTmgo=;
 b=nybvt/xyAwXToeJRguN8q8FvXshq0Pk45XI00FCVDKu0SuH3PpNwUExi20TqqnDPIZ
 IoNK6EXfZwRroX+ppuR69jOiuQAo8iMD3k9+ZGVmSIA2M36YXXEa+Fdl1rThw5CQa7GV
 Oa1SE9+s+h9w9hW6RMdu564dj3DResQ7FjgaYvf3uKNQhukTk4R8aqxBTfypVVJKcwnO
 Bt1gzDg2ST3QOY6pH36rCPxIoHsyc+Ss7V3jStr9CcznGqTD1I6WwRwEhpsUyzQDVXHZ
 +kIIKlzohfM5/V2ij0nTul78gYLRTVr/pGltIGrXzzp46L/X6hyEfu6oJyLyYmYXPKGl
 Ye3w==
X-Gm-Message-State: AO0yUKXXs3wcsagVt0bsv0qKc9rt4CCDl3auWu0k+QuJ7GQU/ALqLIv/
 0y+N4CejywiyBMf2f75nnisuWQ==
X-Google-Smtp-Source: AK7set8F7JQr/+Q5d5t1bpv5mznG/vQgvb9MEKl3nrq0mroCNi0ZZ9LfioWMBVgnFI3kYFAFWpgR4Q==
X-Received: by 2002:a05:6a20:c127:b0:c6:c0c1:b1fe with SMTP id
 bh39-20020a056a20c12700b000c6c0c1b1femr4279484pzb.57.1677197207436; 
 Thu, 23 Feb 2023 16:06:47 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u64-20020a638543000000b004fba03ee681sm6910714pgd.13.2023.02.23.16.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 16:06:46 -0800 (PST)
Message-ID: <33f91448-78bd-e5a9-f05f-c54e0c8c1c13@linaro.org>
Date: Thu, 23 Feb 2023 14:06:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 1/4] tcg: add 'size' param to probe_access_flags()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-2-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223234427.521114-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 13:44, Daniel Henrique Barboza wrote:
> probe_access_flags() as it is today uses probe_access_full(), which in
> turn uses probe_access_internal() with size = 0. probe_access_internal()
> then uses the size to call the tlb_fill() callback for the given CPU.
> This size param ('fault_size' as probe_access_internal() calls it) is
> ignored by most existing .tlb_fill callback implementations, e.g.
> arm_cpu_tlb_fill(), ppc_cpu_tlb_fill(), x86_cpu_tlb_fill() and
> mips_cpu_tlb_fill() to name a few.
> 
> But RISC-V riscv_cpu_tlb_fill() actually uses it. The 'size' parameter
> is used to check for PMP (Physical Memory Protection) access. This is
> necessary because PMP does not make any guarantees about all the bytes
> of the same page having the same permissions, i.e. the same page can
> have different PMP properties, so we're forced to make sub-page range
> checks. To allow RISC-V emulation to do a probe_acess_flags() that
> covers PMP, we need to either add a 'size' param to the existing
> probe_acess_flags() or create a new interface (e.g.
> probe_access_range_flags).
> 
> There are quite a few probe_* APIs already, so let's add a 'size' param
> to probe_access_flags() and re-use this API. This is done by open coding
> what probe_access_full() does inside probe_acess_flags() and passing the
> 'size' param to probe_acess_internal(). Existing probe_access_flags()
> callers use size = 0 to not change their current API usage. 'size' is
> asserted to enforce single page access like probe_access() already does.
> 
> No behavioral changes intended.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   accel/stubs/tcg-stub.c        |  2 +-
>   accel/tcg/cputlb.c            | 17 ++++++++++++++---
>   accel/tcg/user-exec.c         |  5 +++--
>   include/exec/exec-all.h       |  3 ++-
>   semihosting/uaccess.c         |  2 +-
>   target/arm/ptw.c              |  2 +-
>   target/arm/sve_helper.c       |  2 +-
>   target/s390x/tcg/mem_helper.c |  6 +++---
>   8 files changed, 26 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I'll change probe_access_full as well, just to keep them in sync.

> +int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool nonfault, void **phost, uintptr_t retaddr)
>   {
>       CPUTLBEntryFull *full;
> +    int flags;
> +
> +    g_assert(-(addr | TARGET_PAGE_MASK) >= size);
> +
> +    flags = probe_access_internal(env, addr, size, access_type, mmu_idx,
> +                                  nonfault, phost, &full, retaddr);
>   
> -    return probe_access_full(env, addr, access_type, mmu_idx,
> -                             nonfault, phost, &full, retaddr);
> +    /* Handle clean RAM pages. */
> +    if (unlikely(flags & TLB_NOTDIRTY)) {
> +        notdirty_write(env_cpu(env), addr, 1, full, retaddr);
> +        flags &= ~TLB_NOTDIRTY;
> +    }
> +
> +    return flags;

But bypassing probe_access_full here is fine.


r~

