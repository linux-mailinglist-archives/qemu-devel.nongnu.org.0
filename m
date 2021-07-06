Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B03BCB02
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:54:06 +0200 (CEST)
Received: from localhost ([::1]:37712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iiL-000565-8s
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0igr-0003l8-KH
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:52:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0igl-0005jk-PV
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625568746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xsY4Lrx1XIHsa7qj123GT/datXg1dpoTUyc9Bhf6qQ=;
 b=WQxfNc8LsXs4WspofK2mdzhEMkmRP8nBCUEIGB9hcxLNdLmnZw1zb38t0tW98yXAsT1cXl
 XirhwpAdc6duQkXJxepwnf3I4FTr066GgHKVYz2cp5FS6f81/EqcgYGPFR8chdwzXQ9U87
 10feQmU7xYIrimKaF+PRxQHve+VUR7s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-EUmh8jo3OVSA3EdK677HHA-1; Tue, 06 Jul 2021 06:52:24 -0400
X-MC-Unique: EUmh8jo3OVSA3EdK677HHA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f16-20020a1c6a100000b0290210c73f067aso409724wmc.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+xsY4Lrx1XIHsa7qj123GT/datXg1dpoTUyc9Bhf6qQ=;
 b=J+QNmq8Qco6crbnYE6D+fuPa4hkQhqV/14mXZhdfgZO092xA/3kdAieizX6G7Pbxne
 b03KpxtU90mgFNQCKCDLafW/4k55QaDXF5RN7vsvFmR/kRaO32vRkI0tMi/MbeUZywUB
 1afXS1i9pV09UMZfdwhW9Vs9DhPwh4yb1mwJ+i3GX3eYZFSDm7x/2yQTw0OCRizqqIjt
 pY2NYe2fgD1xU3q60prg1NbAsZa0fVIYBdZRbnEcf2HA0A2e4xNkxD1LgAWDvMASO+LC
 ipD36NER/nPG3682CIwMg8QYiSsclxYWCXD/OkgA49d4AZZ7QK6/37UGK4ZEiGiZtMpf
 LVZA==
X-Gm-Message-State: AOAM532j/NBtFIHzO090TzXe1t8DigT1gjAmdT0hzWTzUcuV3wkjBwVG
 63d/liVWlv1RaMtegemOz0jvo6DklbNo0WRf6D6igXTq6S66+74y9Q6tEaoil1VxUhLxv+f3NOw
 ISlpTIiv1X3hIxec=
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr20189682wmi.32.1625568743155; 
 Tue, 06 Jul 2021 03:52:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXw5+0srefVUM97YsAC+k707u39frUzbAhX3bSTZ/YeBPOxduBT3oL5TsXMgH4G/zj6bKcng==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr20189631wmi.32.1625568742878; 
 Tue, 06 Jul 2021 03:52:22 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e24.dip0.t-ipconnect.de. [217.87.94.36])
 by smtp.gmail.com with ESMTPSA id w8sm17521441wrt.83.2021.07.06.03.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 03:52:22 -0700 (PDT)
Subject: Re: [PATCH v1 1/5] meson: Introduce target-specific Kconfig
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c3d33a80-b3bb-5aa5-50c7-7c1a379814ba@redhat.com>
Date: Tue, 6 Jul 2021 12:52:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621152120.4465-2-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, pbonzini@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/06/2021 17.21, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Add a target-specific Kconfig. We need the definitions in Kconfig so
> the minikconf tool can verify they exit. However CONFIG_FOO is only

s/exit/exist/ ?

> enabled for target foo via the meson.build rules.
> 
> Two architecture have a particularity, ARM and MIPS:
> their 64-bit version include the 32-bit subset.

Why do you mention these here, but not x86, Sparc, PPC and RISC-V which also 
have 32-bit and 64-bit variants?

The patch itself looks fine to me, so once you've clarified the commit message:

