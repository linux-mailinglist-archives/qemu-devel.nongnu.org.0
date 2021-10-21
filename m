Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2793643587C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 04:07:23 +0200 (CEST)
Received: from localhost ([::1]:60062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdNUH-0004XP-9A
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 22:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdNRO-0003GC-O4
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:04:22 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdNRL-00049s-Hb
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:04:22 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso3792827pjw.2
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 19:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fcoq9KmwCI+XCoPhkFOHPeF8VCw4vIy+xnEFmZWXRHo=;
 b=LzK2mHLRTnqhj0gHgr0Tl7rjxtK/A7Wz7gFgCaGK8cmAQACvMMOs193O9MIdcOVoVn
 uwvWpH02uGEgvdxB/ryvRdSuyszPKL9qtwT1tnFuuJ0I4KYwYUJMh7T4nAHyB/xLWj9E
 iN/bhVKg9TP0DL/jN6muK1DBCF7ezpeXKntv9Wb5AK9cb2G6b6FbVBzKfpLru4tQTy+g
 +v97KoUMXhE/9F2nXptTIiuhPypPYacRj1bS5YOdreCIFEF4Wn4xnD4OmSQ99HmJNE9Z
 PgfSTvqZJfULC6Xj3N3Ur76lfjdCXMeXpHGtUPfd0G8nu0/Tq6tm51BXCpOhPOzG8NDP
 zhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fcoq9KmwCI+XCoPhkFOHPeF8VCw4vIy+xnEFmZWXRHo=;
 b=YHQMHdYP7Sy9w1j0wXyOPa/dZDSo29hGcyx0pmOW+INR+S+hLudLUBzkRMJb1KGl62
 iNbr/GpL7cyOJbw7Qwv5fZHgXX2P6JOU+0Whpv3RU7yipWOOT95vdJKgPK7PRdEsIPHt
 iLeEKYvdRiflak7RdiPFVQ1wWWlzR1qex45QytOhvAvFM5IHy8mxnjogUDmrjpU2Ej4/
 nMhbhcBI57hdQhFh9jKUqHEEHsAekCVQcJQhGljVu3DmvdygOPPx4bhv7EqwBKCGwNPo
 i7nmTWcLjOttU5IzEtX9gqITIOZ0Btz3paXvJt3xNNKvTjaYK/HqmEeQmqLO9fiAjoIV
 k24w==
X-Gm-Message-State: AOAM531Od9NBjDLEgL3aOgGL99v+FAhBFx9VFhmltDOn0V0xAhrzcykx
 ON8LK8TO7JX2TVWawpkarg+fw+ygjSbf7A==
X-Google-Smtp-Source: ABdhPJzO2hGolm4khWsEfch7UxPuAiL4JYZS2VT5Mk0ZHFAcjWVlU7Qis1070KO2xAVjyz0ZkrtZpg==
X-Received: by 2002:a17:90a:db14:: with SMTP id
 g20mr3155966pjv.43.1634781857767; 
 Wed, 20 Oct 2021 19:04:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k35sm7301633pjc.53.2021.10.20.19.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 19:04:17 -0700 (PDT)
Subject: Re: [PATCH v2 08/48] tcg/optimize: Split out fold_call
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-9-richard.henderson@linaro.org>
 <87pmrzvfqj.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d5aafbf3-089d-af7a-037f-e790d479967b@linaro.org>
Date: Wed, 20 Oct 2021 19:04:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87pmrzvfqj.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 9:05 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Calls are special in that they have a variable number
>> of arguments, and need to be able to clobber globals.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/optimize.c | 63 ++++++++++++++++++++++++++++++++------------------
>>   1 file changed, 41 insertions(+), 22 deletions(-)
>>
>> diff --git a/tcg/optimize.c b/tcg/optimize.c
>> index fad6f5de1f..74b9aa025a 100644
>> --- a/tcg/optimize.c
>> +++ b/tcg/optimize.c
>> @@ -624,10 +624,42 @@ static void copy_propagate(OptContext *ctx, TCGOp *op,
>>       }
>>   }
>>   
>> +static bool fold_call(OptContext *ctx, TCGOp *op)
>> +{
>> +    TCGContext *s = ctx->tcg;
>> +    int nb_oargs = TCGOP_CALLO(op);
>> +    int nb_iargs = TCGOP_CALLI(op);
>> +    int flags, i;
>> +
>> +    init_arguments(ctx, op, nb_oargs + nb_iargs);
>> +    copy_propagate(ctx, op, nb_oargs, nb_iargs);
>> +
>> +    /* If the function reads or writes globals, reset temp data. */
>> +    flags = tcg_call_flags(op);
>> +    if (!(flags & (TCG_CALL_NO_READ_GLOBALS | TCG_CALL_NO_WRITE_GLOBALS))) {
>> +        int nb_globals = s->nb_globals;
> 
> Aren't we missing a trick here?
> 
> If the helper is going to read global registers we need to ensure any
> temps holding their data is written but we don't need to throw the
> existing temps away if the helper is TCG_CALL_NO_WRITE_GLOBALS?

Hmm, if NO_WRITE_GLOBALS, then yes, we should be able to preserve the information about 
the current contents.  There must be some quirk, though; I just don't recall what it is. 
This patch preserves existing behaviour.


r~

