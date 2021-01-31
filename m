Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41DE309CE1
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 15:31:19 +0100 (CET)
Received: from localhost ([::1]:57034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Dl0-0003lM-OG
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 09:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l6Dj7-0002oQ-ME; Sun, 31 Jan 2021 09:29:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:56152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l6Dj5-0003f4-LX; Sun, 31 Jan 2021 09:29:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86722AD37;
 Sun, 31 Jan 2021 14:29:17 +0000 (UTC)
Subject: Re: [PATCH v6 05/11] target/arm: Restrict ARMv6 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-6-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <795e5835-bd91-8857-11b5-7d366a0a84df@suse.de>
Date: Sun, 31 Jan 2021 15:29:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210131115022.242570-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.079,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
> 
> Only enable the following ARMv6 CPUs when TCG is available:
> 
>   - ARM1136
>   - ARM1176
>   - ARM11MPCore
>   - Cortex-M0
> 
> The following machines are no more built when TCG is disabled:
> 
>   - kzm                  ARM KZM Emulation Baseboard (ARM1136)
>   - microbit             BBC micro:bit (Cortex-M0)
>   - n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
>   - n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
>   - realview-eb-mpcore   ARM RealView Emulation Baseboard (ARM11MPCore)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  default-configs/devices/arm-softmmu.mak | 2 --
>  hw/arm/realview.c                       | 2 +-
>  tests/qtest/cdrom-test.c                | 2 +-
>  hw/arm/Kconfig                          | 6 ++++++
>  target/arm/Kconfig                      | 4 ++++
>  5 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 0aad35da0c4..175530595ce 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -10,9 +10,7 @@ CONFIG_ARM_VIRT=y
>  CONFIG_CUBIEBOARD=y
>  CONFIG_EXYNOS4=y
>  CONFIG_HIGHBANK=y
> -CONFIG_FSL_IMX31=y
>  CONFIG_MUSCA=y
> -CONFIG_NSERIES=y
>  CONFIG_STELLARIS=y
>  CONFIG_REALVIEW=y
>  CONFIG_VEXPRESS=y
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 2dcf0a4c23e..0606d22da14 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -463,8 +463,8 @@ static void realview_machine_init(void)
>  {
>      if (tcg_builtin()) {
>          type_register_static(&realview_eb_type);
> +        type_register_static(&realview_eb_mpcore_type);
>      }
> -    type_register_static(&realview_eb_mpcore_type);
>      type_register_static(&realview_pb_a8_type);
>      type_register_static(&realview_pbx_a9_type);
>  }
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index 1f1bc26fa7a..cb0409c5a11 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -224,8 +224,8 @@ int main(int argc, char **argv)
>          const char *armmachines[] = {
>  #ifdef CONFIG_TCG
>              "realview-eb",
> -#endif /* CONFIG_TCG */
>              "realview-eb-mpcore",
> +#endif /* CONFIG_TCG */
>              "realview-pb-a8",
>              "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
>              "vexpress-a9", "virt", NULL
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 560442bfc5c..6c4bce4d637 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -123,6 +123,8 @@ config NETDUINOPLUS2
>  
>  config NSERIES
>      bool
> +    default y if TCG && ARM
> +    select ARM_V6
>      select OMAP
>      select TMP105   # tempature sensor
>      select BLIZZARD # LCD/TV controller
> @@ -401,6 +403,8 @@ config FSL_IMX25
>  
>  config FSL_IMX31
>      bool
> +    default y if TCG && ARM
> +    select ARM_V6
>      select SERIAL
>      select IMX
>      select IMX_I2C
> @@ -478,11 +482,13 @@ config FSL_IMX6UL
>  
>  config MICROBIT
>      bool
> +    default y if TCG && ARM
>      select NRF51_SOC
>  
>  config NRF51_SOC
>      bool
>      select I2C
> +    select ARM_V6
>      select ARM_V7M
>      select UNIMP
>  
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index 9b3635617dc..fbb7bba9018 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -14,6 +14,10 @@ config ARM_V5
>      bool
>      depends on TCG && ARM
>  
> +config ARM_V6
> +    bool
> +    depends on TCG && ARM
> +
>  config ARM_V7M
>      bool
>      select PTIMER
> 

Added Cc: Eduardo,

Looks good to me in general,

Acked-by: Claudio Fontana <cfontana@suse.de>

I am just wondering about that if (tcg_builtin()) / (or _available() as I suggest elsewhere), 
should we instead use the build system already at this stage, so no such check is necessary?

It could be a successive change, but then tcg_builtin() would be introduced, only to become useless after the proper refactoring is done,
and the build system is used to select the right modules to compile, which would do the registration.

Ciao,

Claudio


