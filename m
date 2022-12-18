Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF065042B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:23:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xNk-0007OD-RV; Sun, 18 Dec 2022 12:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6xNh-0007Kl-Cf
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:23:21 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6xNe-0003zw-NU
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:23:20 -0500
Received: by mail-pl1-x62f.google.com with SMTP id d15so6961871pls.6
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EWRl/Jl5dr61re9zRcq1T8qyb15vaEIS0Z9dbDOm7B8=;
 b=dTcndfgz4hAqjw/Q5Bk8BKKX+DH5T6R/kQvXsusEzbOBGIyWjOikkBSRw2LA6pmT5C
 72Ga406mENLyFuOi94elVeO3oOgtjeMbSqysXpDn/EfeYYP27xSnyJZsj6JA+IAC1YGy
 RWaLwR/jKqCFX5TT5g56wTEdy+d6a26inuCn9bS+0DJ+OYYEcSBNca/KaE9FG/pcR4NT
 iws8r3GniY8CX+/vDEc8TjvqtVaf4qFeDYQ3FonUL7Mt5ZwVK9jJoczY2bnXe7fKd3f/
 S8FKSUGahVkMiOJdt+1PdWy5AKII5OoFb6a/hgYgusKZ+mtyZYxkp25XtdSX16P2rnva
 mang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EWRl/Jl5dr61re9zRcq1T8qyb15vaEIS0Z9dbDOm7B8=;
 b=J2SDp+oomsUvwqyINkpcqt6MIz8Csc03gqfbdKfvL8/bgSlf6Sw25LmoYaZDcdApVv
 UQRuTvwC/tzqzVwdicOUomQ+xPksDLngB4dzJWGDCwUMkqMpat91mC+Coc/C1dsZAE9v
 5AABqZ41isoIRmLA0qC0X/Dhd1A7WrvXjaDDy1i4k2znidOmt1h8q5JytS8GPybaF3c4
 HJdL9KZmcPE5yYmMqdn0W1Dfp6QwllpZ9v1G88aXejajuXRzc/OqMQ0AQ+p91HnZaBtm
 ZxckSHtG4XaWeATvNv0bEFqkinVmk4/nW33YvCHiyfi4m+ACfDH9NSQkSf959rpsA4aw
 VXRA==
X-Gm-Message-State: ANoB5pkI4qJyPTK6Z+JPoGuJ1tnEOBCEBPowGrdGrD9//WD99WFA/3G1
 yZJHse23owqobWHyYeLrfIlJhvQyi9PwRrvb
X-Google-Smtp-Source: AA0mqf71frxbTRuZ9ddttMVbBz43kmRgykyYUYdyVBy97691ahEw34VtEpzqZ0QUx6lT7+a1UWnO1g==
X-Received: by 2002:a17:90a:c28b:b0:219:76d5:8da7 with SMTP id
 f11-20020a17090ac28b00b0021976d58da7mr41014500pjt.23.1671384196998; 
 Sun, 18 Dec 2022 09:23:16 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3808:f064:41b8:eb9e?
 ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 q43-20020a17090a17ae00b0021929c71b14sm7961875pja.40.2022.12.18.09.23.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 09:23:16 -0800 (PST)
