Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32996EF98A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 19:40:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prj7i-0002xF-E2; Wed, 26 Apr 2023 13:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prj7g-0002x5-Qc
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:40:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prj7b-0002wb-Sd
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:40:05 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f87c5b4635so6716366f8f.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 10:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682530800; x=1685122800;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rv3iqsXOd9TiduGxhU9+cyt5UkSKcX66zJG5RtZMf4g=;
 b=OmBq3rUA71nF0Inh0R4KNGFYu4DQrrv8ArACU3IVq3Os8X9oMEGEbVTSyUkJZweEku
 0g/EeLQKZ2VnJFWvOd+kwChpsvJ3NpN5kmJ4V4evTWJIsydnBb9Vdt626MYGl9L9skCF
 x+az5u1DNFoLGZ06Zk8nGgJ7s4BbxiKfTRW83r1HvM8hzTAuxgeSE7iy/WUsazjhDdeS
 XNTCOBUaYC6WGHVwYtSBujzbUsXnrXBP2/t/ougbXV2czmBmkxhPiHbdkDs3LiTg/wqZ
 WLujEdIOfYt8iTCvy0aqxIqy4Njy/8rYhvyK4fXB4q8niLINrap0yQC15gUfgZ3mTtyb
 rMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682530800; x=1685122800;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rv3iqsXOd9TiduGxhU9+cyt5UkSKcX66zJG5RtZMf4g=;
 b=KzR8pu9y56eE0mVlPfs9H1ADw2Dk/FuBXxnSzDqfdFdcrrPVbLK/ixZMFSKlJiEOWT
 P2i0XT4cnheywnMfDddCH62PhiglT4UNBtOCdM8xAIidoSsU0ARaWDsViBIOTbxIGkJa
 dMHUQP7XHU2rSw9WFqtFcAK7MdSa1iQ5UZjBSUHywx7YeRXb4sX2NoAEPu5D65XaDKSj
 iy0C7CVegLXe+Jy65nzlnEXkbO0agtoPOHQ4nDKM7xK7zCljmO+VKrk472wDowEeYTAu
 wZTFXbZiRMgBfRRAGPNQqKYIyZuEkMOlHDdPC2vv+RA3d6LN+l8K3zMQjWC4pUt3SA4K
 pI5Q==
X-Gm-Message-State: AAQBX9fA6/FXe/UhhlrHbHTZxFqNi74te9gXNC74PrIJt8wIMNG0tp20
 iq/t1ApNi4GOZ+aLK3zvRr/Q9Q==
X-Google-Smtp-Source: AKy350bgTlkEDNshBReWTvMrTAvokeerci9oo5Ay7qPBS10VpjaO+lCYz9OeSTePcbjiOjKpV8oFVA==
X-Received: by 2002:a5d:4c4f:0:b0:304:760c:6471 with SMTP id
 n15-20020a5d4c4f000000b00304760c6471mr8473194wrt.32.1682530799778; 
 Wed, 26 Apr 2023 10:39:59 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 g18-20020adff3d2000000b002fb2782219esm16531569wrp.3.2023.04.26.10.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 10:39:59 -0700 (PDT)
Message-ID: <c2569a8f-c8f2-f645-339a-8efa4db74b76@linaro.org>
Date: Wed, 26 Apr 2023 18:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 04/21] Hexagon (target/hexagon) Add overrides for
 allocframe/deallocframe
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004130.1318973-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004130.1318973-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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

On 4/26/23 01:41, Taylor Simpson wrote:
> +#ifndef CONFIG_HEXAGON_IDEF_PARSER
> +/* frame = ((LR << 32) | FP) ^ (FRAMEKEY << 32)) */
> +static void gen_frame_scramble(TCGv_i64 result)
> +{
> +    TCGv_i64 framekey = tcg_temp_new_i64();
> +    tcg_gen_extu_i32_i64(framekey, hex_gpr[HEX_REG_FRAMEKEY]);
> +    tcg_gen_shli_i64(framekey, framekey, 32);
> +    tcg_gen_concat_i32_i64(result, hex_gpr[HEX_REG_FP], hex_gpr[HEX_REG_LR]);
> +    tcg_gen_xor_i64(result, result, framekey);
> +}
> +#endif

Better as

     tmp = tcg_temp_new_i32();
     tcg_gen_xor_i32(tmp, hex_gpr[HEX_REG_LR], hex_gpr[HEX_REG_FRAMEKEY]);
     tcg_gen_concat_i32_i64(result, hex_gpr[HEX_REG_FRAMEKEY], tmp);

> +#ifndef CONFIG_HEXAGON_IDEF_PARSER
> +/* Stack overflow check */
> +static void gen_framecheck(TCGv EA, int framesize)
> +{
> +    /* Not modelled in linux-user mode */
> +    /* Placeholder for system mode */
> +}

g_assert_not_reached();

> +    TCGv_i64 frame = tcg_temp_new_i64();
> +    tcg_gen_addi_tl(r30, r29, -8);
> +    gen_frame_scramble(frame);

Perhaps better as

     TCGv_i64 frame = gen_frame_scramble();

with the allocation inside the subroutine.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

