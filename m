Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB34363843
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 00:49:33 +0200 (CEST)
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGEO-0001Wu-5M
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 18:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGBS-0000JZ-Ki
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:46:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGBR-0006l3-8g
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:46:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n10-20020a05600c4f8ab0290130f0d3cba3so4184954wmq.1
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z3jPETk6dg3CYPuFsRvjE94yQT2OUiIkkmPpmDY5jkQ=;
 b=KfLOw+PPVrvt4twf9KGl411uxFhwX+6rIDt2JBUa0xFBvKcHripYdX6soSEi653wj+
 WqUSVBMnCnY+RMkLVGZY8XA/IjryLBTpxy0GsUTtKMnFcTJHViBm4UMbI49YOVav90tg
 7nX8JaPn56veEWguZArx3lXFBzEzWE/lf7MsjPs2NiozoqCmusWpGl/cDLqECBkw3F2G
 qYFYP5lYf1DNNV1dZzhyXuMNSv3FCxO8JzYZKTMwzMNUlezp+CrIDtzwN8vq9v/I4qI4
 xjZ/nJUrOSU2t9u4hDYI9Ls1MS2cf9oTlt9CGoHI4uEMYN9UDIEBiQdoave+uVeFKMMS
 lezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z3jPETk6dg3CYPuFsRvjE94yQT2OUiIkkmPpmDY5jkQ=;
 b=GvVwl6ok291ON6BoeF+mPRw/g3R9Ts+wIHHYS0jpQpWbSCEMLcEgCC79AmEz2nAd1S
 bDgxWp4kvvZBhlLvBJnvljeCOAI/Xsw3hWqboM69Jf4GusShlO2uwfjRqbK3Gt1uNcyM
 Uq2TNAnKdgQBTxBIHZkWDxZt8Ro7tsMQS6ig3jx8PTsi1n2Q12vY0PZggzmje70qPZEl
 zIgY+PNGC+9wpm0H+uM4dVjA5BPO1DuTiLWaYF5R/DQzSCnDJdz5Z3VHs+uJeAQB+gum
 SVY5H36uaeMJAa5NjeF6tD8Ef9txjfzxWyG4iJBeQf0qSvNSVXZow0UHypIZIWERgAF6
 o68g==
X-Gm-Message-State: AOAM531/OEFxtheTLB74C08YvkljpYGWiVuAtkXUoms8rULLZFA16FJB
 gIjqZ8jKK/5h5ShDC1VbD5k=
X-Google-Smtp-Source: ABdhPJyZyNEb6s50YV8qoP4bMsLAU0tzwiClGcU6nL0iBPBpvZtNTFaph/Cm3944NKY2tBZRmEG29A==
X-Received: by 2002:a1c:bad7:: with SMTP id k206mr18665632wmf.26.1618785987577; 
 Sun, 18 Apr 2021 15:46:27 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r2sm19928694wrt.79.2021.04.18.15.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 15:46:26 -0700 (PDT)
Subject: Re: [PATCH 06/26] target/mips: Extract load/store helpers to
 ldst_helper.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-7-f4bug@amsat.org>
 <ddf7817e-3476-099c-345d-a094e97c1af3@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b2086af6-2271-1e58-70f9-d41a539d19f4@amsat.org>
Date: Mon, 19 Apr 2021 00:46:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ddf7817e-3476-099c-345d-a094e97c1af3@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:08 PM, Richard Henderson wrote:
> On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
>> +static inline hwaddr do_translate_address(CPUMIPSState *env,
>> +                                          target_ulong address,
>> +                                          MMUAccessType access_type,
>> +                                          uintptr_t retaddr)
>> +{
>> +    hwaddr paddr;
>> +    CPUState *cs = env_cpu(env);
>> +
>> +    paddr = cpu_mips_translate_address(env, address, access_type);
>> +
>> +    if (paddr == -1LL) {
>> +        cpu_loop_exit_restore(cs, retaddr);
>> +    } else {
>> +        return paddr;
>> +    }
>> +}
> 
> Code motion, so,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> but I think that it's a mistake for cpu_mips_translate_address to split
> the raise_mmu_exception from the cpu_loop_exit_restore.  If you make the
> changes to env to indicate the exception, you *must* then go back to the
> main loop.
> 
> There seems to be exactly one caller, this one, so it should be trivial
> to change, which the lets do_translate_address vanish entirely.

I'm taking note of this comment and will try to address it later.

