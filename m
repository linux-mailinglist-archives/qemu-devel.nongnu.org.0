Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E2B698CAB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:12:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXUX-0007ij-5D; Thu, 16 Feb 2023 01:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSXUV-0007iZ-Gq
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:11:35 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSXUT-0007VO-Jx
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:11:35 -0500
Received: by mail-pj1-x1035.google.com with SMTP id bg2so880785pjb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 22:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u/upB2Fusjnx9vKadiy8q3x01J4ya1rr7BeKAbtwJpM=;
 b=E/hySfZo2o4MVRxsGFFlexnA9rMjwpMQWuFKgPbt6SrRU10fSn7h1VWBCsMsvzKtQS
 CsWn84LR4A6y5VdkLXs0j0Mr6EwH2CSXCa6UFf1/hSf05D/Ol4OrtYHZi0WF7Hwj2rNZ
 JWC9sFk09X7Py7SMC7sg8eLMiM3lns2FDwV1IOa0tAWIOlFKBuBmeOkgLOEO8Z+wkxgz
 PmiZB3xZqU4rUQ2ygXHP/WIs8x3fwJzhDpjD6ilb0IoWz6TDI/iQP3HT/Sm8CdQSF0zX
 nkXHkymLPgapUNmvjo73gEr/GeOSNJO52j0xguAXdJVAVRkffhe5a5Ln4CUzTM/gT6F2
 YZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u/upB2Fusjnx9vKadiy8q3x01J4ya1rr7BeKAbtwJpM=;
 b=I4P+Y42GgL8GPgXm6fWF2T8CW2Ecafn4xUxHLOMEWkmmyry8XEBI/Ztls/4oRm3d5x
 sADoQoKevpJhDIvJpVfD0ET9+KWnKSlqIQ4PcNf9DuCp41A2ZsjfAIxrpksfatQJgrkV
 EkM+1GPrUdKRjMeo6cGzyp104trpVZ7FQlzWGaFRyrrYl1rYdL/hMuawq7IJrvXLnyof
 dfcP/5jW1vQjGBqSWgVmQlkqdJcPt9bLEt2w8HAT1Ivo5+I0WIoPS7OBaaVilnAK+mXf
 EezDJcXUPvutmrXE92QJ7ZQjxP4zmzgA6wpIvfcVdXDKyuwhCMjOvcA+KqAL7FDxQNmO
 3QxA==
X-Gm-Message-State: AO0yUKWjlyTn92ohQTCJpkFFKr6Gdem/kZnkvS2oVbtItQdvkHGdEUwT
 B++D9w1KWRQU6BZeC47lh2UJAuIjl3/gdo0MnpY=
X-Google-Smtp-Source: AK7set8Q2no9Ps9afafdQTwaU2oYQXN/ct9FZ+mAIUT9wzcmjlI03ynm8heb8+FWDO3CqeznUpkH9A==
X-Received: by 2002:a17:903:88d:b0:19a:95ab:6b38 with SMTP id
 kt13-20020a170903088d00b0019a95ab6b38mr4601973plb.1.1676527891371; 
 Wed, 15 Feb 2023 22:11:31 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b001991f3d85acsm356621pln.299.2023.02.15.22.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 22:11:30 -0800 (PST)
Message-ID: <6dc34c72-b424-6a4b-289e-119a7e52aa40@linaro.org>
Date: Wed, 15 Feb 2023 20:11:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/27] tcg: Simplify temporary usage
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

Ping for the 9 patches lacking review.

r~

