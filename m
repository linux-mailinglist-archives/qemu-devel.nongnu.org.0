Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828F3309E35
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 19:35:44 +0100 (CET)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6HZX-0005ZV-4B
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 13:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6HXV-0004UY-NB; Sun, 31 Jan 2021 13:33:38 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6HXT-0004BI-Nu; Sun, 31 Jan 2021 13:33:37 -0500
Received: by mail-wm1-x331.google.com with SMTP id m1so8038871wml.2;
 Sun, 31 Jan 2021 10:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YfXntrVy2t2jATilFhg+s/zNLQ2Gr95Pj2L0u5l7ikY=;
 b=GYhp8jkAogxxPdFA0ChERYrJO1aYMBvRrUyFRwyqxhDh/Zo6tdBLIkXxFJBxJf02lZ
 7EFaGt+xPX+/JKeCcCPowDQO2rctOww7Bq3BgEYBbbGVfX3GmTjhywQedsbSOk/mthnI
 nljnhTpxWyzedMXI7zjZhZeZ69znOFt2cTjZLIIH68QpG+jD33jouS3rbirHrpqCx6bi
 bTNMNaAlWc7jFjtYgbSrARBIATrb2sqLMbNuuUgtm+sunEmPaQrr7BZVoiOgzAlYVmCS
 oPO0tRC/TSm6Z7XC0bDVf/4yX38I9ddxB1Z9NqrR0ig2JB6nmSYnhWqnrvfGcpMh27WP
 eK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YfXntrVy2t2jATilFhg+s/zNLQ2Gr95Pj2L0u5l7ikY=;
 b=ZBYg1qxEDkbml0upRYEIzwHcOhsr+yUD0DCATkY3bm8lLhV7Dg01WKgdeDaiP1dpkB
 fszpLy9pi1/3jPEr59Xt3HGvrrZOCIhUIoGYVXUsmJOFucV22XEuJwX9nbrDeKqgdthm
 Mjkt7w/mepIVoY2wqMJxo/2f1QcETxd16bzFtD3WxnIVHFJQj22PVxCOULDqlU3mwsoc
 /h92s9gQ/UoefDd6qnvBVdUjvA6j1LSZ9i2aOSMF8lpeXZaSuM6y+iXWuML6mrx7wV+j
 flPsQf2ADzbG5T3Gu/6LVaItiBX39uOnN2eRZHfdzaWv326ufflqF0pj4aOGg//K0CK7
 OLOg==
X-Gm-Message-State: AOAM532+wcHU1ZSO9syei6YrMR4c86t/urB1PliL2snBqAMMqSdkUg8i
 Q6js1Zel9RqW7XTc+hZhCfc=
X-Google-Smtp-Source: ABdhPJwhNtifPhE6CM7o9ikNu4Fbm+EsmeWIzWtQu3ct2e0LjPszU+7vUs7Sv//6T4u9/wZD6sjAtQ==
X-Received: by 2002:a1c:bc89:: with SMTP id m131mr5962664wmf.32.1612118013350; 
 Sun, 31 Jan 2021 10:33:33 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id i18sm15848918wrn.29.2021.01.31.10.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 10:33:32 -0800 (PST)
Subject: Re: [PATCH 2/5] hw/arm: Restrict ARMv7 A-profile cpus to TCG accel
To: qemu-devel@nongnu.org
References: <20210131164406.349825-1-f4bug@amsat.org>
 <20210131164406.349825-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <53c946a7-e79a-6a45-d342-6104efc166b3@amsat.org>
Date: Sun, 31 Jan 2021 19:33:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131164406.349825-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 5:44 PM, Philippe Mathieu-Daudé wrote:
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
> 
> The following machines are no more built when TCG is disabled:
> 
>   - cubieboard           cubietech cubieboard (Cortex-A8)
>   - mcimx6ul-evk         Freescale i.MX6UL Evaluation Kit (Cortex A7)
>   - mcimx7d-sabre        Freescale i.MX7 DUAL SABRE (Cortex A7)
>   - npcm750-evb          Nuvoton NPCM750 Evaluation Board (Cortex A9)
>   - nuri                 Samsung NURI board (Exynos4210)
>   - orangepi-pc          Orange Pi PC (Cortex-A7)
>   - quanta-gsj           Quanta GSJ (Cortex A9)
>   - realview-pb-a8       ARM RealView Platform Baseboard for Cortex-A8
>   - realview-pbx-a9      ARM RealView Platform Baseboard Explore for Cortex-A9
>   - sabrelite            Freescale i.MX6 Quad SABRE Lite Board (Cortex A9)
>   - smdkc210             Samsung SMDKC210 board (Exynos4210)
>   - vexpress-a15         ARM Versatile Express for Cortex-A15
>   - vexpress-a9          ARM Versatile Express for Cortex-A9
>   - xilinx-zynq-a9       Xilinx Zynq Platform Baseboard for Cortex-A9
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  default-configs/devices/arm-softmmu.mak | 10 ----------
>  hw/arm/Kconfig                          | 11 +++++++++++
>  2 files changed, 11 insertions(+), 10 deletions(-)
...

>  
>  config REALVIEW
>      bool
> +    default y if TCG && ARM
>      imply PCI_DEVICES
>      imply PCI_TESTDEV
>      select SMC91C111
> @@ -241,6 +244,7 @@ config SBSA_REF
>  
>  config SABRELITE
>      bool
> +    default y if TCG && ARM
>      select FSL_IMX6
>      select SSI_M25P80
>  
> @@ -292,6 +296,7 @@ config VERSATILE
>  
>  config VEXPRESS
>      bool
> +    default y if TCG && ARM
>      select A9MPCORE
>      select A15MPCORE
>      select ARM_MPTIMER
> @@ -307,6 +312,7 @@ config VEXPRESS
>  
>  config ZYNQ
>      bool
> +    default y if TCG && ARM
>      select A9MPCORE
>      select CADENCE # UART
>      select PFLASH_CFI02

Missing:
-- >8 --
diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index cb0409c5a11..c1746284ee2 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -225,10 +225,11 @@ int main(int argc, char **argv)
 #ifdef CONFIG_TCG
             "realview-eb",
             "realview-eb-mpcore",
-#endif /* CONFIG_TCG */
             "realview-pb-a8",
             "realview-pbx-a9", "versatileab", "versatilepb",
"vexpress-a15",
-            "vexpress-a9", "virt", NULL
+            "vexpress-a9",
+#endif /* CONFIG_TCG */
+            "virt", NULL
         };
         add_cdrom_param_tests(armmachines);
     } else {
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c83bc211b6a..d8ebd5bf98e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -159,10 +159,10 @@
   (cpu != 'arm' ? ['bios-tables-test'] : []) +
                         \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ?
['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ?
['tpm-tis-device-swtpm-test'] : []) +  \
+  (config_all.has_key('CONFIG_TCG') ? ['xlnx-can-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-   'xlnx-can-test',
    'migration-test']

 qtests_s390x = \
---



