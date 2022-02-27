Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD54C58D3
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 01:53:34 +0100 (CET)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO7oa-0003FD-UD
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 19:53:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7ne-0002RL-Le
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:52:34 -0500
Received: from [2607:f8b0:4864:20::630] (port=46026
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7nc-0003UO-Hi
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:52:34 -0500
Received: by mail-pl1-x630.google.com with SMTP id s1so7799210plg.12
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 16:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s+WvMh5tNQNASSkSkpt1t/55e0p94/L4KaAsp8jpFLA=;
 b=Ll6kuRXZzylwosrlhL8ZR1KAsoIqENy/eYP5qP+mE7KYyi2GEAXy7TItXn8s2SyaRR
 GR3FBqgVwyXdouDMcv7HM/tbPyf+BTnDC0BD5Leef3Ouw5lEInlXEtpF9u7Ld/HJvuye
 yRFtxPiuBQbPVWwSs9r0QAUBUyir5n8Gqn6GPEEOwBdspjUPsec5FtE49aODl13bNof1
 +1WJut8UChfUQuLh5QnB+Lw/HOUiNr3z1fcPip3kzJfHUrwMrqWuNU94s5Yplhz8QVtW
 30IyTRSAlrHNHlm8aNUTi5I5lldj9JLORxm3TQfvviBqPAcn9Ltu5ZY1/f3Av4oNP0WE
 P6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s+WvMh5tNQNASSkSkpt1t/55e0p94/L4KaAsp8jpFLA=;
 b=rnbWMZOb/dwUWw9hSQ9klRFmIQv8fNuUHciOjKZ92gYx9isdH3Gs31AJO2lKQ5lNJQ
 vggYmSKKUpxuxKqqJeIqAxoj2e2sO3898uRsVnc5pSQ6hw3GXu0wZaVLfy80YBwx0lqx
 WJhqG6iAlvw3jNMl4rDpRfkdtje5famR3CCq5ibk3Qu0hN4heZd3BnkWvF2L/25wP2Eh
 26a/+vA1zNCLZnCwXFwoDzCwMgqUMGzezxxMFwRGpbDqnixp8xSRtFTN0s4Rf7gt+Hhm
 YB+7v3wars8JVsxUW+bShl4uS8pYNo3Nh9DUZEOqNo9CggCpyo0Cfev++u3ngzy4djFH
 SLCw==
X-Gm-Message-State: AOAM533l8VkOaxR604ZyB3WRF6CpIfuwEMbnMy3gyBvOIXjoESsGUFMQ
 aUvL4hN5nCXf8ELYze4tX/s01g==
X-Google-Smtp-Source: ABdhPJyyruBDicx+ktjbQEirEaLPaUVyw65Zq6ac42IxHW6JCs4+jmezD/UFRAyJtgcZF5YksE/Pyw==
X-Received: by 2002:a17:90a:1b04:b0:1b9:92e1:6264 with SMTP id
 q4-20020a17090a1b0400b001b992e16264mr9900535pjq.116.1645923150692; 
 Sat, 26 Feb 2022 16:52:30 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:9001:d56a:9ee0:246?
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a056a00169100b004f3c2ac6600sm8151618pfc.116.2022.02.26.16.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 16:52:30 -0800 (PST)
Message-ID: <dc8c7a21-7244-1baa-bc64-5c4d1c015c25@linaro.org>
Date: Sat, 26 Feb 2022 14:52:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/9] meson.build: Don't misdetect posix_memalign() on
 Windows
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220226180723.1706285-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
> Currently we incorrectly think that posix_memalign() exists on
> Windows.  This is because of a combination of:
> 
>   * the msys2/mingw toolchain/libc claim to have a
>     __builtin_posix_memalign when there isn't a builtin of that name
>   * meson will assume that if you have a __builtin_foo that
>     counts for has_function('foo')
> 
> Specifying a specific include file via prefix: causes meson to not
> treat builtins as sufficient and actually look for the function
> itself; see this meson pull request which added that as the official
> way to get the right answer:
>    https://github.com/mesonbuild/meson/pull/1150
> 
> Currently this misdectection doesn't cause problems because we only
> use CONFIG_POSIX_MEMALIGN in oslib-posix.c; however that will change
> in a following commit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

