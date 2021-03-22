Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2F2345168
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 22:10:04 +0100 (CET)
Received: from localhost ([::1]:51994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lORoI-0002SK-Qy
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 17:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lORlE-0008NS-2Z
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:06:52 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:36715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lORlC-0001J5-1S
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:06:51 -0400
Received: by mail-qk1-x736.google.com with SMTP id c4so12179471qkg.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZpVVQ4Ie0TykcrQv6GwiXOFMv8aqoj9bAsg/Fwuq3uc=;
 b=PJt7tBRD6Lt4z1+LRxTP58iDVXWZWKgvS5c8TypO8mrBteg+bazOlXUmJxjZKB+XKC
 8WduRawFsRYPtVkniTSkmb31yl8LWVHnPuG9PHzbzaQqCEktxEcO1tfdJcYrJq57BiHK
 51FNVzpAmQ68n56sHORdWGq8DWZ13NXDYXmtqdd+rgofpFRn47fektWYm8zE77Wc9+9k
 xAh9Pp83nSQOHaqUA1440XNEsZxoCBqVtrgiUxOyEDUvA/SGZXCl+PbHgzQ6UeJGcn4b
 1kY+5rowGlDZQWiqvBSlV/RH0Hr099eeM6El07hc0IPrUUSGRK4c/lgdMNp4m+uU2xKo
 zr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZpVVQ4Ie0TykcrQv6GwiXOFMv8aqoj9bAsg/Fwuq3uc=;
 b=Zhn0rpPUV00/ojNqj0P9D+fOyTzk1+eCJQ/DtkqEnmzOB+2jN41X6S1m4uJLxTSiKi
 HAtKx5JCzzr2XvjpBVu7XJwm/a18Gg4HeWguFlErPOrKzeqb2XnSq9rhJxq19fs1JDAK
 xYoxw7rfU8PA+owTIdadSyjPs0kBy50Zq454sudt7ZbxBcNyZZxO3SoUy9tj3m6R7K3l
 oXUHOmUL7l37w9x0+70CYq4V+i6WoHk094wFx6N2mtVkN2rEHzOnqFiTJSKhxnKLR/tf
 LEnp800sBCoXpPZRvBUCu0SvTzHHSEbKtUrNx97wciqgYKOwFjOqBcA2CpDX+oa4OSVm
 oQhg==
X-Gm-Message-State: AOAM531lvOGWSS+I01h3NBLtAYCOYcbgRDDsntTwKCQXRNbmq02n4S/k
 MZXtbPpzj5p6KJYtl+2h8iiespFRbKbGDLRR
X-Google-Smtp-Source: ABdhPJxweg94MG1L9t3xFMr07wSEF9hvr0udtzXBygSZqcoCkPHi+2d62QsOxGfErVCIdezq4pOkhw==
X-Received: by 2002:ae9:d60a:: with SMTP id r10mr2040143qkk.411.1616447208840; 
 Mon, 22 Mar 2021 14:06:48 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j30sm9887407qtv.90.2021.03.22.14.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 14:06:48 -0700 (PDT)
Subject: Re: [PATCH] i386/cpu_dump: support AVX512 ZMM regs dump
To: Robert Hoo <robert.hu@linux.intel.com>, pbonzini@redhat.com,
 ehabkost@redhat.com
References: <1616410796-43167-1-git-send-email-robert.hu@linux.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6afd2662-d9eb-35c1-4401-6e699c8f861e@linaro.org>
Date: Mon, 22 Mar 2021 15:06:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616410796-43167-1-git-send-email-robert.hu@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 4:59 AM, Robert Hoo wrote:
> Since commit fa4518741e (target-i386: Rename struct XMMReg to ZMMReg),
> CPUX86State.xmm_regs[] has already been extended to 512bit to support
> AVX512.
> Also, other qemu level supports for AVX512 registers are there for
> years.
> But in x86_cpu_dump_state(), still only dump XMM registers.
> This patch is just to complement this part, let it dump ZMM of 512bits.

I think you should examine the state of the cpu to determine what of SSE, AVX 
or AVX512 is currently enabled, then dump that.

> -        if (env->hflags & HF_CS64_MASK)
> -            nb = 16;
> -        else
> -            nb = 8;
> -        for(i=0;i<nb;i++) {
> -            qemu_fprintf(f, "XMM%02d=%08x%08x%08x%08x",
> +
> +        nb = sizeof(env->xmm_regs) / sizeof(env->xmm_regs[0]);

E.g., you're dumping all of the registers in 32-bit mode, which is restricted 
to 8 registers, not 32.


r~

