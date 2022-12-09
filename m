Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E876482A4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 13:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3cwf-0001OZ-K3; Fri, 09 Dec 2022 07:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3cwX-0001NL-MV
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:57:34 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3cwW-0002u0-2w
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:57:33 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5699379wme.5
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 04:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hZqXnAGQvdY12EYunZsd33B+R0nXI3I3bZAyxod3eT8=;
 b=oGYxXVDM9i/d2UJicl/IthNQ+RUQyLo5qwFzie8TN9KUH3H26ZHp0kZyOnValJurkC
 52x9f+1TF0KQdkHo3DCPwnRKtPiVL5B5QPVg6aslhhYMKRiH9HARySMULZ+G4RxQ3TzG
 KAC+CgN2VDnd1fgfGyOi4R0Bk2ic3syHVmPEZY19llBzC7yDzClMuhp1aqRGZ9/SXAtm
 7xDLYK16TzcMt3lsuHaeU/mWNaHvLlhgIi61vLcQr29hUrPFZw+QyF52YYEOs/YPWRqB
 xJU8R8M/PkknrC/DStjRk8ybxPmoZXFqw2rkwX6Wl+a8oQ9/T46fACwUXe2i89QlqCEu
 thkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hZqXnAGQvdY12EYunZsd33B+R0nXI3I3bZAyxod3eT8=;
 b=SIRTWl460N557Y8NJ9bOMyCN3R0D87lUEhf+C7DF7FerUxwBPcLE19rkkmpcIH5zpR
 UUWtur2jGHiCuliFi7DRDhMlids98YoucWBlgRXvKbdgneQY0/Fz3oTOpfjpoNUHYLF9
 CGzTn8VNM/UpmnL+iVmtmsZ9Tn53E5/LXtJD9p040vSqH1vDWn1gWR0DtopZ0HDtTWO1
 NbtkKA0RMFGABXXwVAibp1J9rT9YbOm53qHLTkyZdFe1gKvYqRjEELfZjEQUmdg+/gV3
 bOhZUGAokh5/BgORWLogYHZLU5KT+pv1mPrE1D+ZP0McxodTiWyPIMvC3man/c8/22xq
 /dnQ==
X-Gm-Message-State: ANoB5pkmvqOwrDjHJpyYcvelCjAVplulAJaAz69KGSUDqfiTjjjkC1wg
 3Ti9E31bDF8rT/dfwJkprJOfxA==
X-Google-Smtp-Source: AA0mqf6cmWAJFWmLXn9OtLJdKtkD0D/5ADgm6ZGzV0xXiro0dEL+d35PCVYJ33FrohF8dYwl3y+aDA==
X-Received: by 2002:a05:600c:654e:b0:3d0:6a57:66a5 with SMTP id
 dn14-20020a05600c654e00b003d06a5766a5mr5031721wmb.0.1670590650151; 
 Fri, 09 Dec 2022 04:57:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 hu7-20020a05600ca28700b003cf878c4468sm7665338wmb.5.2022.12.09.04.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 04:57:29 -0800 (PST)
Message-ID: <aef1cfc4-bfc3-e8d5-5ab8-59558bfbb405@linaro.org>
Date: Fri, 9 Dec 2022 13:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 22/30] build: move SafeStack tests to meson
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-23-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209112409.184703-23-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/12/22 12:24, Paolo Bonzini wrote:
> This disables the old behavior of detecting SafeStack from environment
> CFLAGS.  SafeStack is now enabled purely based on the configure arguments.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure                     | 73 -----------------------------------
>   meson.build                   | 26 +++++++++++++
>   meson_options.txt             |  2 +
>   scripts/meson-buildoptions.sh |  4 ++
>   4 files changed, 32 insertions(+), 73 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


