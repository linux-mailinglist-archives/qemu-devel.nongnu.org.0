Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4DC60A959
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:19:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxLD-0007gi-B2; Mon, 24 Oct 2022 09:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxL5-0007cY-JP
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:18:05 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omxL1-0002Gq-7A
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:17:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id bp11so15631105wrb.9
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WiSZRX/iiRROqIv++0dD+lL7htV9BEbsSumBlLpQtHU=;
 b=yYq8USQ9LIl3oYxthrtmwSFV/y4kcr4mZJO4B4Zev/qs6wDx5UJaldsBE/3w3fujI/
 azQmQWtN4hvEBMvBVBVBG2yT7cK/qyML3NZuZLgShizdF6z+2dCSJ/TyzdCFeOxNmZJZ
 /+VWYPqV8sIXgtf9xJElxfCY9LjM9dgWkBkHYdUl0iGrDoAQwBxjtrJ9nD1LAxk/FNg2
 Zihj6A56jk0+eCkLZ4og9siYPFBDAe0nya99QNDbIFwHyqv+NrADDfWe5kla4Kl1XmCa
 Yt8FD8fxvfNKe86pqjqFMVHrOzBdg7udPvNQkVDGSzCO4nreT0yJDdW6dMhAn5CmfsOG
 OIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WiSZRX/iiRROqIv++0dD+lL7htV9BEbsSumBlLpQtHU=;
 b=XZuskjv+tuxCcm+X+/DPxqJIYn8TXIL5RyN3vMM6xk9QYa6vKUbq4xXxhl8PbARmFd
 j08EMvY6DIwZtaD69HcNFQhwOZ2cCodycP+HCmUMYxcGKjmSizUT0zuK5LoF+oZ5yNQo
 fWfoAeER0PxTeV+HSfQci8H+w6str9Dk3iB5m3m3sCgmoR0cnhWXtBnRuK3Gv4IVm3fP
 k8Ont6z5v8W+e5/nmiXgsTePGQORYCvZZ1/INT+XQ00KQIvUvz2H4qEMC/uELYjUhYdE
 OXnrXNl42BYMKsrb0KuCK+0zG0P+9cWz1g9yRTeu9Nd2z3bKfyVHq+6xUVU8GVVSaREM
 soaQ==
X-Gm-Message-State: ACrzQf343Aq3RsSxHpjESobOFIbhieN3AkaMbcjJH5AYh8lmO7+Ogvqt
 pOmQKS1F14RhOOd8dsMHSzRStQ==
X-Google-Smtp-Source: AMsMyM4q5BWo1hE4Hs4BETLO7ZXLaAdHQxQRSanwm5w+5ceIiF/WP4iXY+mcbmu846YFG579fNLlKA==
X-Received: by 2002:a05:6000:15c6:b0:22e:5c0c:13d6 with SMTP id
 y6-20020a05600015c600b0022e5c0c13d6mr20961821wry.485.1666617473739; 
 Mon, 24 Oct 2022 06:17:53 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 e10-20020adfdbca000000b0022e66749437sm27005487wrj.93.2022.10.24.06.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 06:17:53 -0700 (PDT)
Message-ID: <77127e76-ab0d-b18a-35b1-cb7449f1d7ae@linaro.org>
Date: Mon, 24 Oct 2022 15:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 5/9] target/s390x: Use Int128 for return from TRE
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021073006.2398819-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/10/22 09:30, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/helper.h         | 2 +-
>   target/s390x/tcg/mem_helper.c | 7 +++----
>   target/s390x/tcg/translate.c  | 7 +++++--
>   3 files changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


