Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEF932DAE6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:12:23 +0100 (CET)
Received: from localhost ([::1]:57438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuKc-00049w-9b
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:12:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuIp-0002gN-BY
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:10:31 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:54440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuIn-0002mh-0f
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:10:30 -0500
Received: by mail-pj1-x1030.google.com with SMTP id i14so7299580pjz.4
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1nXxooLlUkWW/fkXDaSCSNeMJez5btAAMg7QWFUhyyA=;
 b=kmBswWYZn+UHUPbupFPUKznwnn7kl1z2UmwQlSkXy0zNV79ztOhakNAj8HvjhAXDLE
 eCisSdUGx6sCMwDKidNyXl+bZJMDav433eIHtBttdfDU/C6I7NS1GJbfjvhB3QRUiTC3
 xrS3Mq9cIV4SQyrD//9HDY34jySKrbHfoaGCIz8V24Q6VvIA/2uypJfw4JR436Fcx9uz
 ZDEoMQivLVpiflQ+jovlbBED3M4ppJfu2XrNCtzBWCONM8mWB+F9jsfGGXzNuV552khp
 164F9bF0tN4/bm6DZODZKE7nQNilfgN3cxQCx1KFeR1SzcdIuPrAbx7y6IfYEdfRRvKW
 pdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1nXxooLlUkWW/fkXDaSCSNeMJez5btAAMg7QWFUhyyA=;
 b=iuw5BJ/fjAIAcUaaP0v61JxzZzkpFakmvWOTTC2RJ+T7t9g19sorKMEqWIL+GizeQD
 VVU+rtQW2SomkQnSypy1SJOLZknY+dQhEFX9Cw3++bsgto7rU0SVpYU24lh/0bOHJTdO
 jVoPRHefquTXeg9/J4dy1TODVcAmomp2nzfLBSVGUJTHqpLii63ft0lMx3Kh2kg82p1n
 1Ut5yTgdeq4NAJmCpn9afGmCQb9hMe9JKWo0nZYPk/Qf1G6hpUQZEwa0kmsan3CUuho2
 2Za3hyQi1/VFxsU4ax1vpobgMGxHmzCidwNtcsKzTAwMyO5LCgfqvLiho4cqbctDgmUo
 nZQQ==
X-Gm-Message-State: AOAM530nxHGxkxnLC9+mfW89SUNGNcF08gA8yfBy+tpEsb5KCbE/c3vs
 Z/83oc320aXtG8Fnk3ajeAh7miu/WhyLGQ==
X-Google-Smtp-Source: ABdhPJyuIgMcFAvVA0I7DYk/fNrlLEODbE2BoZHfFrvw94bGRdBDgVFTEOfBPLwgvZIrzVesfpmynA==
X-Received: by 2002:a17:902:8690:b029:e3:91f9:eaeb with SMTP id
 g16-20020a1709028690b02900e391f9eaebmr5506867plo.34.1614888627394; 
 Thu, 04 Mar 2021 12:10:27 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z5sm237663pfk.21.2021.03.04.12.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:10:26 -0800 (PST)
Subject: Re: [PATCH 23/44] hw/arm/armsse: Add framework for data-driven device
 placement
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60943f76-29ea-677c-e8b3-ce275cff3c9e@linaro.org>
Date: Thu, 4 Mar 2021 12:10:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE-300 is mostly the same as the SSE-200, but it has moved some
> of the devices in the memory map and uses different device types in
> some cases.  To accommodate this, add a framework where the placement
> and wiring of some devices can be specified in a data table.
> 
> This commit adds the framework for this data-driven device placement,
> and makes the CMSDK APB timer devices use it.  Subsequent commits
> will convert the other devices which differ between SSE-200 and
> SSE-300.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

