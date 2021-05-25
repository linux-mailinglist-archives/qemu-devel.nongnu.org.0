Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A702638F806
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:19:34 +0200 (CEST)
Received: from localhost ([::1]:40952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMfN-0005Zf-0W
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llMFv-0005eR-LA
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:53:15 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llMFt-0003qZ-8b
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:53:15 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so12240603pjb.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z//ZdmQPdvPSCHUDAaZ6ZgNYu/ZvQQN6wVUK8vFK3VI=;
 b=EVYr7fX8soRG1lDRacDt9suAzoCzehnkl2btZKfvFI8jN3WLimHnx2xK7NRRzbP4kB
 83wGgb1gzzwD/6L70/3Cjbl56KxMttADh6TJuMjNXb9e+UIlIx/Ran5fJKynB/Q9Abeg
 XP676olnF5Go/+oik5dXgXRd3eT8FWmPaQ6s6tSc8dEcuECmT97ObCPCgl828kXjMS40
 yt0WaJvuaifR3Q+O1XvppqmDZlQ74Sn7vsLDvjIdxxcWNnteYaTHSuEtahoQ8nXROOJN
 PjAqkUFR5YGVOTiR+dQsY2GEBmkmHZbKgNBXurdzpPG4u1m+jE23FqZ4AOV3QR37bJgw
 1UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z//ZdmQPdvPSCHUDAaZ6ZgNYu/ZvQQN6wVUK8vFK3VI=;
 b=FlAG0jAUyjL2du1Anu327u4HkQ+ZdhiHjMkyzFAAwsD3651731QP/7LX9BwpSl8vbo
 uQsYy72dEC0z5vmS4KYTqqPsIHg+CzyfHwPs41hZHnclz7pK1KSCcvsX/tOLZREcLuax
 OeD6yhMHnm6GXSfrR2QKGycpU32upm1POGP6m3682+jSSe+43AUGELOLbcWor/Gm0Wpb
 xU1TKZDJHoXoywaEVpHXIhs7nXKqswkxOrGfiTNIdBGMu6HA3ST2OXNqqN4RcHto5mB/
 bpWQcBGbQUMWiujBUcgdX4JJdDmqVPfLIQPLSfYiK4W2b1KWPH+7/31ertR0cqSpVWaw
 fcvw==
X-Gm-Message-State: AOAM533kDGHeinJeWvQ+/OT+tjM9ZtVoJy890os2cC7hU3zLAUznHToT
 ndIvgYZgqbELsRzg+kXZer2uLg==
X-Google-Smtp-Source: ABdhPJyH6e7zLumN4tLPYzNm9ir6e/vQicnjYUOZ0YIi61z/t2f/jnBWIbCsxxW1FYNuXCAqOLPlmQ==
X-Received: by 2002:a17:902:d711:b029:f0:b127:8105 with SMTP id
 w17-20020a170902d711b02900f0b1278105mr28514824ply.20.1621907589622; 
 Mon, 24 May 2021 18:53:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g141sm10449701pfb.210.2021.05.24.18.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 18:53:09 -0700 (PDT)
Subject: Re: [PATCH] Adding ifdefs to call the respective routines only when
 their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>, qemu-devel@nongnu.org
References: <20210524225608.3191809-1-swethajoshi139@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8fbdab13-ed0e-047a-7a67-2e30471a46b1@linaro.org>
Date: Mon, 24 May 2021 18:53:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210524225608.3191809-1-swethajoshi139@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, Swetha <swjoshi@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 3:56 PM, Swetha Joshi wrote:
> From: Swetha <swjoshi@microsoft.com>
> 
> Signed-off-by: Swetha <swjoshi@microsoft.com>

What are you trying to accomplish?
That's what belongs in the commit message that you omitted.

> +    bool acpi_enabled = false;
> +#ifdef CONFIG_ARM_VIRT
>       bool acpi_enabled = virt_is_acpi_enabled(vms);

Of course this doesn't compile, having declared acpi_enabled twice.  So you 
have clearly not tested this patch sufficiently.

The cc to qemu-trivial is unwarranted.


r~

