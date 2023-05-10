Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626DD6FE230
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:13:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmRF-0002Eh-DZ; Wed, 10 May 2023 12:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwmRB-0002DS-W8
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:13:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwmRA-0000h9-1n
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:13:09 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f475366514so7758255e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683735185; x=1686327185;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=htY5EZ6WTIVHCyo4mZ/rIeQxNsCvxiyS24rSgTevj10=;
 b=OdzYjbhZ+r5jsHEnlV8Fel9HibQduvgMcbALQoiNiCWEQeLfvk2ubtojN8m8ZyOfYs
 KOjP4+39yicPnN2lAJUn5ZQM+PLmhtwr5SWLW3SHz6/BKxVsE7gsqSyQA76uPs7Dvg2K
 E9vKsBJqwvKv8pHF73VEYZXgRbJ40eYyDooY1Ko3vADSiXahQPU0qsVdJWKZYcv8+m+u
 mP7PbA46PUm8JM/A+6TjQYB7VtWgeJn/4AEMoe4FRGzUaLtBmVtqFFTaDGyabBQPbFdN
 PBBYGhWZBa0W0MPnltdMcFZk8WCAvD6G3F6p1q8jOu+SgMqcfGYwqlB8Z7J44ZkoTZPn
 UNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683735185; x=1686327185;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=htY5EZ6WTIVHCyo4mZ/rIeQxNsCvxiyS24rSgTevj10=;
 b=EO+fedYItEYnURDshwuGfHV48wRgiC8hjYzUB0pSXmdlfWpfMbKW/QcGpgmGQqAY7n
 WBaEe9LzDSyGtWwRcb1vkw5/DV5XwqO6Ze2HxvfZND+/uJrw/TMwuaHvy4VaAXZNXgjW
 DcxO1Lku9jeZXxAJIO8pXf0/Xf6Sm2JAJm4b31prc1rM13W7UOa2G84iTzwO0AJJLN6q
 nVmgGMru4alPu3kupmeWNZFwU3GWwGpLIqqUKYJdOw34iF3/+smcITsVaDK6TVYYrlaW
 G2hib7OvnMRvlHu1xUatoy9lAXHvQ69QQGusjivjmcCSVDryqf0pNOJ58GThBakusK5H
 b7Uw==
X-Gm-Message-State: AC+VfDwx9louTpK8ieYqnsJUECmkKl83ZHcMOmw8Zzau1OZFmY0qsNRE
 /NGUVAUgslOf+jEVkMdESVhjMw==
X-Google-Smtp-Source: ACHHUZ7lCeT6Skxe8WMdnfAAVZLb4yJVogkBPkDtk/3C2Iskj0fesXXCj6I0QvbgKHC4MSY4zyZIhg==
X-Received: by 2002:a05:600c:218:b0:3f4:28fd:83e0 with SMTP id
 24-20020a05600c021800b003f428fd83e0mr6082501wmi.31.1683735185676; 
 Wed, 10 May 2023 09:13:05 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 14-20020a05600c024e00b003f423cc11e4sm10651481wmj.16.2023.05.10.09.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 09:13:05 -0700 (PDT)
Message-ID: <c7e792c1-8229-8b6c-8e6a-1eda14d77c03@linaro.org>
Date: Wed, 10 May 2023 17:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] target/openrisc: Allow fpcsr access in user mode
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>
References: <20230510153228.264954-1-shorne@gmail.com>
 <20230510153228.264954-2-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510153228.264954-2-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/10/23 16:32, Stafford Horne wrote:
>   void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
>   {
> -#ifndef CONFIG_USER_ONLY
>       OpenRISCCPU *cpu = env_archcpu(env);
> +#ifndef CONFIG_USER_ONLY
>       CPUState *cs = env_cpu(env);

Pulled cpu out if ifdef here...

> @@ -204,10 +220,22 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
>       OpenRISCCPU *cpu = env_archcpu(env);
>       CPUState *cs = env_cpu(env);
>       int idx;
> +#else
> +    OpenRISCCPU *cpu = env_archcpu(env);
>   #endif

But replicated it here.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