On 1/30/23 10:59, Richard Henderson wrote:
> Based-on: 20230126043824.54819-1-richard.henderson@linaro.org
> ("[PATCH v5 00/36] tcg: Support for Int128 with helpers")
> 
> The biggest pitfall for new users of TCG is the fact that "normal"
> temporaries die at branches, and we must therefore use a different
> "local" temporary in that case.
> 
> The following patch set changes that, so that the "normal" temporary
> is the one that lives across branches, and there is a special temporary
> that dies at the end of the extended basic block, and this special
> case is reserved for tcg internals.
> 
> TEMP_LOCAL is renamed TEMP_TB, which I believe to be more explicit and
> less confusing.  TEMP_NORMAL is removed entirely.
> 
> I thought about putting in a proper full-power liveness analysis pass.
> This would have eliminated the differences between all non-global
> temporaries, and would have noticed when TEMP_LOCAL finally dies
> within a translation and avoid any final writeback.
> But I came to the conclusion that it was too expensive in runtime,
> and so retaining some distinction in the types was required.
> 
> In addition, I found that the usage of temps within plugin-gen.c
> (9 per guest memory operation) meant that we *must* have some form
> of temp that can be re-used.  (There is one x86 instruction which
> generates 62 memory operations; 62 * 9 == 558, which is larger than
> our current TCG_MAX_TEMPS.)
> 
> However I did add a new liveness pass which, with a single pass over
> the opcode stream, can see that a TEMP_LOCAL is only live within a
> single extended basic block, and thus may be transformed to TEMP_EBB.
> 
> With this, and by not recycling TEMP_LOCAL, we can get identical code
> out of the backend even when changing the front end translators are
> adjusted to use TEMP_LOCAL for everything.
> 
> Benchmarking one test case, qemu-arm linux-test, the new liveness pass
> comes in at about 1.6% on perf, but I can't see any difference in
> wall clock time before and after the patch set.
> 
> 
> r~
> 
> 
> Richard Henderson (27):
>    tcg: Adjust TCGContext.temps_in_use check
>    accel/tcg: Pass max_insn to gen_intermediate_code by pointer
>    accel/tcg: Use more accurate max_insns for tb_overflow
>    tcg: Remove branch-to-next regardless of reference count
>    tcg: Rename TEMP_LOCAL to TEMP_TB
>    tcg: Add liveness_pass_0
>    tcg: Remove TEMP_NORMAL
>    tcg: Pass TCGTempKind to tcg_temp_new_internal
>    tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
>    tcg: Add tcg_gen_movi_ptr
>    tcg: Use tcg_temp_ebb_new_* in tcg/
>    accel/tcg/plugin: Use tcg_temp_ebb_*
>    accel/tcg/plugin: Tidy plugin_gen_disable_mem_helpers
>    tcg: Don't re-use TEMP_TB temporaries
>    tcg: Change default temp lifetime to TEMP_TB
>    target/arm: Drop copies in gen_sve_{ldr,str}
>    target/arm: Don't use tcg_temp_local_new_*
>    target/cris: Don't use tcg_temp_local_new
>    target/hexagon: Don't use tcg_temp_local_new_*
>    target/hppa: Don't use tcg_temp_local_new
>    target/i386: Don't use tcg_temp_local_new
>    target/mips: Don't use tcg_temp_local_new
>    target/ppc: Don't use tcg_temp_local_new
>    target/xtensa: Don't use tcg_temp_local_new_*
>    exec/gen-icount: Don't use tcg_temp_local_new_i32
>    tcg: Remove tcg_temp_local_new_*, tcg_const_local_*
>    tcg: Update docs/devel/tcg-ops.rst for temporary changes
> 
>   docs/devel/tcg-ops.rst                      | 103 ++++----
>   target/hexagon/idef-parser/README.rst       |   4 +-
>   include/exec/gen-icount.h                   |   8 +-
>   include/exec/translator.h                   |   4 +-
>   include/tcg/tcg-op.h                        |   7 +-
>   include/tcg/tcg.h                           |  64 ++---
>   target/arm/translate-a64.h                  |   1 -
>   target/hexagon/gen_tcg.h                    |   4 +-
>   accel/tcg/plugin-gen.c                      |  33 +--
>   accel/tcg/translate-all.c                   |   2 +-
>   accel/tcg/translator.c                      |   6 +-
>   target/alpha/translate.c                    |   2 +-
>   target/arm/translate-a64.c                  |   6 -
>   target/arm/translate-sve.c                  |  38 +--
>   target/arm/translate.c                      |   8 +-
>   target/avr/translate.c                      |   2 +-
>   target/cris/translate.c                     |   8 +-
>   target/hexagon/genptr.c                     |  16 +-
>   target/hexagon/idef-parser/parser-helpers.c |   4 +-
>   target/hexagon/translate.c                  |   4 +-
>   target/hppa/translate.c                     |   5 +-
>   target/i386/tcg/translate.c                 |  29 +--
>   target/loongarch/translate.c                |   2 +-
>   target/m68k/translate.c                     |   2 +-
>   target/microblaze/translate.c               |   2 +-
>   target/mips/tcg/translate.c                 |  59 ++---
>   target/nios2/translate.c                    |   2 +-
>   target/openrisc/translate.c                 |   2 +-
>   target/ppc/translate.c                      |   8 +-
>   target/riscv/translate.c                    |   2 +-
>   target/rx/translate.c                       |   2 +-
>   target/s390x/tcg/translate.c                |   2 +-
>   target/sh4/translate.c                      |   2 +-
>   target/sparc/translate.c                    |   2 +-
>   target/tricore/translate.c                  |   2 +-
>   target/xtensa/translate.c                   |  18 +-
>   tcg/optimize.c                              |   2 +-
>   tcg/tcg-op-gvec.c                           | 270 ++++++++++----------
>   tcg/tcg-op.c                                | 258 +++++++++----------
>   tcg/tcg.c                                   | 270 +++++++++++---------
>   target/cris/translate_v10.c.inc             |  10 +-
>   target/mips/tcg/nanomips_translate.c.inc    |   4 +-
>   target/ppc/translate/spe-impl.c.inc         |   8 +-
>   target/ppc/translate/vmx-impl.c.inc         |   4 +-
>   target/hexagon/README                       |   8 +-
>   target/hexagon/gen_tcg_funcs.py             |  18 +-
>   46 files changed, 640 insertions(+), 677 deletions(-)
> 


