Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B041967D06D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:40:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL4L8-0004rG-JV; Thu, 26 Jan 2023 10:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pL4L5-0004qq-Vk
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:39:00 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pL4L4-0005VE-EK
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:38:59 -0500
Received: by mail-pl1-x62d.google.com with SMTP id 5so2168194plo.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 07:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BbFjzNaRKGW2A6L7+E19GfnwvTEEz6x/7c9e0Ylp7HQ=;
 b=bY2NXrIvKvpXWIg7uv9ek3LbqXhLhqmXLvq252T41TUjeb+AkzmYwglzSZC8X0GK+H
 z49MZdZCVY4mwy7rKIa1dQmpcTGKaUuKJpN3mxmHNQHXyGCJeSNEOKw9Ov2JKW9Rpnua
 dkjJ0Xij2ZElnqemjkE1kcgdi5Gcz1zWk47C7FnQtuBgcS+2WztrBiuCQ+oLiiB3n+cB
 f2HR3kHAXyjukcdZTbSa3w77EOUhuPtl0JNQbgt8+cu4+KIxYOwX0zSBRs8BioAziouT
 dCeZbTJv54Vn/PRaWnSkB8Bvbt5HHJ4gO9KjESkuCFmtsZWCnmf5T9RRYzRxJUljbo64
 DE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BbFjzNaRKGW2A6L7+E19GfnwvTEEz6x/7c9e0Ylp7HQ=;
 b=LclMdgA/vZv34CiJOxntfH7100YzIFU250YPcMPG3G4Oi55SH7Nbf99EM0PmDoMIYW
 ns6ie0DH3HWf5hQmlUOUfBITQOQEfG1aCPSQ+lKVoozi1w/JiyVD1mGoUM6swoKhBdaS
 Mz2bahP3EyvfWWL5wwa1m4H8rr32er8Jj01F9AxBVV+qe2wmgX/EhDiXnq/P6w/J0ISR
 +lkirtL1laQwMv74tjowjkLueY5727oP/f35rr57mBaJ6dz3a58VgUxWAmcuFdIoWWAk
 0kcNvolrrtddPJbRFhv/XuL4fgK9BDJFaq397zv6px34qzX1BxJuWu9cNleYt2Nv2GBF
 JDEQ==
X-Gm-Message-State: AO0yUKXoDLnl6s99YP1UACPssKGYwUElgTQ0ea8jB5Kk30s13INaLIX2
 t/jQUVC7mp6LlU6Khk2nh9EP4g==
X-Google-Smtp-Source: AK7set++YVAgVWARstllEirHwZocO5PftbA8oQfhyQZzIT/a9Thi2ly03CZTkxpCvZPgM+MbH7mzow==
X-Received: by 2002:a17:90b:4a8e:b0:22b:f035:c09c with SMTP id
 lp14-20020a17090b4a8e00b0022bf035c09cmr10589918pjb.4.1674747536853; 
 Thu, 26 Jan 2023 07:38:56 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 101-20020a17090a09ee00b002276ba8fb71sm3466904pjo.25.2023.01.26.07.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 07:38:56 -0800 (PST)
Message-ID: <579dcb33-739c-a850-0f17-f5feee55d00a@linaro.org>
Date: Thu, 26 Jan 2023 05:38:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] sbsa-ref: remove cortex-a76 from list of supported cpus
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230126114416.2447685-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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

On 1/26/23 01:44, Marcin Juszkiewicz wrote:
> Cortex-A76 supports 40bits of address space. sbsa-ref's memory
> starts above this limit.
> 
> Signed-off-by: Marcin Juszkiewicz<marcin.juszkiewicz@linaro.org>
> ---
>   hw/arm/sbsa-ref.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

