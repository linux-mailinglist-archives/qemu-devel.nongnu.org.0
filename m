Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A63BDC12
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:19:51 +0200 (CEST)
Received: from localhost ([::1]:50300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oje-0001Yl-Nt
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0oiq-0000RP-PL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:19:00 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:44787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0oip-0001xp-5G
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:19:00 -0400
Received: by mail-ed1-x533.google.com with SMTP id l24so29021566edr.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 10:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nqDKLKNoSkRPXg6EgrkuVqzGLUZxZevHKUZx3bufJHQ=;
 b=lA/MJ/0gc15laPx9G5ehsaQDqFK1WDOnVWqxJFuIKCSTW+JihKYuFPlPQoa2UxsW6s
 lQb37gFTVgmnPaRT3kEoWI/J5Y5D6fRTZmq/pDCbOZdCVShwve9IHYr6hngbSOb/G/0R
 Sb/nbu4pAOxUVAG2kX76Os5cF6ft0K7pgAYOVJF0EwFYaE/AY2NWfm4V5rrAaQdD3Dhw
 KAT615aPOTn0ghQawMfl0ukIUb78UkOlwgV0PF7nNl63pxzRDOm7LYBARdi1WMXH6l3/
 aRg7oBV6TjqkKenr7y3gZPmEbZcEhOsEmUnArvXdNVHlZOpzStmOo3erA0y7zyLKFxSB
 Hh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nqDKLKNoSkRPXg6EgrkuVqzGLUZxZevHKUZx3bufJHQ=;
 b=tjx9ZU6jZ+aNn0ZqKdzMmLbVzKDZ/B6hesW9AOEhfttetxErg1wnon2KgRdCS5wCmM
 fJAWgb/emNgaaRVdKp8lIFR/LOJPr+AroTN00EBmSxFH/BktecSlNuqdl+1DJGj8U7kG
 u0U7IPVqkI/WIfB35wNeyTDHXaemcsDw9EyvN5s1hr0JU6HUuTDdRq5wn98V7v34W40m
 GkxVjndnMOzCnOfIUVDvIK/FwgkXRKGx0EYEaVkaUfDMz7c0nLi+/4y8UOHC5K9YiM6y
 thpgg5JAqSoysiigZ51bJgiUuIrmS9MYr2Z6fVjpjVrU32vkqBO8kLOSdz8KekbnGUQV
 B+LA==
X-Gm-Message-State: AOAM530fqTX+EGHteoRlyCnAgeQ+65xY8/q+a2DsS7WxIAtskJJTwWNb
 caWOcxi0eQr92mHxilY4pTA=
X-Google-Smtp-Source: ABdhPJzYfxI76smzcw6+mdn6J4RLNJDDux9XmsvdMXd4jAKeQyAGwvrXchvD9oM0KlmEs8K/lDqnFQ==
X-Received: by 2002:aa7:c04e:: with SMTP id k14mr23830946edo.157.1625591937606; 
 Tue, 06 Jul 2021 10:18:57 -0700 (PDT)
Received: from [192.168.135.41] ([195.76.183.18])
 by smtp.gmail.com with ESMTPSA id c1sm4397570edt.18.2021.07.06.10.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 10:18:57 -0700 (PDT)
Subject: Re: [PATCH 1/4] dp8393x: don't force 32-bit register access
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 jasowang@redhat.com, laurent@vivier.eu, fthain@linux-m68k.org
References: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
 <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c6b30e8a-59fa-b66a-97ad-4bb3421b542c@amsat.org>
Date: Tue, 6 Jul 2021 19:18:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
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

On 7/5/21 11:49 PM, Mark Cave-Ayland wrote:
> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" set .impl.min_access_size
> and .impl.max_access_size to 4 to try and fix the Linux jazzsonic driver which uses
> 32-bit accesses.
> 
> The problem with forcing the register access to 32-bit in this way is that since the
> dp8393x uses 16-bit registers, a manual endian swap is required for devices on big
> endian machines with 32-bit accesses.
> 
> For both access sizes and machine endians the QEMU memory API can do the right thing
> automatically: all that is needed is to set .impl.min_access_size to 2 to declare that
> the dp8393x implements 16-bit registers.
> 
> Normally .impl.max_access_size should also be set to 2, however that doesn't quite
> work in this case since the register stride is specified using a (dynamic) it_shift
> property which is applied during the MMIO access itself. The effect of this is that
> for a 32-bit access the memory API performs 2 x 16-bit accesses, but the use of
> it_shift within the MMIO access itself causes the register value to be repeated in both
> the top 16-bits and bottom 16-bits. The Linux jazzsonic driver expects the stride to be
> zero-extended up to access size and therefore fails to correctly detect the dp8393x
> device due to the extra data in the top 16-bits.
> 
> The solution here is to remove .impl.max_access_size so that the memory API will
> correctly zero-extend the 16-bit registers to the access size up to and including
> it_shift. Since it_shift is never greater than 2 than this will always do the right
> thing for both 16-bit and 32-bit accesses regardless of the machine endian, allowing
> the manual endian swap code to be removed.

Removing .impl.max_access_size means now it has default, which is 4.
See access_with_adjusted_size:

static MemTxResult access_with_adjusted_size(hwaddr addr,
                                      uint64_t *value,
                                      unsigned size,
                                      unsigned access_size_min,
                                      unsigned access_size_max,
    ...
    if (!access_size_min) {
        access_size_min = 1;
    }
    if (!access_size_max) {
        access_size_max = 4;
    }

called as:

    access_with_adjusted_size(addr, &data, size,
                              mr->ops->impl.min_access_size,
                              mr->ops->impl.max_access_size,
                              memory_region_write_with_attrs_accessor,
                              mr, attrs);

So if you don't mind I'll keep .impl.max_access_size = 4 and update
the comment.

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
> ---
>  hw/net/dp8393x.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 11810c9b60..44a1955015 100644
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
> @@ -691,11 +690,16 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
>      }
>  }
>  
> +/*
> + * Since .impl.max_access_size is effectively controlled by the it_shift
> + * property, leave it unspecified for now to allow the memory API to
> + * correctly zero extend the 16-bit register values to the access size up to and
> + * including it_shift.
> + */
>  static const MemoryRegionOps dp8393x_ops = {
>      .read = dp8393x_read,
>      .write = dp8393x_write,
> -    .impl.min_access_size = 4,
> -    .impl.max_access_size = 4,
> +    .impl.min_access_size = 2,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> 

