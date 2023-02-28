Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5396A5DAD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 17:51:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX3BO-0007E5-QV; Tue, 28 Feb 2023 11:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX3B2-00079L-Gt
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:50:14 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pX3B0-000845-FA
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:50:08 -0500
Received: by mail-pl1-x635.google.com with SMTP id i5so9396933pla.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 08:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7C6qi5rHjTfbLJq0kaRGZoFs0Nz7cWB81wNV8QvLOdI=;
 b=Oplw051M0reok/lVt+twiOGmkZBP65T4OZXedhleOcev3KpPm5mUzbmw5EIY64Vfwk
 RKOkRyoJ9FuVgN1Ld0KgmN4+uhz+ByXkZ1LNIrPjc1RBo0rafO45dGGZRK2iiab17Ymu
 afzXRSc/hk+y7KAG7YFxBQFEqS6inpXERXdSjjGJsb9KkiHNOqK6UvzKVih3TGRmMWwh
 FfbL1NlZzRR/+vlHNa6QJ+5VGaKMa3yb6nLj4kMcJSsuXH8BDH6gGVFhY9/BkM0TZJTT
 ChuggTdK3uJBIVMIBUBwMiTCg0+/z2Okta3IvX4KF5fgT+s2NSsh/S/Cc+PdktqzM8pX
 rmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7C6qi5rHjTfbLJq0kaRGZoFs0Nz7cWB81wNV8QvLOdI=;
 b=J3A/9Q7wBcq1iCRPVorYDJUIf0y/rTddBsmBzeWjmQSpi6tFtP9JCuK67GX2ggYM/x
 /LfJkx5RfhCHwHKl9P6rgPIUw/X2Dfx7ajoks20wYKt9aNwoM3cnRgONu52pkvDhktUK
 tB8b4AUNjzGlqzLo9sjetzN+j3cXc2hBMdPUIel9mGPyYTrhjEoi7mTBdNPbeZbluN2t
 GvkBOko7qx7T8siVssUo/l/zYzfMViIaCPc4tm6ztXJzcD67RkjwJZA4bbRNTiElVEYF
 2qO72pqM8E5F5c+N8ADJ6FfDAJteqbhOnuEeZiaw/RRGTI+bzjcfvvlF7VGi7a7queyN
 RM1Q==
X-Gm-Message-State: AO0yUKXAtnBc7Z3nQSLp1V0qvRHSTHk6c5+y+1HnwVEgLIAkFGUQ1+l5
 qVPK9b9S7hCkIe63dHMKumVFkwQpbYGUonvYjKI=
X-Google-Smtp-Source: AK7set86pgMc07Gv4SAaHAWSznDt4S5Nd+wV9QGX7EpDnTJntavRVpi5N387DWuF/nsvYp8jnbrYPA==
X-Received: by 2002:a05:6a21:7892:b0:be:a55a:8910 with SMTP id
 bf18-20020a056a21789200b000bea55a8910mr4640452pzc.4.1677603004318; 
 Tue, 28 Feb 2023 08:50:04 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 h191-20020a6383c8000000b004fbfefd5183sm6054936pge.80.2023.02.28.08.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 08:50:03 -0800 (PST)
Message-ID: <00db0a28-ffdd-7fd9-e9d9-840e1821a640@linaro.org>
Date: Tue, 28 Feb 2023 06:50:01 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
 <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
 <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
 <e75fd2b7-9955-ad2b-62d2-30d7b85d7e7b@linaro.org>
 <f484b933-8f9f-6f0b-0d81-7202bed31d83@loongson.cn>
 <1ad204fc-8f7e-0f1c-e8f6-163d11f3880b@linaro.org>
 <c795a157-21a8-a8d7-bbc1-ed33e7f32747@loongson.cn>
 <9efbc9ba-9a5b-9c6e-9255-a407126c7c8a@linaro.org>
 <9f80521d-1106-08e2-b7c4-78c70027a7dc@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9f80521d-1106-08e2-b7c4-78c70027a7dc@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 2/27/23 21:44, gaosong wrote:
> Hi, Richard
> 
> 在 2023/2/25 上午7:01, Richard Henderson 写道:
>> On 2/23/23 21:24, gaosong wrote:
>>>          {
>>>              .fniv = gen_vaddwev_s,
>>>              .fno = gen_helper_vaddwev_w_h,
>>>              .opt_opc = vecop_list,
>>>              .vece = MO_32
>>>          },
>>>          {
>>>              .fniv = gen_vaddwev_s,
>>>              .fno = gen_helper_vaddwev_d_w,
>>>              .opt_opc = vecop_list,
>>>              .vece = MO_64
>>>          },
>>
>> Oh, these two can also include .fni4 and .fni8 integer versions, respectively, for hosts 
>> without the proper vector support.
>>
> OK,
> 
> but fno is not for hosts without the proper vector support?

For this definition, if the host has vector support, then the expansion will be done with 
.fniv, otherwise with .fno.


r~


