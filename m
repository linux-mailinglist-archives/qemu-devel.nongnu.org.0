Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125F7666821
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:52:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlae-0007qt-Lm; Wed, 11 Jan 2023 19:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlad-0007qV-7y
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:07 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlab-0001rC-NZ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:06 -0500
Received: by mail-pf1-x430.google.com with SMTP id a184so12669301pfa.9
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s8xRIRpw0WAo8Z5gQD/S+cALOK5Vh9UH9kuub8CTgUo=;
 b=wGUcMmtxM3A0vIUxWY+gHjIYPSUsi33O8rLYU5YfJjIoMLnGwOqEDjb+AYW8V+aCnG
 90t9W/Lctjp1aQSrcKHqyhma8Iqy+gi+M+wa8PyDXKRrVigHeKwyUv8jPXup8q15w6Js
 wzudOtTPoYIYb+LfrlJisoxQqbEd1S/RuCMU9yJy11mAEf+ATZ22WjO3u9KO0gvp6Kaf
 yIH66EdFRHSyq1aJ519P7YVKNhP8MTMMekC2jDOjpmOf99aE+7etnZ+i9PKWuToJwhiM
 xZPO+kvruD8dEQSXXyy7zd7dBjJBpFaK2pDDpCqCOa97XNSHJUjEvRJc/grSi1xb3n9C
 Y1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s8xRIRpw0WAo8Z5gQD/S+cALOK5Vh9UH9kuub8CTgUo=;
 b=yU/FrOFxGZu+2UkZFgMmYZKi31H+l64GBoidbf0i9CAqajWUarxgSKFkT5WvWxr/NE
 a3kDPlX1H/+qIAETNwwspDp8xcraGKrKgDcvMTjU7QMq4HpgtpgV4lqLWIVA6eKkBCIa
 YKB/dR7qBlM7juFPjhMAYQg6mw0xvkEjg8V+sZPoNG5rr/ihYHggtwz1Gv3KUl5nu67t
 edVREsF06agWhXzim1jMARuNpINVmOHIqynTdxA0etsfITq3lpQx3hrCcxGTuYaC8hSv
 6nxIOekwe6RQHsqRbURKBGHgVJDOq2fTFKXKIqZxbJ/EEVGHS1QT1hArEVdB+dMam2F6
 N8fQ==
X-Gm-Message-State: AFqh2ko37wn5eVJNkDUvgSHg1V3ctorxKEUgyWVaK5nnzj/GAtEDvFoS
 wHgBuUavzh/YnunI7DqIADXu8g==
X-Google-Smtp-Source: AMrXdXtc6o/CS9AzkOtDd8MD+cIVACtXbeJWASrr/nypQCt7c/OI8ioroiIOJ8IHb7XmpZmIle20aA==
X-Received: by 2002:a05:6a00:1da5:b0:577:9807:2db8 with SMTP id
 z37-20020a056a001da500b0057798072db8mr77681108pfw.3.1673483824263; 
 Wed, 11 Jan 2023 16:37:04 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 8-20020a621608000000b0058a3d8eab6asm4357007pfw.134.2023.01.11.16.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:37:03 -0800 (PST)
Message-ID: <5ae82175-d692-0add-7e16-df6a4a65d247@linaro.org>
Date: Wed, 11 Jan 2023 09:55:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/18] hw/arm/boot: Include missing 'exec/cpu-all.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110164406.94366-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/23 08:43, Philippe Mathieu-Daudé wrote:
> default_reset_secondary() uses address_space_stl_notdirty(),
> itself declared in "exec/cpu-all.h". Include this header in
> order to avoid when refactoring headers:
> 
>    ../hw/arm/boot.c:281:5: error: implicit declaration of function 'address_space_stl_notdirty' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>      address_space_stl_notdirty(as, info->smp_bootreg_addr,
>      ^
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/boot.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

