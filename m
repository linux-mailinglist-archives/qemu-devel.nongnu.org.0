Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072926AC86C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 17:43:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZDvL-00081R-S2; Mon, 06 Mar 2023 11:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZDv2-0007y6-T0
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:42:39 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZDv0-0006aj-6T
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:42:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso8677644wmb.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 08:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678120952;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s4EZJ7fWZhvw9acDihty55MxGkbAV1MCj25rENm13mM=;
 b=mfOG+QkfA3s6v9zvI26rZGobpCth7Ozt1ypK5XgnUB4pkHj8x0BZqsi13qpaNUN3/H
 7RexV90ejLy29zpBJx0vGt8xAVyL7FGvuFUdUEAizI2mURU1c0OcNbgSZEEJo+p9/kCd
 jFfyeoIE/phMXXzhprrvymxZXrlEnNr3Llc8hRpgDw5Skhv85ELDZEGEaBDPU7DJy34b
 p55wuwEa4fgGncTlanNOY1vLq8kWTYR1cU9gE5D/IFWHaQwKr4NLwofjkdtOgVeq3iJQ
 X/IiKgkejHOCqA6419n8yny8AABJ/cAVTSnphTnEsd2PKgd3IlYLRPcPDq/vrRuAwY+U
 Mpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678120952;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s4EZJ7fWZhvw9acDihty55MxGkbAV1MCj25rENm13mM=;
 b=hYk1pjEt+864T4HpWWhPTSwAaSyelwLJ9i91ItrJ4fKAxSbIQu8AMMUfpLPVXGtOj6
 3pgrhd7bQOpb4APJ7l/5hDFWveWi3T+19iSpraft0ePDGEj7812cHf3NUbUKLcnl00P+
 2hckGUBgQohGWvGeTUz8f7wGHec++lcAba9yiZGXie/VsNLjJNqPW6ycXSMgDPXSJQGH
 jXSRsrKLs2+KAqVP7hPavac29U/taMr/FsQywEfpSPSBEgMBNa0GnIdmqIVHkSW2dHoe
 APjaaM6ugBbytJci7IBrmDbgYd32vitDUlwIMHIPtN0r/MYfkRLnq7SkiRIRGO6FEd+c
 eAyQ==
X-Gm-Message-State: AO0yUKWOkEAPlEPFyXO0SvPt+m7XrR0N941BBGe7lzsXZzRiP8kl6xtZ
 eciuQn4LJnoc3Vl8Sq4N/FQnfQ==
X-Google-Smtp-Source: AK7set+fbHjJsT1zpPRykBp1wtG921i5dkFPnbCS+A74KUO759Muh2j/LdgQm7Es/chaDvDRNjel4w==
X-Received: by 2002:a05:600c:4f0c:b0:3ea:c100:f18d with SMTP id
 l12-20020a05600c4f0c00b003eac100f18dmr10066515wmq.9.1678120952419; 
 Mon, 06 Mar 2023 08:42:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t21-20020a1c7715000000b003e2096da239sm13974921wmi.7.2023.03.06.08.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 08:42:31 -0800 (PST)
Message-ID: <50b4c547-7237-9b4d-2cbe-653a5a403210@linaro.org>
Date: Mon, 6 Mar 2023 17:42:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] hw/mips: Add MIPS virt board
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
 <20230304223803.55764-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230304223803.55764-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/3/23 23:38, Jiaxun Yang wrote:
> MIPS virt board is design to utilize existing VirtIO infrastures
> but also comptitable with MIPS's existing internal simulation tools.
> 
> It includes virtio-pci, virtio-mmio, pcie gpex, flash rom, fw_cfg,
> goldfish-rtc and MIPS CPS system.
> 
> It should be able to cooperate with any MIPS CPU cores.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v1:
>   - Rename to virt board
>   - Convert BIOS flash to ROM
>   - Cleanups
> v2:
>   - Fix fdt flash
>   - Remove UP variant
> ---
>   MAINTAINERS                             |   7 +
>   configs/devices/mips-softmmu/common.mak |   1 +
>   docs/system/target-mips.rst             |  22 +
>   hw/mips/Kconfig                         |  17 +
>   hw/mips/meson.build                     |   1 +
>   hw/mips/virt.c                          | 916 ++++++++++++++++++++++++
>   6 files changed, 964 insertions(+)
>   create mode 100644 hw/mips/virt.c



> diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
> index da3a37e215ec..8a753ec2aee2 100644
> --- a/hw/mips/Kconfig
> +++ b/hw/mips/Kconfig
> @@ -59,5 +59,22 @@ config MIPS_BOSTON
>       select AHCI_ICH9
>       select SERIAL
>   
> +config MIPS_VIRT
> +    bool
> +    imply PCI_DEVICES
> +    imply VIRTIO_VGA
> +    imply TEST_DEVICES
> +    select MIPS_CPS
> +    select MIPS_TRICKBOX
> +    select SERIAL
> +    select FW_CFG_MIPS
> +    select GOLDFISH_RTC
> +    select PCI
> +    select PCI_EXPRESS_GENERIC_BRIDGE
> +    select PFLASH_CFI01
> +    select VIRTIO_MMIO
> +    select FW_CFG_DMA
> +    select PLATFORM_BUS
> +
>   config FW_CFG_MIPS
>       bool
> diff --git a/hw/mips/meson.build b/hw/mips/meson.build
> index 900613fc087f..5670c939fa7b 100644
> --- a/hw/mips/meson.build
> +++ b/hw/mips/meson.build
> @@ -1,6 +1,7 @@
>   mips_ss = ss.source_set()
>   mips_ss.add(files('bootloader.c', 'mips_int.c'))
>   mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
> +mips_ss.add(when: 'CONFIG_MIPS_VIRT', if_true: files('virt.c'))
>   mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
>   mips_ss.add(when: 'CONFIG_MALTA', if_true: files('malta.c'))
>   mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
> diff --git a/hw/mips/virt.c b/hw/mips/virt.c
> new file mode 100644
> index 000000000000..e4359f930104
> --- /dev/null
> +++ b/hw/mips/virt.c
> @@ -0,0 +1,916 @@
> +// SPDX-License-Identifier: LGPL-2.1-or-later

Besides the // comment which is not QEMU style, can we
use GPL-2.0-or-later for files used by final binaries?
IIUC LGPL is for lib-erizable files such (lib)tcg.

> +#include "qom/object.h"
> +#include <libfdt.h>
> +
> +#define TYPE_MIPS_VIRT_MACHINE MACHINE_TYPE_NAME("virt")

So now every variant requires libfdt available on the host,
otherwise building with --target-list=mips-softmmu,mipsel-softmmu
on a host without libfdt:

../../hw/mips/virt.c:47:10: fatal error: 'libfdt.h' file not found
#include <libfdt.h>
          ^~~~~~~~~~

So we can use:
-- >8 --
diff --git a/configs/targets/mips-softmmu.mak 
b/configs/targets/mips-softmmu.mak
index 7787a4d94c..a5c1db82c9 100644
--- a/configs/targets/mips-softmmu.mak
+++ b/configs/targets/mips-softmmu.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=mips
  TARGET_ALIGNED_ONLY=y
  TARGET_BIG_ENDIAN=y
  TARGET_SUPPORTS_MTTCG=y
+TARGET_NEED_FDT=y
diff --git a/configs/targets/mips64-softmmu.mak 
b/configs/targets/mips64-softmmu.mak
index 568d66650c..398e0fc244 100644
--- a/configs/targets/mips64-softmmu.mak
+++ b/configs/targets/mips64-softmmu.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=mips64
  TARGET_BASE_ARCH=mips
  TARGET_ALIGNED_ONLY=y
  TARGET_BIG_ENDIAN=y
+TARGET_NEED_FDT=y
diff --git a/configs/targets/mipsel-softmmu.mak 
b/configs/targets/mipsel-softmmu.mak
index c7c41f4fb7..3ddebca575 100644
--- a/configs/targets/mipsel-softmmu.mak
+++ b/configs/targets/mipsel-softmmu.mak
@@ -1,3 +1,4 @@
  TARGET_ARCH=mips
  TARGET_ALIGNED_ONLY=y
  TARGET_SUPPORTS_MTTCG=y
+TARGET_NEED_FDT=y
---

But if we can't install libfdt (non-root?) then we can't build any MIPS
target.

$ git grep -l TARGET_NEED_FDT configs/targets/*softmmu.mak | wc -l
       18
$ git grep -L TARGET_NEED_FDT configs/targets/*softmmu.mak | wc -l
       13

I guess that's OK...

