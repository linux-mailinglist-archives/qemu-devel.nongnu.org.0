Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3740A6DD814
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:42:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBSB-0000pB-2L; Tue, 11 Apr 2023 06:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBS3-0000oL-Ia
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:42:16 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmBRw-0001bF-OE
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:42:11 -0400
Received: by mail-wm1-x335.google.com with SMTP id l16so3764829wms.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681209727;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Us6tcV5lnTKRKMyK6gacWOCqQITbRHtnTKAjVmBqFMo=;
 b=Fd49tepfcjJhEL+qgTVHfFOS3PqsxXZtX7h2WnkKyy5FSjgywnJSOsdp8fIT7UK0aX
 dbA2EpkayNlNITEEtXBVZtHwc+7nncvwRgqK3T9C5eRVKTvVYzYXp2HtFBreJ5v+mNf+
 SsoCGBYunkmGHpzSCClQ+xob7muJquU3tYi184cixAWPeUQlNmXwI3eeRtQ5FB07LMqQ
 7wI3PDwfBWtMDuzOmLfIsl33SzcOBevefMqxrfi5nh8bhxorty596phO2Hh0O3BmHaCW
 qXojlhUUG9WnWRmDXrasnoS8vB6JYrCHLYBRQpPlFIs4oyXQj7yPoTFwLbnoFxibBG14
 HaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209727;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Us6tcV5lnTKRKMyK6gacWOCqQITbRHtnTKAjVmBqFMo=;
 b=NJBOmJMIenDBk++5bGTAhwoiTkKwMLAXezlCFNpra/432QsP0KJLwNqYn+bq8I/PFQ
 5c8sitVXG0efuw7WYxMm9vP370kmygyqtrobvaWvKuc0BfTcQCnQUMClGUU4aecHYrMw
 +fMqemZfndVExnoG5BEa/1gMyRoebbjmhJkGzoM3rlQbG9wBrf04OJ+IZBzo2br+Bw4t
 4ss9EJs4963p3sZa7hhB3Q2aEr2UkOH4oHv9D3itGYvqqL/U3mkEwV/wgeVLhwr4laKl
 gEuvFW6jrs9jCXtoH40eq2BN8cR8FGmoxl016CiZTIsDdCzKj2lLsdJwvT2DhQXWbThd
 flkg==
X-Gm-Message-State: AAQBX9ceiSMn9PI0HPjswHsl9R3ij8EiXr+RKTMhZdenceyAJJIzMdln
 +bGg5siINQ5UufJyfEyxDnnFow==
X-Google-Smtp-Source: AKy350ZwIOwySicl+Hl7s9fjMCHnWmifXS7pY1wlQgnfP3QTmzQGBJ6Sxn5e8I4x3h8fISceYUj9fw==
X-Received: by 2002:a7b:ca50:0:b0:3f0:80cf:f2d5 with SMTP id
 m16-20020a7bca50000000b003f080cff2d5mr6472724wml.11.1681209726872; 
 Tue, 11 Apr 2023 03:42:06 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003ee443bf0c7sm20380270wms.16.2023.04.11.03.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:42:06 -0700 (PDT)
Message-ID: <0dd900ec-cb08-b89c-bf09-851cca144afd@linaro.org>
Date: Tue, 11 Apr 2023 12:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] hw/arm: Fix some typos in comments (most found by
 codespell)
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
References: <20230409200526.1156456-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230409200526.1156456-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 9/4/23 22:05, Stefan Weil via wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> The patch does not change code and could also be applied for 8.0.

But not user-facing, so can wait 8.1 :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   hw/arm/Kconfig            | 2 +-
>   hw/arm/exynos4210.c       | 4 ++--
>   hw/arm/musicpal.c         | 2 +-
>   hw/arm/omap1.c            | 2 +-
>   hw/arm/omap2.c            | 2 +-
>   hw/arm/virt-acpi-build.c  | 2 +-
>   hw/arm/virt.c             | 2 +-
>   hw/arm/xlnx-versal-virt.c | 2 +-
>   8 files changed, 9 insertions(+), 9 deletions(-)


