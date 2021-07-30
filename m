Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85C3DBFD0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:29:40 +0200 (CEST)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z8V-0004uk-UN
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z3Z-00027b-SC
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:24:33 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z3Y-0004RA-7k
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:24:33 -0400
Received: by mail-pl1-x630.google.com with SMTP id t21so12401479plr.13
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LXvqGSbeOcGp6b2KGG49U1TFPQ4xk0cX4DSMyzdLqpo=;
 b=cpYT1pIwii4U6Gfk5qDkKWdzFPR/Nw+jOPMrQa0RhhLkFXooJmfYLO/c0oldlxNeIA
 l1aWccuLU8UaxKyeLO3S8iYOidstgYsGa56hF13/E9vask7bVsBSOj1M+sjYhAdFwdiP
 3Uk4mBGIrOt3j7ZHEuqFyy7H/BAVWSW/0VAWlNmF4HcEDLjdXky2vp0T/BMQHqdj6714
 iQZDghCqbginwd9I1r7yzWDlb3dmbgW0xauQkG1K+i7QgIgdJzhjJvDwVdKPUmgsAPpj
 Tsb+drQOxpUhJC+7AFBHgcikpuzT7J5o26+jtIHk9eyIFGhfrh0b0NmX8ukWBYHdhcO4
 zkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LXvqGSbeOcGp6b2KGG49U1TFPQ4xk0cX4DSMyzdLqpo=;
 b=gVGgOgJtB6Hr+BU5CwFzbmyXnEu3gu8svdP1lbjMx3fJaAB9O0+JOu11GczZZQenlk
 AAVpnyifbYVWYF+GxmvD0CQTBoZn01QcZEayo1iK1+Zn35AVo4TpO18yVJhpCtn5eenb
 sm1hz2eMxIKng07xOdZB61DxqhkJhhsITaX6xGAQ9s6IlK3uG6kvwTsCXP7QOD6kyrhT
 SxBTSSwiUHwjjRYJXciVIYgz9+p+SeLocdt0fEqIGdx00GPZsIxHWMytmWoohuOZpkLz
 6OqrG4ondZxCp85jRaWUsh5lSf0w71gs058Gj6QG7uFLQXmc4YkHQCc1f1QFpkfrUppm
 F1mg==
X-Gm-Message-State: AOAM532bUxYh1pjxeRktEOlTbMOZkL383ZA7Semnw+9NvqVjwTpANF+o
 Dd+GpBQC4c2Ce9Vagtpe7aV6cVCUgmjonA==
X-Google-Smtp-Source: ABdhPJxkJKa4u+k9iw6kJHUJcZMmkJpQRvMmE3CL5OE+FhZK4R7OuEIjzqNFvge6hdEWSjwRwXs2dA==
X-Received: by 2002:a05:6a00:238e:b029:35c:c5e:b82d with SMTP id
 f14-20020a056a00238eb029035c0c5eb82dmr4646183pfc.33.1627676670562; 
 Fri, 30 Jul 2021 13:24:30 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id c206sm2501384pfb.160.2021.07.30.13.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:24:29 -0700 (PDT)
Subject: Re: [PATCH for-6.2 48/53] target/arm: Implement MVE VCVT between
 floating and fixed point
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-49-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57510c4c-0253-ac75-9a21-0a292557c8fd@linaro.org>
Date: Fri, 30 Jul 2021 10:24:27 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-49-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE VCVT insns which convert between floating and fixed
> point.  As with the Neon equivalents, these use essentially the same
> constant encoding as right-shift-by-immediate.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  9 +++++++++
>   target/arm/mve.decode      | 19 +++++++++++++++++++
>   target/arm/mve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 18 ++++++++++++++++++
>   4 files changed, 82 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

