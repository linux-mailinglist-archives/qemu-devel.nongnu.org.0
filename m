Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B77F6F06A4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:33:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1jl-0005vw-8B; Thu, 27 Apr 2023 09:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ps1ji-0005uD-OU
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:32:39 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ps1jh-0005Xj-6I
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:32:38 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5083bd8e226so13035994a12.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 06:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682602355; x=1685194355;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cME9iT6e1P4yFXSSBFVRVpRrX/bMQO/rEdyrEYaCsPc=;
 b=KPfb8LkhLlE+Bk5UIulposdiJW4B1/1aEyUYr0eUj54RCGBFQfIPA+dl/6vIk7USsH
 qNYXP49DK4W3QyhGN//fWWVMh3OsByjfyaBPlbIJX/KTO4q12f1fU6Odi0wKQcLYjF3Y
 ano8+VXNk9VWWAViJalByCGD5KLIea8des/O6LnaeYArDcvb9xkULqCyn55Zy2om4CdL
 bwEg6Jn8gqmslweqBAHX1+IQO/bVnsrotIUVN8sBWQ8/SuRrWnjYhf5g6ZJ4vpvYhgnC
 9gfRa2B9g16S3ErIMvJipE7Pdx+0xTfFbphTAMJLMQ0riF8us2FP66mwi7M21DqL7I84
 AKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682602355; x=1685194355;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cME9iT6e1P4yFXSSBFVRVpRrX/bMQO/rEdyrEYaCsPc=;
 b=V91GQwHjDCYtq0XQeYaWI/IbHcgTD4zhozD3MmTLyEFBjdI5JTZkj1Is5o0qEmVgI8
 zYFqna6KHyO06RdCKC28Gmd7WbaLsOYQtHVoqfhIMjqglP2uK5ufflbO50pAacGb5Wdi
 c+8R5Xp6UzPBoNcF9zR/9gaQswb+kQUQ1gU+rKem+hFAL9adFEJD4w0xkvWmCg+XDFpp
 DOq2PHfVF7bZUU/H7UA0RDR05eNk05G1G8QbmQK+pAkr2hesKtqKoPDA9aQ7ADI2jbU2
 qJli7bmcXiGcfceWX7+6IHq1JT9P95uCQRSsqIPr5g2WxVeds5tqUxthl2UY7LIn2DnM
 BNFw==
X-Gm-Message-State: AC+VfDwxBbP7TrhPK0GR4zWtpbFKTexEiKw3p9y2fEQTF+3u68zdsUez
 jwlj2I6Zlpd6YGJUICYHB2c9WQ==
X-Google-Smtp-Source: ACHHUZ4Ka63d5agq/Ass/6Xzag6mEtMcKdn9Ah1/xyrPJhP6Z93iQksbinCSzeOrUOH4Cq1c3rYLsw==
X-Received: by 2002:a17:907:805:b0:947:c8d5:fb2a with SMTP id
 wv5-20020a170907080500b00947c8d5fb2amr2045478ejb.48.1682602354923; 
 Thu, 27 Apr 2023 06:32:34 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 bq6-20020a056402214600b0050470aa444fsm7922994edb.51.2023.04.27.06.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 06:32:34 -0700 (PDT)
Message-ID: <4db9ea15-7478-06ef-f774-0f7162780f29@linaro.org>
Date: Thu, 27 Apr 2023 14:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/hexagon: fix = vs. == mishap
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>
References: <20230427125632.104034-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427125632.104034-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/27/23 13:56, Paolo Bonzini wrote:
> Coverity reports a parameter that is "set but never used".  This is caused
> by an assignment operator being used instead of equality.
> 
> Cc: Taylor Simpson<tsimpson@quicinc.com>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/hexagon/idef-parser/parser-helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

