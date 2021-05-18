Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F356387B21
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:29:29 +0200 (CEST)
Received: from localhost ([::1]:47498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0iu-0001ve-K2
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0hQ-0000G4-FO
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:27:56 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:39786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0hO-0001Li-Qk
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:27:56 -0400
Received: by mail-ua1-x931.google.com with SMTP id a12so3292991uak.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kmJEJEIEu2V4ecwMZE5l48qY6xxsQ0QFV8BvT4lmjAU=;
 b=JbiYaz9K+m5CcOUFYcbR6dd0tk8duoktFZEFO/0m+nexl2vn8UhmXWNXMMJxMvhcys
 HhiVHk75xSbEEbtaIirMCqmYIklwv5VZi6LzTrjt8zwxgaRQ0Il9622qSUdiFDjeMrZ4
 3x4pPrqS0gU46RZdUrqbbmejlTaOBFA2hENBPN7qVWq1uB1kZ32HjoO5361Q+aAPuwpd
 38CQ+IAukvTQXNOIhMuZE+3+aMAGErIFwHhQ/idv7ZXA7Fhi+i3cIbt21hxaYsnIy08r
 RpKzjHyeX8JehD3vPsOWpSsxM3aYa0TnTIURDoG3qq4NvVYKgaHzjuH27FhIHvuddeOh
 EZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmJEJEIEu2V4ecwMZE5l48qY6xxsQ0QFV8BvT4lmjAU=;
 b=AjqmSAR0g5zAugb/IZmOZHPb/XDR0RE7gnWpVBtEskMBllfXXc7Vh/VY1w5JfagXXv
 q0l0ap3keLNTpt9aZGc2Vh/mQjF4XsH3WUCh/7uZRi63LWOlzAWXnfwjedJko9uQ2Ljn
 hU4VX9cwpk/I7i9ewciEegXb0LKAp0kv8pKzMWsotyv6WnYp8wReX0dpS3jRVE0+kObn
 7mZTy6ZtFMrT6oOZjtCAgUMXybUwC56mfJuWZDbH1EUkR0RSmFAkV0J96QttGHC6Umd9
 af0nFE7d13f6rDZxajeqYE6zzA5hg4Zz5+IAepd0aYim6Itmq4SpYPT6W7eMBJZoYQOP
 rEkw==
X-Gm-Message-State: AOAM532Gj7K40fsoiv6heIFhZYwY5RIVIoSGppwUd0Qmv02vMpCuUXAJ
 0LuCmavUN7liqrZNuh6erC/rbQ==
X-Google-Smtp-Source: ABdhPJwJtGie1Q5Tx+NJV7mUaA+00fa/SwEFMcpce0z4GOR9+o6ja5BNbhrDGMCrEAXbAfwqicJtbQ==
X-Received: by 2002:ab0:5a61:: with SMTP id m30mr6467042uad.125.1621348072370; 
 Tue, 18 May 2021 07:27:52 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id x187sm2749577vkf.55.2021.05.18.07.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 07:27:52 -0700 (PDT)
Subject: Re: [PATCH v1 06/11] target/arm: Implement bfloat16 dot product
 (vector)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-7-richard.henderson@linaro.org>
 <CAFEAcA8xEJrECb9+nb_8Xn+ZHigJPQKP6pQgp=PqJsqT4tyrmg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d4684801-7d2a-55d8-c022-c4bcdabc1b6c@linaro.org>
Date: Tue, 18 May 2021 09:27:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8xEJrECb9+nb_8Xn+ZHigJPQKP6pQgp=PqJsqT4tyrmg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x931.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 7:15 AM, Peter Maydell wrote:
> On Sat, 17 Apr 2021 at 01:02, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This is BFDOT for both AArch64 AdvSIMD and SVE,
>> and VDOT.BF16 for AArch32 NEON.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> @@ -12326,6 +12336,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
>>           }
>>           return;
>>
>> +    case 0xf: /* BFDOT */
>> +        switch (size) {
>> +        case 1:
>> +            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfdot);
>> +            break;
>> +        default:
>> +            g_assert_not_reached();
>> +        }
>> +        return;
> 
> The switch on size here seems unnecessary to me given we've already
> decoded size earlier in the function.

Size is opcode here, and the switch gains extra members as we continue.  I'm 
beginning the form we need to continue with.


r~

