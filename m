Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930A84005CB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:24:02 +0200 (CEST)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEnB-0006nO-LD
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEiA-0004lD-1g
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:18:50 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEi4-0000td-6E
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:18:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so203653wml.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w+EWVLghGrTLEyjnAgcni+6Qg644HxUmZiZnH/7GPmo=;
 b=YOTagwrULCcABeNZCP9iT/xEwAzP+5dww8RQrzFMNtIwtXD5Xsm0NMNbQc3D7NUrAY
 JwX2dHeWbk5wx+LAMLNvIzKtytSb6odJuqCk2bCyqScIoo+7cmb2b7JHJtA0iZGSQ5CX
 5hjKAkP1ODYxdSOr2tAs6i0Iu3xubl7W8i5eSCmr1Xt4b/l/8p0apJ0KFAZatka0s7Y7
 yLYrpxZDHxtXD0KP7K1uXBydZfgF5NVA/yvXKaqFB6ayCC+87g4vBdQIUqtj/3GA4Bux
 ZFpkShATjo3B3Hi+vmzFwtzR4iEsMNIIMvUlcMaZ74ZC1Oi3ZnpPo6ZpkHZaURR/aZNZ
 WJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w+EWVLghGrTLEyjnAgcni+6Qg644HxUmZiZnH/7GPmo=;
 b=tdfOfkY2vJwz7KQFnzrKjCNQ7mSA8EBN29PHjy+SIOvuee7M9S48spkweF4cSelOF1
 qODVVLGzht9jmvcIdAYKnC+S9LTN33oE0faszh8CAyWSy+a789W9HbpAyPQYicEAtMIO
 3lJlQXDuIS1h9jdBXlZTs6yPdadWjcZOj/ts1s5Qsky/zOs3hmrFWepa7vqrAPCjEPEU
 RN6G3aFq0uxkwT8VA6tDwG7dEcXBxRe3p24LZLpKHdNWPKcEPZ0lKtnrh2BKyxKNshcX
 6MyILVlRtMSMd4J84AHXdcShKPfdHUPcGzWevcmdcXr6hueLwsPJgD6PEXh35QRYFQoZ
 7lEQ==
X-Gm-Message-State: AOAM5301owVGLI9RMA7dl4Xnq4MXQVy80I2tRXZ+nkK3TW8G7Duji7o7
 TSE1/ScNDNYHJL4K1kjr+D4AIA==
X-Google-Smtp-Source: ABdhPJxMK1ZE5RwruzPnBybJkdr67GSwPFzT7AJ/MLIDtdOvXFRqxhXXIoxgxJOOnapQR1+9Dc8+6Q==
X-Received: by 2002:a1c:9a13:: with SMTP id c19mr236574wme.195.1630696722514; 
 Fri, 03 Sep 2021 12:18:42 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l17sm128003wrz.35.2021.09.03.12.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:18:42 -0700 (PDT)
Subject: Re: [PATCH 16/24] target/openrisc: Restrict cpu_exec_interrupt()
 handler to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c983e61c-45f4-1592-5527-36d856f297c0@linaro.org>
Date: Fri, 3 Sep 2021 21:18:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/openrisc/cpu.h       | 5 +++--
>   target/openrisc/cpu.c       | 2 +-
>   target/openrisc/interrupt.c | 2 --
>   target/openrisc/meson.build | 6 ++++--
>   4 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

