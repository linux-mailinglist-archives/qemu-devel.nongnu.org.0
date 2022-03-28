Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C714D4EA3DC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 01:44:23 +0200 (CEST)
Received: from localhost ([::1]:46476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYz26-0004wO-32
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 19:44:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYyxb-00045h-EN
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 19:39:45 -0400
Received: from [2607:f8b0:4864:20::102c] (port=55938
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYyxY-0007GY-GU
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 19:39:42 -0400
Received: by mail-pj1-x102c.google.com with SMTP id jx9so15720531pjb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 16:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XqcDiMnOA9m+P9+2aeRCB6HhGp2WcuqSe1BUdOwAUUY=;
 b=T7QS6iaXOlCKh52K3diFXYxN8L2gUdjUue0+Dy1AVp/3NisD0p8niib3rsellWwq74
 LLy6PVMs6EEp29hOrrpEMRoy3V8EGMmD0WrOSkVGdeco0ob/DRnQQzfNsI845jBto4g8
 7MFi8F3mNoPsGotjQecyfcKdZll4Vh3nciRsFqBy46U0+x6l0znU20lD2tl2c0luoL09
 0+NqUlf65Yj4Logt/g8ih5M83Cj2/Hj+d0Ofp5bigVfmP8x4yRiWcZUCget5G6GzMF4t
 yzXxUAXGgHs98DeZgEjeiXbz4Deov+Of6YCsxU8tjFrOkAV/DO0Ei/pHqd5bjFP43kSg
 zw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XqcDiMnOA9m+P9+2aeRCB6HhGp2WcuqSe1BUdOwAUUY=;
 b=1o5BnBvWRrchf3InjFVzo2lrNEf2WKiru5JeWQv2nDhcehw5Hs5WVrDSP8FRIlFPil
 Hquc/4toMXjMEnW2F4tqLmWcMUwrE4pDavMCx33GSEO36kGzz1yeqd+YDxHUozRxkC6p
 oRsG22COQlmChHsVYEvT2fNxfspRjydM4w+aKBVxpYpDb42muI4MzCg5uif2ss0lKS6o
 Y2WjkYOOBLwIK3Eo1nWvNxjcw5ZNFKYjhHQOQiEXykF8B5aqC74mQ7IZ8w+fGjPnUb12
 dNTEUmza3HZayNwDTzl/S51F8tDMz1/3fl2oRsQYMpUWDbjHiEbSfR3rSexhOhbOLdC8
 D7Tg==
X-Gm-Message-State: AOAM533CT87+wYpvk636PGpO5cyOPezzBhlNkM6bkiMoivKyVClTiPbq
 7rus8b/+RSx+VVEkjT6qtYw=
X-Google-Smtp-Source: ABdhPJwV+P+roSaegY8ZJ3baKDF9DHbzRXea9WyFwh2WA24RyCwL8ZcU96rb604dLYL+3pMCu/LZHA==
X-Received: by 2002:a17:90b:1a8b:b0:1c7:386b:4811 with SMTP id
 ng11-20020a17090b1a8b00b001c7386b4811mr1593000pjb.4.1648510778702; 
 Mon, 28 Mar 2022 16:39:38 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 w61-20020a17090a6bc300b001c7ca8a1467sm551305pjj.46.2022.03.28.16.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 16:39:38 -0700 (PDT)
Message-ID: <e3a30b1a-69ab-9e69-4722-c8aa056a8c97@gmail.com>
Date: Tue, 29 Mar 2022 01:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0 v5] qemu-binfmt-conf.sh: mips: allow nonzero
 EI_ABIVERSION, distinguish o32 and n32
Content-Language: en-US
To: =?UTF-8?Q?Andreas_K=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20220328204900.3914990-1-dilfridge@gentoo.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220328204900.3914990-1-dilfridge@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Alex Bennee <alex.bennee@linaro.org>, WANG Xuerui <xen0n@gentoo.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/3/22 22:49, Andreas K. Hüttel wrote:
> With the command line flag -mplt and a recent toolchain, ELF binaries
> generated by gcc can obtain EI_ABIVERSION=1, which makes, e.g., gcc
> three-stage bootstrap in a mips-unknown-linux-gnu qemu-user chroot
> fail since the binfmt-misc magic does not match anymore. Also other
> values are technically possible. qemu executes these binaries just
> fine, so relax the mask for the EI_ABIVERSION byte at offset 0x08.
> 
> In addition, extend magic string to distinguish mips o32 and n32 ABI.
> This information is given by the EF_MIPS_ABI2 (0x20) bit in the
> e_flags field of the ELF header (a 4-byte value at offset 0x24 for
> the here applicable ELFCLASS32).
> 
> See-also: ace3d65459
> Signed-off-by: Andreas K. Hüttel <dilfridge@gentoo.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: WANG Xuerui <xen0n@gentoo.org>

v5 changes are too different from v4 to keep these R-b tags IMO.

LGTM but I'd like Xuerui to double-check the R-b stands,
and an Acked-by from Laurent would make me feel safer ;)

> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: WANG Xuerui <xen0n@gentoo.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Alex Bennee <alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/843
> ---
> 
> v5: Fully relax mask for EI_ABIVERSION for all of mips; squash patches
>      since they touch the same lines
> v4: Unchanged repost of v3
> v3: Add the magic extension to distinguish n32 and o32
> v2: Add the same EI_ABIVERSION fix for little endian as for big endian
> v1: Initial version, only handling EI_ABIVERSION=1 on BE
> 
>   scripts/qemu-binfmt-conf.sh | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index e9bfeb94d3..9cb723f443 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -60,28 +60,28 @@ m68k_family=m68k
>   
>   # FIXME: We could use the other endianness on a MIPS host.
>   
> -mips_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
> -mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
> +mips_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
> +mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
>   mips_family=mips
>   
> -mipsel_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
> -mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> +mipsel_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
> +mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
>   mipsel_family=mips
>   
> -mipsn32_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
> -mipsn32_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
> +mipsn32_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
> +mipsn32_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
>   mipsn32_family=mips
>   
> -mipsn32el_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
> -mipsn32el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> +mipsn32el_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
> +mipsn32el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
>   mipsn32el_family=mips
>   
>   mips64_magic='\x7fELF\x02\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
> -mips64_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
> +mips64_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
>   mips64_family=mips
>   
>   mips64el_magic='\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
> -mips64el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> +mips64el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\x00\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
>   mips64el_family=mips
>   
>   sh4_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x2a\x00'


