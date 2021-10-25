Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F88B439DA7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 19:33:09 +0200 (CEST)
Received: from localhost ([::1]:35874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf3qO-0004Y0-NU
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 13:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf3pO-0003rN-61
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:32:06 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf3pM-000331-59
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:32:05 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so595315pjb.3
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 10:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+asivq2hKBL2AagU9a3VoFSCoFThCBgKzJfWC1Its6s=;
 b=o+oeiyUosy2htgpD2tHPDbcpcAcwjO69DDjsPgTKvCcFRtxqAlD7G9dvS3Le/Koald
 0ZF9kBKOHgEZKYd3vPhX7fq9QaFOmeDfpWjbn+WKFDfjFoVVovBVpUHTk5No79vUjX1P
 NhEUoNjrsUTkEjO5bHhpFGCvMT5rzCzMPdYF7N99oRyM+FTnZq0gsLVuz2v+hRp0L9pB
 cJsUkbZKFl719monKWrE4RqkL0GM54vHxgGHbLiWVWZyoZ0evy//B30uCpBgkXkbND9M
 pRmyhgYlqZ3N3iJmbTCfI1XcdWjnWm0Hp5Vtjma1kwUHpnOENUQcXr/T75Wf2akKMxI4
 8XCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+asivq2hKBL2AagU9a3VoFSCoFThCBgKzJfWC1Its6s=;
 b=bTUNvSqM3W743g+Pp0bfGG59mQy20oVfzRAFuQazm0j74IR9R25/pdmy4CRXJBvC69
 HOqPpfjDd2VyMRdPvEbNP4vZCI5DhQo5eYqhM/haiEfYmpASHsfU92ndF0wHr5B5EMw+
 ms5l4FICx1OCotyoULg7O/htTwOYRWfPCa9Y/rDknYLm6t31QsQhC6oVzGHDv/JlUk17
 B9DW41QEIL9ZLByyXhB9Y7xz/ntH6wm17N2Fq5A7OSWK6SH30xpJvY2k1Ggwxl9DA2tu
 TyjQuEalBket1qhs85Ky106aMKJBcQoJjlf9O88FxcaqdCgNcZKna9xIKORLaU5gtKfH
 t8Cg==
X-Gm-Message-State: AOAM532WyhyotMthh2NUWwo6tGkol+53teDrXIOPH2AD5x5QY9c6XbC+
 eirDRhfLukwlnP2rG/J+L44q6A==
X-Google-Smtp-Source: ABdhPJwZvQY0xESwbj3eCZ/rkWOr4fj2OgFZDIoAoBi/wc2WGjM8zX6iS++Hhjkago/smYp038OakA==
X-Received: by 2002:a17:90a:f401:: with SMTP id
 ch1mr35204736pjb.136.1635183121513; 
 Mon, 25 Oct 2021 10:32:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m10sm15559653pfk.78.2021.10.25.10.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 10:32:01 -0700 (PDT)
Subject: Re: [PATCH v3 34/48] tcg/optimize: Split out fold_to_not
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-35-richard.henderson@linaro.org>
 <CPXPR80MB52241B3E9288764685587103DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c98f2859-d8bc-73fe-73c6-50417bda713f@linaro.org>
Date: Mon, 25 Oct 2021 10:31:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CPXPR80MB52241B3E9288764685587103DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 10/25/21 7:17 AM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>> Split out the conditional conversion from a more complex logical operation to a
>> simple NOT.  Create a couple more helpers to make this easy for the outer-most
>> logical operations.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/optimize.c | 154 +++++++++++++++++++++++++++----------------------
>>   1 file changed, 86 insertions(+), 68 deletions(-)
> 
>>   static bool fold_eqv(OptContext *ctx, TCGOp *op)  {
>> -    return fold_const2(ctx, op);
>> +    if (fold_const2(ctx, op) ||
>> +        fold_xi_to_not(ctx, op, 0)) {
> 
> Should be fold_ix_to_not (not fold xi_to_not).

No, because for eqv we expect the second operand to be the constant -- eqv is commutative.

> 
>>   static bool fold_orc(OptContext *ctx, TCGOp *op)  {
>> -    return fold_const2(ctx, op);
>> +    if (fold_const2(ctx, op) ||
>> +        fold_xi_to_not(ctx, op, 0)) {

But for orc you are correct.  Thanks.


r~

