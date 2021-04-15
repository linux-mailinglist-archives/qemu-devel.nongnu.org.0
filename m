Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193DF36157A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 00:26:27 +0200 (CEST)
Received: from localhost ([::1]:58954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXARM-0006IL-SX
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 18:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXAQ8-0005IJ-9Y
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 18:25:08 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXAQ5-0004zw-Sy
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 18:25:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id r13so9082513pjf.2
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 15:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OsFyBiBOCKTjkQNT6yRdyWwxH3TNiEJ1hscJXYK5138=;
 b=kgXK6UUHoL/DuSaEs62M3NsE+AUDjy0lxs+VxmKhLwypb3S2dW8w1b3Q/2kJiZ0s7X
 T9hlpz0CaT/b7OonoeRp9W3xqrlR7Dq5oginjMC6fcB18fht1JFx3Ppy2smwLqrg+yro
 qXFHTvt3BHBBt065Ig9GNbCRwcBHDzbmn4IIE+VGvcRC2bzypSZnE/FoNZVknfd03A3C
 DFKXpfD57tYZ/t8rEZZEPGltvAMrmaYHm1h3s3aCjQ/elENNe9sWffEoihoK1OqbJuZP
 87xVuT8gWwFgLLJjE3sg0vXwBFjWxnkxdc4LsyUJbno12OewINheqmrwp7KGxi+9LRXD
 j1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OsFyBiBOCKTjkQNT6yRdyWwxH3TNiEJ1hscJXYK5138=;
 b=ZC/IlReDjYk9I2pnAli2UhMNNgWFitEKgwsCo7stkOWHRyHE/wKfkHJY0HECkYNTLK
 57vRY1NK/W1Wy2A4M8KU8YsGjYPlX8/RJFjneJMXhURgr65GFsRhFUHQUAcLdzKccao+
 d41K4tqfjRzYuAj0q4ZPUqx4OjyeRxzqi2Tonazm+vfulT80ToNmMC2fxtScw8j1WjYL
 FwY23ZlAa2XdYWqlFjF7O3oapLVKJvV+UA+80E/bPljDOG2kXJfT16I/aJDOxO/TwSc4
 y1Vx/82qc2I1YcmCw1HAgEGLAGEBxYfM0xiNgkvaknxaKQJ3o0f7KuuYjRmlRDFXkhIK
 gcDg==
X-Gm-Message-State: AOAM5318AbzPWq4usZ6Gfe4yIGwQ01dL+bAoLffI5K/P4znIKyVrqSx4
 Oozu7rSLGbjuPRh8pF52GI4Y2Hl0aKWxcQ==
X-Google-Smtp-Source: ABdhPJwRvDwudSryH69QtTd6kFYLrV7YPF/xcs8OdZHn5/s2vejRGWQONrIGg0RLN5wHJZMG2jwfhw==
X-Received: by 2002:a17:903:1cc:b029:e6:f37a:2185 with SMTP id
 e12-20020a17090301ccb02900e6f37a2185mr6293652plh.67.1618525504274; 
 Thu, 15 Apr 2021 15:25:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id 18sm3062383pgn.82.2021.04.15.15.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 15:25:03 -0700 (PDT)
Subject: Re: [PATCH for-6.0?] hw/arm/armsse: Give SSE-300 its own Property
 array
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210415182353.8173-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6502730d-a3f0-dbbf-b532-8c863216406b@linaro.org>
Date: Thu, 15 Apr 2021 15:25:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415182353.8173-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 4/15/21 11:23 AM, Peter Maydell wrote:
> SSE-300 currently shares the SSE-200 Property array. This is
> bad principally because the default values of the CPU0_FPU
> and CPU0_DSP properties disable the FPU and DSP on the CPU.
> That is correct for the SSE-300 but not the SSE-200.
> Give the SSE-300 its own Property array with the correct
> SSE-300 specific settings:
>   * SSE-300 has only one CPU, so no CPU1* properties
>   * SSE-300 CPU has FPU and DSP
> 
> Buglink:https://bugs.launchpad.net/qemu/+bug/1923861
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This is a simple and pretty safe fix, but I don't think it quite
> merits doing an rc4 by itself. I think if we do an rc4 for some
> other reason it ought to go in, though.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

