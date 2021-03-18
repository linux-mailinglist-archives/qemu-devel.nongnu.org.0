Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D15340D89
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:51:36 +0100 (CET)
Received: from localhost ([::1]:53856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxk7-0006hu-LU
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxdZ-0002Zg-0S
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:44:49 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:46648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxdU-0005Zl-Uo
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:44:48 -0400
Received: by mail-oi1-x22e.google.com with SMTP id m13so2010735oiw.13
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S+VSVrp3YsMqmu2uBUuVXa0j96Blp1FfeLNvci+x28Q=;
 b=KrYnltzltxjZhDm9N3UxWMLb2qIGUtTynwwWrIm2b242qKTcuXKx2mEFtJ4kjuQr1J
 xZZWjcdk4vV5MNku1he+cf4r9qvWFfPno9KXFgeTi2alKU+tcaJgK/quFqckDvlJwVLn
 yBhml78d4T9Ozq6NE4A9dG5nyDqf0AIClIjkdV1BjfhKDj4IgcVN02dFK3Z2FQC1dNe7
 DI9yPwRTgMtqZ2T3IfdVT76RWRIaTn+XHICR36E3C5cP5pLAuiq0aYm8bncqACpDEe4m
 Qskkf5QL+7aJnRneyPrJbW+Iq4zi6LIwmuiAu+ilCzBnPpIolJL3NMyu4PHEBIm/m714
 vbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S+VSVrp3YsMqmu2uBUuVXa0j96Blp1FfeLNvci+x28Q=;
 b=f3SdfKCdwFSUtgBkJddIOKsJbaSH0e4QuCTljj2/JNTFefv7OMslyl2nPJejLMKFiT
 4v8QjrXy1LV+b3n9kxzwlffcaP29hWzEyockXc9sqge/pf/Cco4BwAfGpRXxCMZKSJqh
 PFaCgyDndKaHx4kwX/WX3qcx5hw9Ep+9tZH3zORpBG/Ix953aUmBsmNueo/xZR1k8Qix
 DOVWUcaIh3+OtXtWuerQQFeGFzo3H9BYGkGULABNHa6/S7t7b+lp19ePCOKwCUzw1TlW
 NDP3QGC+aJkmeHY7RfofbaK4S1/lR5fTS8ZKeHQ0KOXcvv9ai3THFrP/zoq63198zqG7
 pFpA==
X-Gm-Message-State: AOAM532XbeJmWY7VjV0NAaTyRQW3DQUrrveLvUcq4WeDRnK9G99oiNqq
 GtepfHQEsOs79PZRZr4F+QpFcA==
X-Google-Smtp-Source: ABdhPJytBioxqdHpF/XPYmvccqRcvtsQra7nqaRERIQoEqeO+y4/ZVAOt0uTtSgeIQpCGRxVhEipeQ==
X-Received: by 2002:aca:1e16:: with SMTP id m22mr4013601oic.153.1616093083910; 
 Thu, 18 Mar 2021 11:44:43 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 64sm708006oob.12.2021.03.18.11.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 11:44:43 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 5/5] target/arm: Make M-profile VTOR loads on
 reset handle memory aliasing
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e9f44dba-bfc5-41b2-e60e-6101e96c8f63@linaro.org>
Date: Thu, 18 Mar 2021 12:44:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318174823.18066-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:48 AM, Peter Maydell wrote:
> For Arm M-profile CPUs, on reset the CPU must load its initial PC and
> SP from a vector table in guest memory.  Because we can't guarantee
> reset ordering, we have to handle the possibility that the ROM blob
> loader's reset function has not yet run when the CPU resets, in which
> case the data in an ELF file specified by the user won't be in guest
> memory to be read yet.
> 
> We work around the reset ordering problem by checking whether the ROM
> blob loader has any data for the address where the vector table is,
> using rom_ptr().  Unfortunately this does not handle the possibility
> of memory aliasing.  For many M-profile boards, memory can be
> accessed via multiple possible physical addresses; if the board has
> the vector table at address X but the user's ELF file loads data via
> a different address Y which is an alias to the same underlying guest
> RAM then rom_ptr() will not find it.
> 
> Use the new rom_ptr_for_as() function, which deals with memory
> aliasing when locating a relevant ROM blob.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


