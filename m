Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08BA37B714
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:47:32 +0200 (CEST)
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjad-0001is-Qz
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjZC-0008VP-IO
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:46:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjZ9-0002ZK-S2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620805559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7zEDoXWJ/xTynSF5qTDMCPIZdhvDsBmI2M88nWjjdLg=;
 b=Hmjlu7UbJDAJV7KyO0/0XnOswuJTEKyGg0hHPuHK6Io7+tAm/J3/XbMioU3f2Qc+9+zY2l
 hnA7EwJmeZcMx8WQ/9hVK9rFjPHj25AszMNcWNge28yRE3F4ceocDDvHWc4HPLwH9ITIUc
 8JTB51qNbgaSO5YoSQ4obs1ld6C0gfo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-AqrA0oekMLybeuLXopQrzg-1; Wed, 12 May 2021 03:45:57 -0400
X-MC-Unique: AqrA0oekMLybeuLXopQrzg-1
Received: by mail-ed1-f70.google.com with SMTP id
 s20-20020a0564025214b029038752a2d8f3so12367984edd.2
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7zEDoXWJ/xTynSF5qTDMCPIZdhvDsBmI2M88nWjjdLg=;
 b=e1hTMzzSgWNdFjlHAAVI6hi3k+MvTsUX+gHpB002lC14czmToiVeRY102Al9g/TlpC
 1xh+BbsBznt1g3HdLT41DSaX/q7EWA422KFRVpgW+fwEQsheF7kbH3PQH3yLHK5CmN0u
 dmTYjaRNR3urEkaIWykI2AN4wS4OgOfR0CrDnQubG20FlN5q2PhmH9b3Pp3FOPSbbyOK
 8B1CTZ7MXnYE9YfEr3DMv5Yv3QuxjRZmJMkqWYWGoKVJaZ3N5ZRES+WgEbYaX1NNdYjC
 kkfRV8JSMme5poKh+4ESqWIHTwog6Kf4SxHcR84IOIA0osL7LYp5Oxl/jeuyMmwaEbuC
 JcOA==
X-Gm-Message-State: AOAM530ynGmRijCmvpjd2vSG3iPUUI/lqGMAR3pb7FkUtdO2utem3VI6
 uN8kyVgT5QiCR9mhVmbJbfYyjUrDSav0EXXUFLmfKE+lNAwvtabrnD1yz++VXXSqiCwTVOKOxO1
 +46wVdJtDistcT54=
X-Received: by 2002:a17:906:a393:: with SMTP id
 k19mr35214182ejz.26.1620805556648; 
 Wed, 12 May 2021 00:45:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+xaq5ru4B8x8iGDIW+TVxVxfJpu8df+bu3SGMvPmMVpdVnMuas1tHiG3AynxInM+WImIpYQ==
X-Received: by 2002:a17:906:a393:: with SMTP id
 k19mr35214159ejz.26.1620805556427; 
 Wed, 12 May 2021 00:45:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c3sm3053316edn.16.2021.05.12.00.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 00:45:55 -0700 (PDT)
Subject: Re: [RFC PATCH 3/5] hw/ppc: Have pSeries depends on libfdt (via host
 Kconfig FDT symbol)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-4-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <28e52da6-6cfa-1653-79c7-fb2d857c8eeb@redhat.com>
Date: Wed, 12 May 2021 09:45:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511155354.3069141-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/21 17:53, Philippe Mathieu-Daudé wrote:
> Since commit fea35ca4b8e ("ppc/spapr: Receive and store device
> tree blob from SLOF") the pSeries machine depends on the libfdt
> fdt_check_full() call, which is available in libfdt v1.4.7.
> 
> Add the corresponding Kconfig dependency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

This is not the only one though.  In particular, there should be a 
"depends on" also for MIPS_BOSTON (hw/mips), E500 (hw/ppc), POWERNV, 
PPC440 (hw/ppc), (hw/ppc), SAM460EX (hw/ppc), VIRTEX (hw/ppc), RX_GDBSIM 
(hw/rx), XTENSA_XTFPGA (hw/xtensa).

Once you do this, TARGET_NEED_FDT can go away for PPC, MIPS and.  The 
remaining ones use fdt functions in hw/*/boot.c so they need libfdt 
unconditionally RX (and TARGET_NEED_FDT should be added to 
default-configs/targets/nios2-softmmu.mak for the same reason).

Paolo

> ---
>   hw/ppc/Kconfig     | 1 +
>   hw/ppc/meson.build | 4 ++--
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 66e0b15d9ef..3935b73456f 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -1,5 +1,6 @@
>   config PSERIES
>       bool
> +    depends on FDT
>       imply PCI_DEVICES
>       imply TEST_DEVICES
>       imply VIRTIO_VGA
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index 86d6f379d1c..e82a6b4105b 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -9,7 +9,7 @@
>   ppc_ss.add(when: 'CONFIG_FW_CFG_PPC', if_true: files('fw_cfg.c'))
>   
>   # IBM pSeries (sPAPR)
> -ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
> +ppc_ss.add(when: 'CONFIG_PSERIES', if_true: [files(
>     'spapr.c',
>     'spapr_caps.c',
>     'spapr_vio.c',
> @@ -28,7 +28,7 @@
>     'spapr_rtas_ddw.c',
>     'spapr_numa.c',
>     'pef.c',
> -))
> +), fdt])
>   ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
>   ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
>     'spapr_pci_vfio.c',
> 


