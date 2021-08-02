Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEA13DE0C3
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 22:37:27 +0200 (CEST)
Received: from localhost ([::1]:33510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAegg-000737-3C
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 16:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAefp-0006MI-LK
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 16:36:33 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAefo-00073r-3c
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 16:36:33 -0400
Received: by mail-pj1-x1034.google.com with SMTP id mt6so26842800pjb.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i/+9ysmy7mxHNu5OoLAXgveXXF/xV7NASToaHqXl5sY=;
 b=GGz/dHGtoX9f6f44N7CYrEohdhRQIEDcSujWjRPYL4z5TL9t6ZEru9JfcAySFNhAzf
 0qPbNao/mnLyKJygtJGBZIUjq8Lyr0FkhwGPRPQ+GMOZNgck1LecqYNhjOSDOfVrtVer
 R2UysvYA3XuFAtEg0DfA94ZjCw9BfJKTeYWt19WK0jv+AGUPUinQz1vw6UiPXOyy3qxF
 6QwXQyREmNMlTiR0sFNiKTZfW4NtiY/lxy9ljHHsk3Ugga+H8rWfBIKmDSQC4h/cfNlO
 s3bTHtzURUzZK58HLlXbwFrpDCPrZPMfzhAp1Kgp+RguQ47lLpvjLHC8KXYqiAPxFGhz
 6fyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i/+9ysmy7mxHNu5OoLAXgveXXF/xV7NASToaHqXl5sY=;
 b=pmH8kRPRWagdLOhRhuG5j0NRLKp/8pX24CPNUhywgPdkJprgQTf4Hytsozq4UVEebQ
 +9N/hQre4VGLk+eAWfYPl3FgzM9xBNky/8sn8mpUQaVZ4D2nPYU9B/FDAaIGzAVOCVJq
 OWfGzAh0D2qEzxFjh57QapDkTdO75PJMxFeHAWMmATd/6ACnsoxZc4FIiXMC/nXH7P61
 LYGzEBfsDef1MPQn8LnKCWhLCODwQNAX2y3KB8GA7WDRlpudFXh/cw2E09wXNtAlz9/p
 MrbPRchaMktX2m2ZwBOO0ZeQ1LHKRFxkMjZmsJvYYBfB+6Y2+OrM4YBF8mcsAFK5OH+h
 HGJA==
X-Gm-Message-State: AOAM533gStv1eJHKCESvW4j+O4cBesVjyVQ6T43h5LPL53O45M1AMW5Z
 ieAl8Tolg//4LgieaRoZhFDEiA==
X-Google-Smtp-Source: ABdhPJwoAfaNhmFTz0NPexnqqfJkfsZekv76fRMi4UTIMxxUhEXPAAQGWTLWeTQo3VecZRN/kDdMTw==
X-Received: by 2002:a17:90a:c24b:: with SMTP id
 d11mr650018pjx.91.1627936590517; 
 Mon, 02 Aug 2021 13:36:30 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id x4sm13023112pfb.27.2021.08.02.13.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 13:36:29 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 5/5] target/mips: Convert Vr54xx MSA* opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210801235926.3178085-1-f4bug@amsat.org>
 <20210801235926.3178085-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9518568c-3d2f-5586-fcf0-78dbce6814c7@linaro.org>
Date: Mon, 2 Aug 2021 10:36:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801235926.3178085-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 8/1/21 1:59 PM, Philippe Mathieu-Daudé wrote:
> Convert the following Integer Multiply-Accumulate opcodes:
> 
>   * MSAC         Multiply, negate, accumulate, and move LO
>   * MSACHI       Multiply, negate, accumulate, and move HI
>   * MSACHIU      Unsigned multiply, negate, accumulate, and move HI
>   * MSACU        Unsigned multiply, negate, accumulate, and move LO
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/vr54xx.decode      |  4 +++
>   target/mips/tcg/translate.c        | 55 ++----------------------------
>   target/mips/tcg/vr54xx_translate.c |  8 +++++
>   3 files changed, 14 insertions(+), 53 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