Reviewed-by: Thomas Huth <thuth@redhat.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> vajb:
>    - removed targets that no longer exist
>    - reword commit message to show why we need the Kconfigs
> ---
>   meson.build               |  3 ++-
>   Kconfig                   |  1 +
>   target/Kconfig            | 19 +++++++++++++++++++
>   target/alpha/Kconfig      |  2 ++
>   target/arm/Kconfig        |  6 ++++++
>   target/avr/Kconfig        |  2 ++
>   target/cris/Kconfig       |  2 ++
>   target/hppa/Kconfig       |  2 ++
>   target/i386/Kconfig       |  5 +++++
>   target/m68k/Kconfig       |  2 ++
>   target/microblaze/Kconfig |  2 ++
>   target/mips/Kconfig       |  6 ++++++
>   target/nios2/Kconfig      |  2 ++
>   target/openrisc/Kconfig   |  2 ++
>   target/ppc/Kconfig        |  5 +++++
>   target/riscv/Kconfig      |  5 +++++
>   target/rx/Kconfig         |  2 ++
>   target/s390x/Kconfig      |  2 ++
>   target/sh4/Kconfig        |  2 ++
>   target/sparc/Kconfig      |  5 +++++
>   target/tricore/Kconfig    |  2 ++
>   target/xtensa/Kconfig     |  2 ++
>   22 files changed, 80 insertions(+), 1 deletion(-)
>   create mode 100644 target/Kconfig
>   create mode 100644 target/alpha/Kconfig
>   create mode 100644 target/arm/Kconfig
>   create mode 100644 target/avr/Kconfig
>   create mode 100644 target/cris/Kconfig
>   create mode 100644 target/hppa/Kconfig
>   create mode 100644 target/i386/Kconfig
>   create mode 100644 target/m68k/Kconfig
>   create mode 100644 target/microblaze/Kconfig
>   create mode 100644 target/mips/Kconfig
>   create mode 100644 target/nios2/Kconfig
>   create mode 100644 target/openrisc/Kconfig
>   create mode 100644 target/ppc/Kconfig
>   create mode 100644 target/riscv/Kconfig
>   create mode 100644 target/rx/Kconfig
>   create mode 100644 target/s390x/Kconfig
>   create mode 100644 target/sh4/Kconfig
>   create mode 100644 target/sparc/Kconfig
>   create mode 100644 target/tricore/Kconfig
>   create mode 100644 target/xtensa/Kconfig
> 
> diff --git a/meson.build b/meson.build
> index d8a92666fb..3ddd22ab7a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1377,7 +1377,8 @@ foreach target : target_dirs
>         command: [minikconf,
>                   get_option('default_devices') ? '--defconfig' : '--allnoconfig',
>                   config_devices_mak, '@DEPFILE@', '@INPUT@',
> -                host_kconfig, accel_kconfig])
> +                host_kconfig, accel_kconfig,
> +                'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=y'])
>   
>       config_devices_data = configuration_data()
>       config_devices = keyval.load(config_devices_mak)
> diff --git a/Kconfig b/Kconfig
> index d52ebd839b..fb6a24a2de 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -1,5 +1,6 @@
>   source Kconfig.host
>   source backends/Kconfig
>   source accel/Kconfig
> +source target/Kconfig
>   source hw/Kconfig
>   source semihosting/Kconfig
> diff --git a/target/Kconfig b/target/Kconfig
> new file mode 100644
> index 0000000000..ae7f24fc66
> --- /dev/null
> +++ b/target/Kconfig
> @@ -0,0 +1,19 @@
> +source alpha/Kconfig
> +source arm/Kconfig
> +source avr/Kconfig
> +source cris/Kconfig
> +source hppa/Kconfig
> +source i386/Kconfig
> +source m68k/Kconfig
> +source microblaze/Kconfig
> +source mips/Kconfig
> +source nios2/Kconfig
> +source openrisc/Kconfig
> +source ppc/Kconfig
> +source riscv/Kconfig
> +source rx/Kconfig
> +source s390x/Kconfig
> +source sh4/Kconfig
> +source sparc/Kconfig
> +source tricore/Kconfig
> +source xtensa/Kconfig
> diff --git a/target/alpha/Kconfig b/target/alpha/Kconfig
> new file mode 100644
> index 0000000000..267222c05b
> --- /dev/null
> +++ b/target/alpha/Kconfig
> @@ -0,0 +1,2 @@
> +config ALPHA
> +    bool
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> new file mode 100644
> index 0000000000..3f3394a22b
> --- /dev/null
> +++ b/target/arm/Kconfig
> @@ -0,0 +1,6 @@
> +config ARM
> +    bool
> +
> +config AARCH64
> +    bool
> +    select ARM
> diff --git a/target/avr/Kconfig b/target/avr/Kconfig
> new file mode 100644
> index 0000000000..155592d353
> --- /dev/null
> +++ b/target/avr/Kconfig
> @@ -0,0 +1,2 @@
> +config AVR
> +    bool
> diff --git a/target/cris/Kconfig b/target/cris/Kconfig
> new file mode 100644
> index 0000000000..3fdc309fbb
> --- /dev/null
> +++ b/target/cris/Kconfig
> @@ -0,0 +1,2 @@
> +config CRIS
> +    bool
> diff --git a/target/hppa/Kconfig b/target/hppa/Kconfig
> new file mode 100644
> index 0000000000..395a35d799
> --- /dev/null
> +++ b/target/hppa/Kconfig
> @@ -0,0 +1,2 @@
> +config HPPA
> +    bool
> diff --git a/target/i386/Kconfig b/target/i386/Kconfig
> new file mode 100644
> index 0000000000..ce6968906e
> --- /dev/null
> +++ b/target/i386/Kconfig
> @@ -0,0 +1,5 @@
> +config I386
> +    bool
> +
> +config X86_64
> +    bool
> diff --git a/target/m68k/Kconfig b/target/m68k/Kconfig
> new file mode 100644
> index 0000000000..23debad519
> --- /dev/null
> +++ b/target/m68k/Kconfig
> @@ -0,0 +1,2 @@
> +config M68K
> +    bool
> diff --git a/target/microblaze/Kconfig b/target/microblaze/Kconfig
> new file mode 100644
> index 0000000000..a5410d9218
> --- /dev/null
> +++ b/target/microblaze/Kconfig
> @@ -0,0 +1,2 @@
> +config MICROBLAZE
> +    bool
> diff --git a/target/mips/Kconfig b/target/mips/Kconfig
> new file mode 100644
> index 0000000000..6adf145354
> --- /dev/null
> +++ b/target/mips/Kconfig
> @@ -0,0 +1,6 @@
> +config MIPS
> +    bool
> +
> +config MIPS64
> +    bool
> +    select MIPS
> diff --git a/target/nios2/Kconfig b/target/nios2/Kconfig
> new file mode 100644
> index 0000000000..1529ab8950
> --- /dev/null
> +++ b/target/nios2/Kconfig
> @@ -0,0 +1,2 @@
> +config NIOS2
> +    bool
> diff --git a/target/openrisc/Kconfig b/target/openrisc/Kconfig
> new file mode 100644
> index 0000000000..e0da4ac1df
> --- /dev/null
> +++ b/target/openrisc/Kconfig
> @@ -0,0 +1,2 @@
> +config OPENRISC
> +    bool
> diff --git a/target/ppc/Kconfig b/target/ppc/Kconfig
> new file mode 100644
> index 0000000000..3ff152051a
> --- /dev/null
> +++ b/target/ppc/Kconfig
> @@ -0,0 +1,5 @@
> +config PPC
> +    bool
> +
> +config PPC64
> +    bool
> diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
> new file mode 100644
> index 0000000000..b9e5932f13
> --- /dev/null
> +++ b/target/riscv/Kconfig
> @@ -0,0 +1,5 @@
> +config RISCV32
> +    bool
> +
> +config RISCV64
> +    bool
> diff --git a/target/rx/Kconfig b/target/rx/Kconfig
> new file mode 100644
> index 0000000000..aceb5ed28f
> --- /dev/null
> +++ b/target/rx/Kconfig
> @@ -0,0 +1,2 @@
> +config RX
> +    bool
> diff --git a/target/s390x/Kconfig b/target/s390x/Kconfig
> new file mode 100644
> index 0000000000..72da48136c
> --- /dev/null
> +++ b/target/s390x/Kconfig
> @@ -0,0 +1,2 @@
> +config S390X
> +    bool
> diff --git a/target/sh4/Kconfig b/target/sh4/Kconfig
> new file mode 100644
> index 0000000000..2397c86028
> --- /dev/null
> +++ b/target/sh4/Kconfig
> @@ -0,0 +1,2 @@
> +config SH4
> +    bool
> diff --git a/target/sparc/Kconfig b/target/sparc/Kconfig
> new file mode 100644
> index 0000000000..70cc0f3a21
> --- /dev/null
> +++ b/target/sparc/Kconfig
> @@ -0,0 +1,5 @@
> +config SPARC
> +    bool
> +
> +config SPARC64
> +    bool
> diff --git a/target/tricore/Kconfig b/target/tricore/Kconfig
> new file mode 100644
> index 0000000000..9313409309
> --- /dev/null
> +++ b/target/tricore/Kconfig
> @@ -0,0 +1,2 @@
> +config TRICORE
> +    bool
> diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
> new file mode 100644
> index 0000000000..a3c8dc7f6d
> --- /dev/null
> +++ b/target/xtensa/Kconfig
> @@ -0,0 +1,2 @@
> +config XTENSA
> +    bool
> 


