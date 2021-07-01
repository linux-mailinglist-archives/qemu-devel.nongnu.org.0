Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADBB3B983D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:36:08 +0200 (CEST)
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4Lv-0000ET-4U
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4K0-0006v8-PN
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:34:08 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz4Jz-0000lU-5l
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:34:08 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p8so9989258wrr.1
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 14:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kPHkAy9s+8IpwFuCYZoROmhOlZQDAF32qgjXoE6YQis=;
 b=qyAi2qUaHP2k9DVLgL28lz58Loo4c1vs1rzoHu3RBH01Vqi5MGdeotAVg4KQ001nLj
 Khl0MtXR/wsgTtLW4+8ps4Uoa2whTrhEjIsJEq2zJYsUB62J+VC+lPTWhj2Kbb8qgiEn
 lfa8OuL64b0/LKPu1mOQ/xboIjWcxz3pagJISoTt1EVKq29gJiBBxZawwc7ABjjVZbDw
 ZtzRXFI0sq7RJ5sjZKHdV677qFKeCuxEDn2XZMCIdVk6UyRsTtXG6Xrc0kEIMUksjxXK
 LKyCl8DzRWXhHHwgyHGY2K1TXvbHKvDulTvmTTa9qCI/TX6WVHhDkEZctd7p5++QyrH0
 +lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kPHkAy9s+8IpwFuCYZoROmhOlZQDAF32qgjXoE6YQis=;
 b=J4hxV7OLlzxy/fSnfk2ae4AIqkirqC25Mg/97AFY/eOGY+L2u9aRV8LAvoIMQYR2XK
 OfAFyPqzIo1FQ1s0kaQqprouhrtvWZyEq+7gWWIPirnTuLQ5++RH5I/OWb2Rin84kZDD
 85NHGsU5Hw4zRnLZhKRhw6erVR43to3qRpQiQDQFfnqNdAi5dFa664yqvCwN/NEjgc+B
 EI5UkzX0DFYOVhrJKYvLrNVMBfjZxeAZLrO3uWtOnvqRH/73ddDxEBKtUCUGaPmR1ccL
 ekivF+UOan9pbceZBveW1DZi3N5zMNCLRbwUpa825k7+agMhJjkirn4SfFSkbUxSTFPj
 6ITg==
X-Gm-Message-State: AOAM532FmBtbrvc/5ZMyILC6eX1r3yWl0Rj+lGHmEo1UAeUodMG76gxI
 dd4KkcTfffsHbxhlfqrX1kY=
X-Google-Smtp-Source: ABdhPJze05ii9Dca1MfKa9WmmncrJkqBcx1ZZ8j/vEsEhzvOvLyJgUkdtvEKujrlB2wak+r0yI44eQ==
X-Received: by 2002:adf:f882:: with SMTP id u2mr1850481wrp.319.1625175245505; 
 Thu, 01 Jul 2021 14:34:05 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id l1sm5765491wme.11.2021.07.01.14.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:34:04 -0700 (PDT)
Subject: Re: [PATCH v2 08/10] dp8393x: don't force 32-bit register access
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-9-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a6fae6a6-4fbd-a75c-96b5-403ba3658217@amsat.org>
Date: Thu, 1 Jul 2021 23:34:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 8:53 AM, Mark Cave-Ayland wrote:
> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that all accesses
> to the registers were 32-bit but this is actually not the case. The access size is
> determined by the CPU instruction used and not the number of physical address lines.
> 
> The big_endian workaround applied to the register read/writes was actually caused
> by forcing the access size to 32-bit when the guest OS was using a 16-bit access.
> Since the registers are 16-bit then we can simply set .impl.min_access to 2 and
> then the memory API will automatically do the right thing for both 16-bit accesses
> used by Linux and 32-bit accesses used by the MacOS toolbox ROM.

Hmm I'm not sure. This sounds to me like the "QEMU doesn't model
busses so we end using kludge to hide bugs" pattern. Can you
provide a QTest (ideally) or a "-trace memory_region_ops_\*" log
of your firmware accessing the dp8393x please?

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
> ---
>  hw/net/dp8393x.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 252c0a2664..6789bcd3af 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -602,15 +602,14 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
>  
>      trace_dp8393x_read(reg, reg_names[reg], val, size);
>  
> -    return s->big_endian ? val << 16 : val;
> +    return val;
>  }
>  
> -static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
> +static void dp8393x_write(void *opaque, hwaddr addr, uint64_t val,
>                            unsigned int size)
>  {
>      dp8393xState *s = opaque;
>      int reg = addr >> s->it_shift;
> -    uint32_t val = s->big_endian ? data >> 16 : data;
>  
>      trace_dp8393x_write(reg, reg_names[reg], val, size);
>  
> @@ -694,7 +693,7 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
>  static const MemoryRegionOps dp8393x_ops = {
>      .read = dp8393x_read,
>      .write = dp8393x_write,
> -    .impl.min_access_size = 4,
> +    .impl.min_access_size = 2,
>      .impl.max_access_size = 4,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
> 

