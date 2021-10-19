Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DE9433C1E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:27:44 +0200 (CEST)
Received: from localhost ([::1]:35628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrxn-0008Mm-MR
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcrB8-0008E2-Jn
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:37:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcrB7-0000O3-3l
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:37:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso187589pjw.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sdxDg4EIrLJsU6hwUWx5D2Os8NyFPA0l3RQC544Ee68=;
 b=rQIIvYzD7w46eJ0pT/I4fs2GHJUbOZjOVljmLzJxg6ozvslANR2/Kb2wk3rUD0QHNk
 rvMW/0TxtJaEmV0Jy4dZ0icL2qwx9cgUqsKZ+Xw8PZAUKuUDlkHtg9H75MZm0tKFtU3U
 y5OkjXnMXFvDMM1rKLDEm8sZ7vTJBSYafivgfK6elHNap8OhViGzmyN6gFNOpIDj8hP3
 LPcG5uQkETOxD6BhXn2jqzEvF2PUi7vFBee5IAtcX7FYFpupuUTdfNpnk8N5HHLc1vkU
 cHW4Q62z7owz2KHTnCCUlJGa9XxNbT25+ScgkCFZ/EGBoCMk3YgunoV3LK0YFReS/mWx
 JaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sdxDg4EIrLJsU6hwUWx5D2Os8NyFPA0l3RQC544Ee68=;
 b=LJnScez1rj9gUsEuBZ2B2X4U8+BeoeBxrgtXOyAILEKGeX31cT6AZd90xswWilmy3T
 OxcvWmhaxRyxHP2MCuMZFOMZM3f2lGdOnRPO6tm/B2Uwmu9B06N4uPXjz1fZehtv/FMi
 S3CqVCJyuDjUWxnX03UXtRn/ei0OBQmDiODLLVByt++gAG75NE8jDHEhcQq6/2oxgK/g
 c9sFZ0sZzVYJ5YmElWisfCDizerCXmjnGMIu5vY7qj+bN+QKe1xBFq4uYc6FiPIadH3N
 9/+g0DVK8QEgcM6RkLk/KMk9kammB5UEo2I4OCawOtBFMLaPssvQV2McX39TaQ7U9AUq
 0vNA==
X-Gm-Message-State: AOAM532pdaf6wZOlyA3ProhiIftGxXlHW2mqrPWP5Ffm063DlUgUduBY
 vlF9z22/S9ZxB2arcOmWKJaBDjobNvK3UA==
X-Google-Smtp-Source: ABdhPJwd210Im5t0BcN+badD0EcpmDZgOZBebgf9U0iSJMkvDt0BQ5iRhEZMAM+t9e7p2M6/y3RVOQ==
X-Received: by 2002:a17:90b:18f:: with SMTP id t15mr683443pjs.19.1634657843287; 
 Tue, 19 Oct 2021 08:37:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a7sm16491215pfo.32.2021.10.19.08.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 08:37:22 -0700 (PDT)
Subject: Re: [PATCH v2 02/48] tcg/optimize: Split out OptContext
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-3-richard.henderson@linaro.org>
 <87tuhdxcek.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e5ed8ec-f837-e737-0e48-bda043aaa758@linaro.org>
Date: Tue, 19 Oct 2021 08:37:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87tuhdxcek.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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

On 10/19/21 8:25 AM, Alex Bennée wrote:
>> -    TCGTempSet temps_used;
>> +    OptContext ctx = {};
>>   
>>       /* Array VALS has an element for each temp.
>>          If this temp holds a constant then its value is kept in VALS' element.
>> @@ -615,7 +619,6 @@ void tcg_optimize(TCGContext *s)
>>       nb_temps = s->nb_temps;
>>       nb_globals = s->nb_globals;
>>   
>> -    memset(&temps_used, 0, sizeof(temps_used));
> 
> Did you mean to drop this memset entirely given I see it being done
> later on?

It went to the struct initialization above.


r~

