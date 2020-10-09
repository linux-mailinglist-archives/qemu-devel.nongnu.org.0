Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894EB28891D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 14:44:52 +0200 (CEST)
Received: from localhost ([::1]:44354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQrlT-0000PI-JJ
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 08:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQrjk-00081M-As
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 08:43:04 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQrji-00025O-Kr
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 08:43:04 -0400
Received: by mail-oi1-x243.google.com with SMTP id m128so10039374oig.7
 for <qemu-devel@nongnu.org>; Fri, 09 Oct 2020 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x8xmRfTHLK3kQuLH/s0R4OpetNNmtRLuNOMA4pPj7yk=;
 b=l5ufy0iUoRvOmJ/1waNMvCSHhELpJBohB7DUW3XJH94Bw5+6ftlEU8y9WwQR0zQV16
 dA+z+6KR7FLKoQHYfKXbaGdO2PkKk9vjLBbCBLLmhtzQTTK2kmekFk1w2g0DFO5VcEzV
 4rsxVXgpycGENkC3otqotQMaxRd7pkRz+gSlVPMlybzCxdM2vXXFExaL/IMTdyaRxA2F
 W2WBxFp7bToCerFwVo+ahq6DnI7Dj5/69UdsHhdiibD6aDC371iv8NnSPJbOebikPDCT
 Jc0X46WI0+7klTUfrIS6tLuzE46lszPUd9CeflMy29qITHDvd8H4mdEvceGuQn4m76lw
 U8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x8xmRfTHLK3kQuLH/s0R4OpetNNmtRLuNOMA4pPj7yk=;
 b=YP9tskyzNunf8E/oXZLP+O2ilkhBq7T/gMuduGrEX8fGNoVcbw2zidizgdejiSHh7P
 BQE4d/SARaX4qiYzb4bxQpMzXX6Ci0iZ0s5dQGdubFoB+GMixzXXDWn9vCRCfur+JU3s
 AXZgVZeGGgbZ4/fNghs5pTGaFPqjp07H9aIR6eTKZRzARReN0l3bMBBC57uVYQkwPyiI
 JiPOetlqWhzdPjQyhPnZyxddIwqzMjLxchgt/zZu+uIGwmgNZ8lQyMf/13+Ee3ovpEVt
 zyQqiJjt23VQUIjpfvk8Y9mibCpU4NcntWYtsTSRtS8OJCVGmalf9ekKrnn+czNSjmBw
 AXdQ==
X-Gm-Message-State: AOAM531yH2E81x4k6joUPxOpmSksULWHhLg1Bxt1yq6dXEK2nGIIrtjM
 fn+ZthGztgJFxQl+/gQi4H2rIg==
X-Google-Smtp-Source: ABdhPJxgq9vmCgdkGomfpFkbpVU4uHn5OoocLxImJdRmzzvEZ71YmDNXAUK99XWCLTqATid32fojOQ==
X-Received: by 2002:aca:d48e:: with SMTP id l136mr2411294oig.142.1602247380837; 
 Fri, 09 Oct 2020 05:43:00 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id o10sm6554031oib.1.2020.10.09.05.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 05:42:59 -0700 (PDT)
Subject: Re: [PATCH v3 51/81] target/arm: Pass separate addend to {U, S}DOT
 helpers
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20200918183751.2787647-1-richard.henderson@linaro.org>
 <20200918183751.2787647-52-richard.henderson@linaro.org>
 <f7b50204-0f53-5275-32c9-fdc9900142dc@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6eb557d6-8f01-4f94-fa4c-652044927b00@linaro.org>
Date: Fri, 9 Oct 2020 07:42:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f7b50204-0f53-5275-32c9-fdc9900142dc@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.208,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/20 6:48 AM, LIU Zhiwei wrote:
>> +    for (i = 0; i < opr_sz_8; i += 2) {
>>           uint64_t d0, d1;
>>   -        d0  = n[i * 4 + 0] * (uint64_t)m_indexed[i * 4 + 0];
>> +        d0  = a[i + 0];
> Add once.
>> +        d0 += n[i * 4 + 0] * (uint64_t)m_indexed[i * 4 + 0];
>>           d0 += n[i * 4 + 1] * (uint64_t)m_indexed[i * 4 + 1];
>>           d0 += n[i * 4 + 2] * (uint64_t)m_indexed[i * 4 + 2];
>>           d0 += n[i * 4 + 3] * (uint64_t)m_indexed[i * 4 + 3];
>> -        d1  = n[i * 4 + 4] * (uint64_t)m_indexed[i * 4 + 0];
>> +
>> +        d1  = a[i + 1];
>> +        d1 += n[i * 4 + 4] * (uint64_t)m_indexed[i * 4 + 0];
>>           d1 += n[i * 4 + 5] * (uint64_t)m_indexed[i * 4 + 1];
>>           d1 += n[i * 4 + 6] * (uint64_t)m_indexed[i * 4 + 2];
>>           d1 += n[i * 4 + 7] * (uint64_t)m_indexed[i * 4 + 3];
>> @@ -555,7 +570,6 @@ void HELPER(gvec_udot_idx_h)(void *vd, void *vn, void
>> *vm, uint32_t desc)
>>           d[i + 0] += d0;
> Add twice.
> 
> I think it is wrong here. Do you thinks so?

Yep.  Thanks for noticing.


r~

