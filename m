Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8367A3A1D8E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 21:16:26 +0200 (CEST)
Received: from localhost ([::1]:45902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3gf-0006xQ-Jh
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 15:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3fm-00065C-Er
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:15:30 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3fj-0003Uw-Ti
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:15:30 -0400
Received: by mail-pl1-x62f.google.com with SMTP id v13so13147985ple.9
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 12:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dVROZKETV5g9pd5icw4Pjz+sM0br7otAB1vDz1vnAvg=;
 b=xjXdq+0efLob+7P+fkOrxF0B1W9FHFKaM595aHg6t0pFQBt9L+TgXORKY/bqHCPwyl
 yTtW7otLvi1ISYtJZXdZYN/oznhL/dhQe1/RgafsPm4iCQZ4qt79aV1zS0k7uu/cwrJS
 PKkpRgAFxR73/kaOG3dC3y1iyphG5IlHmUQ3sKnCVrYw+rvZwdXrkCG7OoIEoDoYSVr2
 2LaDxzuRcntTVWog6vIQ1HCzGOQQM61q8Ww8p+Fnxh2CNrnTQbjR5uUpki393yV/NjH3
 7h8jxO22b1fW4eOrlnmcFKmnQL489M40Shs27hUs1t5eMqDMHgjACJ0D+fj+1Gqub7a3
 /gVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dVROZKETV5g9pd5icw4Pjz+sM0br7otAB1vDz1vnAvg=;
 b=mDoSzuvxixnu5A+TnaErNmztalpwrQkm1nAPi9uWrbPhieKDYy62BuVWFbV2K75UCT
 GZFd+y3+m4lZf7MGIpCScgRbHIF1fzO8UN6pfAwl9Ul+t7VlQMiLGFLFZQ3bXyNPVY/I
 mk4slJnz9CKCANswXf9okasLit4oFYa8vDuXrAmhedecebh2XTVGvVPVoiNdyWvBvKaA
 zKLElTXykUFKeoPTkFlaEF+NXBCCja8wH3x3FYzY5sRRnjRRVyQvmPr2zYpi34gFNMG1
 OW8yKT7yQdxzzw1dnOeT13oLBlYF/UEDsk/Tsx4uYx/hflWtAKsSqdtpWWeTJaTHsZGI
 WrMA==
X-Gm-Message-State: AOAM5329XRW9TFGMW2FDkNWV6dYbQPYi9gB1ueOXv4Zh8JLL06lj/029
 nLWEWkcrEml7Il+OTaH4TxxaFmi/rL0qzA==
X-Google-Smtp-Source: ABdhPJzFcbI3pTJDDSCJchpsJJdxGe1KnxwSxC3bdIKvKneqiOD0Z6C0JNqZsW6+0AuhYeBx4NzYaQ==
X-Received: by 2002:a17:90a:5504:: with SMTP id
 b4mr1087353pji.208.1623266126417; 
 Wed, 09 Jun 2021 12:15:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d3sm305188pfn.141.2021.06.09.12.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:15:26 -0700 (PDT)
Subject: Re: [PATCH 42/55] target/arm: Implement MVE VQADD, VQSUB (vector)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-43-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df2353b4-5b1d-1501-a235-11acf00a04d6@linaro.org>
Date: Wed, 9 Jun 2021 12:15:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-43-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the vector forms of the MVE VQADD and VQSUB insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 16 ++++++++++++++++
>   target/arm/mve.decode      |  5 +++++
>   target/arm/mve_helper.c    | 14 ++++++++++++++
>   target/arm/translate-mve.c |  4 ++++
>   4 files changed, 39 insertions(+)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

