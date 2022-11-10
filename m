Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CB9623B67
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:41:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0JD-0007ic-Il; Thu, 10 Nov 2022 00:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0JB-0007iA-Qr
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:41:01 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0JA-0001QS-AV
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:41:01 -0500
Received: by mail-pg1-x52d.google.com with SMTP id s196so782065pgs.3
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/P3gxgO+QBnDwJGxjmfJCBToANCVMCf/BmXc9OJ8r50=;
 b=nz+QKYtY7x09tJiCQTo9YnjRNpQxZMd556emOlwbYYNLwP1sB9kAduXKaq+QX+Pcd0
 hJybfZxacTggrQ0al1ZA/7kpecbl/r8gR7DYVWVbe009eWsTbRlACGY3OW0xs6KJQocX
 VoVJn9mfnyZnlpGGSzh24l5GyBAhw2l3477+yIBshSkjSx1tx+/+6g68yFIkg1YKZhNc
 eyFZ3z2gTUEEPJZGr7Us6zitWsiJXHlNjqVeQmeII3whDZZ+9hyyALEooOA68Fjtd+NW
 2VrHlCOla3MNALb6TBgDA748j18drW1i4iHfKkb2hnR2ZICz1F2B+/6P52DEtsSrdM+c
 4qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/P3gxgO+QBnDwJGxjmfJCBToANCVMCf/BmXc9OJ8r50=;
 b=FE4j2dWiY3CNRfSwuXOHCpiWHIY8b7GOe2Zqvi+rIDHNCFU+gkNCD1IPex3t/Umkbe
 dLMjRB+9Y/gxvAhHlREcPjt+ctaikmngoz/WPILSXB90gYWhYaSJNdIcOfor6ZeN0YxZ
 wpkd2+ZBM5ECTBtK5v24RiqNVVUWJZJEv5cEpQc5tm0dlw+6FUTkEuxac4yHMGPgv9Nr
 /lVo7wEhFYFZnsoVKZL6WSZKOZ6shs7gNrDPX95LKZKY8bsaxaDE8lcymXy+MaDeUvyY
 23yS8+RBerrE73PtMwz9+wcrsTQgWOYZG4x0ZKry5WEWCzispV71tnj+wrKxnh3DNvFj
 i35Q==
X-Gm-Message-State: ACrzQf2DLqNa38Q6nuCtTXUTODqXya37c7RZk/4/mrOuJ0W4n2yI/Rab
 yhYAhl5NKtPrqXN4cft2EtmxA9BPUS9tM3KQ
X-Google-Smtp-Source: AMsMyM4B3BUH+twGVwMQticnxndsHVYRw9FacjMDRo4O0WMx5eUoYNhx/oP1WID8czn4gKMfidCq3A==
X-Received: by 2002:a63:ce42:0:b0:45a:f77f:a57f with SMTP id
 r2-20020a63ce42000000b0045af77fa57fmr1840402pgi.439.1668058858691; 
 Wed, 09 Nov 2022 21:40:58 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b0017f64ab80e5sm10145998plf.179.2022.11.09.21.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:40:58 -0800 (PST)
Message-ID: <fd4859ed-1398-f6ea-5e79-e0540506824f@linaro.org>
Date: Thu, 10 Nov 2022 16:40:53 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 1/9] hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_ARM_SMMU device to 3-phase reset.  The legacy method
> doesn't do anything that's invalid in the hold phase, so the
> conversion is simple and not a behaviour change.
> 
> Note that we must convert this base class before we can convert the
> TYPE_ARM_SMMUV3 subclass -- transitional support in Resettable
> handles "chain to parent class reset" when the base class is 3-phase
> and the subclass is still using legacy reset, but not the other way
> around.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/smmu-common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


