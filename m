Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633342FC0C6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:20:57 +0100 (CET)
Received: from localhost ([::1]:44108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xUg-0007oQ-4n
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1wXn-0004eA-75
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 14:19:59 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1wXk-0007Z7-L8
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 14:19:58 -0500
Received: by mail-pg1-x532.google.com with SMTP id p18so13545795pgm.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 11:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=93bZXThkPBbLLK2hGNJCA/sR9uUbksalIT3IgCsYe7A=;
 b=rEg05OezxtmWq6kcVMWFLsiIZh8cE223RPqhWwponnHqBKt0BzlT84g+SgIwrpuL+k
 PyhHNh4u43cu6FXJqQQrlAKmJi4990sHKplBRg4/b5vMqVKfdpdid+aO3vraeJQ2vQkR
 h8BDI1ghsxFUuockH15pa8OYWGQT/i4FTvvWhtHIsxU3Wt6LTMB03wKJzwrBK/iyMT+9
 Hv/KW36MOyBlFKdcmtXIL5ojX5RnwFOsGAAO5R6FZuFxq6Xxd7w5bKAm/Ic79J+xFViJ
 XQmgYzk8DWBIaXgNpiTTSZxtoOsODlOBkm3imhic/VOW2lmaIE5yrCVqFV/fN6NZ1Yzo
 DfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=93bZXThkPBbLLK2hGNJCA/sR9uUbksalIT3IgCsYe7A=;
 b=LvrC1zyIM1DJAJScREV79lnN+WEABeXHWnQHdqYvEJc4GqipflyQcmTrusTFgqsfhJ
 9NXI41ojK3wo4uZek9Qo4pwrYk4fvAvjaV6kNRh/xLPVtlQD86Xh+SjMvkOn5lNt5wVe
 C0zJKKI3Dyg45jx2vAPBfc3LwVaghXZuar822rdmfBUZt+XzJmOnELH4C5Ai1cI1Fom/
 qUzuf3cYUm9svKnfUtIAt+RHnZPfasxM0S9Fad45DRZNa/Uai8SYgQVl1k/6VkSiLHjY
 22gpLdnLnsoVPRUzoZ6FGFoiDhOspTnXLac0uT94zbweG8S/MZuok7MN/3FOoSQjZd9q
 3rcg==
X-Gm-Message-State: AOAM530Acgxm62H/k9fHp6RAKmkA6YsTC1WHve2TpwKW5g42EZyjBwgv
 QaD/7J/fjl8jvk15IQSP11KDDwzgMaoHjQ==
X-Google-Smtp-Source: ABdhPJzBK+wBCLmDM1Yt/7GlDjSUCqVE9qOosSi0JjdtNKQVCgYi7G4WN9Q8ERKMGu7a0YokxFQVhg==
X-Received: by 2002:a62:3485:0:b029:1b7:d521:29e9 with SMTP id
 b127-20020a6234850000b02901b7d52129e9mr5358679pfa.81.1611083994954; 
 Tue, 19 Jan 2021 11:19:54 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id b65sm17055819pga.54.2021.01.19.11.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 11:19:54 -0800 (PST)
Subject: Re: [PATCH v2 02/22] tcg/i386: Move constraint type check to
 tcg_target_const_match
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-3-richard.henderson@linaro.org>
 <CAFEAcA9Ng8hysJRf+odugoSUcrjzBNUvmhpTzOLmSYKELWF0TQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7caa5d5c-fb3b-fa60-ae95-6f63cdc5c2e9@linaro.org>
Date: Tue, 19 Jan 2021 09:19:51 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Ng8hysJRf+odugoSUcrjzBNUvmhpTzOLmSYKELWF0TQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 4:27 AM, Peter Maydell wrote:
> On Fri, 15 Jan 2021 at 21:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Rather than check the type when filling in the constraint,
>> check it when matching the constant.  This removes the only
>> use of the type argument to target_parse_constraint.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tcg/i386/tcg-target.c.inc | 28 +++++++++++++++++-----------
>>  1 file changed, 17 insertions(+), 11 deletions(-)
>>
>> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
>> index 050f3cb0b1..74637f654a 100644
>> --- a/tcg/i386/tcg-target.c.inc
>> +++ b/tcg/i386/tcg-target.c.inc
>> @@ -263,13 +263,13 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
>>          break;
>>
>>      case 'e':
>> -        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_S32);
>> +        ct->ct |= TCG_CT_CONST_S32;
>>          break;
>>      case 'Z':
>> -        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_U32);
>> +        ct->ct |= TCG_CT_CONST_U32;
>>          break;
>>      case 'I':
>> -        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_I32);
>> +        ct->ct |= TCG_CT_CONST_I32;
>>          break;
>>
>>      default:
>> @@ -286,14 +286,20 @@ static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
>>      if (ct & TCG_CT_CONST) {
>>          return 1;
>>      }
>> -    if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
>> -        return 1;
>> -    }
>> -    if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
>> -        return 1;
>> -    }
>> -    if ((ct & TCG_CT_CONST_I32) && ~val == (int32_t)~val) {
>> -        return 1;
>> +    if (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32) {
> 
> Where does the TCG_TARGET_REG_BITS check come from? We weren't
> testing that in the old code in target_parse_constraint() that
> I can see.

Premature optimization and a separate change.
Dropped.


r~

> 
>> +        if (ct & (TCG_CT_CONST_S32 | TCG_CT_CONST_U32 | TCG_CT_CONST_I32)) {
>> +            return 1;
>> +        }
>> +    } else {
>> +        if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
>> +            return 1;
>> +        }
>> +        if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
>> +            return 1;
>> +        }
>> +        if ((ct & TCG_CT_CONST_I32) && ~val == (int32_t)~val) {
>> +            return 1;
>> +        }
>>      }
>>      if ((ct & TCG_CT_CONST_WSZ) && val == (type == TCG_TYPE_I32 ? 32 : 64)) {
>>          return 1;
> 
> thanks
> -- PMM
> 


