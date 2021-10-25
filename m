Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DB4439EA0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 20:39:53 +0200 (CEST)
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf4sx-0005MB-Gx
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 14:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf4oe-0003Tf-Rp
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 14:35:25 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf4oa-0005vo-0u
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 14:35:22 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 83so5583085pgc.8
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 11:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VNlBTCk7UBlblrAz/8/CJijvz/ulh3F+bbQ6eVaI99c=;
 b=XHCeGBmCySlUxns2m5icHTpY1ZkJShoS2IqMov+iSyeIYuLA0syMbsqPPy8wMr2NRZ
 aoMC/OPQpKVS72gcY3/6DyQwVfGVYOFyPF8A3wGO2D9DC54A/OmkJA6op/ie4mmmtofp
 /mIIE9LmH7g2+mLGQboCBFdJ9AswseB8LA09c5iC4mgwPEM7mvQbjhjAJ13zDpiRYv8w
 7oflh4TgQox4WOmQUT8C6iYSyXmSPM6TuoNsa/FgmL9nFNIaI5n0k0WYmPCRdt6xOjpJ
 XhBFrVM9iglg+gvR7ygCqDHYxIX6qvCoGLtP6azWE5yFUnWhJha2wBJF9TqC3Lug9Oel
 JElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VNlBTCk7UBlblrAz/8/CJijvz/ulh3F+bbQ6eVaI99c=;
 b=EKWdoud6ntvRqY6znwfy5LUc7X1REiDv4ajq7dlNLPETlXXS1O4Gpd+OabvCpFJuya
 FEU0apd8785FVN/0KhSkALJNJPzEXMqhPHJ5/eryRGA7v4YEZx/O1zesTKK9LX3/Rl9b
 DncHwwFJe5PcG3b4XMjmdIoHITEtImCGYSRD9qKY32ci2osh4srQxzdyDP2/8U5Ml+aX
 xFf8dLWnQTZw1Oh5JFJ258Y8xBK3T95bnZBi1I8qFbPwH1wi0yGKof9wNUWqVUSN9VKL
 SVWqlkn73O6HLzOnNu78jGg3B+UkZZFHXOwtMsNZaFbC7BSy5P1Q+EjbYCK+85SAlSgR
 zqxg==
X-Gm-Message-State: AOAM531osv0/QpxopFlVr9tjRzlHZt7vI24cJJPAh55IWlWjEAmM4sQ3
 +pQT8yOi2OgCnFuOaNn9OUlSBA==
X-Google-Smtp-Source: ABdhPJy1uE3iFax5f1KQunG+K8PlVaDWPKNVeqQDGZlostKu13zISePYu9cVD553QKtRUH96gUTF9w==
X-Received: by 2002:a63:e216:: with SMTP id q22mr14840556pgh.3.1635186916646; 
 Mon, 25 Oct 2021 11:35:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c85sm4544131pfc.146.2021.10.25.11.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 11:35:16 -0700 (PDT)
Subject: Re: [PATCH v3 34/48] tcg/optimize: Split out fold_to_not
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-35-richard.henderson@linaro.org>
 <CPXPR80MB52241B3E9288764685587103DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
 <c98f2859-d8bc-73fe-73c6-50417bda713f@linaro.org>
 <CPXPR80MB5224B6595B884D669BC14C59DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4651d464-8a73-d334-2889-eac47aae75af@linaro.org>
Date: Mon, 25 Oct 2021 11:35:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CPXPR80MB5224B6595B884D669BC14C59DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 11:13 AM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
>>>>    static bool fold_eqv(OptContext *ctx, TCGOp *op)  {
>>>> -    return fold_const2(ctx, op);
>>>> +    if (fold_const2(ctx, op) ||
>>>> +        fold_xi_to_not(ctx, op, 0)) {
>>>
>>> Should be fold_ix_to_not (not fold xi_to_not).
>>
>> No, because for eqv we expect the second operand to be the constant -- eqv is
>> commutative.
> 
> Ah, got it! The previous code was wrong, and I failed to notice that eqv would've had its arguments swapped to have the constant as second.

Ah!  I failed to notice that the previous code was wrong.  ;-)


r~

