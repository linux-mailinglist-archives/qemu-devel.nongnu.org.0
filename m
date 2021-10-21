Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525884358AD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 04:34:06 +0200 (CEST)
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdNu9-0008Gx-5v
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 22:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdNsr-0007az-0z
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:32:45 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdNsp-0003mH-8f
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:32:44 -0400
Received: by mail-pg1-x534.google.com with SMTP id t7so9785784pgl.9
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 19:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=e7oVyaCcPk73OlTPHhYFnq/OZV8IBOIRXVPbs+q6xks=;
 b=H6S0uEnec7ZAo88CBKawsi+a7vB4ylTpnlHvZ96CCun34fz+peK4JT9fV70qNAAVYO
 nj4kneP75CidSJgqIKMR70OU6gFj2uRxZoD3zm3vinfKHpMSKUUn9rkFG8AHN/S4mKXC
 Pt9l5SyQTVktbblNIugLWzOahku6anGIuIfxAMwsM5neWilUhJXRA9b2Xu95ZsFLyhx4
 Vc2yXlgbdqWBV3gfnosmVtEX9wGawMjgPsp4umcdQPKd76lGIiHUy6qU57dSlKAtjZrH
 h99Z5ldc+Pb5w+LZ6HDKKcZ5dbuQS4RLHd4SjE4A6XiEC6s5b+UxGgHe6fLYIiMovNzz
 TF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e7oVyaCcPk73OlTPHhYFnq/OZV8IBOIRXVPbs+q6xks=;
 b=RkcM3qjFvcD59wnBHa4TvGahFKcouPueVqYbbLWe47RvG1C872luYcNoUmtlbZrm1U
 vU4xsbpS/2B2tvvo1RlKT4RBss3e6xy2SGFlYy6tGz7rU1zT5/5dM41xMbC2vGhKunmw
 6N2UufsgLxMxCo+xWasolqGLDk0fUtPWuO/ES4Waq7bTPAblCHs5Yo9CtEMl+YBFPcpb
 UK4v2ppJ8BhnnhCJb3LBcVaX4zd9bt3+m4IGCE0n3Qup5kRiJ42x5ZVYoXFYr2sNfLq0
 sVpBou5FFqAI0NVC8I5lEHAEwn3b/H0JKxdpRG1VI1Wb8wgJAJi87YgbPQP20XKxN5IS
 SrCA==
X-Gm-Message-State: AOAM533wpkJvk2+CWKQjuVRntJHamTwe2lXFyzlyJMd42KdvL+fDCGhA
 d93GgYyBQZ3Cr1gcNUf8l5y7f9LwBBcFZA==
X-Google-Smtp-Source: ABdhPJzreb88piKOsjCmf/3BG2O8IAc85jm25DcPRP8VyAHwZFsjRurpfKRGRjNVox8nd415G7Of5A==
X-Received: by 2002:a05:6a00:22c8:b0:44d:cb37:86e4 with SMTP id
 f8-20020a056a0022c800b0044dcb3786e4mr2490688pfj.78.1634783561560; 
 Wed, 20 Oct 2021 19:32:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t14sm7089529pjl.10.2021.10.20.19.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 19:32:41 -0700 (PDT)
Subject: Re: [PATCH v2 17/48] tcg/optimize: Split out fold_brcond2
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-18-richard.henderson@linaro.org>
 <CPXPR80MB52245558D605EAE1AD3421FFDABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40b64d55-23b0-7ad8-7a92-8b1a17a428ff@linaro.org>
Date: Wed, 20 Oct 2021 19:32:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CPXPR80MB52245558D605EAE1AD3421FFDABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 3:27 PM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>> Reduce some code duplication by folding the NE and EQ cases.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/optimize.c | 161 +++++++++++++++++++++++++------------------------
>>   1 file changed, 83 insertions(+), 78 deletions(-)
> 
>> +    case TCG_COND_NE:
>> +        inv = 1;
>> +        QEMU_FALLTHROUGH;
>> +    case TCG_COND_EQ:
>> +        /*
>> +         * Simplify EQ/NE comparisons where one of the pairs
>> +         * can be simplified.
>> +         */
>> +        i = do_constant_folding_cond(INDEX_op_brcond_i32, op->args[0],
>> +                                     op->args[2], cond);
>> +        switch (i ^ inv) {
>> +        case 0:
>> +            goto do_brcond_false;
> 
> I believe this should go to do_brcond_true when cond==TCG_COND_NE.

Good eyes, thanks.
This needs to be more like setcond2, with do_brcond_const.

r~

