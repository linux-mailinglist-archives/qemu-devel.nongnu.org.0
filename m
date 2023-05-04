Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3D16F71E7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 20:24:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pudav-0000oz-UM; Thu, 04 May 2023 14:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1pudat-0000lB-MM
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:22:19 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1pudas-0000Sq-1H
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:22:19 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-61b79b9f45bso7657256d6.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 11:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=koconnor.net; s=google; t=1683224536; x=1685816536;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iedR82l/diXqUYXzIqNsFXyGKb8H2KZoJSe0sHqDaCc=;
 b=bOa7X/dDUVQ3DbRmzq7qNmV/68JWStO1DqlQg7vOyeWw3rS4PjI4ej2aijFBerRZ+H
 vBR9t/ZtNWeb5BuN2Zr2qrtslfTzPZqfPuwGraw7OFwSg1XrLDqXmsJR9FX44YKjYy9s
 Ce+cvNhMG0mKM2Q+lw3PSN64ImDxxYZwSszpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683224536; x=1685816536;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iedR82l/diXqUYXzIqNsFXyGKb8H2KZoJSe0sHqDaCc=;
 b=RqbyAgxyRCWYvDQkwHjYxZQkoT/JzBhjbMekmE9+JwJBJ2vaM9M26+3GXd341z+edY
 4RfC5QEWlKtepB6nHYtZEEGuXiSZ72iHILlVmFaHusvt0vHuvuGCu3RbD+Q6Mk74hPA3
 zEm085+mPIWcu2zg0JRhByEJ08GZdGMSOY/g5pWD/psn9IH8p/NVmuiyqy+KY5fPq7og
 WeztReSFqw8chfakZ/sI+n31VsCi6FsZSRfhAX4TLDGmUyEv9MQy4B1yjNaI9Mq5CvXK
 kfcujjb6ysBvmKwlvI/mOzNdJojjwmnP6nPx4T+tqn0dlhTvrTSzlnfNUYKqZwIEil+p
 NeZA==
X-Gm-Message-State: AC+VfDwzrXhGzrTON+PH1OfJk3UCnIeBfgxucCAqye85nEVtiJUKutXB
 Ix7i3RAbSDg/YaMll4ALZfxfxw==
X-Google-Smtp-Source: ACHHUZ7saazg+p77UIlZPUq6FhPgP5e2whKVbYTr4Ko06xO21RaqbXWY3m5k4/tGivmx/We+yW+cYw==
X-Received: by 2002:a05:6214:27e3:b0:5ef:4ecf:3cb0 with SMTP id
 jt3-20020a05621427e300b005ef4ecf3cb0mr20872820qvb.25.1683224536678; 
 Thu, 04 May 2023 11:22:16 -0700 (PDT)
Received: from localhost ([64.18.11.72]) by smtp.gmail.com with ESMTPSA id
 z11-20020a0cf24b000000b0061b6d792ec2sm2264123qvl.113.2023.05.04.11.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 11:22:16 -0700 (PDT)
Date: Thu, 4 May 2023 14:22:15 -0400
From: Kevin O'Connor <kevin@koconnor.net>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: seabios@seabios.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/6] detect physical address space size
Message-ID: <ZFP313yzSgcq2uT3@morn>
References: <20230503092058.486893-1-kraxel@redhat.com>
 <20230503092058.486893-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503092058.486893-3-kraxel@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=kevin@koconnor.net; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, May 03, 2023 at 11:20:54AM +0200, Gerd Hoffmann wrote:
