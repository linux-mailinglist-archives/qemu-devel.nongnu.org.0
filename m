Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459A43ADA0B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 14:56:47 +0200 (CEST)
Received: from localhost ([::1]:52734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luaWj-0003l0-Gm
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 08:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luaVp-000340-7k
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 08:55:49 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luaVm-0002Hi-Lk
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 08:55:48 -0400
Received: by mail-pj1-x102a.google.com with SMTP id h16so7283121pjv.2
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 05:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7Aup0FEhsiEpWHU4L0/cS+s6HHBLxZPjJ+8LL+A/suE=;
 b=oPc6n5s6+72x29xHUSiiQG/U+m0gNLHGJJ73DHZvKVeQD8RyijsZ7vp+3Vy3aBLHUa
 UmfEoTEHlOgFJyMy8IYpyoGQxrhx/PTc8x9zV9MpaAVesYw+p9VkV3KzpFvj2iyr6pDt
 dvomj8p4gOKNJXvcTyvaYfholKyzcciWMFVmzDLcN+97A3K8wwHc1FHz+a8QS3aDuYe9
 gSAEnOJkWKpchbHNZQ8TAvG+pyyMZvnVZozpiDsYV42Jx4mqtLOrnmxQc6/K0uc1rpvl
 uDw6md8DBsCxXde7CmKjz7wodXdzNZckeg6Wn+1JYz0DEcd+nRgWb86K3LgZBRIe2TSQ
 lC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Aup0FEhsiEpWHU4L0/cS+s6HHBLxZPjJ+8LL+A/suE=;
 b=j0UFSNQibho420urys/8hMjKnjSsKCIwTW0qo1Rzxl+Cp+lrlOqxZ/ZjMx8OYReveY
 KRHDKuqHDyTjpvHOZfcCcJae+cg11BbVnFxGJX23rkNyTs4AlumaoSkk7iUDHolRW5zl
 TQoClF/4aUSqZe9QVcC6bsou3xMjd+ZMeIoIgYRBoPW71t0i88iUk8zUDAYyoQlFhnOX
 jNXDsql2Hb3XKrWGxmRC4V5EA1FUQShQ/k2y6s3tjm9we2ZcH5+VfrCIr2bDEOSCfp0K
 dgcGxqNHCunnIqv85aAOFjCy05Oif1AmEnh3TwA7VeFy3eCdpUmuonCzVndQFnOMuFTB
 iSnQ==
X-Gm-Message-State: AOAM533ZxLGFSNYEjNkW6Ws06AVp7J92PATyw9Zw8+OU+JoSUpqTfdhh
 2KPfDX6tEkeb2qTlZFGlS0dCyg==
X-Google-Smtp-Source: ABdhPJwc08Eq5ANe7lZ/uOLdiEGSSijjiIW5Qani7gc7KKhXSgaSKC/CR2p765PqeJzv5B9ak7JD5Q==
X-Received: by 2002:a17:902:968a:b029:11d:6448:1352 with SMTP id
 n10-20020a170902968ab029011d64481352mr9049665plp.59.1624107345000; 
 Sat, 19 Jun 2021 05:55:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 35sm10115183pjo.16.2021.06.19.05.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 05:55:44 -0700 (PDT)
Subject: Re: [PATCH v2 07/23] linux-user/cris: Implement setup_sigtramp
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-8-richard.henderson@linaro.org>
 <5e279c7c-35d6-038c-78d5-19d84489a314@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <522f9456-307a-e4d0-2006-753c7b795e2e@linaro.org>
Date: Sat, 19 Jun 2021 05:55:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5e279c7c-35d6-038c-78d5-19d84489a314@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 2:33 AM, Philippe Mathieu-Daudé wrote:
> On 6/18/21 9:29 PM, Richard Henderson wrote:
>> Split out setup_sigreturn so that we can continue to
>> initialize the words on the stack, as documented.
>> However, use the off-stack trampoline.
>>
>> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/cris/target_signal.h |  2 ++
>>   linux-user/cris/signal.c        | 29 +++++++++++++++++++++--------
>>   2 files changed, 23 insertions(+), 8 deletions(-)
> 
> Nitpicking, 6 -> 3 * 2? :)

Elsewhere I have used <bytes-per-tramp> * 2 if we have two trampolines, not 
<bytes-per-insn> * <n-insns>.

r~

> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 


