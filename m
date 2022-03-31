Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B8A4EE003
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:59:50 +0200 (CEST)
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZz5J-0004V1-AP
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:59:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZz0c-0005PM-Ta
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:54:58 -0400
Received: from [2001:4860:4864:20::36] (port=35063
 helo=mail-oa1-x36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZz0b-0004tA-Bs
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:54:58 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-de48295467so88988fac.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BfK+R37iRk2biLz0xzQOZHyqSOXM5kt5frNrjSTbw8g=;
 b=mXEchJ96zEZ8irUlqW7PYfQo9e8p/4LeT+04ei08NGzR0AkpNiCh4DzmJZUSfFdwV4
 djm1LAxoR8XY4LVIUHy1K558YAeAaZIIOMyeaD/85n5iSWgw5978uuUZAgCUdgfnHokp
 8ejZH9HdJJY2FJzWYSt4P8gHqm8bxJNt2W5NS+u1NBVCqNUQdNc+jvrlRcriF6pAj2Co
 1tvrUoOPpM8lIUjsCCFmEP6CM4GmWOt/nYo8LXpbNRTxQ6Z0oYjHnrrXz3JsN6jbArOl
 Yjc3LdOEjQ8uRnHGRewZkZZdiNwCmncvC9VRBkE9O7hEqmhn1oVH+5n0gymNlUhuyG5r
 7ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BfK+R37iRk2biLz0xzQOZHyqSOXM5kt5frNrjSTbw8g=;
 b=FqfT8fAHEj2zLTkqDkWuC7dJPPE+Gn6/R6f01kHYBc0yaBTYl8nWOYFN//B9WGxrkb
 GQ4M9C2TRCLDO6ZgsQXxwgKl6CmVdpk8ZCC1YBHSNt/CEObIdZPw27H+p9HlrCPbwtIG
 BDRq7iqYr45088NI+C/yDKhdZLcnvDo2nOpYU82tux4NIBzfpPw8kfQIllcHdJq1helb
 4E1UT9+VeviMBI3hIMFpsRL2CPE9/VQgslpaiwHTDEMtCOK6i5aNTZ4hjqL5Q2VaM7Mv
 6fH2cZHBpUXj1YDAkWmQvVcoWVjRvzj7v/J4qHUUCAiHGHoqX0g4WNAwSuh57tPQZah6
 1yoA==
X-Gm-Message-State: AOAM530VEMug6XwtR37gHX60pXFL4IDnQlkj8XqGuG4VwK+RHV2QV6mj
 BetZv6b4d0iENRjJ6tyJLDICCg==
X-Google-Smtp-Source: ABdhPJw/jUHzsovwJiqqsvgQrSfRz6IyE4h/aKVefRdV/tFyZtRxRARKZpLRnOtrC5DfNKJfOTFxBA==
X-Received: by 2002:a05:6870:e408:b0:de:b929:5206 with SMTP id
 n8-20020a056870e40800b000deb9295206mr3223379oag.71.1648749296033; 
 Thu, 31 Mar 2022 10:54:56 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056830304e00b005b246b673f2sm71943otr.71.2022.03.31.10.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 10:54:55 -0700 (PDT)
Message-ID: <aeaebbd2-1d63-d392-9f3f-30419cb09e0f@linaro.org>
Date: Thu, 31 Mar 2022 11:54:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PULL 06/29] softfloat: Move compare_floats to
 softfloat-parts.c.inc
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
 <20210603214131.629841-7-richard.henderson@linaro.org>
 <CAFEAcA9tV_3VMwgAgN4BKc1GW9w59kwHB-xFhn1pi4pBH2YxrQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9tV_3VMwgAgN4BKc1GW9w59kwHB-xFhn1pi4pBH2YxrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::36
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/22 04:46, Peter Maydell wrote:
>> +static int parts64_compare(FloatParts64 *a, FloatParts64 *b,
>> +                           float_status *s, bool q);
>> +static int parts128_compare(FloatParts128 *a, FloatParts128 *b,
>> +                            float_status *s, bool q);
> 
> Here we define these two functions as returning "int"...
...
>> +static FloatRelation partsN(compare)(FloatPartsN *a, FloatPartsN *b,
>> +                                     float_status *s, bool is_quiet)
>> +{
> 
> ...and unless I'm getting confused by the macro usage here,
> the actual definition of the functions returns a FloatRelation.
> (I'm not sure why the compiler doesn't complain about the mismatch.)

That is an excellent question -- it really seems like it should have complained.

>> +    int cmp;
>> +
>> +    if (likely(ab_mask == float_cmask_normal)) {
>> +        if (a->sign != b->sign) {
>> +            goto a_sign;
>> +        }
>> +        if (a->exp != b->exp) {
>> +            cmp = a->exp < b->exp ? -1 : 1;
>> +        } else {
>> +            cmp = frac_cmp(a, b);
>> +        }
>> +        if (a->sign) {
>> +            cmp = -cmp;
>> +        }
>> +        return cmp;
> 
> This code path seems to be written to assume an
> integer -1 or 1 return value...

The FloatRelation enumerations *were* chosen to make this sort of negation work; only 
float_relation_unordered is an outlier.  But it would be clearer to use the enum type for 
cmp here.

> FWIW, the Coverity issues are CID 1487134, 1487139, 1487151, 1487184,
> where for some reason it thinks that floatx80_compare() and
> floatx80_compare_quiet() can return 3 and thus that there is a
> potential array overrun. (I've marked these all as false positives
> in the UI, anyway.)

Interesting about '3'.  I'll have a look.


r~

