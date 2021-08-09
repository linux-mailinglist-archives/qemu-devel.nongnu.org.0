Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41D73E4D24
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 21:35:37 +0200 (CEST)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDB3g-0004WB-TO
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 15:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDB2i-0003jq-QL
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:34:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDB2h-0002Z1-7K
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:34:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id bo18so7572268pjb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 12:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pPcCycoZaAWKYNQlrXsatKDZcRD/A1Al+PwuNps7dTM=;
 b=OId5eN+vTUiPD0bFt/9drpraDb0ZabrRvz4mgArYtrN+GPxdtaPCCxFkiarF7pAIux
 SXqb0d5rW2yvLubXoLbMsO3HW84qBKXFjwM6LiCksEEMsrf5ZGiHPPkCSgusdbt+ztBY
 zRl3oT5scrEtnY2fcuVM9ytgUCtd9rtsyhLpAJ2qCV/TXB3JfGmHRmLN6S7BrDTBqtwG
 zRPjqXAtyKGcJvsxvQxMYApAWD8tMWnde1+EcRKafYE9VBSVHWG9kv8vUOvHP6k5LCB9
 s9/SuZU4uFJOirgAvl4UEF17tqA9+cwFdUGG2bxGcB0QFgunaAh3gRNb2VshrJC2hwrf
 fHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pPcCycoZaAWKYNQlrXsatKDZcRD/A1Al+PwuNps7dTM=;
 b=Ru3ykZVeXhpJoVYlxDs7VXSDQuqsddqfeEqhW/ogozOhJLv2yur/Ob3bDCh5BGTqgQ
 0/1G+0foo2T68r2HsEmXI2h3UeCOauDzx9IHVyNAPrIhEAmOEq634FNRbHya6i0ZjwHB
 UKvUp9i1eEacrTU0ju3rl3kfZ1puWxU9CqXPdiWgH04llMJo5WN+4S/3PxhUpyNO8lwD
 6Ukwho7uahwJdhQ7Bmb0KX7gE9U8Le/sxXINaQtYioPAOuYERUy2q22qNJrdxOW9CGUg
 FYrSi8V3aP5SiH3dVdd6ce41JYdOdOsgySnYhENWGZM2i7ytbO9FLnJ7dNuyqTpS5YaX
 maoQ==
X-Gm-Message-State: AOAM533Vw6hbY7fmPzM5oBvMWm1iBimzR1fQ+uBA3JlPO8yzJ+87Kh1Y
 KNgL0WDAxnFLQCiQn44jy1f3TQ==
X-Google-Smtp-Source: ABdhPJyUSLS/kL2uEA/v8MZDTzjiQEzmHnQPlwvdp+1za5y6NydSWLLHo+TNJ5Ld1zJ+OKnE1nOyCw==
X-Received: by 2002:a17:90a:9411:: with SMTP id
 r17mr26872892pjo.49.1628537673724; 
 Mon, 09 Aug 2021 12:34:33 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id x13sm19641429pjh.30.2021.08.09.12.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 12:34:33 -0700 (PDT)
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
 <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
 <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <249ce5f9-333a-7186-36bb-a2ecadb19254@linaro.org>
Date: Mon, 9 Aug 2021 09:34:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/21 3:45 PM, LIU Zhiwei wrote:
> 
> On 2021/8/6 上午3:06, Richard Henderson wrote:
>> On 8/4/21 4:53 PM, LIU Zhiwei wrote:
>>> +static TCGv gpr_src_u(DisasContext *ctx, int reg_num)
>>> +{
>>> +    if (reg_num == 0) {
>>> +        return ctx->zero;
>>> +    }
>>> +    if (ctx->uxl32) {
>>> +        tcg_gen_ext32u_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
>>> +    }
>>> +    return cpu_gpr[reg_num];
>>> +}
>>> +
>>> +static TCGv gpr_src_s(DisasContext *ctx, int reg_num)
>>> +{
>>> +    if (reg_num == 0) {
>>> +        return ctx->zero;
>>> +    }
>>> +    if (ctx->uxl32) {
>>> +        tcg_gen_ext32s_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
>>> +    }
>>> +    return cpu_gpr[reg_num];
>>> +}
>>
>> This is bad: you cannot modify the source registers like this.
> 
> In my opinion, when uxl32, the only meaningful part is the low 32 bits, and it doesn't 
> matter to modify the high parts.

Then why does the architecture manual specify that when registers are modified the value 
written sign-extended?  This effect should be visible...

> 
>>
>> These incorrect modifications will be visible to the kernel on transition back to S-mode.
> 
> When transition back to S-mode, I think the kernel will save the U-mode registers to memory.

... here.  Once we're in S-mode, we have SXLEN, and if SXLEN > UXLEN, the high part of the 
register will be visible.  It really must be either (1) sign-extended because U-mode wrote 
to the register or (2) unmodified from the last time S-mode wrote to the register.


r~

