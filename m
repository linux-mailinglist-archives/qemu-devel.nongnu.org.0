Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2715B662C62
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:13:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvhA-000566-E1; Mon, 09 Jan 2023 12:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvh7-00050I-U6
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:12:21 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvh5-0002WO-E3
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:12:21 -0500
Received: by mail-pj1-x1029.google.com with SMTP id dw9so8008830pjb.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9zRJvusVdveg8ntpsoXYeqh/c6o+xozD2w4b9RQTDnk=;
 b=S4RIxIklpFe9OatknX4eoKqmjljrpI2CfPyRFt4fwpAZUz6Pn9/+I21qVH1eWoC+KA
 VGmUU621fZHFZm6ouNCrhkH+zKk+6nT0M8cBVyvNIn6978GKb262wwICCuMSdkoDX2N6
 or1V/Z8VcICiO2NRQC4H/MF6pPMug99FQLFbqnm6u5InIjkTlQ4EAwh5SQOC33wS36N3
 SzQS0UeXLJpfRM4LCtpCYfP4w4cvWP/KtECHTbXVUNObr1G9WgTBbMQIy8QJUbzzWqAB
 pQUjeGI5gk34J/HgwufZqLqg9UitCWztIYcIxkePSRz+bCdxDf2ZYxpyQbgvI8nOYMGg
 Vu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9zRJvusVdveg8ntpsoXYeqh/c6o+xozD2w4b9RQTDnk=;
 b=L66mJAAQIZf8UGh4BoYChj6kP8U78VxwmbXJDBoY/A2Ar66jkNT8WqxW8DO6ZQrRdR
 RQxDNeMPQwOqdwez1NHJFZntdFJJC2rOog5+AtVlllBsVnxp4NyERpYsJ8QLs9Gq7fnd
 2R/xRp/JRpzEnngtZIuMvXmJI7AbhL3gByYyAa7Jc5OBWkfiWYaLw76jWOq1XfA5csxC
 Q/AtZnaKof239BsOugRUKhDDjvxG09VvpyWBPpHEery23gCd/6rwqZR0ieQsw2ta5dSZ
 XJEXbcmPrq17SodnwvSAz2zoQS3Q0KJqGUqbhI3UzPXS8KQUeIdj7D6mLp/ptDSElasR
 0ZUQ==
X-Gm-Message-State: AFqh2kq3uT6YzqhIGqlBZqVz/YGnWiC42JQcjYM05+XIWQcv1aSuLnXG
 RD7Y6007yaNRwTRrZNdSVIPTsMFO44v5Loey
X-Google-Smtp-Source: AMrXdXuoyy4B2HmYTjzqp275KPvFMQcafiy4otqrf0fbMTos7Us9Qidi3rOnDtSP6qoe1mJYniwr0g==
X-Received: by 2002:a17:902:cad5:b0:193:12fd:a2e3 with SMTP id
 y21-20020a170902cad500b0019312fda2e3mr9522396pld.55.1673284338013; 
 Mon, 09 Jan 2023 09:12:18 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a17090332c700b001894881842dsm6394147plr.151.2023.01.09.09.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:12:17 -0800 (PST)
Message-ID: <d4760a0c-0c01-c5de-34cb-f5e381e51fc9@linaro.org>
Date: Mon, 9 Jan 2023 09:12:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/5] hw/i2c/versatile_i2c: Rename versatile_i2c ->
 arm_sbcon_i2c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230109091754.79499-1-philmd@linaro.org>
 <20230109091754.79499-6-philmd@linaro.org>
 <e901bc9d-1c3c-5cc0-7a59-e55816babffa@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e901bc9d-1c3c-5cc0-7a59-e55816babffa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 1/9/23 01:29, Philippe Mathieu-Daudé wrote:
> On 9/1/23 10:17, Philippe Mathieu-Daudé wrote:
>> This device model started with the Versatile board, named
>> TYPE_VERSATILE_I2C, then ended up renamed TYPE_ARM_SBCON_I2C
>> as per the official "ARM SBCon two-wire serial bus interface"
>> description from:
>> https://developer.arm.com/documentation/dui0440/b/programmer-s-reference/two-wire-serial-bus-interface--sbcon
>>
>> Use the latter name as a better description.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/Kconfig                              |  4 ++--
>>   hw/i2c/Kconfig                              |  2 +-
>>   hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} | 24 ++++++++++-----------
>>   hw/i2c/meson.build                          |  2 +-
>>   4 files changed, 16 insertions(+), 16 deletions(-)
>>   rename hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} (81%)
> 
> 
>> diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/arm_sbcon_i2c.c
>> similarity index 81%
>> rename from hw/i2c/versatile_i2c.c
>> rename to hw/i2c/arm_sbcon_i2c.c
> 
> Sorry I forgot this hunk:
> 
> -- >8 --
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a40d4d865..a3c7748505 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -940,6 +940,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>   L: qemu-arm@nongnu.org
>   S: Maintained
>   F: hw/*/versatile*
> +F: hw/i2c/arm_sbcon_i2c.c
>   F: include/hw/i2c/arm_sbcon_i2c.h
>   F: hw/misc/arm_sysctl.c
>   F: docs/system/arm/versatile.rst
> 
> ---
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

