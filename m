Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF443D7F0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 02:11:07 +0200 (CEST)
Received: from localhost ([::1]:32894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mft0c-0002kE-Aa
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 20:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfsy8-00022t-Eb
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:08:32 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfsy3-0005ZB-GV
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:08:28 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so6506549pjl.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A+r3SX2CaFCxDjf8aoeGcvdIAratAfOMfdhYYEqgDsY=;
 b=XH2UzSsRrX+B4d/UnEZHJPTBAwcT9ne4WIyqBVzj3JJwUyQTt6iPV8mxUuPZAWbLYO
 2PoRLCeS8za+VxbxHJcUc9s/U59rUSEv1cFep5ypZDIUAgs1AkAl1YzrmqD7H65tPsxV
 tiB83pAJeB+d1xqAR+u25DQ1BeT8NQstjW2gIFpYK7E2yODTaWlDZtFVV56IViqiITQ6
 PiGv4JCWpgjVPxmpp/lILdfHn9IcJfGX+3Z3/5bCK/xfN2kSGUOCqI1pQXlznW0GtfYb
 4lF/A3O/oUgYCiVGYXFm4TqwJbQ/DeJmj1bH1RY9L0qpiiCAjGhWYnAi8NFGKcZu3mjo
 01oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A+r3SX2CaFCxDjf8aoeGcvdIAratAfOMfdhYYEqgDsY=;
 b=3anJAc7ddqTzKWeAWQtwNNWp9q4vx5m/mOL5QMzvf+/x+i/Aq5cqAVm9hW/g6DA+14
 8iv/VJhlfGajP/3Ofc4P0UTtrjNPfJHxpe4jGvcn/KBHnfaGOw96qqNt51pCzIj2zmhF
 PmGMdEiRkHcMAG6b4GGMpuCrHMLKcbL6RZs7Y2HqfhJ1JIBrt1XsxTFFLQGhORuACfih
 AxxjrN7llyiy24D3CZilWwOWpfnFhJKLIOu5WAQVwsCZeCvTqxfN7HH9g/MC9cDxt3P9
 a+DConcRrkSkhKAh6ZbcJJYMHTCXewq/hsWmSYjLCAFf+VGQyyThW2n604pnrCjFssG3
 FooA==
X-Gm-Message-State: AOAM530245u8lJwecen4UhhyzMlSyDK0MdsHO7+cLM3W9w9TO+hzYmZl
 BNRf39Kb4gJDW2V0T0u2LcRT2g==
X-Google-Smtp-Source: ABdhPJwk85PdAUI97dGBAfqQ8kD2zi5THBJ4GCNSD622vjuzbaSQTY7dnK5MzKay4zhkZAsKiv+IFA==
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr680248pls.17.1635379705124; 
 Wed, 27 Oct 2021 17:08:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h4sm5359977pjm.14.2021.10.27.17.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:08:24 -0700 (PDT)
Subject: Re: [PATCH v4 46/51] tcg/optimize: Use fold_xx_to_i for rem
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-47-richard.henderson@linaro.org>
 <CPXPR80MB52247FE76878B0F308FFDEA2DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <004eba91-9b1b-5246-fbca-f98894fdccbe@linaro.org>
Date: Wed, 27 Oct 2021 17:08:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CPXPR80MB52247FE76878B0F308FFDEA2DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 1:42 PM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
>>   static bool fold_remainder(OptContext *ctx, TCGOp *op)  {
>> -    return fold_const2(ctx, op);
>> +    if (fold_const2(ctx, op) ||
>> +        fold_xx_to_i(ctx, op, 1)) {
> 
> Should this be fold_xx_to_i(ctx, op, 0)?

Oops.  I can only guess it's a cut-and-paste error.

> If arg[2] is 0, we would have different results than do_constant_folding(), but not sure we care, since the result is documented as undefined.

At first I thought you meant a known 0, but you mean some unknown value which happens to 
be 0 at runtime.  Yes, we do get a different value, but yes, we don't care because undefined.


r~

