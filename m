Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62652DB6A4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 23:48:25 +0100 (CET)
Received: from localhost ([::1]:35338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJ7I-0004Vt-Us
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 17:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJ2O-0000Aj-2W
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:43:21 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJ2L-0007YP-1a
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:43:19 -0500
Received: by mail-oi1-x242.google.com with SMTP id x13so16166783oic.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Tac8R0/4/dnpUcxt6Aj8QnSKzTmEC8dVmvD5YDU6yl4=;
 b=ogNklUOdINw15uqD1JRGpwL9IF1VNZbbWTCMaXfR5zxYB8pwMsR+zqlgF5nZJnhk5u
 SPrEmippAr3LM29ORDYiACY+3hSb2KEINSENdQZm+KNprYYbcyYvv1YyT8pnB58nmbTn
 OWpbIwTyyMnOaMXFpRvRfhDUyxussOwGtLqQaKJNlzE34lA/6R+zr1XeBQicnX3m32d9
 dB6p8etRFtPw87geHrbX7Ay+NUEijDk36qqafLZ9R9mXvRCM9rSlIntorx8rGjkb3rym
 5l0qqVTGfH578s5R1LdVm2/PPvgDuNYqtwzVH4WeLGsmeKNAGPqcqu7mSGAHhR0I48ra
 BC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tac8R0/4/dnpUcxt6Aj8QnSKzTmEC8dVmvD5YDU6yl4=;
 b=cokc/naoR/TKFyKnBgy8Kq4QpOXO+hSiLBkn8kKm+wVQFjrn6b+ScRE19KCuF+84vz
 q6IGP6+gsEY6fhVL1m3uCk7gGdsjvdWjiTPxofDU8uF541/tDkEiwHte/EaBq2WUnK1r
 UqDXfPmEgRR0tfauuyhL78RGS+IoXy93tlEqciB1fUhXI674Lr7dQt7ROCDDh5nFp8vo
 Ak+XvSHrdnfD1WgueGkSmag1X/W4WDSw6xlHslikGZSErKOpbCWQqctv34+wLyXitMrS
 5oRHHf25+Kz4xNe4zyZMbAXbJjHiOEvoqoJLD0JrqATty5NirAYWr4bX4jtZVaXY2mG5
 98QQ==
X-Gm-Message-State: AOAM533yb1nZivUrJg2kDK1bD0EyAUUFQPZqelfTKdk9mQ/DiW7UHl/v
 b3Eg5VdBwD5wM3oWg2oUtsWEBcPdv7O8+qfI
X-Google-Smtp-Source: ABdhPJyAbwAaGD5lnDegWLK088FSpmP1W6RA/CEtkmQXIgZsgfQiDGrsbTkoYcCAQCUSzeo+X7t47g==
X-Received: by 2002:aca:b587:: with SMTP id e129mr587060oif.90.1608072195427; 
 Tue, 15 Dec 2020 14:43:15 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q21sm10030oog.30.2020.12.15.14.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 14:43:14 -0800 (PST)
Subject: Re: [PATCH v4 07/43] tcg: Add in_code_gen_buffer
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-8-richard.henderson@linaro.org>
 <0ca448f1-bbd1-36b3-67c7-d430005db00d@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a79b5c1f-80c3-d0cf-770e-838cafa3373d@linaro.org>
Date: Tue, 15 Dec 2020 16:43:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0ca448f1-bbd1-36b3-67c7-d430005db00d@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 4:09 PM, Philippe Mathieu-Daudé wrote:
> On 12/14/20 3:02 PM, Richard Henderson wrote:
>> Create a function to determine if a pointer is within the buffer.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  include/tcg/tcg.h         |  6 ++++++
>>  accel/tcg/translate-all.c | 26 ++++++++------------------
>>  2 files changed, 14 insertions(+), 18 deletions(-)
>>
>> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
>> index bb1e97b13b..e4d0ace44b 100644
>> --- a/include/tcg/tcg.h
>> +++ b/include/tcg/tcg.h
>> @@ -680,6 +680,12 @@ extern __thread TCGContext *tcg_ctx;
>>  extern void *tcg_code_gen_epilogue;
>>  extern TCGv_env cpu_env;
>>  
>> +static inline bool in_code_gen_buffer(const void *p)
>> +{
>> +    const TCGContext *s = &tcg_init_ctx;
>> +    return (size_t)(p - s->code_gen_buffer) <= s->code_gen_buffer_size;
> 
> If 'p == s->code_gen_buffer + s->code_gen_buffer_size',
> is it really "in" the buffer?

Well, sort of.

Compare the fact that in C, a pointer to the end of an array is valid as a
pointer even though it can't be dereferenced.  This is a pointer to the end of
the buffer.

Extra commentary required?


r~

