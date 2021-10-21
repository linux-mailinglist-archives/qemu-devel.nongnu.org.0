Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90127436DB8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 00:48:01 +0200 (CEST)
Received: from localhost ([::1]:55836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdgqu-0002Da-LS
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 18:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgej-0003tO-Qn
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:35:26 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgeh-0006tt-1l
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:35:25 -0400
Received: by mail-pg1-x530.google.com with SMTP id g184so1580629pgc.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 15:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QIoqRIbfQaLvWZimKieQRtbuv5GMAfVPt2Bcd+cG4gw=;
 b=XiWrQbVn/rmQsDG9wjFbbqRmBjHZFFthcHmE5FHVL4H1g1yLEACuIyKEPD6lN4Mrau
 cYN0o5H3OqBigP7h5S3MjZD4PB6sUTFQYR8t3LQWcr9fQ/cVG+7k/m30IjUZM1uAaSVS
 3K4m0PEeGU5IXlZjTm0RZzA1jWHZTEBjHHDQ/1ldkKhWbgLLDBGh5fzYAA5K9echK+tn
 gBqUoLbR3u8gTAHW54B5qNtsuLWp2lh/d497rssT7N0gCcTtUQJXr+vlMKh4XHeSZa1r
 MVYGz5fXdwAVYm5om910NHSSuFDFYnekWfisDpWT1YI+VERtIXoDTKU1lYz/rxeWn37q
 spoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QIoqRIbfQaLvWZimKieQRtbuv5GMAfVPt2Bcd+cG4gw=;
 b=lmAbVc2Mkc0UxK33hafsxLjI2BK9G4AFTaRr/Xq7pCjxHmGKOO9P6vNPQV2r6/7DJc
 7oZn5mb2YmNbdX4YYLlSqt5EEGEpOyW0xpoXemvGlL4mkSS5l/AgMZhB/JqdK76IIryk
 X+p+KmG+g8LNh/OJ8MBiwNN4Mk7W9mxe7/qxILVyjq44m6C8YGZFjekPOjyrOP8GM/xJ
 0zOvdxBO6BXdQuUVxL0i79Y6vonAyCmJkQtPWZGinzws2GnAgAsfy+fsEQ03MmIguqu5
 ADHOsKPt+E6WduHYZq/U9NkEwe98P/eOqkIMNo4UoPHOeJ0+lTjobt88J9DI48m4mfpH
 JJ/Q==
X-Gm-Message-State: AOAM5329Wowa84DmRgRgwr4pbcCYIcks7wE85wbp8BOeXUr4OKUJHsf3
 avc/oH+agSYb7kU/WiP0Eun+0g==
X-Google-Smtp-Source: ABdhPJxoJvF5mLY442ZGRDNl8gOPf7PUbYgIfCbUmDaO9gImL07f22o+pmODbYP34zyxFwY/RDy/qA==
X-Received: by 2002:a63:8c54:: with SMTP id q20mr4628219pgn.420.1634855721316; 
 Thu, 21 Oct 2021 15:35:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id rj6sm11266354pjb.30.2021.10.21.15.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 15:35:20 -0700 (PDT)
Subject: Re: [PATCH v3 21/22] target/ppc: Move
 dct{dp,qpq},dr{sp,dpq},dc{f,t}fix[q],dxex[q] to decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-22-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <471ebd3f-bf8b-ef16-1412-071ced0d1bdc@linaro.org>
Date: Thu, 21 Oct 2021 15:35:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-22-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> -#define GEN_DFP_T_B_Rc(name)                     \
> -static void gen_##name(DisasContext *ctx)        \
> -{                                                \
> -    TCGv_ptr rt, rb;                             \
> -    if (unlikely(!ctx->fpu_enabled)) {           \
> -        gen_exception(ctx, POWERPC_EXCP_FPU);    \
> -        return;                                  \
> -    }                                            \
> -    gen_update_nip(ctx, ctx->base.pc_next - 4);  \

nip.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

