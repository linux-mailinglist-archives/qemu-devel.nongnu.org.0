Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3924436DAE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 00:44:10 +0200 (CEST)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdgnB-0004XH-5y
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 18:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgS8-0003KR-98
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:22:24 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:47034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgS4-0004NT-21
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:22:22 -0400
Received: by mail-pf1-x432.google.com with SMTP id x66so1882337pfx.13
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/LQiKtKWxRyxt3ErT4xqJWmTj3gJKVRVFGhad7puT7c=;
 b=CbJNJMP4GkjKPM6BOKrmWLUOyCCqaqNufCNoKLkdVVa228KhZre5TZJ/OPIFeGgdpE
 6xDQkvOwBlzVqEXa+I4fF2PogYL/8wwT3uMiwMFY3Y8/mvIHGMPvVq5UMTKrIH+CSh2U
 wlOYOhMWaLOuMGCvPOefW8Gf2ktUbBWg8iPFwqGk35xAWJB1e49On87byKgVGwtlCsSL
 ibAcerJgCeewyzHvrzmTHADeINxI2PhWzHFy3ivAFWcqKUbeU0jmETJRRZEh//veU+zY
 lQsLwB1afEzUi8CqSTULiYGO0DEBZFYUzgFvkxsKNgAgfPm/4zv0U5ekjwB5LQh40nSb
 4C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/LQiKtKWxRyxt3ErT4xqJWmTj3gJKVRVFGhad7puT7c=;
 b=GCz+IQaVizlz0bFJQY19Nis3ginYRynebKWL7mG+ja427SVKNhkEcVG9yhjyu0wci7
 wQIqsVnVLWDVqg9NgKYXwaRHt6NwDAh3hFgi3oQ45/PysW79Eos6s4Zvr/QiBmxHzq+5
 saq+p+4MJCwsBPOoe9dmvL6hcZW5Br73/LsQPK3QyYFzYottn5JfydOy4mz2Hpm7Da6G
 oDoJ6oMOqVaenn8IQwylm5BD7KFP83peaCzVjWaVDUTuYFUum86XZCFVoua5Gy2WCrmY
 c623/SPjCvuyECP5Ib6fT+T39HqRe04lRg3zgwNfo6Qrq233QmAwk80MgdJ7zV9HW4Tb
 2bHA==
X-Gm-Message-State: AOAM530o7HGcF66Y4JVjVnQjsL+XbZ/aFjjgLK+ppnLrm8HYO5yKKjB7
 3bGDePN/pOZDvsEEXFrJIlB/9A==
X-Google-Smtp-Source: ABdhPJzREifcVipPo5tWbIVo8a92rIdx7Zwy/WIU5aj1BiCx7TsADKLxPRjbjgx0dU+6dc+lNgmkJQ==
X-Received: by 2002:a05:6a00:1995:b0:44d:aa2c:e4ec with SMTP id
 d21-20020a056a00199500b0044daa2ce4ecmr8790418pfl.80.1634854938406; 
 Thu, 21 Oct 2021 15:22:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u12sm390279pfi.217.2021.10.21.15.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 15:22:17 -0700 (PDT)
Subject: Re: [PATCH v3 19/22] target/ppc: Move dquai[q], drint{x,n}[q] to
 decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-20-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f5095c94-abbd-40df-cd19-316032b535cf@linaro.org>
Date: Thu, 21 Oct 2021 15:22:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-20-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
> -#define GEN_DFP_T_B_U32_U32_Rc(name, u32f1, u32f2)    \
> -static void gen_##name(DisasContext *ctx)             \
> -{                                                     \
> -    TCGv_ptr rt, rb;                                  \
> -    TCGv_i32 u32_1, u32_2;                            \
> -    if (unlikely(!ctx->fpu_enabled)) {                \
> -        gen_exception(ctx, POWERPC_EXCP_FPU);         \
> -        return;                                       \
> -    }                                                 \
> -    gen_update_nip(ctx, ctx->base.pc_next - 4);       \

nip.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

