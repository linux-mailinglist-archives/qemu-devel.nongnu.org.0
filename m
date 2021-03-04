Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670B532DAE8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:14:06 +0100 (CET)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuMH-0005oo-Ew
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuKL-0004Wj-DF
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:12:05 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuKJ-0003Rw-U6
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:12:05 -0500
Received: by mail-pf1-x42d.google.com with SMTP id m6so19770650pfk.1
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kPQek6afpmDhNb/TsGn1pK9ziyVCBlYson013SRiO5U=;
 b=GTCaxAs54g2wauvPSXXTHFdq3Aqt11QXv6aahG/7NTrW4x1U1KcOP0Ws8ifEmXSiOJ
 /K0nO2TNk9EQqfgAm3BGrdQv9GL3+aVYopLujvmJ4HwR+0wMlxan4w5rLPsDEAafiiMk
 tZvR1+0dwtAwBUxdDfl/hCN79k15VbsPnKjVt4uBKdfygBmYFP3+3hVAr2vVTe6jQ4zO
 KqBHTqeVXREFalBj7vA+dwsqz/ouw+a3soTV9BcVWXK9EU4XzlMv4HSr5vQA27yz1dpe
 WjO9lHVHI+txRPldZca2j9bW+vfKHfKSv2LPGmQCSdB7ZJIPLlwJeZYMLPmwqo6O9vlb
 HVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kPQek6afpmDhNb/TsGn1pK9ziyVCBlYson013SRiO5U=;
 b=THwLe10tdvGvlvsTfcYejZmXfSeNwPLgSlVbavkhIaI5S5VuaPkXiVhGrhRQFYuk8Q
 50S+r+wTXauxgWZ172OaQiXH9BCUDSxk2ZWaz+i4I9qlIb+2+o6DQgzZlgx+SWGv/EYE
 J+vLQaNDyKyh5WJq8T25KB8oyso7sY+gd6gyRSGF4dNywlGLIpEOGRGnb1TXpTPNXWjw
 AEbcR1iGA776+Jv5S4G/+TVUOSkXM+MLck2UtbiFcYsGHSmsJA3p2RbhDd5T1Fmnl0Oy
 aFfhg1ObijYQuydg1l1ueJwxRbSHiLBizsj/r+/RJxhZBPNr4a4Na/Gwuihi4TBFCuSZ
 S3hA==
X-Gm-Message-State: AOAM530AV73Lp5nIedREY/2SHKMSwRP+qHNrd5hoh8wexHevijNb7CtI
 L8dtyIm33UNqj+vF7uEjkZl17OLj75+AaQ==
X-Google-Smtp-Source: ABdhPJzGsJO/hAeAbAdTNdA4b2iheD0SYP1MHRTx2iljRjo9HCpk2aqWNbaczDrTry3FbBCckwf9+g==
X-Received: by 2002:a62:88c4:0:b029:1ee:4e39:dccc with SMTP id
 l187-20020a6288c40000b02901ee4e39dcccmr5478924pfd.59.1614888722737; 
 Thu, 04 Mar 2021 12:12:02 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id v15sm230159pgl.44.2021.03.04.12.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:12:02 -0800 (PST)
Subject: Re: [PATCH 24/44] hw/arm/armsse: Move dual-timer device into
 data-driven framework
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <35a0c75b-2855-7d53-cd1e-ea03e8153b73@linaro.org>
Date: Thu, 4 Mar 2021 12:12:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:45 AM, Peter Maydell wrote:
> Move the CMSDK dualtimer device handling into the data-driven
> device placement framework.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

