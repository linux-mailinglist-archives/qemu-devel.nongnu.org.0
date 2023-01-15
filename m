Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB6066AF17
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 03:35:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGsq6-0001V8-7a; Sat, 14 Jan 2023 21:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGsq2-0001Uu-Cb
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 21:33:40 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGsq0-00046K-LD
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 21:33:38 -0500
Received: by mail-pg1-x532.google.com with SMTP id s67so17427479pgs.3
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 18:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zzdgf8wFFBavsfZ0Hx/H26kw4BQUfvq0/4N5QmhA9ko=;
 b=fMOJ6eU8z40NJt2+b75jFqUd0mBZZRdkUOLQS8VGHWHSNUQuOmil2TijoZRq8c7Cmm
 c1cYwrEQsHo49AF6/s4alYRgjriC8w9wgVle5a1ZU8YdBlH7DAOTJzEbi5whrC14a7l/
 iT1EClMDP4evlm8CQu5SgT1i19tI39YdcoA1tSj9e4IF+mVsHWRUIa6IoccukCNY23xN
 yU2NKgnWURJflvB4GAPoJy5OD/KQPLKdyqiZ8jcJfGIYa/8+DeCbETGu3EH33A383FxV
 xTaziZ+PBjsI+4VQpEWVbm4QyvdFj2mtkW4nBDh2jBChv8cnJzkHkLyapfyD6iplfT/M
 WE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zzdgf8wFFBavsfZ0Hx/H26kw4BQUfvq0/4N5QmhA9ko=;
 b=YNo03cqp6/icgDXYomoHNYyFS9IYvAuVMxsbRu+NCTuLFplfeBq6Qrhcu7vle2ctS3
 HQCTQMW/JUCHykZ1N+mUrZlc6FiDudDqpkPOKhx+AZEyAXp1IfPgJmr7Rbk4l4CKV813
 RyqU4jdK076O4DOH/sqVbW7m1/YRC/wlsmyIQGrZHYqsse1chUkGEQnSeBssEfNvxqmN
 lCvK1odUTkkzuhf3SzF29pXYqb3BCBfaA7CFnrb5uoz9b1+E64NfOAqMotwRJ8KWBSm6
 u+cRn1PWWvrHFj8EFpYyLE8BKQvFLjpHsZpgDY5dfsWMc2djZSIbIBRwYmyBJDZT/bJT
 mWoA==
X-Gm-Message-State: AFqh2kpX6zx1F6sEZaBmKT8iV5UZZX3mFHzBRFH4GmcPkRzTqldJbWXf
 9GRRY32ObxQWZeKemGJLzJhW9mHtBAPMVYdB
X-Google-Smtp-Source: AMrXdXvJHl9nukGHeni5SE+Z9eYrIQOMNXKD5jeaV5lQ1c7OKN/FBhkFy8Z3yoUlDvqK+jOcducf4Q==
X-Received: by 2002:aa7:8f89:0:b0:58b:bce2:7eb7 with SMTP id
 t9-20020aa78f89000000b0058bbce27eb7mr6968798pfs.10.1673750014629; 
 Sat, 14 Jan 2023 18:33:34 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 g73-20020a62524c000000b0058b540b7ffesm7511373pfb.29.2023.01.14.18.33.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jan 2023 18:33:33 -0800 (PST)
Message-ID: <96b02ecf-b742-6ba1-fdab-0c3366c304cb@linaro.org>
Date: Sat, 14 Jan 2023 16:33:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 00/22] tcg: exit_tb tidy, goto_tb reorg
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Ping.

r~

On 1/8/23 15:42, Richard Henderson wrote:
> Small patch for exit_tb.  Large reorg for goto_tb, primarily aimed at
> fixing a race condition in which a host thread gets suspended in the
> middle of executing a two insn sequence, and the sequence is updated.
> The updated second insn does not match the previous first insn, so
> when the thread restarts the entire sequence will not branch to either
> the old or the new destination.
> 
> The middle-end is adjusted to support both direct and indirect jumps
> simultaneously, instead of depending on TCG_TARGET_HAS_direct_jump.
> This allows the backend to decide whether to use direct or indirect
> based on the branch displacement.  Which allows us to only update a
> single instruction, which means there's no multi-insn sequence that
> can be interrupted.
> 
> Changes for v2:
>    * Rebase on master,
>    * Remove if (0) accidentially left in tcg/sparc64/.
> 
> 
> r~
> 
> 
> Richard Henderson (22):
>    tcg: Split out tcg_out_exit_tb
>    tcg/i386: Remove unused goto_tb code for indirect jump
>    tcg/ppc: Remove unused goto_tb code for indirect jump
>    tcg/sparc64: Remove unused goto_tb code for indirect jump
>    tcg: Replace asserts on tcg_jmp_insn_offset
>    tcg: Introduce set_jmp_insn_offset
>    tcg: Introduce get_jmp_target_addr
>    tcg: Split out tcg_out_goto_tb
>    tcg: Rename TB_JMP_RESET_OFFSET_INVALID to TB_JMP_OFFSET_INVALID
>    tcg: Add gen_tb to TCGContext
>    tcg: Add TranslationBlock.jmp_insn_offset
>    tcg: Change tb_target_set_jmp_target arguments
>    tcg: Move tb_target_set_jmp_target declaration to tcg.h
>    tcg: Always define tb_target_set_jmp_target
>    tcg: Remove TCG_TARGET_HAS_direct_jump
>    tcg/aarch64: Reorg goto_tb implementation
>    tcg/ppc: Reorg goto_tb implementation
>    tcg/sparc64: Remove USE_REG_TB
>    tcg/sparc64: Reorg goto_tb implementation
>    tcg/arm: Implement direct branch for goto_tb
>    tcg/riscv: Introduce OPC_NOP
>    tcg/riscv: Implement direct branch for goto_tb
> 
>   include/exec/exec-all.h          |   5 +-
>   include/tcg/tcg.h                |  14 +--
>   tcg/aarch64/tcg-target.h         |   7 +-
>   tcg/arm/tcg-target.h             |   5 -
>   tcg/i386/tcg-target.h            |   9 --
>   tcg/loongarch64/tcg-target.h     |   3 -
>   tcg/mips/tcg-target.h            |   5 -
>   tcg/ppc/tcg-target.h             |   7 +-
>   tcg/riscv/tcg-target.h           |   4 -
>   tcg/s390x/tcg-target.h           |  11 --
>   tcg/sparc64/tcg-target.h         |   4 -
>   tcg/tci/tcg-target.h             |   4 -
>   accel/tcg/cpu-exec.c             |  16 ++-
>   accel/tcg/translate-all.c        |  10 +-
>   tcg/tcg-op.c                     |  14 +--
>   tcg/tcg.c                        |  42 +++++--
>   tcg/aarch64/tcg-target.c.inc     | 104 ++++++++--------
>   tcg/arm/tcg-target.c.inc         |  89 +++++++++-----
>   tcg/i386/tcg-target.c.inc        |  68 ++++++-----
>   tcg/loongarch64/tcg-target.c.inc |  66 +++++-----
>   tcg/mips/tcg-target.c.inc        |  59 +++++----
>   tcg/ppc/tcg-target.c.inc         | 193 +++++++++--------------------
>   tcg/riscv/tcg-target.c.inc       |  65 +++++++---
>   tcg/s390x/tcg-target.c.inc       |  67 +++++++----
>   tcg/sparc64/tcg-target.c.inc     | 201 ++++++++++++-------------------
>   tcg/tci/tcg-target.c.inc         |  31 +++--
>   26 files changed, 522 insertions(+), 581 deletions(-)
> 


