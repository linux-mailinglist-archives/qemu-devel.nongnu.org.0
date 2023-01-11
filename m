Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCBA666835
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 02:03:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlaI-0007Tu-Q1; Wed, 11 Jan 2023 19:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaH-0007Ti-FH
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:45 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaF-0001hN-TQ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:45 -0500
Received: by mail-pf1-x432.google.com with SMTP id i65so9210925pfc.0
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bYJoKIZm1hyXjsTxr0wMNg1VsWwfcqhf2+zUyrxQDcs=;
 b=aamLikFzKpKd+lUDa4skP7CC7FOncU/vYm1SDbtcIRaE7we8hqVx0adbuVj/6xkjFH
 OUuKvUcvTumfRhTi5tFBAK11hC4YYSOPNC+k/l1JARgjWP2NN7ohgLvUct3mhMQVgjsq
 vCJYDvvEyBVi/KvjEUHb8wxw+wjFcRWBjp7zM9aPRevjODUAFFhFcxaxFMac4Zedbh8F
 RbgnOg1Hf9ZVyZM4/WJzs/orpMuhccpRukfNZRoxE6C41OK7xv5/n29yvNW8wMgvApTW
 E+AFUyVNccZYhhWHwY7Sb+ykrPn50LsjXITeWQkghhdbhg1AU/1kLLzcveN+eEiK09+c
 hEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYJoKIZm1hyXjsTxr0wMNg1VsWwfcqhf2+zUyrxQDcs=;
 b=GRK5TdCGOYUnduPoQspgGWp3ftou25El9QmdgHnvcBWSAyFTjICxGzecsECoTuLoE5
 YICbAAaccik2vEX3dfQM6LPclPzdqjO8/g7H2w6x06QvTqPRGlpxVgeUmnRN59WK8VcA
 poTseewAanSHNCnyqbQ35eTChgqMNVhoIqNkgQpabQtKGqnQwzsDqNZgeTmaERNeL/MR
 ufyZF5Sw/nuJTKaFs4BsA80LP13IO6qiI158+iidYbbKopkmfj1cqXaat9TEVI2rGjb0
 UbGQBxH89mg5FJIj/0HSKI8Vhb2JfvV+C8GoH/C8YsQG6lUpJKrgEQAi3JNU503rqlSk
 yAbg==
X-Gm-Message-State: AFqh2kqbfGZSyENW4c1a27fhSoM8J2TjDKYtEVPSr8Tvz0MkAFoMmM8n
 aolWE8o1jFV008jygjORbTQVFw==
X-Google-Smtp-Source: AMrXdXs1/Hhxret3YEUJjnXkhmVFjVxnpmmHFno+HR/loGZLKNXIqULltjBvmpDW8/tZeUoXY561fA==
X-Received: by 2002:a05:6a00:3217:b0:581:7430:aba with SMTP id
 bm23-20020a056a00321700b0058174300abamr48969695pfb.10.1673483802378; 
 Wed, 11 Jan 2023 16:36:42 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d2-20020aa797a2000000b005895f9657ebsm5868339pfq.70.2023.01.11.16.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:41 -0800 (PST)
Message-ID: <e2693fc6-e7b2-74a4-53c1-4ed0c46f9c7b@linaro.org>
Date: Wed, 11 Jan 2023 09:11:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 24/26] translator: always pair plugin_gen_insn_{start,
 end} calls
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-25-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110173922.265055-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

On 1/10/23 09:39, Alex Bennée wrote:
> From: Emilio Cota<cota@braap.org>
> 
> Related: #1381
> 
> Signed-off-by: Emilio Cota<cota@braap.org>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Message-Id:<20230108164731.61469-3-cota@braap.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   accel/tcg/translator.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

