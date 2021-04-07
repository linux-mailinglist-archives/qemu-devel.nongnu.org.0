Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F49D35781B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 00:59:12 +0200 (CEST)
Received: from localhost ([::1]:60158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUH8h-0008Lc-JY
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 18:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUH7C-0006zV-Es
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 18:57:38 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUH7A-0008QZ-6N
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 18:57:38 -0400
Received: by mail-pg1-x52b.google.com with SMTP id z16so6757084pga.1
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 15:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bDXD5KHeba++bW/v/oyeHA2L2HMn/IivonjK1IviUKM=;
 b=zm39pWu2PXepcdRf0enN447EIjVQMT+BMYhm+lquTdKfWB5BRaeRlbS3nI7XyEMkya
 i7OOaOsT4oTe8rqNPWrY09jfYmSdanUBs9tvsWxqlgAMo7dD9TVY+Mcjwfw76J0EbifU
 IzOGq3nWE/vKFmvGQWZ0Z5zljdvjD2rSrrAuo6n2Y6PDwgsIdZJSkFzdmdbQC3Vuz42I
 Lqbzm6/UMJh0SaXvf32RmcZcWwmha1TIpGAwW8flNU7ZWJPr/qhNtstZ8P5WvOLn0Ulg
 fPLKXABpNo1MzXKYC5HHoQond4N4RHOuvHBh5G5RQ3Naupw5ndXyHLgKsQDWSlqwK0H/
 ZHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bDXD5KHeba++bW/v/oyeHA2L2HMn/IivonjK1IviUKM=;
 b=uNk9/7iOMpBbzuPG2/DXMvjBGYGpIviL6EoI7RHkTuUR/UpxDPYoraZMvpzWTy1QYe
 DULH045i5Y/nPut12MXIlm3IMbIRMQvJytmS5cIBbhFlz3VWLdv2JAbTTcjgE0QzetUG
 E/Pg3KS8aVHXW7Ggm2X8fwwB24kzYcjc0vWCkUN0wYy2m/99qpY3cSL+YTWTCEhnhZ0y
 6vnjjb7gCVcT7KqvIT7uJUcg/Obf5MkGhas4BcuqBOR+3YCPRbOSC1OQxPkQSA4Pedhd
 klt0fbUGeYAqj0Fwtwg8Uu0nQ+jwppOvpL/rdPIgKXBKThhgPRNJ/N/9EnFwYqEdsSAh
 yDyA==
X-Gm-Message-State: AOAM531aO9aoWY2dhnMoUWKu8roBruBIFthjbeBJi2T2EA3gXNd8UonU
 s+CaKqzZxjFaG+uwAvz2n2UoDw==
X-Google-Smtp-Source: ABdhPJwpOItW0rt13hMZbRhbz/78b5usg+Y6kcC1pZ/+WbWPi0W50Weh4zQqZ4MJYISldI60NCGIZQ==
X-Received: by 2002:a62:1557:0:b029:20d:6986:627e with SMTP id
 84-20020a6215570000b029020d6986627emr4864618pfv.21.1617836254513; 
 Wed, 07 Apr 2021 15:57:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y8sm6047387pjb.11.2021.04.07.15.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 15:57:34 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] hw/rx/rx-gdbsim: Do not accept invalid memory
 size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210407223056.1870497-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f459d702-a615-fc9a-6dad-3788bdfa77b6@linaro.org>
Date: Wed, 7 Apr 2021 15:57:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407223056.1870497-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 3:30 PM, Philippe Mathieu-Daudé wrote:
> We check the amount of RAM is enough, warn when it is
> not, but if so we neglect to bail out. Fix that by
> adding the missing exit() call.
> 
> Fixes: bda19d7bb56 ("hw/rx: Add RX GDB simulator")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/rx/rx-gdbsim.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

