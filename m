Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B932C3ECAC7
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 22:02:27 +0200 (CEST)
Received: from localhost ([::1]:46550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFMKw-0001U9-Q7
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 16:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMIt-0000SQ-SX
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 16:00:19 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMIp-0002DJ-V1
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 16:00:18 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w6so11489058plg.9
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KSrz753r9j341lhniAa2wjKyfup+UJr0FLHIk3wdgm4=;
 b=jRE5DG+jXkuDVpTlphkazXFr1WAIPjQG1PwqvNJDCBbVDjbeiJ309Uiv5Y+b7TM3BM
 LX2UFita57j1N3AH7RjTuuQFzMMLxki1t3QTZtM3GeBbGv06CO3zQDPF5Iqg4kgTSfHs
 bsmNl+sKzzLfxJRV1PN9YnAym3ZsCMofy6BuUuyRgzFKfxpARUB/2s3mqJlPtkJOHC4q
 5rEFHXJSGb2p8JTIUiVQ2ZAmxXc+L3/i5+EEKsZyAojReRP4fkvCZgn1iVcqZBJmaJfE
 hsEbIzXUdODAy/Ajr5e9iPop3mrlVMopEZwvxp4S8Sbu67YaPIxai9JEWCY4vhFsi8fF
 Yj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KSrz753r9j341lhniAa2wjKyfup+UJr0FLHIk3wdgm4=;
 b=AANksnx5Utas2PnHneLY+4ko6cBnAXBp4+qYN/ZprNylkh9JMP/mvWGqtr+/Fl1U7j
 g9j2NSwvJjT0qFgb3e7oo59feESVvLGkLaiiK/MY2onQfuzM22CKNokIM8FSY1InSq2B
 QKX+wK/Sr8IQJAgNUQwSf25JWHwbfss3X01OsDKq62P52CBcoyCM08/OWRT42gwaacI5
 S7ZHJVr33LsPlKG2wakyaacTubM+cUVBGtFRd5cS7jrM8TGMC7lGfpXuq1vbrJXPa2+2
 dfyBiaKDHh+mPYFMm15v93C0LMkTACXybgBa/ZD7K9hIBLLDftZ9yTD8XM22QC2C7YNN
 jOpA==
X-Gm-Message-State: AOAM532OfIR68dj/JQVmBsHCZJR5Pt3u4fmvUeV6NQhRtkvt/kSmwaGK
 yef1r9EgXs1XDmVLaOV3aWtO6g==
X-Google-Smtp-Source: ABdhPJylDVxHAW11DobCNW4V7a/OaFeUttYykpaiFqY53nokZj0kBSSeMmElprKuAef1RbsayQ9L/w==
X-Received: by 2002:a62:fb0b:0:b029:3ca:1345:9fd8 with SMTP id
 x11-20020a62fb0b0000b02903ca13459fd8mr12831341pfm.14.1629057614171; 
 Sun, 15 Aug 2021 13:00:14 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id b13sm4013938pfr.72.2021.08.15.13.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 13:00:13 -0700 (PDT)
Subject: Re: [PATCH for-6.2 3/7] linux-user/arm: Use force_sig() to deliver
 fpa11 emulation SIGFPE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <616f6454-5e43-a98f-0769-b242c377c050@linaro.org>
Date: Sun, 15 Aug 2021 10:00:10 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 3:18 AM, Peter Maydell wrote:
> In the Arm target code, when the fpa11 emulation code tells us we
> need to send the guest a SIGFPE, we do this with queue_signal(), but
> we are using the wrong si_type, and we aren't setting the _sifields
> union members corresponding to either the si_type we are using or the
> si_type we should be using.
> 
> As the existing comment notes, the kernel code for this calls the old
> send_sig() function to deliver the signal.  This eventually results
> in the kernel's signal handling code fabricating a siginfo_t with a
> SI_KERNEL code and a zero pid and uid.  For QEMU this means we need
> to use QEMU_SI_KILL.  We already have a function for that:
> force_sig() sets up the whole target_siginfo_t the way we need it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/arm/cpu_loop.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

