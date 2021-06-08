Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD85139FC2F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 18:14:24 +0200 (CEST)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqeMx-0000N9-Q0
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 12:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqeLY-00074N-GP
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:12:56 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqeLW-00054U-8Y
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:12:56 -0400
Received: by mail-pl1-x629.google.com with SMTP id o12so7520710plk.8
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1E1XQBZx1xISdooT+gbm3/yQ5yplqheeK2tgkNMlSLc=;
 b=yuYu6PJDd7vZdRcOB9vkmAVZ/9VQc9GoqtERudkGab23WccCBE5swQ4aFMfJuDL2f6
 9NVbnpm6Gv2ODwwlLQ6KmX8fAmEyk2dsNpMTqNPYXdumG96mkoIKUdbYVMyqzeM5GPeP
 xwgnlYSQB97lB8UjYTfRhm+CyS0gIEFwrIOvakn13aVKC46zDP11NREWvTkg15+l1X7f
 R+2W07k9UppCDNXXTyKDl7D8Wcr7VlDFs2IpzOfMn/YEAiRrP/bl13u15No1voi1Sanv
 QP7VA1C1YsmTjhmv0SCoLBAvfGSMgbHWGCWK9QVX4YYUhKN8p9qNIgSksJQ3+PqP9seB
 rv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1E1XQBZx1xISdooT+gbm3/yQ5yplqheeK2tgkNMlSLc=;
 b=O/WufXWx2e5gpJs/Vz+cDVlpOmEMOADfe7Ps1fuQIl2pQZkC6LabVWuOm0ciCj27R4
 h5u3kY7mz+FiNvq+UCbgmsgnQBWSxX75/TVk/uU1Ghya4xI+bS26jCIYCMAvFJqXtZFQ
 cEuVj00K1qK/bElPWwAboUaQIlCggLFaYDMwv0IOJc8D6nycoeX7nFPp5v2Rlw6aHnEU
 5Ci+mHsefgvaFvFjwKO3dzjZfeYf6+ggXtEz+OhHx5LkT1t/826MaGZqAt2Qfy+xWUG6
 QnghsBrgrk3bIco1rV30dCy1rnFWjnSaa2xifVSrbolhTv0s0WE/2bpJ5IqAXGLx9NkF
 1CBw==
X-Gm-Message-State: AOAM530o91H7KkjqjsDxwgjrtIeCTW15x7IT2AT9bt0KWDMJVVyWRDDi
 7V5qBQnOcOCYOr7nyGEs7SOHGBPWB+WQRA==
X-Google-Smtp-Source: ABdhPJwsBxMq1rPZucCO0YScdTzADxpj0tzDQtgTLpstCzofHoVW3n2XD+TkLzel9g8z+t/5z6rxFQ==
X-Received: by 2002:a17:902:c951:b029:106:513f:58ff with SMTP id
 i17-20020a170902c951b0290106513f58ffmr363243pla.37.1623168772556; 
 Tue, 08 Jun 2021 09:12:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g16sm3108787pgl.22.2021.06.08.09.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 09:12:52 -0700 (PDT)
Subject: Re: [PATCH v3 16/28] tcg: Replace region.end with region.total_size
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-17-richard.henderson@linaro.org>
 <871r9cl4ty.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <15bdc94e-727b-cb84-890e-fb9b430f82ec@linaro.org>
Date: Tue, 8 Jun 2021 09:12:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <871r9cl4ty.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 9:03 AM, Alex Bennée wrote:
>> @@ -279,7 +279,7 @@ static void tcg_region_bounds(size_t curr_region, void **pstart, void **pend)
>>           start = region.start;
>>       }
>>       if (curr_region == region.n - 1) {
>> -        end = region.end;
>> +        end = region.start_aligned + region.total_size;
> 
> So why isn't this end = start_aligned + (n * stride)? do we not line up
> for the last region?

Correct.  There's some commentary to that effect in tcg_region_init, but I 
guess it could stand to be copied here.


r~

