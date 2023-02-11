Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C053F6932D2
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 18:19:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQtWa-0007RP-Rf; Sat, 11 Feb 2023 12:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtWY-0007R8-Pk
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:18:54 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtWX-0006A9-8f
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:18:54 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 on9-20020a17090b1d0900b002300a96b358so8641657pjb.1
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 09:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/1LIuLIHZf3d/Y4L4A9WrM0IFLNRLrENSk0HR0ZAF5s=;
 b=bHjITRyc63yvFXXGbwyWbklCHv4QuxsMxoKOsavtW1dDFwNbarPj1aM/VweAg1ccVc
 ng9AXwiYCPKHbaK7q4sL1+vO1AK3uc5GGsf350obwfRy9xQ/QkixjUn26m2YwnA28u+J
 Kai6gqADdzF7EvyH9T6RddgWrIq/fWTqhLf/TraJ5rbGHzrQ+y6F/VUG92ewHvHGKaWV
 cavp2vm8L0pfM8Puxef2kmYCaXgHUSJpee96asdOMO+OUYlOHosnEkyEF8bcGGiLDl2J
 T8qGdEXbo9MRtLm96mqtqrwq2mfYdH89hSmjw0CseW0iyP9CzsObUXXI8s58ep2STXhl
 IvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/1LIuLIHZf3d/Y4L4A9WrM0IFLNRLrENSk0HR0ZAF5s=;
 b=zm4m102bWbQ04FHtAhAAHgL+eZrY0rg07RNUh6+yVdklUV99X2B5Oao7nvWJ1OdfF1
 Mn1hcT6txByXzcDP+1kryIk7WnN4l8OaC36i0Nmx4P5gkphy5c6i6nhjeMF+m7oBvoEH
 DSthuqLrGQ2M3PAgj3bRHbfgobvAOeuRqpQg/Refp2mYJbjpwIjiDkumDtcJYxNfKGX+
 AofDo1e02/ik0tE5OLS4baBpmsrIiO1/jTzMsV5+KrNzfGURXnQ8kOPBxagWAuPMhzwj
 08LAFKKeyw8ARyRLgVErf68BeIAUFaQ0HToK3OYESHV21B2wM8k3a7ohxTB8VJ5XfthP
 I4Xw==
X-Gm-Message-State: AO0yUKWFYYVWXeR1Tn/Pyd9ciDJZpTvxboa1nLvnfy5f+4A/PGWklRyd
 Rby3fHPOCRAz8sZ2/za3ygZmFg==
X-Google-Smtp-Source: AK7set92OMqhb3CBIONl3IuoGQrZvQJbt/G++lKnMY4UT5i0GboF0gGzEAfvVLPRGWVqSNQ3HiW5/g==
X-Received: by 2002:a17:902:f145:b0:19a:95ab:6b63 with SMTP id
 d5-20020a170902f14500b0019a95ab6b63mr296565plb.66.1676135931519; 
 Sat, 11 Feb 2023 09:18:51 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jf11-20020a170903268b00b00194d2f14ef0sm1058230plb.23.2023.02.11.09.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 09:18:50 -0800 (PST)
Message-ID: <3b2f35e2-1fb6-56e9-8d3c-40cb2d72bc38@linaro.org>
Date: Sat, 11 Feb 2023 07:18:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/11] hw/mips/jazz: Rename ISA input IRQs as 'isa_irqs_in'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230210163744.32182-1-philmd@linaro.org>
 <20230210163744.32182-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163744.32182-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 2/10/23 06:37, Philippe Mathieu-Daudé wrote:
> The following code:
> 
>       /* ISA devices */
>       i8259 = i8259_init(isa_bus, ...);
> 
> gives the false idea that the function is creating a i8259
> device. Instead this function returns an array of input IRQs.
> Rename the variable to clarify:
> 
>       /* ISA devices */
>       isa_irqs_in = i8259_init(isa_bus, ...);
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/mips/jazz.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

