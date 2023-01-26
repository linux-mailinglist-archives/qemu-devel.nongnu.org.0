Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9541067C3AA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 04:36:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKt2d-0006KH-KI; Wed, 25 Jan 2023 22:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKt2b-0006Jf-90
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 22:35:09 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKt2Y-0004FD-IY
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 22:35:08 -0500
Received: by mail-pl1-x62c.google.com with SMTP id be8so816073plb.7
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 19:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dDScx//a87dxLoQohvQY1QUup8T0Y2nk5LUfGW/gtcw=;
 b=lbhDnOIjAppM55ee5j71GlkiYCsEJ3JlX37TcXNcg2C5ilQFmqfq+RFeig90hl52oQ
 gDCIgNQF5M8QdreRfJ7AeTjOY2DHIDRojnNMs5Nqdt0LsQse1iWfvcuz1/K7hyO6poW7
 dBl5nPdzEZSptgKxYkUzG/7n6bzRAbJHod0oHTX2CU8XLLkNzeL5Ms0U24HBrB82MN2G
 Ze1E7mq2rFZ82IQ1oOWvvcv6Po91+vUiD8CZN3/r1Hi4KJIyEzyP+lnoHAoiIErETKVK
 3nIgvOhFADLaQ8mxByW4kGOeyybN7OtNjMUW4Ydnpen+jjoUXs9GJOUGV6hpCKs7oLMV
 RDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dDScx//a87dxLoQohvQY1QUup8T0Y2nk5LUfGW/gtcw=;
 b=i2CEiIngwPxRyKRs/JBJ7j6VhoZ81q1bMjJ1wPsSQfahppQjMvTI1BuRj6jUf085ze
 LPg2F2JV7607KXxcSASz05LuE0xeMFM7d8HQdfg1CYt63wf7KUDx+i2cYps3LvAz7win
 hj4zez3Y+Gkg7jySDifsxqXC0wRNWO92VcKOm/5C3ELSHNMV1ZdXz5Bzd20QsNw8Ar7i
 zcx7lygybk+J5Tcm+DwzSPQV2QgHy3b3bkkRIz+mJVc9lTyjuMTx4SimGNxIVsR1D8O6
 Hok6DYzH3RGQ2MA9aDhdPykuWsZT04zpIVgiR60kfBep7aKZVG3J+AphJE4jmgJeHrHD
 Q6eA==
X-Gm-Message-State: AO0yUKWwbtieVgaSqHB2GaBe52gFkovgptb8twNmGoBjo+muK60wk3yQ
 J2/8DKCirX308w7gTlrnQaJHzQ==
X-Google-Smtp-Source: AK7set+os+6sOsE+zsprZBKSjr+ThRclWO9o19IAbQIxp2TxI7kR8GLafiKjBEDmkkkinnfqSK1cUg==
X-Received: by 2002:a17:903:41cc:b0:196:37a4:775b with SMTP id
 u12-20020a17090341cc00b0019637a4775bmr3150345ple.33.1674704103788; 
 Wed, 25 Jan 2023 19:35:03 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 g5-20020a1709026b4500b0018b025d9a40sm123259plt.256.2023.01.25.19.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 19:35:03 -0800 (PST)
Message-ID: <f527ecff-7597-33f4-2909-1ebe7126447f@linaro.org>
Date: Wed, 25 Jan 2023 17:34:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu 1/1] Remove a stray "@end table" marker
Content-Language: en-US
To: ~gurjeet <gurjeet@singh.im>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, qemu-trivial <qemu-trivial@nongnu.org>
References: <167470125128.13083.10933855577484761075-1@git.sr.ht>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <167470125128.13083.10933855577484761075-1@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/25/23 16:12, ~gurjeet wrote:
> From: Gurjeet Singh <gurjeet@singh.im>
> 
> Signed-off-by: Gurjeet Singh <gurjeet@singh.im>
> ---
>   docs/system/cpu-models-x86.rst.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
> index 7f6368f999..261da6e21d 100644
> --- a/docs/system/cpu-models-x86.rst.inc
> +++ b/docs/system/cpu-models-x86.rst.inc
> @@ -25,7 +25,7 @@ Two ways to configure CPU models with QEMU / KVM
>       typically refer to specific generations of hardware released by
>       Intel and AMD.  These allow the guest VMs to have a degree of
>       isolation from the host CPU, allowing greater flexibility in live
> -    migrating between hosts with differing hardware.  @end table
> +    migrating between hosts with differing hardware.
>   
>   In both cases, it is possible to optionally add or remove individual CPU
>   features, to alter what is presented to the guest by default.

Cc: qemu-trivial.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

