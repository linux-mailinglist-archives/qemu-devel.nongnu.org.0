Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9535B9653
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 10:26:07 +0200 (CEST)
Received: from localhost ([::1]:35538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYkCD-0000c6-MZ
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 04:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk2h-0004q9-0X
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:16:17 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:41495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk2d-0007Dx-Q8
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:16:13 -0400
Received: by mail-io1-xd32.google.com with SMTP id r134so14300667iod.8
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=et4yR2vZNnpuyu+Y+VxJoidQ9mI5mEVRdeAglxprfiM=;
 b=Xk9Aj5GSSHIAP9NBREZJdHwz7KUA8S3zYS4i7wuU4ym6blCi7BzBQMkzQ+oWdK3VJe
 EmPvViaxB7jNJO4SwUfE6KE+jjiAQxj4FaxZ9tXO4S1FGmUepPg2+CMVPPNxKnIWPSq6
 FOregoSD6xvBIxhG6wKcURjsMWAE4kWr35biouSFwCUQRPurGLqmMvPUcEuroo58LHsn
 bKye0qnY17WXBdZIIBCBHIQ0SxCVDglcEI7AcbsvpY/TaV8wMrAxQYcgaYHNDxE2aFaF
 bmFTIGDTh8KIQv1VZFuzi5+OMcO2sOwC24EfJRlPmlQs+Ur+Zm/vUeCAFDbkj9vyALxj
 XrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=et4yR2vZNnpuyu+Y+VxJoidQ9mI5mEVRdeAglxprfiM=;
 b=aQok7czuMgY4kSrtj87HQPc8z/wTtv3YVdkJ4nu2Bthr3s4fqqQeQFqaMdQPeqczWe
 t/SVAE6GV1MOgLMdhM1Ly+CK8KhB2l1urbpl/CH0IB0FM0oke/h/+YqZxig9dkktWolc
 o3nWuCWpqv8bIiP34WjCPzPQdMRoJDzjfuCJL5sT2tf4qP5z1yMb77bhKl7E2DUcQErS
 TKtplqtopSTLV4Ma3WO/NyskOWIxhVVa3x2idSVNpvLoVHVS18lCxJ28m6vJrwAIG5QH
 mCKYLd6hyoaf+iHLpujLUHmFJs8yuYa/3jg0BSBfthzxujFxleXLg8c7UMADkjFpw5bc
 Y1IQ==
X-Gm-Message-State: ACgBeo3enxAORqIpjxBv63xty+WBmtaCgz6ppqAwj7KdSu1bYAbbZvZG
 qMSjps4cMiJLkPWMdXUr/I9prA==
X-Google-Smtp-Source: AA6agR5A4np2AhL3jI+J8X1NSSUMOV3qoYQsWUN8PAztLOB2yYqtNLS5pRU50hl+Czugx91L4IR/MQ==
X-Received: by 2002:a02:620c:0:b0:343:5e87:1bae with SMTP id
 d12-20020a02620c000000b003435e871baemr21010772jac.100.1663229770275; 
 Thu, 15 Sep 2022 01:16:10 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 t70-20020a025449000000b00349fb9b1abesm813036jaa.106.2022.09.15.01.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:16:09 -0700 (PDT)
Message-ID: <c6d2e06f-75b8-0ba2-5e0d-51603873e40c@linaro.org>
Date: Thu, 15 Sep 2022 09:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 2/4] qtest: make read/write operation appear to be
 from CPU
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
 <20220914160955.812151-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914160955.812151-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd32.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 9/14/22 17:09, Alex Bennée wrote:
> The point of qtest is to simulate how running code might interact with
> the system. However because it's not a real system we have places in
> the code which especially handle check qtest_enabled() before
> referencing current_cpu. Now we can encode these details in the
> MemTxAttrs lets do that so we can start removing them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   softmmu/qtest.c | 31 +++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index f8acef2628..c086bd34b7 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -362,6 +362,13 @@ static void qtest_clock_warp(int64_t dest)
>       qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>   }
>   
> +/*
> + * QTest memory accesses are treated as though they come from the
> + * first (non-existent) CPU. We need to expose this via MemTxAttrs for
> + * those bits of HW which care which core is accessing them.
> + */
> +#define MEMTXATTRS_QTEST ((MemTxAttrs) { .requester_cpu = 1 })

Maybe clearer as { .requester_cpu = true, .requester_id = 0 }?
Otherwise it kinda looks like we're setting the second cpu (index 1).

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

