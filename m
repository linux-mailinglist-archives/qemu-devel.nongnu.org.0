Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03057400574
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:03:53 +0200 (CEST)
Received: from localhost ([::1]:51138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMETf-0006Uc-MN
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEQK-0004Jt-Cb
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:00:26 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEQD-0002u8-3m
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:00:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id m2so4142790wmm.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VeOzXG9O5OHj8L4mETTFX+B1SCJ4Q1jx530ePd9LyYQ=;
 b=wGyudfEsh2G3ok8ZAP8KBYLkM5Yk4gg/3Shyct9KiElNHXEGIt2cbRRBwZWvG14xCM
 rXXDCfxc0//KSVmmlncm757lzttYElP7hO0y7ihKljLAHUzMfy4H95ErFhbn8I+gt+rJ
 Yron8y0TlEy+cNpLB6/z2pmwjtKqxH9U7ffXHsYu8fUwACTL+3mnvyeJt4g30AuCJp2X
 XF1WjFcNZU4lsEHVH63G9Ou/rpgyoxsXZtYtoFVe2NRDT/0J/MThBMhFdo2NNB/ZpMay
 8eB8x3W6peaV5DHkR5AAnlT8cgvSGT6JjnemjRs62l3pjJwU7UjBQqE2Lwwrww5oFoqi
 5kmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VeOzXG9O5OHj8L4mETTFX+B1SCJ4Q1jx530ePd9LyYQ=;
 b=CYBxyRjVpKXDRW8hRqbLleSbALdJtWepz+h2Dm0KhNjEeqzKMq2SFWkIrn6eltd541
 VZ0VRqBQzGfs5E9eq3eYdRBoiHqQyqotVpOaZmNR7p3509KJidKUKL7FlybOmqqmKNzR
 PdYBuuIkZ6QZMaJhlEsP4DS8FZa4MES3XomYd2DXVLgsOlGmVxFBVmlQXFdl0gL6i1Of
 AI4shKjNy1crIBpjEJpwyd4OztjgsSmfOIthsfPTmDfzzXeHWI31JRhINwq2bVeRY3C5
 5NZJHe/YZAVIlKvW/ktFfDV7p8XIFmK1suyQSXx84pfJcv3Zl/kTHmWT56zAnv82tt5D
 QQIg==
X-Gm-Message-State: AOAM531pMNV3VKQ/1G23ipk+PYvzPtp71w7TacOGtkK7hmvdKJsMfvq8
 pxa8u5AFLRTczL5BNKVYFjv3cQ==
X-Google-Smtp-Source: ABdhPJxhGKTCZYDQHumRWvLhrskj9AVsQ7YCRYK7whD0iJM3iihVrq0xFayLv4oxOdsDPImaFaW45A==
X-Received: by 2002:a7b:cb02:: with SMTP id u2mr249682wmj.103.1630695614633;
 Fri, 03 Sep 2021 12:00:14 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c13sm61034wru.73.2021.09.03.12.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:00:14 -0700 (PDT)
Subject: Re: [PATCH 03/24] target/i386: Simplify TARGET_X86_64 #ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a3c97bb-7eec-4387-b43a-0a7552f799c7@linaro.org>
Date: Fri, 3 Sep 2021 21:00:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> Merge two TARGET_X86_64 consecutive blocks.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/tcg/seg_helper.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

