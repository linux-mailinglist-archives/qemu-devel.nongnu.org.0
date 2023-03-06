Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE17F6ACD0C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFth-0000vH-0f; Mon, 06 Mar 2023 13:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZFtU-0000uU-Oj
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:49:10 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZFtR-0008Id-6Z
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:49:07 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l25so9885777wrb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678128543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KKhsRC0+zHTrOXNnMQcEKda+hfFNb/nS4UWr7vej2zM=;
 b=XZtl9WhLwsRb1zT+1TfSjC/W/merp+L6PgB3yyWAHrjZOg8Pztx5FYfF2kl+Ak6KRm
 jCYpTlivbvCCoO3+JpV6olct4GLQN5CpLpj/ukLGBDDq/lN/U7ZGvXW1dzTI6ebj12xa
 daR7VEMzv7lsPNwMjcOHF7XJCylf1GMpf6Qu5OaRyL+uLXADxzZ+8PMDZircuLwNrby3
 3iH4YjxPs3aSE2j8YD0mOpDNIzmNgTtIIL57g+QUu2eVt9XtIw0ur0NUHfNzC4zutOUE
 Sb3j4x5fc9I3q1M7ZpN1Ge1F5YZlqh9qBx7Gy/4xbwq5HSxRwzOnmrW2RXBPHrOAV7fn
 4ojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678128543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KKhsRC0+zHTrOXNnMQcEKda+hfFNb/nS4UWr7vej2zM=;
 b=oKypPahZfk9KWSc0nsF+7gz4AJITQMjrRHZwTFlPEf3gTEgvbuPHcLcFZo2SG9Qeqy
 wB+ud+fzV6iTF1sCG92U7p+P5ntoAGnqaBNW/HVWFskpHpfku3XS1ucqXgwJuEnYGkfH
 OIfcolvElLY9zjHg9f7sAVrZfret6Qq677D0y/XFwb+V6LBKRbSPXWzJzt1l+ttgFA1k
 DjpEvTB3i1Mpq4CpFSsp/s5FFcmZ27O/+1NV2ppDb4kyq2NEFY/pL50aP2d4tGQcc0zx
 tY/EBnkq1Z1djsf7cFDl2DB9xsVgtKmrsYUUiBdJLj9TdX9d3MhARrvmTAjqYhk04y/M
 js2g==
X-Gm-Message-State: AO0yUKVbBBb/nQlS44f1ct2Hyk/XkSaM65/fxW9p2ybZLLzG/XCr3xif
 MjHxP/SzxYlwmKkXPHUTQfTSbQ==
X-Google-Smtp-Source: AK7set+7RaObm2mh41jioaBgiif4R6DmW4LV7sinBgZNOSCI0NybUvA5IxlWyBZTVsnhz+BeHkSJPQ==
X-Received: by 2002:a5d:680d:0:b0:2c5:6cfe:aabf with SMTP id
 w13-20020a5d680d000000b002c56cfeaabfmr7297312wru.9.1678128542745; 
 Mon, 06 Mar 2023 10:49:02 -0800 (PST)
Received: from [192.168.165.175] (98.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.98]) by smtp.gmail.com with ESMTPSA id
 w17-20020adfd4d1000000b002c6d0462163sm10614180wrk.100.2023.03.06.10.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:49:02 -0800 (PST)
Message-ID: <0be0019e-58da-3438-654c-2fabe0e7c5cd@linaro.org>
Date: Mon, 6 Mar 2023 19:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 01/23] include/exec: Set default `NB_MMU_MODES` to 16
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
References: <20230306175230.7110-1-anjo@rev.ng>
 <20230306175230.7110-2-anjo@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306175230.7110-2-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 6/3/23 18:52, Anton Johansson wrote:
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   include/exec/cpu-defs.h | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index be920d4208..69cd62c19b 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -36,9 +36,6 @@
>   #ifndef TARGET_LONG_BITS
>   # error TARGET_LONG_BITS must be defined in cpu-param.h
>   #endif
> -#ifndef NB_MMU_MODES
> -# error NB_MMU_MODES must be defined in cpu-param.h
> -#endif
>   #ifndef TARGET_PHYS_ADDR_SPACE_BITS
>   # error TARGET_PHYS_ADDR_SPACE_BITS must be defined in cpu-param.h
>   #endif
> @@ -55,6 +52,14 @@
>   # endif
>   #endif
>   
> +/*
> + * Fix the maxiumum number of mmu modes to 16.  This is larger than all current
> + * targets, and also the maximum supported by the softmmu tlb api.

Typo "maximum".

I'd keep "larger than all current targets, and also" for the commit 
description and not commit as comment in the code.

> + */
> +#ifndef NB_MMU_MODES
> +#define NB_MMU_MODES 16
> +#endif
> +
>   #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
>   
>   /* target_ulong is the type of a virtual address */


