Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C19D37FC23
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:09:49 +0200 (CEST)
Received: from localhost ([::1]:60046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEqK-0000hT-2u
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEhb-0003w5-VU
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:00:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEhT-0004eQ-M0
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620925238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrAZtZFcsvcyvpbP5ZQ9HbMJK/3NFeEPW12PjdLQxFI=;
 b=Ma69pVIGnY9Lc3JeYOKsOG9J47M0LhuFYuvSOFsvuVDe2gDq8rrmH65mXdtXHBP3M05ZmS
 mdiPQMqAodHNVFSOJB4kC1d2752uiv3zdExV9rl4s3ousHaoADSUXrYGAthMu/BPAw17UY
 vMl3swUH5Lxo4217naa8yljqyznsuy8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-plLskEqpNDusPlNxE70wKQ-1; Thu, 13 May 2021 13:00:35 -0400
X-MC-Unique: plLskEqpNDusPlNxE70wKQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 p8-20020aa7c8880000b029038ce714c8d6so612748eds.10
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MrAZtZFcsvcyvpbP5ZQ9HbMJK/3NFeEPW12PjdLQxFI=;
 b=KtVpNcXKwKFMdhtzwMLILr66aGbkrgxsXZswheiC2o9ueFPFYbPZ54M/74UpXH9NzR
 0dLPhOaAEcL1CfLo6+9Bd/zpdRVbIsIDwoQUupDbQ4UOiBmIyJyUmmWf+4RnzK0rGNit
 XhCB54F6+7TiXJYqwy+MVhLOL4q82Lnis+AXqHhWRU+c0T93FHBRbVNE7Fe3U93+OTSF
 Rzyhg7Y/yPU935ngjbddRt5rTo7gOykGX+5wXn2/Y5+lISKjCSIySZYeaNU4b+wbZMYl
 +0VZeQB/Pleu+ZN3Mcx1MZTiGC4Xyw6uZGB8BB2wk0kTv5hrCkebppmi8wZdjCc2zejv
 zqcA==
X-Gm-Message-State: AOAM530ozlNqVz9FZij+/edbP1uG+sqALl2HNpC0se3Jz2ayzwzghHZI
 8wNWvnxkbKAhuGl3Afzq3+ar1F0Riw3SUvyNgcuq3UB31RuR1O3/Gr+eZBUg4mbnc/SgkwhveQH
 mkTuvMuZ9Wo1cVyE=
X-Received: by 2002:a17:906:fa0d:: with SMTP id
 lo13mr10869819ejb.477.1620925233523; 
 Thu, 13 May 2021 10:00:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyimAh9O4peBLD6aExqY+MbGh6aPWxb1x6b+tmtn4NgYu7/G+a7lH+cPk7x15CDVRyXhDIXIQ==
X-Received: by 2002:a17:906:fa0d:: with SMTP id
 lo13mr10869798ejb.477.1620925233311; 
 Thu, 13 May 2021 10:00:33 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id kx3sm2096922ejc.44.2021.05.13.10.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 10:00:32 -0700 (PDT)
Subject: Re: [PATCH 10/10] default-configs/devices: Clarify
 ARM_COMPATIBLE_SEMIHOSTING is required
To: qemu-devel@nongnu.org
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-11-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4e7d146c-3d7b-6210-8478-fba1370fdf64@redhat.com>
Date: Thu, 13 May 2021 19:00:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513163858.3928976-11-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc Alex & Thomas

On 5/13/21 6:38 PM, Philippe Mathieu-Daudé wrote:
> ARM_COMPATIBLE_SEMIHOSTING is not optional on these targets.
> Move the variable assignment out of the block documented with
> "Uncomment the following lines to disable these optional devices".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  default-configs/devices/arm-softmmu.mak     | 4 +++-
>  default-configs/devices/riscv32-softmmu.mak | 4 +++-
>  default-configs/devices/riscv64-softmmu.mak | 4 +++-
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 341d439de6f..2713e5e9eb7 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -1,5 +1,8 @@
>  # Default configuration for arm-softmmu
>  
> +# TODO: semihosting is always required - move to default-configs/targets/
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> +
>  # TODO: ARM_V7M is currently always required - make this more flexible!
>  CONFIG_ARM_V7M=y
>  
> @@ -41,5 +44,4 @@ CONFIG_MICROBIT=y
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>  CONFIG_ALLWINNER_H3=y
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
> index 5c9ad2590ef..7219f9749ad 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -1,9 +1,11 @@
>  # Default configuration for riscv32-softmmu
>  
> +# TODO: semihosting is always required - move to default-configs/targets/
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> +
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=n
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>  
>  # Boards:
>  #
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
> index 8a92f0a2c74..1d1b8bb9f68 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -1,9 +1,11 @@
>  # Default configuration for riscv64-softmmu
>  
> +# TODO: semihosting is always required - move to default-configs/targets/
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> +
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=n
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>  
>  # Boards:
>  #
> 


