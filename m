Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82CA693548
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 00:33:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQzM7-0006ce-9z; Sat, 11 Feb 2023 18:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzM5-0006c0-Cn
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:32:29 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzM3-0004Ni-Nx
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:32:29 -0500
Received: by mail-pj1-x1033.google.com with SMTP id mg23so2242764pjb.0
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 15:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V133+eNKCBnYyYjDISObyQe1JAeSvX4yoFtsSb1YvJg=;
 b=NKFjOHySsFKmbJk8+MlgGTcTLpW6Cs7CvIjYIqgigFmBk9Jcjft1dJHddau1Ex/Es6
 BfuhsUtZXJ41TMOIhnJTWoz753vK1fewYsdEdwlNUk6G2v4DswWl4B13c+SFTaSVvcdz
 JYXh+LA86VD5GyP9mNV4rXN0Ssp1IOngHbr+XVuP4wXG4Fh/HN0d3BOmoLwOlnxr+fP0
 PoOs6jvn8XsdH6HmiEq3fJJemjL3j9nTNSx5PnIJgT0+ShWxOn+YiRjYrJJIT7aEtz/k
 2Z4/XcLpGJ+hqNWB7BfMVZAqiflFqj3RDJlJN9JWKwN0N3t4gwd3yZVUeiBchqpkQLRa
 Kenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V133+eNKCBnYyYjDISObyQe1JAeSvX4yoFtsSb1YvJg=;
 b=VEu6YseT49cX1wAAqSnO5wIUO59Tf70crahiEd8vjWeWrAzUMTujaXiZUecH85RYRE
 s8/oYUB7y23PQ6BJNJjLPf4MXp+JGJYnqRjHqrh5jX/yD2hOCduVCYmAp0Vh/IDynsA5
 1jGOy/NrOvj7gGXgxBIWhYvbkyBAutedwL33sXs7NA4/HfPjqOGxObYDtyS0A3iI+Q5m
 kPr8fcS5e9wr1fmlXacdsZ2Edi7//wX4YuZZLyyr1yB/Bo5hTdGvaqcET9Zqu5Ppch5p
 etY0U1TtOamZYuWZRrIBHM05twEnOvS5WPd4eMUPkzNaXhUoW6oyRT178BDXFnwbqOjp
 cNAQ==
X-Gm-Message-State: AO0yUKVBwum0n8dGzXY/gzGqOcmx163CVCTrzVZdif3f8LzQf+xNEarU
 deaPCyONwi+ijl/g0DsqsqEMgarnJFBE6PxBl4E=
X-Google-Smtp-Source: AK7set8F0En+icMoD4Sv0kx2GTGiUxtlXQKIHjDtxfle4/RZIDihInlun22H/2mB8GHsibkwQO3CCA==
X-Received: by 2002:a17:903:246:b0:196:5472:c115 with SMTP id
 j6-20020a170903024600b001965472c115mr22477430plh.41.1676158346109; 
 Sat, 11 Feb 2023 15:32:26 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 j16-20020a170902759000b00189f2fdbdd0sm5487334pll.234.2023.02.11.15.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:32:25 -0800 (PST)
Message-ID: <e832cbd9-2fd7-213a-08ad-544d708bb823@linaro.org>
Date: Sat, 11 Feb 2023 13:32:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] hw/arm/smmu-common: Fix TTB1 handling
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com
References: <20230210163731.970130-1-jean-philippe@linaro.org>
 <20230210163731.970130-3-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163731.970130-3-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 06:37, Jean-Philippe Brucker wrote:
> Addresses targeting the second translation table (TTB1) in the SMMU have
> all upper bits set (except for the top byte when TBI is enabled). Fix
> the TTB1 check.
> 
> Reported-by: Ola Hugosson<ola.hugosson@arm.com>
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   hw/arm/smmu-common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

