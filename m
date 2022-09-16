Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6AB5BA859
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 10:43:45 +0200 (CEST)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ6wq-0001Pu-DN
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 04:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZ6rS-0004T2-RC
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:38:11 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZ6rR-0003B8-0K
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:38:10 -0400
Received: by mail-ed1-x536.google.com with SMTP id z97so30425860ede.8
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 01:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=VFt3o/0MBDd0Kg1Y1Xg4ykohJ21l5oKiyoW/qwAvWww=;
 b=ngUNAWaoeix2uNcoKDwW9oPP1ZTCt+BPcehaz0yxXHbUPsp6D7FfTcNG1ixUW0umcK
 ehHZl8VFboRPIlmu5WvQCmD9NbqX8dr2dxXCmbKmzpRbMq5SK+of9L8MDOTLdUaNksAv
 U/ISKniZFiSnOUma7ieJ404Tkda6nDaFvsr13vKhLKyQbA5d0BPXsPYFv0XjTUHODj5k
 ONPrG73UiaS8lWholYYqJlezUbRYz/Nz42bx7OgrESI95aqe5Q0SovUuRhxxUsKCfAOq
 ZLSWgyXhxpyBMJBS0GucQ6VCjq9stit+dg5pv3iEsNhrs83rKXx2+hyZ/37sUpBG41WX
 g8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VFt3o/0MBDd0Kg1Y1Xg4ykohJ21l5oKiyoW/qwAvWww=;
 b=2puovzDi45eP8O4k+Q7bbf0btFA/JQ5B/zEPz6zwnR4GyMW3u+HNaRMswSSNZmib1o
 fYjGs+soF0GNb8iV6YMpVxvzOGxBQw845GSynLjCDbPBijEUyMvVFqEo+tEy62uUl9QI
 LkxRx+YF7jO5SxzGbfWXnYlzAmFnz7jDl0KOYUv9cYCBV2Fz1xfLb/zrT//5w0vO5567
 ZOkUm7mpz3riWvf40wpGCoQI36sUk0EIlOyuALbstHGBD4a3lgN1txuyMjerm8H1jApN
 yVSZpvVSGt00yAEhnimtqMMAU7HBZRQzHYkkggGpkofVaWYD4chB2Iwl9teSU8wwzaJX
 bFDw==
X-Gm-Message-State: ACrzQf1Hx23V9j4vbsdG5+enAs7uZpQghAr8OM94RZHDH5dpLwhdVAGP
 Zc6HqR/VlePl+Y6pYHuJMSSR0w==
X-Google-Smtp-Source: AMsMyM73iL6JxCazIonxBMOvPQ5TcIxMBrYUQbXmf3X/vhCXPTnuEqCEcNeOnKKnesc4AsbWxwKxuA==
X-Received: by 2002:aa7:c9cf:0:b0:452:e416:644d with SMTP id
 i15-20020aa7c9cf000000b00452e416644dmr3020689edt.163.1663317487470; 
 Fri, 16 Sep 2022 01:38:07 -0700 (PDT)
Received: from [10.9.7.77] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 dk9-20020a0564021d8900b0044ea683d04csm13042119edb.14.2022.09.16.01.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 01:38:06 -0700 (PDT)
Message-ID: <9b3aa9b3-f657-7087-9d4c-06e071f7da4d@linaro.org>
Date: Fri, 16 Sep 2022 10:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 21/30] Deprecate 32 bit big-endian MIPS
Content-Language: en-US
To: Pierre Muller <pierre@freepascal.org>, qemu-devel@nongnu.org
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-22-alex.bennee@linaro.org>
 <8d64e197-7002-79fd-4e97-cc224099f26f@linaro.org>
 <68abfbc9-929b-92bd-071a-11e2dec7adc1@freepascal.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <68abfbc9-929b-92bd-071a-11e2dec7adc1@freepascal.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/22 10:08, Pierre Muller wrote:
> 
>    I am using gcc230 machine for the gcc compile farm.
> 
>    This is a big endian mips64 machine runnig Debian Buster.
> 
> When compiling the qemu 7.1.0 release source,
> the generated binaries are 32-bit mips binaries,
> and I did not find out how to generate a 64-bit versions
> of the executables.

Yes, that host seems to have been installed with the o32 abi instead of the n64 (or n32) abi.

>    As mips32 seems to still be the default arch that gcc uses,
> I don't really understand the idea of depreciating big endian mips32.
> 
> Is this solely related to cross-compilation issues?

Yes.  Even gcc230 is fairly small for actually compiling qemu, it takes many hours.  So 
for many hosts we rely on cross-compilation from x86_64.

For that, we rely on the set of cross-compilers built by Debian 11 (bullseye) plus (!) the 
host libraries for that platform.  We cannot simply rely on crossbuild-essential-mips 
because building qemu requires many more system libraries than just libc.

In https://www.debian.org/releases/bullseye/, you'll note that big-endian mips is not 
listed, so we are now missing those system libraries.

We are not intending to *remove* support for big-endian mips, as 99% of the code paths are 
shared with little-endian mips, which we can continue to test.  But we are now saying that 
big-endian mips is not "supported" and might break.


r~

