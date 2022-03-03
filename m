Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0857C4CC854
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:47:09 +0100 (CET)
Received: from localhost ([::1]:49948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPtHw-0005c5-4R
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:47:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtGC-0003pY-C7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:45:20 -0500
Received: from [2607:f8b0:4864:20::1030] (port=41529
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtGA-00052o-LA
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:45:19 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so6302074pjb.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Zwf1VHOd3vRXDsiIr26IiXADhKVWHQPzfiSFdV1cRQo=;
 b=GG4Q1M+GQLmmYI9qsOyxth3UFsqxr7yyljqOzcMkyzdk0Ft/yXBbkqpwEzSQGon8gY
 ez2JpOK9aYHNLMjYV99Kq9qEfGatHiYSqMweHiuxafV/Jd8WVtM8P2Hg17FYggmWHwtU
 9I2x2GpQ9gsdIwBTE9o/Nm0DRjKM3q1jInfEsDQmrOfZKOfxSHp9H3VieQPXnCeqLVx7
 XncVAwDIugfdPi9RfaLeWrucTP4z49Xcf0nERpry8i1Xiw7mTqmiWY5zfWWZjRvWWuhf
 BUkbseDw25FIPF3P5uPaBMmSXJ+xsFrV2byEU3lCJ6Tv51GWj6htbpB11xsK/r4mrLA1
 Mw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zwf1VHOd3vRXDsiIr26IiXADhKVWHQPzfiSFdV1cRQo=;
 b=vrci8CVrjUV2OrjCt14wbyulK9toFJUKPHVw9xbUdflGDP/KHpx1RnKkLBAgxRUp4E
 OVw/CzUcw2J6KAwAbO2bUz6wlgROwzlLXtZpBLexrh3Z+kPC4nGnzs+EMEw7FBavyAXV
 SB6fe4fuCXXH9IeEvc/H8AN1lfx46T3G7r4hmNeDF0sjWSZL1TqnnUM8UdcWxDC1pX62
 e16HgjKCqhZfEO6/z7XzNfmcDqv/i/dVkE/c/plo0FnIUTsb6atamwOp3YU6XqEZ3p+O
 Mkyakx0LZJXNIIxXAMakPHzsaMWpxKWQ+oHSvWiVGAGFz9bPTWyXf5rvfYx6goBfbcqX
 7kjw==
X-Gm-Message-State: AOAM533pjQmSaWgFomB22SiBYoSHw+85noQl7k4c+y7u7ZBje6Qs+y9W
 qcxtUZ9dWHPaR9owz7YIBGjAYw==
X-Google-Smtp-Source: ABdhPJyUuv6FH7+8rX6GnrxL53ecxedt92GE/7B4g4Pa8A++hMGYUsBUB73uG9q0SzoS84ziAvE7GA==
X-Received: by 2002:a17:902:9895:b0:151:6a35:dab2 with SMTP id
 s21-20020a170902989500b001516a35dab2mr23103437plp.118.1646343917153; 
 Thu, 03 Mar 2022 13:45:17 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a056a00245100b004c283dcbbccsm3648989pfj.176.2022.03.03.13.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 13:45:16 -0800 (PST)
Message-ID: <7926be61-7536-e683-19bc-51154f0424cb@linaro.org>
Date: Thu, 3 Mar 2022 11:45:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] hw/intc/arm_gicv3_cpuif: Fix register names in
 ICV_HPPIR read trace event
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
 <20220303202341.2232284-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303202341.2232284-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 10:23, Peter Maydell wrote:
> The trace_gicv3_icv_hppir_read trace event takes an integer value
> which it uses to form the register name, which should be either
> ICV_HPPIR0 or ICV_HPPIR1.  We were passing in the 'grp' variable for
> this, but that is either GICV3_G0 or GICV3_G1NS, which happen to be 0
> and 2, which meant that tracing for the ICV_HPPIR1 register was
> incorrectly printed as ICV_HPPIR2.
> 
> Use the same approach we do for all the other similar trace events,
> and pass in 'ri->crm == 8 ?  0 : 1', deriving the index value
> directly from the ARMCPRegInfo struct.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

