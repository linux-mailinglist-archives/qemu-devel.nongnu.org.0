Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED5E37AC80
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:55:55 +0200 (CEST)
Received: from localhost ([::1]:33040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVfm-0000vN-Vh
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgVdZ-0007Ah-2R
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:53:37 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:35789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgVdW-0003iz-Qe
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:53:36 -0400
Received: by mail-oi1-x22f.google.com with SMTP id v22so14744063oic.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GA9gHVc9QHEP6D570KuJv8b5TUCnI0Ii6zSM5zOiBQs=;
 b=D12tc0TYP26eQs8f5Su0mH4k5J65pPSy0bdm5KZOxv9rAb5iI4tK4wEdbK9qeFVm9I
 s+ZRU4hkkyQwzJSw0dUW1+A1mS2C5SToSGDxOuYgNLAC/QQGg0sr6iL8/+mxaMLKZF4V
 HVY5x7JtxH+t0/c01H6a02Xv6b/Dw3b5Vp0RzAxUwXEm/copC7/Z3FIdgbDT3TL9/bOj
 fRFMA3YxlQJ43/2I+zHj3sTlhAKNZ67b+wT8nXB09aTsFIfsubprf3OVsP39dENV5RM2
 LIPQkxNuTCH3DV2Bp+iBgi0SZ7zROMgO2/gVcwFpxHXX5o959yjSqnn9hdcVTVB+8gWy
 Yjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GA9gHVc9QHEP6D570KuJv8b5TUCnI0Ii6zSM5zOiBQs=;
 b=J5N5bsw/zVeO3ReT1qTKJDz+XcIeAE4cOKuOod7XX6slLfDrNvG92mN0vl19IsJTUP
 +bQm1/CYiYrCGD9URjXZvVXQO0xfrbL4WMXsDLue9m4ejZF/DVrvBIJcY0X293Yx9iD0
 Id+jWMGK1HKfJlyBXM272Txh+CyrrWvf36de/JQJIadr35syxGVgbesqOLNRS8DsiXWJ
 4uJ3FhyV3G0wgssON5ytsAPxA5cwV9Yf2Hzr8w2O4c1TvaalI0x/q/omDFlQQVVFE69/
 VvImKaYZIQBMag4Ds9F2+qMmpsEfIKLWHbFDyeXQFTbr80HyU2FOTYElV0/S9mHG2bbS
 kTgA==
X-Gm-Message-State: AOAM532TO6mpSZTb/1ezl1CXTm+AfH7oS3XFz0VkR4zqWgUjrZV7Z35e
 fYRd+Sp+7YYLNdd3AimXQ0qhZg==
X-Google-Smtp-Source: ABdhPJy0QPtq1oaIv7sWunqwKOEYJbAy4Ris9DULLsMGV2Hr8Pnk+U9iNW081bx8s7ACZakZ3e/kxQ==
X-Received: by 2002:a54:4e96:: with SMTP id c22mr22875750oiy.176.1620752013481; 
 Tue, 11 May 2021 09:53:33 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 7sm1197435oti.30.2021.05.11.09.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 09:53:33 -0700 (PDT)
Subject: Re: [PATCH] Constify bitmask_transtbl fcntl/mmap flags_tlb[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210511103502.2875844-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <76a41faf-b7d2-1ce5-32e5-f30020edcd6c@linaro.org>
Date: Tue, 11 May 2021 11:53:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511103502.2875844-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 5:35 AM, Philippe Mathieu-Daudé wrote:
> Keep bitmask_transtbl in .rodata by marking the arrays const.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/syscall.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

