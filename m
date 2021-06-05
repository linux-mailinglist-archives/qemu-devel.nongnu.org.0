Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8B339C47F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 02:36:28 +0200 (CEST)
Received: from localhost ([::1]:41246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpKId-0002b0-Qb
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 20:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpKHN-0001UF-5G
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 20:35:09 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpKHK-0000w1-9k
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 20:35:08 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g6so8626463pfq.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 17:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IllVOuVLyWVmnpnbdo342KsYg5PJF8rlhV7X4bGeK7A=;
 b=EPb0vUh3xN/Xt+1r/SoRCvAN2NaKEbbDzm+AXbqtcnvhGSrrPCW19kS0wPk+6+Dx4q
 fxUN0M6cuSs457+KUVnb/3bkyozlhcbzTABTvUduatQs4WHWI4DP0vg6IaQKrxt4jioM
 cpwktbbhcAYqvNCST5ifLkoWSDOOtsGdnmM1DOWInTkVcFkWja0+FACwuhalObapHxlE
 +TMZbaOpHuVg45wixB9BNk2fHhIUi0x+3j2O0Uorz8Ra9hj6HXhV+U+lUsehNjcFs7BT
 6n34PxJfYT98awAT8mV3YgNXjpxB7nJ0ol1ZdFSUSAtkN9ifo4IZcN/1qP/gHjT325LL
 VuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IllVOuVLyWVmnpnbdo342KsYg5PJF8rlhV7X4bGeK7A=;
 b=c0kWFS0kbD/5n9IGDG3ZMSVGRkIFlFoDJCJLif/jERjfyn3pkgIKe6taenYD79OO7V
 /GVMZvpEr1NG9kxo69XVa/1mqFz+YpbisF9bK2KoeIvFxdWarKUehVrnq8jFK4dpP+CA
 cVJcB2Svka/psK/WJIBx+prm6Nl3S/L/Ssuf+9F9tBivL763hQ+iStsXE2t8YRY5UpYX
 0XpRbbg8+It/aCL6pv9IoT8ij1bjSGW2nFlI8TTCPeTa7zzaJlKlRBQYzd8XCYg2IBjI
 v986Yjj28AAQaaj9G7ARzIZlByY9AzONR4Bn0bG3FMtVgywp4wbJEYAN4l+PKogyhEXV
 JF2A==
X-Gm-Message-State: AOAM530fCSro9reZT4cWzZd7+8HqX3PCnx47bjIYaqSYtrH9Bxaz1/d7
 migfRkjw3ulJAJvY3FioPOtlBg==
X-Google-Smtp-Source: ABdhPJzwvfkyVS63Z22ts7nHI6iZPJT1IXln2Ifp7PEuk2XQPmA9mtnDOhnygTl3MBfAofy2UcR+uQ==
X-Received: by 2002:a63:954e:: with SMTP id t14mr7530446pgn.427.1622853304672; 
 Fri, 04 Jun 2021 17:35:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f3sm5362360pjo.3.2021.06.04.17.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 17:35:04 -0700 (PDT)
Subject: Re: [PATCH v16 47/99] target/arm: move fp_exception_el out of TCG
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-48-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74606cc6-22c1-1bbe-dfcd-8919bbe2d0f3@linaro.org>
Date: Fri, 4 Jun 2021 17:35:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-48-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu-sysemu.c | 100 ++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu-user.c   |   5 ++
>   target/arm/tcg/helper.c | 100 ----------------------------------------
>   3 files changed, 105 insertions(+), 100 deletions(-)
> 
> diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
> index 7cc721fe68..128616d90d 100644
> --- a/target/arm/cpu-sysemu.c
> +++ b/target/arm/cpu-sysemu.c
> @@ -410,3 +410,103 @@ int sve_exception_el(CPUARMState *env, int el)
>       }
>       return 0;
>   }
> +
> +/*
> + * Return the exception level to which FP-disabled exceptions should
> + * be taken, or 0 if FP is enabled.
> + */
> +int fp_exception_el(CPUARMState *env, int cur_el)
> +{
> +#ifndef CONFIG_USER_ONLY

This is cpu-sysemu.c, you can remove the ifdefs.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

