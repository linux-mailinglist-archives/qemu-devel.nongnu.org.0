Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6245A6318
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:17:54 +0200 (CEST)
Received: from localhost ([::1]:47366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT0Bl-0000YT-1K
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT071-0003mD-KW
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:13:00 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:46619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT06y-0007Hb-Ok
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:12:59 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 w88-20020a17090a6be100b001fbb0f0b013so11613128pjj.5
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 05:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=av9f2djljxzDjTZGi9Yo6Yj7IV4hgEO6cUmWzaGGFrI=;
 b=cDQWYeEZdP5q7q2aB8OxUsr+jjnq+ubuZvnumRBuideCujNo8jisGpvmc6hspH87ne
 YdxE9zK4HrVT3KZigISKUh4ddoJ1067CzXO4rNYA9yKHBeXpZQpbVXmJlzmSqv+rM/7E
 PlbsSVwUq7qWM1+fwtkkks6yp8AqhgiRh/ysy7HL32HpC7P/EWenRwtBMliq4j1ghqBU
 aj8lJ5u5dolaOry1Q9blz63ca/X3uHtAsqgpCZbxuRUUvnexvo7T5nxIJ+TZ2vY7s5s0
 WYEzrcYvo8xwZ5JEfYQdLzHvTtf7OfOnxslEwcF3QkksyPKTA4xfCVFP62Yn1qPZPNSY
 qrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=av9f2djljxzDjTZGi9Yo6Yj7IV4hgEO6cUmWzaGGFrI=;
 b=FSAdhPyxskMQgvAZl6OLyT9NXIYy25feM7ArLmAdxt7anGZlliB3AQjHaBVwXVrHax
 qcn6GpY4mJdTjzq1UFsEQAPAx5ssEP/0SmsWM9mrUO/pxKUTkQmWITPCPo6PphybvfXo
 eHAc4qdWu7AtaCnEHCATLT/h4llCreI1/BmmSmrXM4BoiDkcN7qTicFOxUAsVJ4wYj4V
 NKlprgU6zdHgcy1nlFsAH2pMDBlRpgCHviSJ1ntwvW+joTQUmoXFDz68zC1JfoJCQYqK
 ak36tJx+RFUOtGuZuotOOW/aR+JmWjvAtcR6WpoUMGGIyoWVzb6SGlBXD1UpW38r4FPZ
 fCXA==
X-Gm-Message-State: ACgBeo0NC+9g1XKSdJgs2aAdIwcImCZWfJPgS/NCQkxOQE3Ily6zGFNY
 isZ/8fQag7TaaBEfyv+KZis=
X-Google-Smtp-Source: AA6agR5UK+aJfP62uqFtbx9CEFA2IYaXvZwknmJ2+1PlDRKoPPtGpreckK98Ql4lPhRwVxXN93TsdQ==
X-Received: by 2002:a17:902:e547:b0:175:376:875 with SMTP id
 n7-20020a170902e54700b0017503760875mr5085020plf.147.1661861575217; 
 Tue, 30 Aug 2022 05:12:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b0016d9b101413sm1300941plb.200.2022.08.30.05.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:12:54 -0700 (PDT)
Message-ID: <f4e7d88d-2725-bf07-faf1-dcc3e1899b71@amsat.org>
Date: Tue, 30 Aug 2022 14:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 4/7] configure: Add './' on front of glob of
 */config-devices.mak.d
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
 <20220825150703.4074125-5-peter.maydell@linaro.org>
In-Reply-To: <20220825150703.4074125-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 25/8/22 17:07, Peter Maydell wrote:
> Shellcheck warns that in
>   rm -f */config-devices.mak.d
> the glob might expand to something with a '-' in it, which would
> then be misinterpreted as an option to rm.

Interesting, TIL.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Fix this by adding './'.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 894642554c3..d5b6546ae81 100755
> --- a/configure
> +++ b/configure
> @@ -1093,7 +1093,7 @@ exit 0
>   fi
>   
>   # Remove old dependency files to make sure that they get properly regenerated
> -rm -f */config-devices.mak.d
> +rm -f ./*/config-devices.mak.d
>   
>   if test -z "$python"
>   then


