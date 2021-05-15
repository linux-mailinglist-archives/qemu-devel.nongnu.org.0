Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFACB381A05
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 18:56:15 +0200 (CEST)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhxaI-00043G-F4
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 12:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxXS-0001lw-9T
 for qemu-devel@nongnu.org; Sat, 15 May 2021 12:53:19 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:40482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxXQ-00080A-8U
 for qemu-devel@nongnu.org; Sat, 15 May 2021 12:53:17 -0400
Received: by mail-qt1-x82c.google.com with SMTP id j19so1905425qtp.7
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 09:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GrkRmTeWIzLR1r18xTUqveCaCC36oyZeJtZGCG2Z8K8=;
 b=lX+G+c6R5Oh4P++pSeoTLpDqt6754fAFUPxEtY0bV9aebTvQcpKcCA7FuXkocR2Lge
 2RbnBQnaby+B0jEwtgND/IsfNGMcFhZfG10oC7z0XKWetWrIlVXzWIh0oxXd3gMt/OTe
 0dJk/RzcYThYHsAZf0LKUdD2PFBX1BiiAdl3JhfCqHBxuHRr+p5xS2y2AeywQL6J3M5d
 knU/HZVdAakI6dVmUM9uSsscvfGTjzoTZQwvdohQpFTrHgWrSJ/uNISqok2DSEa1iLbJ
 PYEpqMUZ86ySqVNmkcxk0YUlCNzFtQkx6FbejEtazPZjRHjrUsm6XPvEL+Lhb4g0lusk
 M0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GrkRmTeWIzLR1r18xTUqveCaCC36oyZeJtZGCG2Z8K8=;
 b=W9uoIi09NhU2HanN85fLnqVRIg+vlJpny1sermpg/5IsbrKDYGgA3dtH1dEBM91RDf
 cvo84QNZJRS3ZqgyjlsWKm2aqtoGoASUeOmNus8rWxK/iJfVGovTXEihoa8DuhfXYKNF
 G7sQO4FTaS9JSRC/RQcTvmS2b/7Ut0AsD1rPq9p00zC14g0+yvX/0Jgn+/J2m2dKFvAx
 S1mk9KPwR0xz5euvElcpUFJs1kFt9yUIKtYlfKjQbtS+w60AOm6y2JuelYE4k8PwQaS3
 edVNF0l70SC+oTNd5VLqGbjfYy1BILjwTI9+U1fjdi/VOMufgTUsIQzcQL8lbHDKJY+w
 DR8w==
X-Gm-Message-State: AOAM532XsdCErFj5iEfeC+QWk6eZXSy3j8bX9BMSNGKSEjZmAGcQim8X
 yizjjANSI1zzgQnQKCTwKdV7JA==
X-Google-Smtp-Source: ABdhPJxF+Tq8eExc75e8swXhGnVVBXQ9GgI+vPy5Nj9rXtpi2/t5pA3VMefJ7EK8uL93MXRFJVxyNA==
X-Received: by 2002:a05:622a:1189:: with SMTP id
 m9mr41477973qtk.277.1621097595158; 
 Sat, 15 May 2021 09:53:15 -0700 (PDT)
Received: from [192.168.183.51] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id c20sm7072283qtm.52.2021.05.15.09.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 09:53:14 -0700 (PDT)
Subject: Re: [PATCH v6 72/82] target/arm: Implement SVE2 bitwise shift
 immediate
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-73-richard.henderson@linaro.org>
 <CAFEAcA8FVHHYsH+nEVmJLYYvOGk-dsStvPKD0Yu_Qp-eDJQVRw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7e78b70-fe48-e5ab-9846-1422e2247cd1@linaro.org>
Date: Sat, 15 May 2021 11:53:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8FVHHYsH+nEVmJLYYvOGk-dsStvPKD0Yu_Qp-eDJQVRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 11:57 AM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 22:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> From: Stephen Long <steplong@quicinc.com>
>>
>> Implements SQSHL/UQSHL, SRSHR/URSHR, and SQSHLU
>>
>> Signed-off-by: Stephen Long <steplong@quicinc.com>
>> Message-Id: <20200430194159.24064-1-steplong@quicinc.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper-sve.h    | 33 +++++++++++++++++++++
>>   target/arm/sve.decode      |  5 ++++
>>   target/arm/sve_helper.c    | 35 ++++++++++++++++++++++
>>   target/arm/translate-sve.c | 60 ++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 133 insertions(+)
>>
> 
> 
>> +/* SVE2 bitwise shift by immediate */
>> +DO_ZPZI(sve2_sqshl_zpzi_b, int8_t, H1, do_sqshl_b)
>> +DO_ZPZI(sve2_sqshl_zpzi_h, int16_t, H1_2, do_sqshl_h)
>> +DO_ZPZI(sve2_sqshl_zpzi_s, int32_t, H1_4, do_sqshl_s)
>> +DO_ZPZI_D(sve2_sqshl_zpzi_d, int64_t, do_sqshl_d)
> 
> What is the rule for when a set of operations on (8, 16, 32, 64) bit
> values should use (H1, H2, H4, ""), and when it should
> use (H1, H1_2, H1_4, "") ?

Depending on how the address arithmetic is being done, and unfortunately, you 
have to look into the expansion macro to know.

If we're indexing an array of uint16_t, use H2.

If we're doing byte arithmetic and casting to uint16_t* afterward, use H2_1.


r~

