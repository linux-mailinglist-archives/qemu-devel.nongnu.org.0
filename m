Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC8B2B6E30
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:14:16 +0100 (CET)
Received: from localhost ([::1]:40658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf6Qh-0001M6-Jl
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6P1-0000RX-Mr
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:12:31 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6Ox-0007LT-Hm
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:12:31 -0500
Received: by mail-pf1-x444.google.com with SMTP id g7so17944225pfc.2
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MjVn+fo4ZmvONEERM7jkwbaqBmcWHw8AO/SWg/VJg5E=;
 b=oKLyTYBG4UYixeBoDeP0LwE5wZc7qZFIrQ8BVolUr4uuteeI9chKG0DnqAkpLtQF1Q
 UTDYlbpmEkvCOiXX8V2oHpEEmaRrq3m5b9gVESGD7cmYCZ39dWepzeKLBetaisynj6bY
 JTNC0hLdQurBu3qf3C0A05JOE+9s/VDQHRCWa23PS2shjMHG0piR7A1eynKDEM31ddgz
 3pLN9EKAz69KtOHkANvVBabbrRR8OX7cVejpHU1GJUJLN83Tfd7qXSLTqeZhIRBZps63
 U6R+orQ2a5hYEhB0hrA2wTLROxoeHugBsvQrz2SqQ8k/34PXs5fFpQt+VjM4oi6GiJhO
 GdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MjVn+fo4ZmvONEERM7jkwbaqBmcWHw8AO/SWg/VJg5E=;
 b=pkW/0V6DuiSPJB2pgCU9Ve5ZskvKrpb0RrH43JoQRNoohRRHiHNL7cnAEDVcwx7GzE
 CETX6Q6IOwy2FUV3WyCK0X1POSLZJpfbAdzLGwqaSMZpXwsP5drmG8uOJZDIQMEIBP3O
 Xakx/SUIli63QZ89eCnJHloBN6MadeBB4ytZypBV4DVpI480yiKpL1wfDVAtqZgq+hdw
 XRb9p8VZAZa64ltvlkHzXDLOJzna9cLKcqtiXUNJd42gCO7Y4xUoqa5Svyr96WVM0mJA
 peRyygnv8WjVHMVpICQQr3cFQYiyUHUFqckAhSCGrC63hyQg4H7moyazsBA74kp+JVbU
 ZWTA==
X-Gm-Message-State: AOAM532fbr9KP3jPXJkY9vx0xyATKoX6im75MNY9okj6DeRt/+FhPjqG
 T1s55LrXSL20pIYMaXq6PYFRhfna51h5bw==
X-Google-Smtp-Source: ABdhPJwFo1ufcmA5DafZWRk0WEagm/SY/5JQ5NDYAgOvgz9TdxtYs5x1BXDgPUALWrWXrhlkN3kEEA==
X-Received: by 2002:aa7:981a:0:b029:18b:490f:77d9 with SMTP id
 e26-20020aa7981a0000b029018b490f77d9mr782229pfl.46.1605640345773; 
 Tue, 17 Nov 2020 11:12:25 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id d68sm376655pfd.32.2020.11.17.11.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:12:25 -0800 (PST)
Subject: Re: [PATCH 03/15] target/arm: Don't clobber ID_PFR1.Security on
 M-profile cores
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75fe1394-e68f-a3f1-1240-298114243cd3@linaro.org>
Date: Tue, 17 Nov 2020 11:12:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 8:08 AM, Peter Maydell wrote:
> In arm_cpu_realizefn() we check whether the board code disabled EL3
> via the has_el3 CPU object property, which we create if the CPU
> starts with the ARM_FEATURE_EL3 feature bit.  If it is disabled, then
> we turn off ARM_FEATURE_EL3 and also zero out the relevant fields in
> the ID_PFR1 and ID_AA64PFR0 registers.
> 
> This codepath was incorrectly being taken for M-profile CPUs, which
> do not have an EL3 and don't set ARM_FEATURE_EL3, but which may have
> the M-profile Security extension and so should have non-zero values
> in the ID_PFR1.Security field.
> 
> Restrict the handling of the feature flag to A/R-profile cores.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


