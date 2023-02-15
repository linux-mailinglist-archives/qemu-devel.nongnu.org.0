Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C383D69840E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:03:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSN3K-0002vd-Fm; Wed, 15 Feb 2023 14:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN3I-0002ub-FX
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:02:48 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN3G-0000db-To
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:02:48 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z14-20020a17090abd8e00b00233bb9d6bdcso2796439pjr.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iXaWM8DJcFHim1yG1ikSQtIEw2W7l/Ucp08i3El8aCk=;
 b=T2KOwvaGqKSC5aCa0s2PQbqAh1bQ6eGDYwXhXPnLQs7cUenJw7AXO35PPS8cFI7LBL
 KNUwAQw1+JZYIMXkD5c9ZoSEVJ4CpKSPWTDC1aawIA92YasVTtTPuWj1q3NSEMttXG1P
 CDHZJxi+Wa2Un7E1zQ2rmcybZQ9AxdiRvHuoPVNVIal22t9oFaBEKPxm6KU/iOb2cZAY
 lGDr4cLH6gomAbkQV55eSI2UIireQ3ZqHJPg+MvNBtzU8KHx/rD18p3OzFau13OuE6g+
 xVTqRa846wYU/N2FiU2k0fsI2FQaDI4het53UJFC9YSNRlnbTI5Jndb5V7+PZBKEMhz6
 hdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iXaWM8DJcFHim1yG1ikSQtIEw2W7l/Ucp08i3El8aCk=;
 b=NTqykRVYB7FT68ekIPL0hHYInidu70kWtg5wb7G/fsxWvskz2x+6rYSM+4fcX4vpLn
 juRz7mGD0Nc9ic+QiWV/lzNYe+Fb6NWJy/gRRlNTdccLwreEOhSklzS6kJfY1/0F+Fii
 MrXo2yMzxYnLuzv1VO1L2hcQkyJjXzrhWD8nuvR0NLIthtwao2JRhFaflyoDSGvYGfwL
 2TF8rmamoB/XQ2WtNaQw+t023Lq48RZnHmi/PwDlIIP3Grx27mznLq7s6SeafSPcYYy7
 lVv5TD7hwecIRLkMGK7z33gwbFoH299lBPXq647w6o1uzp3/Q+L9I6AT5h+4+ntBR6ut
 Cvgw==
X-Gm-Message-State: AO0yUKXZ4u8rDMh9Rvo3XNtnL8SuJtembNo45gMPiEPp+O1sGC/Dqcdv
 jLRsHOuNYWFxLXCjim65mmvhFw==
X-Google-Smtp-Source: AK7set9syO3Nzsrpna9QRid/5mmRssO7WmpfV9jueQLcZGKIMod+PHJiY1Mj2Fh9B+QEONsYkRs7KQ==
X-Received: by 2002:a17:90b:390d:b0:22c:5241:b8e with SMTP id
 ob13-20020a17090b390d00b0022c52410b8emr4184040pjb.25.1676487765453; 
 Wed, 15 Feb 2023 11:02:45 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 rj3-20020a17090b3e8300b002262dd8a39bsm1793864pjb.49.2023.02.15.11.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:02:44 -0800 (PST)
Message-ID: <6dc9714f-767c-d69c-5126-875355eeb539@linaro.org>
Date: Wed, 15 Feb 2023 09:02:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/5] hw/i386/kvm: Factor i8254_pit_create_try_kvm() out
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230215174353.37097-1-philmd@linaro.org>
 <20230215174353.37097-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215174353.37097-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/15/23 07:43, Philippe Mathieu-Daudé wrote:
> Factor a new i8254_pit_create_try_kvm() helper out of the
> following patter:

pattern

> 
>    if (kvm_pit_in_kernel()) {
>        kvm_pit_init(...);
>    } else }
>      i8254_pit_create(...);
>    }
> 
> (adding a stub for non-KVM builds).
> 
> Since kvm_pit_init() is only used once, un-inline it and
> remove the now unused headers from "hw/timer/i8254.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i386/kvm/i8254.c        | 18 ++++++++++++++++++
>   hw/i386/microvm.c          |  6 +-----
>   hw/i386/pc.c               |  7 ++-----
>   include/hw/timer/i8254.h   | 22 ++++++----------------
>   target/i386/kvm/kvm-stub.c |  6 ++++++
>   5 files changed, 33 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

