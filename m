Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BFD36CE85
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 00:15:55 +0200 (CEST)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbVzm-0005DU-DC
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 18:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbVx8-0004Fy-NJ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 18:13:10 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbVx5-00064e-PK
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 18:13:10 -0400
Received: by mail-pg1-x532.google.com with SMTP id d10so4970270pgf.12
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 15:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pMfajb6glu5ASpJTnwJBybovzcDACTqQLnSunF0CWKY=;
 b=Ronh4MGurulvZRO4Q8xmyd08qUyPs4u8jhBUm2pdZxiwY3zIDj1SEVfGAZiIWOpx4j
 5hIR1uc+tS1yn704TmJV8wmpgCRh6LrHZPwODo/neGBTkIicXalp7liG2GW0WBif8M+U
 4y4dLJlhpkFRCmGMp1+gnb2qDuTLX1lpjv3RDXCQVJpyh9+kOhYKgbAXsFzeg/r6Gnp4
 gvPZwTVdAsqsxKA2JYD1H5OfOUTRlxV44MDOuf7kHpFuzwLy5oLpa+FUlCuKOA1t1ixV
 7UJ9TNACtA6Da2mSafuxJEn2Ml/L1K6B6gx0TizRqSpKpF5d5RTkRfyThdtJw3iT7hjv
 2WpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pMfajb6glu5ASpJTnwJBybovzcDACTqQLnSunF0CWKY=;
 b=KpQoaodcmM57Ctqjl/ATraXCM7UV84wyZ6/1hVR9Z4BMpwu6EPrJ4SW74xdkqRAvGa
 2dmzYkjZOAsUE4Hr5OGjFSuAiV3o7v4t2e+OqtlrtVdESJdKyDsMshlGdhXg+0SIQsK9
 ZEfuvyuZb32FogolyNtWjUFGVTOHCqirr1nwrQPpP8+LHVJNEPbEG9VS07Mc3fzGWMa5
 3WdU0Aiql6aoxZxkt+inY2ElmB7Bc//be3bKwYU53HqhNDMA1k+M5HHVTlT35HK9A++W
 7zEVJ/7DqqWIO5/gVbVi9HmWQkvrSrc8KIXbA+Xydl2izHWEQX02NWPdnGDSoS8yu+Dg
 b2Kw==
X-Gm-Message-State: AOAM532CTvTmo2w5aMt5p19u3HRw+sYuZd9txRKGmtSRz39a+vPGEs14
 B9VjjxIJnf9PA4iZcrTFJxlLsg==
X-Google-Smtp-Source: ABdhPJxrgy17z/GD1jrs9ZLwFjiOwGtSTA1SfN9IQkalx2MB3b+j7zkSHpB9gqf9BaKU8WK157rQtQ==
X-Received: by 2002:a63:544c:: with SMTP id e12mr5907755pgm.161.1619561585590; 
 Tue, 27 Apr 2021 15:13:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id r5sm2924748pjd.38.2021.04.27.15.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 15:13:05 -0700 (PDT)
Subject: Re: [RFC PATCH] target/mips: Allow building without Inter-Thread
 Communication hardware
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210427191152.260421-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f48f0433-9608-3cc6-8a9a-6eef8c213c7b@linaro.org>
Date: Tue, 27 Apr 2021 15:13:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210427191152.260421-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 12:11 PM, Philippe Mathieu-Daudé wrote:
> The Inter-Thread Communication unit (TYPE_MIPS_ITU) is an optional
> device that is only selected by a few machines. However it goes
> deep into the translation code, as the MTC0/MTHC0 SAAR helpers
> call itc_reconfigure().
> 
> When building with no machine selecting the ITU component (which
> is implemented in hw/misc/mips_itu.c), we get the following link
> failure:
> 
>    /usr/bin/ld: target_mips_cp0_helper.c.o: in function `helper_mtc0_saar':
>    target/mips/cp0_helper.c:1118: undefined reference to `itc_reconfigure'
>    /usr/bin/ld: target_mips_cp0_helper.c.o: in function `helper_mthc0_saar':
>    target/mips/cp0_helper.c:1135: undefined reference to `itc_reconfigure'
> 
> Fix by adding a stub, built when the ITU isn't selected.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> RFC because too much Meson machinery to my taste.
> But how to deal with such architectural devices else?
> 
> To reproduce:
> 
> $ echo CONFIG_JAZZ=y > default-configs/devices/mips64el-softmmu.mak
> $ echo CONFIG_SEMIHOSTING=y >> default-configs/devices/mips64el-softmmu.mak
> $ configure --without-default-devices
> $ ninja qemu-system-mips64el
> $ ./qemu-system-mips64el -M magnum -S
> ---
>   target/mips/cp0_itu-stub.c | 15 +++++++++++++++
>   target/mips/meson.build    |  3 +++
>   2 files changed, 18 insertions(+)
>   create mode 100644 target/mips/cp0_itu-stub.c

Perhaps use __attribute__((weak)) on itc_reconfigure?  Then you don't need the 
stub at all.  You're already protecting the actual call, so there should be no 
change needed there.

We're not using weak so far, but as far as I can tell this is supported by gcc 
on windows as well.


r~

