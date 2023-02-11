Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C99E6932DC
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 18:33:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQtjz-0002yT-0Z; Sat, 11 Feb 2023 12:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtjx-0002y0-B2
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:32:45 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtjv-0001Ib-MF
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:32:45 -0500
Received: by mail-pg1-x52e.google.com with SMTP id n2so5741910pgb.2
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 09:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cPrOjhz1p611cZnImhnqTCQ9Gr5n3wFl9/NSgcSlHyI=;
 b=rbpanmPIzy91sXYarSh7fUV8WDcGcI0J685cOctcnlX/6sNjJAGOcCTSFldQd74Eal
 KrmUw7HgPEMw/30T78IKHEfov2fTnx6PqfiXifPuzYFdOd2MDOeso7lXIUbeMOzngPrN
 nUFSr9StRSv4HAaBfYeIZbu6V7I0Oo948dmiwAjR+Zp3zFWFjRw0s+OTCysdWAP/BIN5
 pyxjDmSZAXjX0V17Vs025X/gLp5N8VtXLKSRP2oihrYvaKzWOPv6M1BAWvPh1TpjEHIN
 3TpLeeQ+727hrXM+pXaXEfhK9PQutbb/yY6zkKPTHdsSBJ5B2J3yRhUB4VaVc/28EE6k
 ilmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cPrOjhz1p611cZnImhnqTCQ9Gr5n3wFl9/NSgcSlHyI=;
 b=RIO5bwVocqv60Y+UMXQa3zxRJTns1ptWpYFPjToEJQ2UKJVnE4RB9kVm1ePuT5g5+R
 SmBV1XUw4myokMtmMrhLUrjKKSCAL5gBSml2zDfw9HN/KmH19XeVDY8Ae9n79LpQxoZE
 1McJbqU3eFSi3D0lM63Lt2p87iOhGBFXNFo0QutqNX439n/QQrB0m5LNeqAGcBttt0He
 oshl/YxslNu3d1jaKpmjkfAXasqNKpt1hGJT8x+q8jfXw8kwL0xmE4ornzJB2uPvg75L
 7SIw0iYxAXnW7aZI9vuMoDFWS17yw3If3ktayq6hDf2wdjk/LgwkxF74ZaLKGbgHxg4u
 1swQ==
X-Gm-Message-State: AO0yUKVX1CgjAZs3cgxewb8VzVkcUkmP8X8JWma/epRBnWAHYnbClccW
 FcO3VIBDf2QD1J3DyUKeTMM4nA==
X-Google-Smtp-Source: AK7set9t0Ta8ypw95Nn/WR3gd25G6XERJVlJoWQAjld4zs7mhENHXrDivxi7t5RHwloNVhPDtDmYzg==
X-Received: by 2002:a05:6a00:148e:b0:594:1f1c:3d3a with SMTP id
 v14-20020a056a00148e00b005941f1c3d3amr14517844pfu.15.1676136761366; 
 Sat, 11 Feb 2023 09:32:41 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 q22-20020a62ae16000000b005a8aab9ae7esm91981pff.216.2023.02.11.09.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 09:32:40 -0800 (PST)
Message-ID: <d8c87d99-b825-6e3f-b80a-86109fd27e8f@linaro.org>
Date: Sat, 11 Feb 2023 07:32:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/11] hw/isa: Reorder to separate ISABus* vs ISADevice*
 functions
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-ppc@nongnu.org
References: <20230210163744.32182-1-philmd@linaro.org>
 <20230210163744.32182-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163744.32182-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/10/23 06:37, Philippe Mathieu-Daudé wrote:
> Separate functions taking an ISABus* argument versus
> functions taking a ISADevice* one.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/isa/isa.h | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

