Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858DF43E55C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:44:23 +0200 (CEST)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7Zm-0002W5-KW
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7YP-0001eK-Gr
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:42:57 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7YO-0001yT-1D
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:42:57 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 s10-20020a17090a6e4a00b001a5f4da9892so1104184pjm.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/iKrijP/Dam47Pl/JdkW06cvkbWsVQHH29yiJoGQ1vo=;
 b=EhRs55D9ninLl9rHmrL599jaxIwcAT+kRJvTeHizg3iQAsOVlhzFbs6eZTFMPTQur4
 rCKI1ShOQLBg4S8C2r0HOHuaXPMRMzMf8r2689pTYyxk1wfhzHni7PbUUOp/yB2cfz22
 ltuExdNKH6dsbg+0wniaiHYz2Vb8OxfnkedV+1hO6dK7zu/PdM70jn0XsEFVc7zkAxa8
 qke4hpjfT434L6WDgBPau55tF5I8/ATWAMOGMrmwY0Ld+Ef9/aHik28/MbRdS0GFCMyJ
 8bNh6M5hr9YCDaBSzQleVT5DcoF4+20Ud+FPcoudT0z+sshTIvzhmkKMlA+PqTNljkh4
 KVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/iKrijP/Dam47Pl/JdkW06cvkbWsVQHH29yiJoGQ1vo=;
 b=VrrGILBO3MYNUaA8np3R+LjQGzH+CZn/9N95KVXCsmRk6tADBFlzMa8bgJNQgN9jEc
 qLiXPIDKuD0yikkkuAahY2uJH0lY3tNo/6RozPHZWHWzt7s5htwnhqUJhhy7H9hrLC9c
 tqes7FKY81w3KsPV9R2rh6v7F6xZ5X9kVtgMnEiZOkxhcAaJKZK55WZv5fVpQrJ3g+mF
 k3ohkpNi6o+RnndqSR0u5zpOohsdc9YZIp5xN0EYw1xyjk3bwxLNbBzJdX164lyzHXDG
 EK6S12fnqq3DBEpNnb5f1lVvvrc5SzEKlK9L+rcKML3Z3Yc4a3gLwZ4qiqtqUcVm3sdV
 xJFA==
X-Gm-Message-State: AOAM533zaPyyYcC9DrW2sqPMorDsLcVHo0tAXqe8cq60o8iKL2q2KJl8
 7BbK8OJafKOcpnvR9RldNbqFVg==
X-Google-Smtp-Source: ABdhPJyWJGISn4V82YD5B4XBEx90E4B4njnfLU8z7P8GYWEhb1zq1VrojnR8Nb4m8WFsJQacVhCD6w==
X-Received: by 2002:a17:902:dac5:b0:140:3b56:c7e4 with SMTP id
 q5-20020a170902dac500b001403b56c7e4mr4676558plx.78.1635435774268; 
 Thu, 28 Oct 2021 08:42:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t4sm3925329pfj.166.2021.10.28.08.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:42:53 -0700 (PDT)
Subject: Re: [PATCH 12/24] bsd-user/arm/target_arch_sigtramp.h: Signal
 Trampoline for arm
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-13-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <264949a3-4bc2-e4a1-8a4f-61ee43008c91@linaro.org>
Date: Thu, 28 Oct 2021 08:42:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-13-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> +    /*
> +     * The code has to load r7 manually rather than using
> +     * "ldr r7, =SYS_return to make sure the size of the
> +     * code is correct.
> +     */

This comment was applicable to the original freebsd asm source; it has no bearing on the 
hex instructions below.

> +    uint32_t sigtramp_code[] = {
> +    /* 1 */ 0xE1A0000D,                  /* mov r0, sp */
> +    /* 2 */ 0xE2800000 + sigf_uc,        /* add r0, r0, #SIGF_UC */

I guess this was a bit of thumb1 source that accidentally became ABI?
Otherwise I can't think why you wouldn't squish the mov into the add.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