Message-ID: <cab6b4d0-a08f-ef0c-6471-5d2ed0b15862@linaro.org>
Date: Sun, 18 Dec 2022 09:23:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 00/27] tcg misc patches
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 12/13/22 13:25, Richard Henderson wrote:
> For v4, I've sorted some of the reviewed patches to the beginning
> of the queue and omitted them; this was not possible for all.
> This set begins with the first patch that is missing review.
> I've not tested this set separately, so in case it doesn't apply,
> the entire tree is
> 
>    https://gitlab.com/rth7680/qemu/-/tree/tcg-next
> 
> Patches lacking review:
>    01-tcg-Fix-tcg_reg_alloc_dup.patch
>    02-tcg-Centralize-updates-to-reg_to_temp.patch
>    03-tcg-Remove-check_regs.patch
>    04-tcg-Introduce-paired-register-allocation.patch
>    05-accel-tcg-Set-cflags_next_tb-in-cpu_common_initfn.patch
>    06-target-sparc-Avoid-TCGV_-LOW-HIGH.patch
>    09-tcg-Simplify-calls-to-temp_sync-vs-mem_coherent.patch
>    17-accel-tcg-plugin-Don-t-search-for-the-function-po.patch
>    20-tcg-Vary-the-allocation-size-for-TCGOp.patch
>    22-tcg-Reorg-function-calls.patch
>    23-tcg-Convert-typecode_to_ffi-from-array-to-functio.patch
>    24-tcg-Factor-init_ffi_layouts-out-of-tcg_context_in.patch
>    25-tcg-Move-ffi_cif-pointer-into-TCGHelperInfo.patch
>    26-tcg-aarch64-Merge-tcg_out_callr-into-tcg_out_call.patch
> 
> 
> r~
> 
> 
> Philippe Mathieu-Daudé (2):
>    tcg: Convert typecode_to_ffi from array to function
>    tcg: Factor init_ffi_layouts() out of tcg_context_init()
> 
> Richard Henderson (25):
>    tcg: Fix tcg_reg_alloc_dup*
>    tcg: Centralize updates to reg_to_temp
>    tcg: Remove check_regs
>    tcg: Introduce paired register allocation
>    accel/tcg: Set cflags_next_tb in cpu_common_initfn
>    target/sparc: Avoid TCGV_{LOW,HIGH}
>    tcg: Move TCG_{LOW,HIGH} to tcg-internal.h
>    tcg: Add temp_subindex to TCGTemp
>    tcg: Simplify calls to temp_sync vs mem_coherent
>    tcg: Allocate TCGTemp pairs in host memory order
>    tcg: Move TCG_TYPE_COUNT outside enum
>    tcg: Introduce tcg_type_size
>    tcg: Introduce TCGCallReturnKind and TCGCallArgumentKind
>    tcg: Replace TCG_TARGET_CALL_ALIGN_ARGS with TCG_TARGET_CALL_ARG_I64
>    tcg: Replace TCG_TARGET_EXTEND_ARGS with TCG_TARGET_CALL_ARG_I32
>    tcg: Use TCG_CALL_ARG_EVEN for TCI special case
>    accel/tcg/plugin: Don't search for the function pointer index
>    accel/tcg/plugin: Avoid duplicate copy in copy_call
>    accel/tcg/plugin: Use copy_op in append_{udata,mem}_cb
>    tcg: Vary the allocation size for TCGOp
>    tcg: Use output_pref wrapper function
>    tcg: Reorg function calls
>    tcg: Move ffi_cif pointer into TCGHelperInfo
>    tcg/aarch64: Merge tcg_out_callr into tcg_out_call
>    tcg: Add TCGHelperInfo argument to tcg_out_call
> 
>   include/exec/helper-head.h       |    2 +-
>   include/tcg/tcg-op.h             |   35 +-
>   include/tcg/tcg.h                |   96 +-
>   tcg/aarch64/tcg-target.h         |    3 +-
>   tcg/arm/tcg-target.h             |    3 +-
>   tcg/i386/tcg-target.h            |    2 +
>   tcg/loongarch64/tcg-target.h     |    3 +-
>   tcg/mips/tcg-target.h            |    4 +-
>   tcg/riscv/tcg-target.h           |    7 +-
>   tcg/s390x/tcg-target.h           |    3 +-
>   tcg/sparc64/tcg-target.h         |    3 +-
>   tcg/tcg-internal.h               |   58 +-
>   tcg/tci/tcg-target.h             |    7 +
>   accel/tcg/plugin-gen.c           |   54 +-
>   hw/core/cpu-common.c             |    1 +
>   target/sparc/translate.c         |   21 +-
>   tcg/optimize.c                   |   10 +-
>   tcg/tcg-op-vec.c                 |   10 +-
>   tcg/tcg-op.c                     |   49 +-
>   tcg/tcg.c                        | 1591 +++++++++++++++++++-----------
>   tcg/aarch64/tcg-target.c.inc     |   19 +-
>   tcg/arm/tcg-target.c.inc         |   10 +-
>   tcg/i386/tcg-target.c.inc        |    5 +-
>   tcg/loongarch64/tcg-target.c.inc |    7 +-
>   tcg/mips/tcg-target.c.inc        |    3 +-
>   tcg/ppc/tcg-target.c.inc         |   34 +-
>   tcg/riscv/tcg-target.c.inc       |    7 +-
>   tcg/s390x/tcg-target.c.inc       |   12 +-
>   tcg/sparc64/tcg-target.c.inc     |    3 +-
>   tcg/tci/tcg-target.c.inc         |    3 +-
>   30 files changed, 1285 insertions(+), 780 deletions(-)
> 


