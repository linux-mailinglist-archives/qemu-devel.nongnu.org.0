Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C341C31A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 12:58:24 +0200 (CEST)
Received: from localhost ([::1]:34042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVXI6-0004SB-KM
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 06:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVXFv-0002rh-1Y
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:56:07 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:33674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVXFp-0003Kc-Mq
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:56:06 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 d12-20020a05683025cc00b0054d8486c6b8so2390158otu.0
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 03:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dPQO6ibacWp/r8r6sqYb9wSJOhUvdZMWyTtk37qqhxs=;
 b=N4JNIus2yZ31AJ3P+eK7RnDdc3U1MPrfmbq5M+rWGp9Kwle4D1Kd6COk/G7w3b/01u
 tXnZXU3ywpwXpJujkcW6W296zJCE8uB+V8okxEVPLqhnxZeyyFmmmEY8h8wILmNRHLFJ
 sd9W3tTgpswmdKen8JPlKNZsNOH+k5csacXQHSDLrjO66mcwZE+oF2nP1I1UKG3FZwoR
 TZLGFpHV8pDybdG75NBX0LVTqtERk6Cg6rbXQv/s8ptRKj8wGtX6hsFWx8RFk8iwk5li
 CEY32uh4A0ftOBzFaOa+ICUvOZsklvzouBOn4A5CQJPpQLWmweeG157mYSzJxrykKgmU
 78zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dPQO6ibacWp/r8r6sqYb9wSJOhUvdZMWyTtk37qqhxs=;
 b=ByL596qDoPwTiyLD4ULIz9bTS2P3DBl8sdsHbk1bASjS9kG/hJXrHN/u/BMtRzXHuC
 7vXnS6YedRj1e3J8M4+BcKfyGq9GjW/qFPqDe1D+bsg+pb+4Ypvy2Df2wp45o6J7vRHV
 T2voDtD+/elOZqTReKF4X/bNEUIS8ZpaAfcwUhXt67XFnnzHu9xSWzeh870E1+8vhUsE
 n1ByDAs09CX7rJboU7wue80bi55qoxAkmxf0kmzFYlXOSGq2LilqF4A4fQEPhPb+BFuR
 beiHL+tU2dmSLxd3JoJ13BYPMxjKMrApibWAcQwcitLjf2D7QIWCR4NDmYNZacMiUNaD
 tCmA==
X-Gm-Message-State: AOAM53099tyuIJseplvHGHmGxcnMjlWUEWsXDBXISwLsqdSHc/EOiKCw
 7y+jMqy8FjayeBhtNsesneMSCg==
X-Google-Smtp-Source: ABdhPJyYSVG1SP1vu8IkWUBAOSGDRR7lja5UqjFuaWa+Xn4E6sq7RigqPkRYhoGAANeQW6aL8PF5FA==
X-Received: by 2002:a05:6830:2706:: with SMTP id
 j6mr9724373otu.380.1632912960252; 
 Wed, 29 Sep 2021 03:56:00 -0700 (PDT)
Received: from [192.168.60.34] ([172.58.171.180])
 by smtp.gmail.com with ESMTPSA id l25sm382299oic.54.2021.09.29.03.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 03:55:59 -0700 (PDT)
Subject: Re: [PATCH v12 3/7] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for the h-mode
To: Alexey Baturo <baturo.alexey@gmail.com>
References: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
 <20210928190036.4114438-4-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cfb0d0d1-981b-4762-d563-4ed0f5279f4d@linaro.org>
Date: Wed, 29 Sep 2021 06:55:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928190036.4114438-4-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.03,
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, space.monkey.delivers@gmail.com,
 Alistair.Francis@wdc.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 3:00 PM, Alexey Baturo wrote:
> +    switch (env->priv) {
> +    case PRV_M:
> +        cur_bit_pos = M_PM_CURRENT;
> +        break;
> +    case PRV_S:
> +        cur_bit_pos = S_PM_CURRENT;
> +        break;
> +    case PRV_U:
> +        cur_bit_pos = U_PM_CURRENT;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    pm_current = get_field(env->mmte, cur_bit_pos);

Nit: If you have a look at what the get_field macro does, you'll see that you always want 
to give it a constant, so the compiler can fold all of the arithmetic into a constant 
bitfield extract.  It is not a win to pull the field argument out into a variable like this.

For this reason I prefer the hw/registerfields.h interface -- it is more difficult to misuse.


r~

