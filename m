Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068E46FDC70
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 13:17:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwhoM-0005B2-Bz; Wed, 10 May 2023 07:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwhoJ-00056t-Ce
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:16:44 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwhoH-0001vY-MK
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:16:43 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so4689385f8f.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 04:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683717400; x=1686309400;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iNZjaIU9RB36BvuQW1Xyzhpu0O5RW4gmkW9GMxS71V0=;
 b=malMH8MtL5eM+zqmgCyw6UWlLpsJ5tiFGALd71JRu6+uIwjo7qwlAqdPwz30updJzB
 Mnl7UxuxmZjIrEP0++mRdUpNJGnk/wh0jn4u8EP89ZDfiCWgrqtAgMjjW+gAIHOG8VqE
 K3152Pi1GfmgGv8dow6TFUJdnADLXS5wpb0VmCh7CgvmretiR5DJYg0xOxx1N932WF9X
 vibyYAUZUIRRu1HXzt2lkXHIm3v8swcWEUyMvfaBVV+Hc7tweD32cDFuYxZUNzMHZZxa
 zW7+D0aKkD9ajuj/xpqUF/76Vu0+XvClJH0ktDo2/9+VaQqF1p9rTdutbq2uGMhz/dI/
 4sWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683717400; x=1686309400;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iNZjaIU9RB36BvuQW1Xyzhpu0O5RW4gmkW9GMxS71V0=;
 b=ZxjzJohh6nDdb1Px300vhmzmqm1tKfTdTeD5tOtrUZG1uNYArDalCFPcQxi5dcaA7X
 4TkfCGhnXHt2EcHguZF2qF/+WqsEzI+/QCqd8pKT58LJ4BCVS1VEuCqpUQlc9fVCtktR
 RNtX2zF38yvd3TQlRv+nFMGhmvyPuGxR05NY8GrqihxZEYr2OZTeIS4k4cqndISY+xmj
 1CdwqFZVRwKvzRNVKdxI4b5Ag/8Wvwlv+qSShizbvi9TUynpKfzvi+jrPUrNUpFQ33Tq
 oT3x415hNO2nnCMj0FGtBOf0l7ZgyLQuyiiwLNBbWmpD1G3MXdhwi4wE3JNgkUcr9F8V
 f79Q==
X-Gm-Message-State: AC+VfDx0fbY0smEhRWLay28xpLtnO9+W8/frPXJEPjXZ9P7HnZQnH+HL
 vya7kmUeW/+oXxm/GPAO3lks2F92xDDKA3gDa3BpZw==
X-Google-Smtp-Source: ACHHUZ5dhRP8OYWSuDF/cg3wK/wQy+PwubdXg4h1qaPu42sKkv/Q7E+h9qgme0DX//peSc5Ua/aUbw==
X-Received: by 2002:a5d:5286:0:b0:2cf:ee9d:ce2f with SMTP id
 c6-20020a5d5286000000b002cfee9dce2fmr12334943wrv.19.1683717399942; 
 Wed, 10 May 2023 04:16:39 -0700 (PDT)
Received: from [192.168.10.24] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a5d5112000000b002fed865c55esm16891628wrt.56.2023.05.10.04.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 04:16:39 -0700 (PDT)
Message-ID: <1d7351fd-d3d0-6820-ab93-6d2e08e153c8@linaro.org>
Date: Wed, 10 May 2023 12:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/16] tcg: Remove TARGET_ALIGNED_ONLY
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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

Ping for mips, nios2, sh4.
The portions for alpha, hppa and sparc have been merged.

r~

On 5/2/23 17:08, Richard Henderson wrote:
> Based-on: 20230502135741.1158035-1-richard.henderson@linaro.org
> ("[PATCH 0/9] tcg: Remove compatability helpers for qemu ld/st")
> 
> Add MO_ALIGN where required, so that we may remove TARGET_ALIGNED_ONLY.
> This is required for building tcg once, because we cannot have multiple
> definitions of MO_ALIGN and MO_UNALN.
> 
> 
> r~
> 
> 
> Richard Henderson (16):
>    target/alpha: Use MO_ALIGN for system UNALIGN()
>    target/alpha: Use MO_ALIGN where required
>    target/alpha: Remove TARGET_ALIGNED_ONLY
>    target/hppa: Use MO_ALIGN for system UNALIGN()
>    target/hppa: Remove TARGET_ALIGNED_ONLY
>    target/mips: Add MO_ALIGN to gen_llwp, gen_scwp
>    target/mips: Add missing default_tcg_memop_mask
>    target/mips: Use MO_ALIGN instead of 0
>    target/mips: Remove TARGET_ALIGNED_ONLY
>    target/nios2: Remove TARGET_ALIGNED_ONLY
>    target/sh4: Use MO_ALIGN where required
>    target/sh4: Remove TARGET_ALIGNED_ONLY
>    target/sparc: Use MO_ALIGN where required
>    target/sparc: Use cpu_ld*_code_mmu
>    target/sparc: Remove TARGET_ALIGNED_ONLY
>    tcg: Remove TARGET_ALIGNED_ONLY
> 
>   configs/targets/alpha-linux-user.mak       |   1 -
>   configs/targets/alpha-softmmu.mak          |   1 -
>   configs/targets/hppa-linux-user.mak        |   1 -
>   configs/targets/hppa-softmmu.mak           |   1 -
>   configs/targets/mips-linux-user.mak        |   1 -
>   configs/targets/mips-softmmu.mak           |   1 -
>   configs/targets/mips64-linux-user.mak      |   1 -
>   configs/targets/mips64-softmmu.mak         |   1 -
>   configs/targets/mips64el-linux-user.mak    |   1 -
>   configs/targets/mips64el-softmmu.mak       |   1 -
>   configs/targets/mipsel-linux-user.mak      |   1 -
>   configs/targets/mipsel-softmmu.mak         |   1 -
>   configs/targets/mipsn32-linux-user.mak     |   1 -
>   configs/targets/mipsn32el-linux-user.mak   |   1 -
>   configs/targets/nios2-softmmu.mak          |   1 -
>   configs/targets/sh4-linux-user.mak         |   1 -
>   configs/targets/sh4-softmmu.mak            |   1 -
>   configs/targets/sh4eb-linux-user.mak       |   1 -
>   configs/targets/sh4eb-softmmu.mak          |   1 -
>   configs/targets/sparc-linux-user.mak       |   1 -
>   configs/targets/sparc-softmmu.mak          |   1 -
>   configs/targets/sparc32plus-linux-user.mak |   1 -
>   configs/targets/sparc64-linux-user.mak     |   1 -
>   configs/targets/sparc64-softmmu.mak        |   1 -
>   include/exec/memop.h                       |  13 +--
>   include/exec/poison.h                      |   1 -
>   target/alpha/translate.c                   |  38 ++++----
>   target/hppa/translate.c                    |   2 +-
>   target/mips/tcg/mxu_translate.c            |   3 +-
>   target/nios2/translate.c                   |  10 ++
>   target/sh4/translate.c                     | 102 +++++++++++++--------
>   target/sparc/ldst_helper.c                 |  10 +-
>   target/sparc/translate.c                   |  66 ++++++-------
>   tcg/tcg.c                                  |   5 -
>   target/mips/tcg/micromips_translate.c.inc  |  24 +++--
>   target/mips/tcg/mips16e_translate.c.inc    |  18 ++--
>   target/mips/tcg/nanomips_translate.c.inc   |  32 +++----
>   37 files changed, 186 insertions(+), 162 deletions(-)
> 


