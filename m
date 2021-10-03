Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F94203C7
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 21:39:28 +0200 (CEST)
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX7KY-0008Pq-Cc
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 15:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX7IU-0007ip-MZ
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:37:18 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:40753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX7IT-0003hp-85
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:37:18 -0400
Received: by mail-qv1-xf29.google.com with SMTP id n6so8819611qvp.7
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DVc5KR5LP19QnwZLxBi7oPEot4QTQgpZj3j+CUixUtM=;
 b=FqXMsEGg9VtCOLM3rCxr8DEoPouFKBlrdzIdDJ6/m4wLqKks3GbSCfc/mSHwjpaNIc
 xRd5J6vznXjkLpyaCV8VJWGj09YKPqMpZPFF1srrH3pWFPhAvHZB7HPXoPLRps2aC1z8
 sfXtzJ3K69H8jhu0x/f45Ne+Zw5Ia3NXLJszm3R4o2Atq1Zz+5HLL/1H1BqdT/FVGSMp
 f8QriWgIfNK4xRDUK24wpf92PgNL67fwhkO1DG5/0Qu2aKYTo6joZQmYD7/uO+/2KWc0
 ZYgLqdj70hKXBBS00hdEw80tNgI1dYKcq0o21vzVBNrsQ5OKXbThU0zUuomJYOYCXk0P
 hw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DVc5KR5LP19QnwZLxBi7oPEot4QTQgpZj3j+CUixUtM=;
 b=aFm47CBrbJjx6Q2MnDL8tQzV6sgrokBgDpFtXrZu1Zvg0y9G0wBtgdiCFrakSIPUWw
 PWndMxLHSbGT9aOE5D+6RWkP2RFuSDAV7nkRrs3PJDFwNU/GmGOEo61wNUkK5g4CjtiD
 Ze1a5ulIt5E+WuzqoZvDrez+5dGTWeh9gRxG0viYQKQWtl2Cpzochyl5qqaPlP/NFvnf
 nE7RF4C5y8y1Dxsgdq1m28y70zJOXNC+ZozJQHptgGklj9cIJaJL04K2mBCBhIGn2SMj
 8DH166b1nRuKrufZt1hHpaV8eMu9MOLDjl8KEJM5w0DJdbC5P2Yddt7M3dZvpWj/m5XU
 jXAw==
X-Gm-Message-State: AOAM531WJ5S9lQiuvIEYqDyHwslk9UJK/bJwA7yj8NAdbDt7Zho6jh7H
 BHOZbgXuczK1D6eNl1CGJsW4DA==
X-Google-Smtp-Source: ABdhPJyIeAT3U7m0OeJ/2p5+68h6BJGmjGxzWMs6Fyy9C7bO7zqEWesuESg1OXV9aBxUL4FYazBG1w==
X-Received: by 2002:a05:6214:431:: with SMTP id
 a17mr19133969qvy.48.1633289836320; 
 Sun, 03 Oct 2021 12:37:16 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id f14sm7243192qtg.57.2021.10.03.12.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 12:37:15 -0700 (PDT)
Subject: Re: [PATCH 7/8] target/mips: Use tcg_constant_i32() in gen_msa_i5()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003175743.3738710-1-f4bug@amsat.org>
 <20211003175743.3738710-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9cfb2ac0-af77-9331-2534-cb2bcefb0020@linaro.org>
Date: Sun, 3 Oct 2021 15:37:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003175743.3738710-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 1:57 PM, Philippe Mathieu-Daudé wrote:
> +    switch (MASK_MSA_I5(ctx->opcode)) {
> +    case OPC_ADDVI_df:
> +    case OPC_MAXI_U_df:
> +    case OPC_MINI_U_df:
> +    case OPC_CLTI_U_df:
> +    case OPC_CLEI_U_df:
> +        timm = tcg_constant_i32(extract32(ctx->opcode, 16, 5));
> +        break;
> +    case OPC_MAXI_S_df:
> +    case OPC_MINI_S_df:
> +    case OPC_CEQI_df:
> +    case OPC_CLTI_S_df:
> +    case OPC_CLEI_S_df:
> +        timm = tcg_constant_i32(sextract32(ctx->opcode, 16, 5));
> +        break;
> +    case OPC_LDI_df:
> +        timm = tcg_constant_i32(sextract32(ctx->opcode, 11, 10));
> +        break;
> +    default:
> +        break;
> +    }

Same comment wrt duplicating the switch, but,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

