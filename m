Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5263E4D12
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 21:27:53 +0200 (CEST)
Received: from localhost ([::1]:39652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDAwC-0008ET-Tg
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 15:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDAvD-0007BU-51
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:26:51 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDAvB-0005hs-BS
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:26:50 -0400
Received: by mail-pl1-x62c.google.com with SMTP id u16so17665428ple.2
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 12:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PF5WMvmNYqKZOmvfwFa1tf0Z/i7gZLAoy/02ZSUzMRg=;
 b=aK6oiV64GMyleFDAHE2qvOqb648T4xMmXTx3cuHmrtoj9ju2suBjH5W/anNDEExYZr
 f8VO289T+exFqdBmcXSOf8KSTVtBY7Nab7RxMGBCmNtfXYalQ6AsyntGpq27h3KLA+nz
 +EM1QuBYEp+TgzN/mlgSVNr1ScmaQJOl59Ufzk7J+SGgkfjACl22Ts1dC8grKOl3k/La
 F7ySmTJC5GxugtnDC6vRyXcrkQviEyT6cdRgrJfbHb3thnJfeAqcp08yfi1kVr455/0+
 3PkrNFq0AZ8Y/vnGmB33zNuDMdKKA9LqVYIkmqrKtco0lEiSw39gEt4Ok8g0aqEcB9fF
 3img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PF5WMvmNYqKZOmvfwFa1tf0Z/i7gZLAoy/02ZSUzMRg=;
 b=mjf9CjrTQg1SIFrT8HiQmfSuY5sxAgdFNRt8WoBPfqyafUeBG3NKMDG9xMaQ32I6R+
 9pBeCl4WMNDg8z/pC9sRvmpaiGeoBKuISw9ZMXPaejLCeUIr7e1EI8aWpHmYCMn0dTp8
 oHvqnXtW1PWYoThXZI9x6X/pQqWYKs4Vf+d+/XGuJ/1hu9rZnF8C1uY1lUBZDyYt5zGn
 4fyZOfAKhLs9cZ3sz9QQgqbTy3Y1FdS3wB1N0/mIiWPwaktSxs+wRWoPpsHMd+pJaRYx
 uUeFGNBjLk/xtaGAO4e0cxXvXJkGmCKRFehHlfX0IVZEKqbaVNkdSAeeatR3JjnuDQPp
 ISnQ==
X-Gm-Message-State: AOAM5301L4XoLp8xXdiMgnw/A43+SsAi1kCkvrDWT2A52wQcpvMMJ98k
 MB0UxqvQwpIB18SLZoOaepqTdg==
X-Google-Smtp-Source: ABdhPJzcj1C1Zf9zWYSXHQgLAkkyYeB/6sjVRoyV+hQ3ddOd3NzJsEjsLnkr6/hiGzZeYJO59PO7Mg==
X-Received: by 2002:a62:b414:0:b029:32e:3ef0:7735 with SMTP id
 h20-20020a62b4140000b029032e3ef07735mr19872647pfn.61.1628537207869; 
 Mon, 09 Aug 2021 12:26:47 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id o127sm21418407pfb.48.2021.08.09.12.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 12:26:47 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 v3 1/7] target/mips: Introduce generic TRANS()
 macro for decodetree helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210808173018.90960-1-f4bug@amsat.org>
 <20210808173018.90960-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aef0dbb5-df40-74d7-de46-3b25c16fe20b@linaro.org>
Date: Mon, 9 Aug 2021 09:26:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210808173018.90960-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/21 7:30 AM, Philippe Mathieu-Daudé wrote:
> Plain copy/paste of the TRANS() macro introduced in the PPC
> commit f2aabda8ac9 ("target/ppc: Move D/DS/X-form integer
> loads to decodetree") to the MIPS target.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.h | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