> Check for pae and long mode using cpuid.  If present also read the
> physical address bits.  Apply some qemu sanity checks (see below).
> Record results in PhysBits and LongMode variables.  In case we are not
> sure what the address space size is leave the PhysBits variable unset.
> 
> On qemu we have the problem that for historical reasons x86_64
> processors advertise 40 physical address space bits by default, even in
> case the host supports less than that so actually using the whole
> address space will not work.
> 
> Because of that the code applies some extra sanity checks in case we
> find 40 (or less) physical address space bits advertised.  Only
> known-good values (which is 40 for amd processors and 36+39 for intel
> processors) will be accepted as valid.
> 
> Recommendation is to use 'qemu -cpu ${name},host-phys-bits=on' to
> advertise valid physical address space bits to the guest.  Some distro
> builds enable this by default, and most likely the qemu default will
> change in near future too.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  src/fw/paravirt.h |  2 ++
>  src/fw/paravirt.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/src/fw/paravirt.h b/src/fw/paravirt.h
> index 4e2e993ba9d3..7ca3fdcc06d4 100644
> --- a/src/fw/paravirt.h
> +++ b/src/fw/paravirt.h
> @@ -31,6 +31,8 @@ typedef struct QemuCfgDmaAccess {
>  extern u32 RamSize;
>  extern u64 RamSizeOver4G;
>  extern int PlatformRunningOn;
> +extern u8 PhysBits;
> +extern int LongMode;
>  
>  static inline int runningOnQEMU(void) {
>      return CONFIG_QEMU || (
> diff --git a/src/fw/paravirt.c b/src/fw/paravirt.c
> index c880cb10a1bc..a84968661aee 100644
> --- a/src/fw/paravirt.c
> +++ b/src/fw/paravirt.c
> @@ -32,6 +32,10 @@
>  u32 RamSize;
>  // Amount of continuous ram >4Gig
>  u64 RamSizeOver4G;
> +// physical address space bits
> +u8 PhysBits;
> +// 64bit processor
> +int LongMode;

Odd that LongMode is an "int" while PhysBits is a u8..  Would probably
be simpler to do: LongMode = !!(edx & (1 << 29))  - and then treat it as
a flag variable.

Since these variables are exported, it might also be worthwhile to
give them more descriptive names - for example CPUPhysBits and
CPULongMode.

Separately, series looks fine to me.
-Kevin


>  // Type of emulator platform.
>  int PlatformRunningOn VARFSEG;
>  // cfg enabled
> @@ -129,6 +133,58 @@ static void kvmclock_init(void)
>      tsctimer_setfreq(MHz * 1000, "kvmclock");
>  }
>  
> +static void physbits(int qemu_quirk)
> +{
> +    unsigned int max, eax, ebx, ecx, edx;
> +    unsigned int physbits;
> +    char signature[13];
> +    int pae = 0, valid = 0;
> +
> +    cpuid(0, &eax, &ebx, &ecx, &edx);
> +    memcpy(signature + 0, &ebx, 4);
> +    memcpy(signature + 4, &edx, 4);
> +    memcpy(signature + 8, &ecx, 4);
> +    signature[12] = 0;
> +    if (eax >= 1) {
> +        cpuid(1, &eax, &ebx, &ecx, &edx);
> +        pae = (edx & (1 << 6));
> +    }
> +
> +    cpuid(0x80000000, &eax, &ebx, &ecx, &edx);
> +    max = eax;
> +
> +    if (max >= 0x80000001) {
> +        cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
> +        LongMode = (edx & (1 << 29));
> +    }
> +
> +    if (pae && LongMode && max >= 0x80000008) {
> +        cpuid(0x80000008, &eax, &ebx, &ecx, &edx);
> +        physbits = (u8)eax;
> +        if (!qemu_quirk) {
> +            valid = 1;
> +        } else if (physbits >= 41) {
> +            valid = 1;
> +        } else if (strcmp(signature, "GenuineIntel") == 0) {
> +            if ((physbits == 36) || (physbits == 39))
> +                valid = 1;
> +        } else if (strcmp(signature, "AuthenticAMD") == 0) {
> +            if (physbits == 40)
> +                valid = 1;
> +        }
> +    } else {
> +        physbits = pae ? 36 : 32;
> +        valid = 1;
> +    }
> +
> +    dprintf(1, "%s: signature=\"%s\", pae=%s, lm=%s, phys-bits=%d, valid=%s\n",
> +            __func__, signature, pae ? "yes" : "no", LongMode ? "yes" : "no",
> +            physbits, valid ? "yes" : "no");
> +
> +    if (valid)
> +        PhysBits = physbits;
> +}
> +
>  static void qemu_detect(void)
>  {
>      if (!CONFIG_QEMU_HARDWARE)
> @@ -161,6 +217,7 @@ static void qemu_detect(void)
>          dprintf(1, "Running on QEMU (unknown nb: %04x:%04x)\n", v, d);
>          break;
>      }
> +    physbits(1);
>  }
>  
>  static int qemu_early_e820(void);
> -- 
> 2.40.1
> 
> 

