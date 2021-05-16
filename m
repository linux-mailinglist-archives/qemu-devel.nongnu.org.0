Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20B7381F09
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:13:11 +0200 (CEST)
Received: from localhost ([::1]:50764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGZy-0006mx-UE
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liGBw-00079e-O0
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:48:20 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liGBr-0007CC-M7
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:48:20 -0400
Received: by mail-wr1-x432.google.com with SMTP id v12so3621156wrq.6
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=npmLlgvh/2Lk0hyrusvODicj4RhI3pBzC/iFq4kJjDQ=;
 b=V04GzEZCBPIdRjX+OdPIsqi4wciwyteyU8pke3xom7x0BPsJsiIB3NEBzBlkCAoPe6
 cgOxSDLqhHQheoOExedfjXGU1IVkueOQ2DNixRDypCCbUI6bfaRY0V/ml/TNvRx2cIHk
 DIcOSD/OCtcaFacaT8Akz2YSbisFw0Rx5WcDdkz4UBXeG/fl4KOds1H1/3r6uxqwhuLP
 /96e+bCWpFGBmrtiWKErw0wqa6DcyRMcgit01nXKKk0rbWwZM7wa3ewcFEeRw/vLztyh
 D8mj3XksiX0Vl17dPtUKxh04kmVPF5inPtszjERmheRrklUplcOdJARSXeSrlnYNnJrZ
 GCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=npmLlgvh/2Lk0hyrusvODicj4RhI3pBzC/iFq4kJjDQ=;
 b=BkZ0p7RgSU7/vy/y2CzzjI/9aCTUOmcFgS/uJg1U98fS2qPFsn4RkzeH/nzxULGmmq
 MFqHPeTFXknAJuSzxjnSSCz5Z6LsOqizDp78oK90rF/Ovd3MqiT8EB0tFLfWbD6ZXRy1
 J2iriFInsSqZJmXxJ8LEoKU4Wh766UHmU0i0e+DxzTqY+hdQ/wYejWfQX5iyfun2EPEr
 PCc6DT06U+khQ8z+nBNSkUVBvDBOeRAn9L2CDPpMbSaiO9ElZWrgjdkXDRo1c6t+70Z/
 F3k1eFsdvKg+1a8JETUgll432PEnzXhp0d8ziundclHVPvmh3/5w9+iS47Dd8Ww8sVXz
 wQ8g==
X-Gm-Message-State: AOAM532YYRwer3h82s3IgurLPeTcLTt8J7azGs1OZz6+1nOwrJuUZXCP
 4Pk2SQwDW6D9aMDiPeA6KGE/rx99mdGMqA==
X-Google-Smtp-Source: ABdhPJys4Kz97YUestQ9ngg2n6t3NnVNNbipxB+zxDzxSMUKNlwY6aXI0VKYw3LuDiiFKGKpMpw6sg==
X-Received: by 2002:a05:6000:11ce:: with SMTP id
 i14mr10286616wrx.221.1621169292591; 
 Sun, 16 May 2021 05:48:12 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f20sm12339374wmh.41.2021.05.16.05.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 05:48:12 -0700 (PDT)
Subject: Re: [PATCH v6 07/26] tcg: Add tcg_call_func
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-8-richard.henderson@linaro.org>
 <0de997d8-407d-652c-f0ac-cce3365297ea@amsat.org>
 <5317b096-b9db-6601-172d-a7f48219d5d0@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f74eaf90-9a31-f6d8-ca87-5324b805453b@amsat.org>
Date: Sun, 16 May 2021 14:48:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5317b096-b9db-6601-172d-a7f48219d5d0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/21 3:21 AM, Richard Henderson wrote:
> On 5/3/21 4:50 PM, Philippe Mathieu-Daudé wrote:
>> Hi Richard,
>>
>> On 5/3/21 1:57 AM, Richard Henderson wrote:
>>> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
>>> ---
>>>   tcg/internal.h | 5 +++++
>>>   tcg/tcg.c      | 5 ++---
>>>   2 files changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tcg/internal.h b/tcg/internal.h
>>> index c2d5e9c42f..cd128e2a83 100644
>>> --- a/tcg/internal.h
>>> +++ b/tcg/internal.h
>>> @@ -32,6 +32,11 @@ typedef struct TCGHelperInfo {
>>>       unsigned typemask;
>>>   } TCGHelperInfo;
>>>   +static inline void *tcg_call_func(TCGOp *op)
>>> +{
>>> +    return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) +
>>> TCGOP_CALLI(op)];
>> Why not return tcg_insn_unit* type?
> 
> That's a fairly tcg code generation type -- this is used for more than
> that.  I think it's more natural to use void* when we don't know what
> the real type.

OK.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

