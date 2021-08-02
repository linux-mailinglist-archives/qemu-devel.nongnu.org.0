Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826423DDFDB
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:09:26 +0200 (CEST)
Received: from localhost ([::1]:59620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdJV-0004Nn-JQ
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdHc-0001bR-5T
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:07:29 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdHa-0002P0-7I
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:07:27 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so1384442pjh.3
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 12:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pbpgP8dDa9vpOyKxUssfTEW0iTQH4iKuCvMV9IpBYwU=;
 b=Fx3dfNL8HX1RE+Aqa3A0+c+SQFYvasjM/AiMLeyQOL7YEpkivkxI40JPm+L+CxvIxa
 SfYBBzOYxrA/I4gdEnARTS9y5QI9snQ2bZHkIEVFMApU6TQtCqjadz1sR+61UN05xsS5
 /XoV3F1GH47pojEwx8sem74HdhYfs9ErPL5Hs+/mY38HWF1ZEAQSmfF8zqjh3Qo9CiiG
 YEowHOReDJKNtBXW62CGsrqBsXcwzmG6asl5/niYkcdmgYPB08tMmbVD6kMITptsumkx
 ofVTR2V0SGlEUamMPa+YFjHlaGCELPXA6qzrTY/jMyx9X2QYHlzyFmo5ToIXLohjDF6b
 QSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pbpgP8dDa9vpOyKxUssfTEW0iTQH4iKuCvMV9IpBYwU=;
 b=NACjM51FayIBy1pPTHc6OQiNsKxGa/teOvejPwcuMOC+3/UUe49bXLIyuwQ5xFv3Ud
 /6Ee+/FADmLoD7KhbTa/mvTvNzH0Vg7ezJOkIrEja0sKwtv0RJsvVa9AQMBmtOxxCGIE
 kLPTfYq8gf+SXTFRbf2qbKNaawTkvqPkCL0cGWJ/LPNETGFLPGicus04/nqph6wQxP/A
 vIT9G+PfOCD1nShfziNrxh1UipnXFmdA/FbiCKeDx8YuziUkyK67Vp3d8AAOZt0P6NSZ
 eSxg8i7IlLb7ViT3zznwBdhq1izXcWE9c7IUKmLYA9lRoRAbQR5WJKW1RTq2xzGy4eCa
 Lm8Q==
X-Gm-Message-State: AOAM533cYDYi6xSwJA8Mibc4F+55ceGIztiFnLt1PK3KWgSEmPpxgSyS
 AflpeWl/PxflSLSdIkMcg4QecQ==
X-Google-Smtp-Source: ABdhPJyWxif8aBVp920PpgHlK/0pWKpv5TqxOmfmWXGd/5qKnZSSupeezYjFRLbWpFaGOO+OXDMufw==
X-Received: by 2002:a17:90b:1d81:: with SMTP id
 pf1mr6893154pjb.88.1627931244656; 
 Mon, 02 Aug 2021 12:07:24 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id s193sm13515093pfc.183.2021.08.02.12.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 12:07:24 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 1/4] target/mips: Simpify PREF opcode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210801234202.3167676-1-f4bug@amsat.org>
 <20210801234202.3167676-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f995554e-f14a-39bd-b2da-444e537e3d0d@linaro.org>
Date: Mon, 2 Aug 2021 09:07:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801234202.3167676-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 8/1/21 1:41 PM, Philippe Mathieu-Daudé wrote:
> check_insn() checks for any bit in the set, and INSN_R5900 is
> just another bit added to the set. No need to special-case it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

