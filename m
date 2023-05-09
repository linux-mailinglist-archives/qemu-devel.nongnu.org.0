Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDDF6FC942
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:41:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOW5-0006KL-Ud; Tue, 09 May 2023 10:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOW4-0006JL-0t
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:40:36 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOW0-0000hP-0J
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:40:34 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so8136295e9.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683643230; x=1686235230;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sNPlmCEXFQpje3H4hu0/8e2jihhR+IgU30AifxYCDVM=;
 b=qYqTexInUFPbwi2OQnroKXlJY/UTHXNa/TmHGcGnHe8LhLA2/hxYJOS5zXNFgx2RkB
 lrobwW7mLHRNJdOHXkBXbWZd9j+zg7Y5dFeSgoN6ab27wGuG37ztXQFpk35V2qGLT4XH
 NELC1HYKBAHCn8OTdFJFu8h0QGk8JO4Z7kvb8RjeHRTGXWmRQ4EYcUTxWYJbz27bvJ30
 epwSHe5EEHhnNO5JWIhf3od+sa04+4wCDQrrsjR+qDck9AJG0HOdxXGTola2wQsq5kVg
 7eWtzb+HPtl4UEBgygLQa3b+QYWsKX8zehj7N/Nuf7LZHxkpdAHeeeAM+iryk/fq/ZuL
 rNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683643230; x=1686235230;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sNPlmCEXFQpje3H4hu0/8e2jihhR+IgU30AifxYCDVM=;
 b=JjjOIMNPP5imwCT6GmLJmTDt2+NbgkVo0kOygzIDc13Hzzphp3lEvHvaJKq345qL4l
 xXvNYV7WBlgWcGBGrvVZiDfsZIGw9GAvdMeFZvxcoNhW8qmcSHmzFGqMDe02H3dHlsd1
 ShZxoI9Ji3gAxFlpAjq9JisPpYijcQDoWO6SAVNbSMtQGSkdlfl/W/tACZL9rBdifT2H
 cffMhnGEWhbNBQ/iLStaFnV8cmKGUCLWC67G1nMvRiI+iFz4/9TY/7j3Skq48r+Q484z
 RAwlIZ/q4SKmSuxYN4cW2t8e3Ik4h9I/GBMzqQx1HiCYdIxB8WVeyuS1kpxrKmLDZTCZ
 HAKQ==
X-Gm-Message-State: AC+VfDzbUvz9Cxjkg/aB9uwGR5rpAjwCqZVLs9r51oEpJuGqrsjfps+S
 MC32yIkB3mt32IhrGCOkoWPyfg==
X-Google-Smtp-Source: ACHHUZ5rcmDCY5zZwxhUxUEHiXBJdVKeYWsJ4ZQxafbGn13u1DkSz67M045/P6tRcnUg9yr+HP/l8A==
X-Received: by 2002:adf:ff85:0:b0:307:92e8:ec60 with SMTP id
 j5-20020adfff85000000b0030792e8ec60mr5403503wrr.39.1683643230231; 
 Tue, 09 May 2023 07:40:30 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d4581000000b0030639a86f9dsm14489880wrq.51.2023.05.09.07.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:40:29 -0700 (PDT)
Message-ID: <38880262-7702-7653-ec79-791019b7fd88@linaro.org>
Date: Tue, 9 May 2023 15:40:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/3] target/arm: Select SEMIHOSTING when using TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230508181611.2621-1-farosas@suse.de>
 <20230508181611.2621-2-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230508181611.2621-2-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/8/23 19:16, Fabiano Rosas wrote:
> Semihosting has been made a 'default y' entry in Kconfig, which does
> not work because when building --without-default-devices, the
> semihosting code would not be available.
> 
> Make semihosting unconditional when TCG is present.
> 
> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/Kconfig | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

