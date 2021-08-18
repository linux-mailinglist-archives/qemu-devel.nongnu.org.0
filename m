Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782C93EFFC2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:59:49 +0200 (CEST)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHQK-0007F8-IY
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHPJ-00064y-Jf
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:58:46 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHPH-0002ks-Vv
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:58:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id k29so2294625wrd.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 01:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=np5LKPJlC/7PbwF9/7zmDZt6NcO/yaCqF3lJQM6d3eI=;
 b=gLPH1lt14+Oeg2OjdXsVBmS4Jlx1xBYBcEWbeu62pK4d8AoQ74gSHWIeZu7cIJgf5m
 b+fNmk2cRqMCGP9ltTzxjM9N71vhDG6QFudq8Kx/aO7D6RCEyVSgfwj599skeM6/shPI
 R69MPtlJoEJDvrQ3i+gcuHV/Fsbtkq5TrSsrzYObTeMONTioTlA+/LlmZrBuzz+imx0v
 afmfMg5FTOj/fPCRp+pcN4LwNG8sfrj2OFSJnCs+sWsGuAFJvp2px9XONYlfXKmlTc/I
 BbtD7obaHd03NA8WkurbdPV1tGwIqMvysuGyVf3zIEk8/xGA8AHVkS/GX1A9B/JunavC
 3EgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=np5LKPJlC/7PbwF9/7zmDZt6NcO/yaCqF3lJQM6d3eI=;
 b=GT0jUG0+JepVMzOgKn7G9MzUCmSnTvgUcyr3dGyDHpZXYt1Y741pdqSvPrB4Yo+shZ
 6R2RdVPRamflEfIDhmNZbsnnc4+UyClRdTi3QpNWqyy0+9tx5HXvfb9bkl4XLhA+0DXW
 MnVXzJSVI6+brlVO9MuWS6KYXWwk0+CmYlc1+HTtab+eHuJUKRE0yJt+VUcAQe5ONGjm
 acqzpXubNvq8k9X3rDXIU3Lkrq4bR95RhGXrVv4yi2juLTHH2Uq7H4sb7R1rr6GtLYt+
 EeMIp5sybWW10P5TbkJw0VQTzgyPkafLiM4zfGVRnV2KMdNhi0zJWppknWALEgFE6otN
 PlLQ==
X-Gm-Message-State: AOAM530wn9tR7IcGJyCt/1VEHTQAbLEZak9mxkBHcAYfwRRVZBdjchGe
 pbCOFCYd/rLT/UCK5h1rkzaZf106ik0=
X-Google-Smtp-Source: ABdhPJxdAr4b0B9A5QoidrBNgEVjtoWxT8LRWG2LsXz1M85kT3Th/iqqvmABlI/uVZ6rWFQnDwEzXw==
X-Received: by 2002:a05:6000:18c8:: with SMTP id
 w8mr9135707wrq.90.1629277122103; 
 Wed, 18 Aug 2021 01:58:42 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g35sm4993591wmp.9.2021.08.18.01.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 01:58:41 -0700 (PDT)
