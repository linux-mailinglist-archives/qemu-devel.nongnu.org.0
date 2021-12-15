Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AEB47614C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:01:56 +0100 (CET)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZXH-0002yO-0w
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:01:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxXy5-0003Aj-LC
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:21:30 -0500
Received: from [2607:f8b0:4864:20::52a] (port=35328
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxXy4-0005Gg-4H
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:21:29 -0500
Received: by mail-pg1-x52a.google.com with SMTP id j11so20686260pgs.2
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 09:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1eAWYDHvdjLYyvPEumNqAI6x8J5WcjRovtfZEUnVlbs=;
 b=Y1txZcfaq1hmG10Lp85vLmzj7z53e5eHiWJD7lSduGQqtrAY6+8elrlAXn8E4YZJdP
 MMKlmvCooNbFP1xka25UvC4ejcj/ezTEtY+lmQ/rHrTF0VKiTvEDf8OhXfdMz7OAL5QO
 VyQqGEOe2xI5W4l1j+jqCnKUs0r1CW3RUulpfkTq88HUJzbqqZpyPcK2iDVO8NUUah4d
 jSp+MRh2TiiXYDEhKPUTMoT52zOFkpdJsGLOcR0hJRt0RG1htEhoc7XLqt+gNtxa5sO4
 43MBH66JoQMggUP+2Kx6QQZtEUAxjdRDEzbQ+fEfaNFFvujLAHw/ZfFTKdAJKPxgrSj1
 etOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1eAWYDHvdjLYyvPEumNqAI6x8J5WcjRovtfZEUnVlbs=;
 b=O8fp2GemqDwxBqNJ8nG9gANV5hHo3nD2TW44Hocg5/NE5/1hwGMWCYGcdoq43a6Nti
 xr+GfvpOWnyvtjdvE/8KzpsD4b+hkKsl6NY0gX5XV8QGk+strbPHIpUyeaS/Qwfk8IaK
 M4Fy940jqUWm2q/lR0Ls0KeFqclUmyNGYZuVYeKLdNgq+VfroTEKKK2m3zFiBadL4rWV
 htTGqLG+QCLSUQ/ORA4ylsgmLsbXtI3JIBwDBBsihAoHJdvzhiXBIu8nk7KhHS0RDHRE
 w7Qtfim9Qr+DHWWrsE/H2XFhj8KFKxDHV6PrMvMh7VbtTshZkVhZHHuMvvapxGE/yDy3
 sLfA==
X-Gm-Message-State: AOAM532o9FQuqlawNthnwhfNulTTO91qcbecusAe1DNaDmJf+MfweVR+
 M//Wk3qHN9kNfv2v+huWxGzEvQ==
X-Google-Smtp-Source: ABdhPJwuxJnWe00zFWBZFwUlT3H/j4YTOtJ4tlwPUPRKZhIEjE24Vfi40iQ7Pjb4IlwxfzyfihjPSw==
X-Received: by 2002:a63:710d:: with SMTP id m13mr8536307pgc.545.1639588884899; 
 Wed, 15 Dec 2021 09:21:24 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-148bb55d365sm449785ad.219.2021.12.15.09.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 09:21:24 -0800 (PST)
Subject: Re: [PATCH] target/rx: Correctly set Error Summary bit in set_fpsw()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211215124312.254042-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51e648cb-4cec-8792-76d9-452244388ad7@linaro.org>
Date: Wed, 15 Dec 2021 09:21:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215124312.254042-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 4:43 AM, Philippe Mathieu-Daudé wrote:
> FIELD_DP32() does not update its first argument, so the Floating-Point
> Error Summary Flag (FS, summary of FV/FO/FZ/FU bits) is never updated
> to the Floating-Point Status Word (FPSW). Fix by assigning FIELD_DP32()
> returned value to env->fpsw.
> 
> Fixes: 075d047e2bd ("target/rx: TCG helpers")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

