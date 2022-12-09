Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C9B6487AF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:23:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3h4V-0001Gb-Do; Fri, 09 Dec 2022 12:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3h4U-0001GN-3m
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:22:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3h4S-0004G0-Cw
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670606519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1Ds7J7jLrQ7CACl1vRX0ByuHvgUraz1dnEDkplHlNk=;
 b=aA4s7Gv2Rf1ofts79dZUX3qRnsbCh3fhL3aRLaD16JwiXSSk7QQPNvVA6c5QSPKn3IdLg4
 kkkMke15B93UdNwm7t+P806PcdnzicSMGgiTdda7DMRl/9SwwmT40GEV5KinpOB4Qxdeoj
 nQ3RpcVm6mMCCQ/tD8h9ox4KETNR03g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-9xcbGiYKOyuYD7EfQF7HwQ-1; Fri, 09 Dec 2022 12:21:57 -0500
X-MC-Unique: 9xcbGiYKOyuYD7EfQF7HwQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 z4-20020a05640240c400b0046c51875c17so1761147edb.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 09:21:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L1Ds7J7jLrQ7CACl1vRX0ByuHvgUraz1dnEDkplHlNk=;
 b=kN3BgppSBx+cvbmfgU1NEWaR/dxqKuC22tsr0ubogvvofVRySBydwh9QsCcHco7wvp
 5QDazZvMzaE06GbblmFCgrmbNunAClz5mSLD9YQnQlzgsZP5fjwL5oMoigPDXMGLEpt6
 7txWAfqVakgpxADSPUbuxG3B6K8omTMZuRQ2+/uBl7k1ndhDmNbIIhfrjFowPn2/v+c2
 ldsF/P/wmmHpYiyCNlBgy8lx466hAGLAHRb8f1RQUT+hwhZf2d5hUIjUrVRkaQq/yxOD
 e/WmkHSD2x7JZfs38FhWDzIZXXlz9PyIzOf2HPkuQ7A/jxdwal6BornSxgl0ZO2XPPfZ
 pP+Q==
X-Gm-Message-State: ANoB5pnJzjqRRM5Sz5RUKyO4gHkSdhiWiO7jvciH74bMb8g4vjfsEXCe
 /dwkezcHJXm8VAN422J7Ii78LnS9+csDRqDp6tieShGEXOwonXYSN4UEfsaJuultUw+C3h2a6wQ
 VrT6GSOL6Eh4+Mbk=
X-Received: by 2002:aa7:c844:0:b0:461:9faf:6895 with SMTP id
 g4-20020aa7c844000000b004619faf6895mr5487271edt.16.1670606516742; 
 Fri, 09 Dec 2022 09:21:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7GiWcSigdvOw8c7i1L7qvMTqHCzXvEZhwHjWUkfDzPjgT57ahbwMnVEl+eA0UUb9NoitoYjw==
X-Received: by 2002:aa7:c844:0:b0:461:9faf:6895 with SMTP id
 g4-20020aa7c844000000b004619faf6895mr5487254edt.16.1670606516521; 
 Fri, 09 Dec 2022 09:21:56 -0800 (PST)
Received: from [192.168.8.102] (tmo-086-144.customers.d1-online.com.
 [80.187.86.144]) by smtp.gmail.com with ESMTPSA id
 c25-20020a056402159900b0045ce419ecffsm866899edv.58.2022.12.09.09.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 09:21:55 -0800 (PST)
Message-ID: <6548f60f-1b98-f35e-e568-af9b2537fc2c@redhat.com>
Date: Fri, 9 Dec 2022 18:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20221209170042.71169-1-philmd@linaro.org>
 <20221209170042.71169-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH-for-8.0 2/3] hw/intc: Move omap_lcdc.c out of
 target-specific source set
In-Reply-To: <20221209170042.71169-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 09/12/2022 18.00, Philippe Mathieu-Daudé wrote:
> The Goldfish interrupt controller is not target specific.

It's also only used by m68k which is only built once, so this does help 
reducing the compile time ... but I agree, it will be more helpful in the 
future the more code we move to softmmu_ss instead of specific_ss.

> While the Exynos interrupt combiner is only used by the ARM
> targets, we can build this device once for all.
 >
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/intc/meson.build | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index bcbf22ff51..2ad8648366 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -13,6 +13,8 @@ softmmu_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
>     'arm_gicv3_redist.c',
>   ))
>   softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
> +softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_combiner.c'))
> +softmmu_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
>   softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
>   softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
> @@ -33,7 +35,7 @@ specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
>   specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
>   specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
>   specific_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))
> -specific_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos4210_combiner.c'))
> +specific_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c'))
>   specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
>   specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
>   specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
> @@ -60,7 +62,6 @@ specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('xics_spapr.c', 'spapr_xi
>   specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
>   specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
>   		if_true: files('spapr_xive_kvm.c'))
> -specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
>   specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))

Reviewed-by: Thomas Huth <thuth@redhat.com>


