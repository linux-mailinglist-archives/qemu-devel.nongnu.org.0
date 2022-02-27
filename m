Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DDE4C58D6
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 01:59:36 +0100 (CET)
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO7uR-0000Pz-LA
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 19:59:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7tU-00081b-Ih
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:58:36 -0500
Received: from [2607:f8b0:4864:20::62d] (port=33512
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7tT-0006MN-1W
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:58:36 -0500
Received: by mail-pl1-x62d.google.com with SMTP id c9so7874317pll.0
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 16:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KAmOJ3m/G1sVS1afimPc6ecTHqOjLrgLyIzDZwAgsEs=;
 b=VR22RR+QDq9c/OOeIQtw/M7ndrh4fyMhPHwp2x07kcjIfkRPfi98vk5aYl8LD0rfSq
 3aN7swT5WR+vzlqv5WPXV0g6dcTXXDMQ29RHUEftO/jZ8dd2tvn98duSLwWyColZx1ZO
 WXUwQCbqX14auBxmoTOFy3UHbR0xZ6O6V/aNdgbGLcsX3BVpa/x/WmdLU3b21h0fw7B7
 DAjbV6938p0cXFLIAqHGHdlSoq5Onf4gs8Eb7aguAWo2f+DGCmyZ++2pFR8mDv6j5/XZ
 w8uJ3GiS5kqj/FPsO3r/JiKBFPdw4h2kyuEPGunYH8Z2h5hi+yH78XwgTb5pfqkq0Jyy
 wAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KAmOJ3m/G1sVS1afimPc6ecTHqOjLrgLyIzDZwAgsEs=;
 b=ju3J+8q73+tbyCSqwp6VAva+E06829ODOpmo4fjkt9daSwQLtl0JHU7J1EYQ9Hf+hK
 Sa5GD8QFoh8mMEUt6XteN/HHWC9NBGTo39En8q6Yf3Smi3kSOoa2tBjZTBck/UYuIAA/
 Z7g95jxLpWmik4EPtCM7++Vbx+JZUtz8huWpprqNeAi0F01EiF8+HPX7T0Iys0jMayxv
 +XyqSY5lHlTq+kVe/eYtODC9iLjlWTv70P9P6RhRGRmJ43vPrGrK5SkWWmycVJwrYtO3
 /s+Eox3yI3xDC8CfP9OR3UUvJKJ6AlPjI0T2/Hg9Zl5/ZWZWFmG6p9MeRAK+mHYxsRYo
 qrJg==
X-Gm-Message-State: AOAM5305u+1xJdpYgS8yqo730HY7XpYZFHEg8iEXLWo5FWwOODNIpsfW
 vhXQ66jy2SmtxBqhRTwKBZYhgw==
X-Google-Smtp-Source: ABdhPJx3EP/rDeDyb0e/zq8OeNl2w8Z2ELt//jOtZWtxnlJeiYG0zFd4wlG2SUOCYSbecJmxKHb6oQ==
X-Received: by 2002:a17:902:c405:b0:14f:dff5:92a0 with SMTP id
 k5-20020a170902c40500b0014fdff592a0mr14520349plk.61.1645923513670; 
 Sat, 26 Feb 2022 16:58:33 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:9001:d56a:9ee0:246?
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a056a00234800b004bfd2246f3asm8249893pfj.102.2022.02.26.16.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 16:58:33 -0800 (PST)
Message-ID: <cf48d722-7404-a2e0-f73e-eeafd073c84a@linaro.org>
Date: Sat, 26 Feb 2022 14:58:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/9] util: Use meson checks for valloc() and memalign()
 presence
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220226180723.1706285-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/22 08:07, Peter Maydell wrote:
> Instead of assuming that all CONFIG_BSD have valloc() and anything
> else is memalign(), explicitly check for those functions in
> meson.build and use the "is the function present" define.  Tests for
> specific functionality are better than which-OS checks; this also
> lets us give a helpful error message if somehow there's no usable
> function present.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   meson.build     | 2 ++
>   util/memalign.c | 8 ++++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

