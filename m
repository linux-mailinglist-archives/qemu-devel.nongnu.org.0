Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0570F3D4F71
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 20:19:22 +0200 (CEST)
Received: from localhost ([::1]:33188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7iif-0006fZ-2Y
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 14:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ifm-00046e-57
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:16:26 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ifj-0002Xs-Np
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:16:21 -0400
Received: by mail-pl1-x635.google.com with SMTP id e5so7003212pld.6
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 11:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=T0rXdxYYGfrICfq2Vs2XvjqztMZXQxCus06EsOgZ6x8=;
 b=QpwX/jF5Dohfk8jht0UmVIuUTZR7hyIQrfXDmDG/JSwI7KHvld0dFFH/x+aDoN/o7M
 kbQEF0M2Mv7Mlmm3PrueaKMJjF4ZhusBS/6RGHLtvNrdSLXdkWdWBTa/3gaGPdaH9cbn
 c4H5oPjIlKqcOvBf9gAXnIjxepmtI4flGDIU/quhnnlfEZTmMcwyg4CZasl+tcBbxI+S
 b7+Ara+yJW/KoUJ1zgC1YhA1XTjbGl7w3KPROuHUaZd+WUy0NXQOERHqkmgl5uXyFQYk
 WdY87VGAjIkKx5x4w4RZff6w0r9a203yoYTVWMwTlzJ+AtUqty1q869/+IPqz6N3fb55
 +vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T0rXdxYYGfrICfq2Vs2XvjqztMZXQxCus06EsOgZ6x8=;
 b=YpgaP07xwpbgpjR/VIBQCnhLx2uPUO7QLw6VQwWk3kSZylHCx7tgISe2b0i2mfPfx8
 fyJsfyT8Hu5O9EEiDLebO08AJ3tzvUrA0+GJWxiZbR+0Xoaa6fT6jzH5U/iIWQhgjyZJ
 QoQ1E9Afa+aW2NgA+lj4MH13045Y+ARa1ZTnHymW5knzBog7/FUxxAhWZ0a6mh6tRAKU
 YavoijmKF3KrP9BD74t7G+pN8dHNaC4qd+ikQft+e/ccraLin7eSv1KDyJtZ+1L69DM1
 D6Ocf86qIGR3+iXMxdeCWYMkQ1U6YmcoX2xwqn64DLE7vb3k5BzrSqCXRxrrPthuGkfo
 nIwA==
X-Gm-Message-State: AOAM530ydXiXjfoGMhCXNQDHecfemPozbb09efWOrC+TWe2zHRvoBPgK
 KhRrRltG7P19X2wGx9QX7vRLwnalgExpKA==
X-Google-Smtp-Source: ABdhPJy4w+S88BFceIL+MAuEPCuXv/P3y7IxpviVwo8rv6PcsKP4gtQamzbgR+dpH/FdL+5rzEUNyg==
X-Received: by 2002:aa7:8284:0:b029:312:1c62:cc0f with SMTP id
 s4-20020aa782840000b02903121c62cc0fmr14584730pfm.75.1627236978397; 
 Sun, 25 Jul 2021 11:16:18 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id h20sm41200296pfn.173.2021.07.25.11.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:16:18 -0700 (PDT)
Subject: Re: [PATCH for-6.1 3/6] target/arm: Report M-profile alignment faults
 correctly to the guest
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210723162146.5167-1-peter.maydell@linaro.org>
 <20210723162146.5167-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8fa3d4f-1521-6090-3052-62760ea12047@linaro.org>
Date: Sun, 25 Jul 2021 08:16:15 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723162146.5167-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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

On 7/23/21 6:21 AM, Peter Maydell wrote:
> For M-profile, we weren't reporting alignment faults triggered by the
> generic TCG code correctly to the guest.  These get passed into
> arm_v7m_cpu_do_interrupt() as an EXCP_DATA_ABORT with an A-profile
> style exception.fsr value of 1.  We didn't check for this, and so
> they fell through into the default of "assume this is an MPU fault"
> and were reported to the guest as a data access violation MPU fault.
> 
> Report these alignment faults as UsageFaults which set the UNALIGNED
> bit in the UFSR.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> The other approach would be to have arm_cpu_do_unaligned_access()
> raise the EXCP_UNALIGNED which we already use for Unaligned
> UsageFaults which are raised by m-profile specific helper code,
> but I think this way is in line with the current design that
> generally prefers to report exception information in an A-profile
> format and then re-arrange that into the M-profile information
> in arm_v7m_cpu_do_interrupt().
> ---
>   target/arm/m_helper.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

