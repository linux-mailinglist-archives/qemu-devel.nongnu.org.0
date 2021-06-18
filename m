Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E123AD557
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 00:44:08 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNDb-0002Ck-Bp
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 18:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luNAb-0005b4-6r
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:41:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luNAZ-00069i-Lf
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:41:00 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 pf4-20020a17090b1d84b029016f6699c3f2so1691976pjb.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JJoTUf0U3pJsRg6NZ7uqQeVRJxHKKo1I4fmow8CxV+8=;
 b=UKSZ+7df+dfXkw6fwK0MGnPDQpufd8W0ixAbY7HWV8zqW/2Kkf4ujMbbHX5GWMbi+k
 V90us5i0epFGIrjrYR7FOVCjoIokOOTbHO9bQkgtp9r6Dyf5uG9yKK4AbdlDDxCE15mv
 lhXSGJQ83lVuXQ3dt+l3DOFGYXXq9o2J9VI4E+vV2ob2fKLHlRd4pelnmj9NmV1rLdlT
 JX2hY+xjJd/Uo/33nNsf70E2JEr5I6cI6BjswlCH8mGpNfXodHW8jTvMBclUHsYsLlAe
 9HdExH5uH4R2ItepwYIt2FrlKkI10vBmJcrChj3UC0E33UiKKZVaCZsGRwH8PTpWkBS2
 WYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JJoTUf0U3pJsRg6NZ7uqQeVRJxHKKo1I4fmow8CxV+8=;
 b=rmuk7IBv22BFIyXetPXFm0kfjZWZhl9hO49HL6XqDQEvzzGmqG8ivEW2xOfKGkbcfZ
 oT1mCjDgNYR0QWIlFsa9G6jGG0NZ5whLA57SqisiLNinPXu4NA+8ww+531PZxyxHuyNB
 1aPPObs6gR1HsK83wAsMEsJFYb4K+qUe9pDPegiaXPMTnSIS9Vqqateu9K3mu74RILzB
 5KrVevLgak45n8LHL82GR4hAPhlCgIetTEFOOTa3RzTb8xoaYmT0wmsqMkr5bS+tdAtg
 9JU4i/FlRoQdaMPUHPguZEaOG8lvTc0h/enVh1XKq+xJh9pMiyww2hjvx3CbVA6b3fnr
 hkaA==
X-Gm-Message-State: AOAM530G3WCKpmcCCynBog/B/htb/epHfJRkWG/jKPVuUaY1yRylzuYQ
 tt666CkC/rLYS6Hc7V8witQLJ5se/fNpwg==
X-Google-Smtp-Source: ABdhPJze411pxcZ93MmCcjK+zDDmn5iR7dL489MmGl5aSgMLMQb/1l/1jXQ7PTqQ9DEWIjHar5gtSw==
X-Received: by 2002:a17:90a:640c:: with SMTP id
 g12mr24989806pjj.52.1624056057249; 
 Fri, 18 Jun 2021 15:40:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id fr20sm8621240pjb.29.2021.06.18.15.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 15:40:57 -0700 (PDT)
Subject: Re: [PATCH 8/9] target/mips: Constify host_to_mips_errno[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
 <20210617174323.2900831-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f352008f-4308-5859-7929-a6f9f09d3f92@linaro.org>
Date: Fri, 18 Jun 2021 15:40:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174323.2900831-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 10:43 AM, Philippe Mathieu-Daudé wrote:
> Keep host_to_mips_errno[] in .rodata by marking the array const.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