Subject: Re: [PATCH v2 28/55] trace: Split guest_mem_before
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c12e7af5-5f20-a270-5dcd-68cf0de154b0@amsat.org>
Date: Wed, 18 Aug 2021 10:58:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 6:14 AM, Richard Henderson wrote:
> There is no point in encoding load/store within a bit of
> the memory trace info operand.  Represent atomic operations
> as a single read-modify-write tracepoint.  Use MemOpIdx
> instead of inventing a form specifically for traces.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/atomic_template.h   |  1 -
>  trace/mem.h                   | 51 -----------------------------------
>  accel/tcg/cputlb.c            |  7 ++---
>  accel/tcg/user-exec.c         | 43 ++++++++++-------------------
>  tcg/tcg-op.c                  | 17 +++---------
>  accel/tcg/atomic_common.c.inc | 12 +++------
>  trace-events                  | 18 +++----------
>  7 files changed, 27 insertions(+), 122 deletions(-)
>  delete mode 100644 trace/mem.h
> 
> diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
> index c08d859a8a..2d917b6b1f 100644
> --- a/accel/tcg/atomic_template.h
> +++ b/accel/tcg/atomic_template.h
> @@ -19,7 +19,6 @@
>   */
>  
>  #include "qemu/plugin.h"
> -#include "trace/mem.h"
>  
>  #if DATA_SIZE == 16
>  # define SUFFIX     o
> diff --git a/trace/mem.h b/trace/mem.h
> deleted file mode 100644
> index 699566c661..0000000000
> --- a/trace/mem.h
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -/*
> - * Helper functions for guest memory tracing
> - *
> - * Copyright (C) 2016 Lluís Vilanova <vilanova@ac.upc.edu>
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef TRACE__MEM_H
> -#define TRACE__MEM_H
> -
> -#include "exec/memopidx.h"
> -
> -#define TRACE_MEM_SZ_SHIFT_MASK 0xf /* size shift mask */
> -#define TRACE_MEM_SE (1ULL << 4)    /* sign extended (y/n) */
> -#define TRACE_MEM_BE (1ULL << 5)    /* big endian (y/n) */
> -#define TRACE_MEM_ST (1ULL << 6)    /* store (y/n) */
> -#define TRACE_MEM_MMU_SHIFT 8       /* mmu idx */
> -
> -/**
> - * trace_mem_get_info:
> - *
> - * Return a value for the 'info' argument in guest memory access traces.
> - */
> -static inline uint16_t trace_mem_get_info(MemOpIdx oi, bool store)
> -{
> -    MemOp op = get_memop(oi);
> -    uint32_t size_shift = op & MO_SIZE;
> -    bool sign_extend = op & MO_SIGN;
> -    bool big_endian = (op & MO_BSWAP) == MO_BE;
> -    uint16_t res;
> -
> -    res = size_shift & TRACE_MEM_SZ_SHIFT_MASK;
> -    if (sign_extend) {
> -        res |= TRACE_MEM_SE;
> -    }
> -    if (big_endian) {
> -        res |= TRACE_MEM_BE;
> -    }
> -    if (store) {
> -        res |= TRACE_MEM_ST;
> -    }
> -#ifdef CONFIG_SOFTMMU
> -    res |= get_mmuidx(oi) << TRACE_MEM_MMU_SHIFT;
> -#endif
> -
> -    return res;
> -}

> diff --git a/trace-events b/trace-events
> index c4cca29939..a637a61eba 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -120,26 +120,16 @@ vcpu guest_cpu_reset(void)
>  # tcg/tcg-op.c
>  
>  # @vaddr: Access' virtual address.
> -# @info : Access' information (see below).
> +# @memopidx: Access' information (see below).
>  #
>  # Start virtual memory access (before any potential access violation).
> -#
>  # Does not include memory accesses performed by devices.
>  #
> -# Access information can be parsed as:
> -#
> -# struct mem_info {
> -#     uint8_t size_shift : 4; /* interpreted as "1 << size_shift" bytes */
> -#     bool    sign_extend: 1; /* sign-extended */
> -#     uint8_t endianness : 1; /* 0: little, 1: big */
> -#     bool    store      : 1; /* whether it is a store operation */
> -#             pad        : 1;
> -#     uint8_t mmuidx     : 4; /* mmuidx (softmmu only)  */
> -# };
> -#
>  # Mode: user, softmmu
>  # Targets: TCG(all)
> -vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=%d", "vaddr=0x%016"PRIx64" info=%d"
> +vcpu tcg guest_ld_before(TCGv vaddr, uint32_t memopidx) "info=%d", "vaddr=0x%016"PRIx64" memopidx=0x%x"
> +vcpu tcg guest_st_before(TCGv vaddr, uint32_t memopidx) "info=%d", "vaddr=0x%016"PRIx64" memopidx=0x%x"
> +vcpu tcg guest_rmw_before(TCGv vaddr, uint32_t memopidx) "info=%d", "vaddr=0x%016"PRIx64" memopidx=0x%x"

Alternatively we can implement:

const char *memopidx_name(MemOpIdx oi);

and have the trace events display the MemOpIdx name.

Anyway,

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

(also, maybe "trace/mem:" in subject).

