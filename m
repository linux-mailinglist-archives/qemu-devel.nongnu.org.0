Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61886B20BA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:54:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCyx-0000mo-Dr; Thu, 09 Mar 2023 04:54:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCyv-0000mE-8r
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:54:41 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCyt-0003gw-SB
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:54:41 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so3296467wms.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678355678;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rEB7s1n5OKHVJVpTSXQAQpBMTnmGBLIxqAUC/PSgbgg=;
 b=pk9xX+QbMORAmDwcnIS5wmPVNHPnHgygaVkjhLMqoLVcZEXInbSjoVc89gFroh2H2t
 sMQLAi9emUjIucac5JJeG52R7njH2Hq6QIAazH1qKLi79yCr/vG8+47pH4pqXYs/vcSx
 8fXDxvEqUMpIPIbSi3hmjPQxbLTQTiW6f8vOoaK9SriWyWIflBiY/BaFhrwU5pn/ZbPp
 +8v/+13ykF9x9ljocBsynzX3hQvKqbpSqN81HOgQVPeRJ2M0oUwe3bNiyYGCO8t8a1nA
 K5Cp/mPR47j2SRJPcG1WGYjO/FcTfnQo9KEGoVxl0kYKn3U4s4LsdJIwIWUQvXWLhsQ4
 zK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678355678;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rEB7s1n5OKHVJVpTSXQAQpBMTnmGBLIxqAUC/PSgbgg=;
 b=Zti7/2gqiLZ2ukqCvxfcwZRty1G9vUo8csYTq2y2nAI9eYiWWld5peRjWmZb5kOaa+
 1lgYGE8zi1zvB8iDM9E5Ge0q6aMnJ4ktlZ/M+emh61P6fJd/3CNHJUMoFem1FK1DftLS
 fq0IRhuzgOCXPq2T1zJGGit0Ikv70aDI3jt5iAZqANKeVxpjoiQR8MgpDcnxRav8AUqO
 +0PoiJWsEg59nCd5rVT/c7pkrnF4dErgEIEuBqZ3ByVH8KSbZ011BcUPEGGrwDv/wgLT
 Kaq4IsO+lNjQs1BMz85XKIAvO4eeJ3HejqV2yT5tnlf2eMOEhsbjz59Kw/LhR0DLknrP
 gDdQ==
X-Gm-Message-State: AO0yUKVroFh6RW7fgN1mfhetIE3tbD9d/K2lst0SrMgC4VaLldc1Ubm+
 zlao45GmpFkA26+y2xygnbv4tA==
X-Google-Smtp-Source: AK7set8V4ZO54KwGx6VsD5/Uf9oGxTx4qjfAJJIQF/5hqCXQe8v/YbKoV0RbPAtz9LFESOKcM62SJQ==
X-Received: by 2002:a05:600c:35c6:b0:3eb:42ab:7b5 with SMTP id
 r6-20020a05600c35c600b003eb42ab07b5mr19516112wmq.1.1678355678606; 
 Thu, 09 Mar 2023 01:54:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w13-20020a05600c474d00b003eb5ce1b734sm2267542wmo.7.2023.03.09.01.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:54:38 -0800 (PST)
Message-ID: <78ff9dd3-4c21-afe9-49ed-635ed1e621a4@linaro.org>
Date: Thu, 9 Mar 2023 10:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 19/25] target/ppc: Avoid tcg_const_* in
 power8-pmu-regs.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/3/23 19:34, Richard Henderson wrote:
> All uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/power8-pmu-regs.c.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


