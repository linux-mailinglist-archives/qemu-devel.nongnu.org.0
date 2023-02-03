Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABC068A083
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO00o-00018y-LL; Fri, 03 Feb 2023 12:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO00m-00018T-Bq
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:38:08 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO00k-0000rM-RY
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:38:08 -0500
Received: by mail-pf1-x434.google.com with SMTP id 203so4218902pfx.6
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 09:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ji2J6KZBtiSwSZhhlL8oBfPaFCHOhmDMElIZmcMVV5g=;
 b=WHMsHzVtFY+GCjtFlJGdXEQHqfuvWCu1l1BpSeEec41U+WmMDvh1KvrT6XDvCpW5AR
 xAAHhnsHOq0a9v8f13qiDS3eScfQ0TnMLqv4auyyk8t2H6XGUdI3XGAxWolVv2DihmMi
 am65gVswBBHHlN+WlJ8l7nBXHMbVbrO/6diXByauLiySyhyN/TLHSuYbcyP5mtfDFnKm
 n73V8UVjqGywSxtpsdKYx/1hrNrU6J0SMOB/Tc7h9eoOexZxzIMfJdJHzz2dGJH2crQx
 LeqgIRLyRB6TUbZe01FQHEnVPqF9x8ofcIyiacC6NLqWgZTiL94x1VuCFCJICWjc0+xB
 ErGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ji2J6KZBtiSwSZhhlL8oBfPaFCHOhmDMElIZmcMVV5g=;
 b=mYNexWbOHdjbhTqBWd1teY+ONtPSVOuhUndv3hYBMihNp+bEwV355czL5hDDfvEMaT
 fCXGhnvUS8+iQWk2YRLIHC1x3niZUx1CvUUAS7MgFX8E6jkeTEJIMEpoHLZgQk8mwa9h
 oq+Wg6wWoq0CzmaZlqYb12efT3nbVVeZ8Mb/L4yGCgOnCreh0wrBrhxxCkNN+u0lllrf
 K/BF2XOH3nX185v/VupgcXI+T7pl9ZEq8SX8RBUIIrZ+8U5tCm9QEfj3ZFQLcxrTGB/X
 BeldBOCXbTS7jJeG6pOmh0ApZqA5P9nwPF9W+J7VS0L3jTcf58Tn2JYdoHi51Kfzd5/t
 6gHA==
X-Gm-Message-State: AO0yUKX2AqslLX8c4n93wWjrv7lwAwkSfLImmSBUxTRTf3GDcOqttT29
 tpgIyWm6vpFoM/i1Q9spnSVhyA==
X-Google-Smtp-Source: AK7set/IhTv5bYBwbdqsXYarz4MdOl8xpj1VTvmHt/MJH3K1/ilP0PMKtq/iuo/C2GDNeSnjdKgYcA==
X-Received: by 2002:a05:6a00:991:b0:590:6d2f:d23a with SMTP id
 u17-20020a056a00099100b005906d2fd23amr12957431pfg.10.1675445881858; 
 Fri, 03 Feb 2023 09:38:01 -0800 (PST)
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 v15-20020aa7850f000000b0059398b45272sm2066976pfn.58.2023.02.03.09.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 09:38:01 -0800 (PST)
Message-ID: <9ea6c5bd-dea5-13bd-dcbc-00b096a0080e@linaro.org>
Date: Fri, 3 Feb 2023 07:37:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] tcg/aarch64: Fix patching of LDR in
 tb_target_set_jmp_target
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zenghui Yu <yuzenghui@huawei.com>
References: <20230203171858.3279252-1-richard.henderson@linaro.org>
 <d38221c1-cc89-7161-3713-2b314a253b56@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d38221c1-cc89-7161-3713-2b314a253b56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/3/23 07:25, Philippe Mathieu-Daudé wrote:
> On 3/2/23 18:18, Richard Henderson wrote:
>> 'offset' should be bits [23:5] of LDR instruction, rather than [4:0].
>>
>> Fixes: d59d83a1c388 ("tcg/aarch64: Reorg goto_tb implementation")
>> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/aarch64/tcg-target.c.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Is it worth Cc'ing qemu-stable@ ?
> 

The patch being fixed is not in v7.2.


r~

