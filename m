Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD67400EB4
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 10:31:18 +0200 (CEST)
Received: from localhost ([::1]:49232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMnYb-0004Zc-41
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 04:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMnWD-0003rh-Ur
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:28:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMnWC-0000IU-8V
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 04:28:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id b6so4948785wrh.10
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 01:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JTZ6cC4e2aAZoNymTTPQ+9vuq98hMLL+6iEVG7896ro=;
 b=DuaYD/lrsK/Z4zvynXtDhQGEuSHBCHYXiqhGedMgyTeZA0G4D65lH+JZPWeNZ5Wnp0
 zrl7oU+JTqXFXETD+kDR6EqmMZVqfSuSzcptEXKKP3bAnNPYGtOFUmEF5wSiHk97cUOO
 mvqSSglv332lMuHU1N/k0DRuimjmVIDKu+fviIr5wgJ1EoZ3S7wXPe41AHJKtbo+04+0
 d8GoE5qyDyhs4wzhmWFP+yEt/FMTQoOd5AEzz9C7O/ixJV7R9rROqAypKovtrMWetmFj
 wLxGhv6O6VJmddcR7LmCIdCpnn0VvGx9NEo8x45+5LjRZ1D/cHtCwTh+7+3/bkfQlj+b
 7qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JTZ6cC4e2aAZoNymTTPQ+9vuq98hMLL+6iEVG7896ro=;
 b=CAKCV0/z8FH8NXWV9/58j7sApt3WICTC3GJrD/KSmfNdng1uzJhSsK5niPnYaOA7a4
 uC1DBzQj24Y3eP6tEKIcjz52PeZ6uDOYEQINFBCistlBcuVIt/9vH3NKLobhUw6Js37M
 m6johb+5DJ+07Ob09WdXPGQA/SP19gfEiWO/B1nJW25p9+noJjMpVTm3dx4lG1mYTN5U
 2LH7IN4hjTe4pe4dn9n59t5dJjiizdTuxPlE9sTvWDFCf0Hdjw4cUTTuQsru/1k/t0TU
 ch/uiqHUjFIhzw3xTqLQscc3P/WUQQWuxtgjsD7sELVZKTtX98CQrJb+Z2UvQllpeKXq
 +baA==
X-Gm-Message-State: AOAM530fz8XJLwgnFhx+0YtPl8aBnLu3c+beuGY7l+BybMqCNIUmb+h0
 g/uSdkM807n3eczfOCrdBjvQRw==
X-Google-Smtp-Source: ABdhPJw/cdzkvcs4FBGsGq5yNGhthKH2wBorQAsJ3XpqhcEYhuPGXNOpjGtgI2pZOAllbkjXcUuvaw==
X-Received: by 2002:adf:f7cf:: with SMTP id a15mr6231663wrq.188.1630830526449; 
 Sun, 05 Sep 2021 01:28:46 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id c2sm4255837wrs.60.2021.09.05.01.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 01:28:46 -0700 (PDT)
Subject: Re: [PATCH] user: Mark cpu_loop() with noreturn attribute
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210905000429.1097336-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36ce44d9-52cd-758d-b2fe-8c92549f0e07@linaro.org>
Date: Sun, 5 Sep 2021 10:28:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210905000429.1097336-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/21 2:04 AM, Philippe Mathieu-Daudé wrote:
> cpu_loop() never exits, so mark it with QEMU_NORETURN.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   bsd-user/qemu.h   | 2 +-
>   linux-user/qemu.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

