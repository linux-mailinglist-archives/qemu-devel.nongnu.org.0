Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3CA37FD0A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 20:01:23 +0200 (CEST)
Received: from localhost ([::1]:60084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFeE-00039t-51
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 14:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFbh-0001qz-QG
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:58:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhFbg-0004sW-2C
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620928723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OmVhz4Ving8phARpfZHCWdJismwwmvj+3aKyFHAHDYI=;
 b=LnJB59cqV1tEZtMb/gLwJysNAKOqwm383+6d7crtALuH8uyi07clwczhbRI8pFCNLYlb5N
 u2JkdZ9wGCwhTJbxo/bQoaCPiBLn1mzwGULSl2lVRVlLHKYwIGbh2Zq3KB59Up5W4CTLQ7
 bvLwEM0Wm8hvEvS/sMPErQQZmzuxz4w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-qIfCFj44NnOcdV5kN2WPvA-1; Thu, 13 May 2021 13:58:41 -0400
X-MC-Unique: qIfCFj44NnOcdV5kN2WPvA-1
Received: by mail-ej1-f70.google.com with SMTP id
 zo1-20020a170906ff41b02903973107d7b5so8626693ejb.21
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OmVhz4Ving8phARpfZHCWdJismwwmvj+3aKyFHAHDYI=;
 b=d/7DNpvzF8U0Ga9v8hylizzHytPltfHhJWHj6DQuLUyyc/wqrUz1SU37ppxkiyAqrG
 qDcc+AjheswR+MeGve1kA88n0aD42w/YV6vIsMc1BUtfMUU2VsISfX54ENJ9ANhGg8LA
 HmxKKVlGABO6TU2Usheu0qab9Pp3/4IFqiYeTb4GA7TYMK+iv1cgakD220UG9WOyie50
 xdyQAgICZOrKeIuVKjTxTDZ4r+WyrcvjvWxp4a2SP/8ejcGtMcMNyZ43fllBZeapKLt8
 HDnHeNFkIVFnLEoHz7JlOI9lfIvuck0nPrx7JbCQfyOHDqsLz0chan8k4pZerYPnzkxx
 vJcw==
X-Gm-Message-State: AOAM5325svwxQ/Mmsji66E4a0UGEJVfo7qLS+S1Bf0XNwS5HJ38QRjhr
 PKpvxIceSmZm2wdi4Uou2xRAe5KkjmQJe5w8Q9zw3U75YTBz5kyVatOb/1uJrwJyNiUZAh/mDKG
 hpEiWfviIDlfMDzic3TCpBgBE1PGnCDGN5VMppUVw8V/lxaKY1PvLxTCoglQOIzbLxDo=
X-Received: by 2002:a17:907:1b1e:: with SMTP id
 mp30mr44693759ejc.532.1620928720198; 
 Thu, 13 May 2021 10:58:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnUSshVBmlvGL3+ANFuD3tjxhruDPXwH5vu1Gv96ZG1/D8SovxO2dh7vJqFoxW/0rUrhDxnA==
X-Received: by 2002:a17:907:1b1e:: with SMTP id
 mp30mr44693739ejc.532.1620928719887; 
 Thu, 13 May 2021 10:58:39 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id kx3sm2170359ejc.44.2021.05.13.10.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 10:58:39 -0700 (PDT)
Subject: Re: [PATCH 10/10] default-configs/devices: Clarify
 ARM_COMPATIBLE_SEMIHOSTING is required
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-11-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3da616d1-bfe7-e7fc-644d-fb530d6d50ef@redhat.com>
Date: Thu, 13 May 2021 19:58:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513163858.3928976-11-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/21 18:38, Philippe Mathieu-Daudé wrote:
> ARM_COMPATIBLE_SEMIHOSTING is not optional on these targets.
> Move the variable assignment out of the block documented with
> "Uncomment the following lines to disable these optional devices".

Can you document why it is always required in the commit message?

I suppose you cannot move it to default-configs/targets/ because you 
want to have CONFIG_SEMIHOSTING selected automatically (patch 9).

Paolo

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   default-configs/devices/arm-softmmu.mak     | 4 +++-
>   default-configs/devices/riscv32-softmmu.mak | 4 +++-
>   default-configs/devices/riscv64-softmmu.mak | 4 +++-
>   3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 341d439de6f..2713e5e9eb7 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -1,5 +1,8 @@
>   # Default configuration for arm-softmmu
>   
> +# TODO: semihosting is always required - move to default-configs/targets/
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> +
>   # TODO: ARM_V7M is currently always required - make this more flexible!
>   CONFIG_ARM_V7M=y
>   
> @@ -41,5 +44,4 @@ CONFIG_MICROBIT=y
>   CONFIG_FSL_IMX25=y
>   CONFIG_FSL_IMX7=y
>   CONFIG_FSL_IMX6UL=y
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>   CONFIG_ALLWINNER_H3=y
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
> index 5c9ad2590ef..7219f9749ad 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -1,9 +1,11 @@
>   # Default configuration for riscv32-softmmu
>   
> +# TODO: semihosting is always required - move to default-configs/targets/
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> +
>   # Uncomment the following lines to disable these optional devices:
>   #
>   #CONFIG_PCI_DEVICES=n
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>   
>   # Boards:
>   #
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
> index 8a92f0a2c74..1d1b8bb9f68 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -1,9 +1,11 @@
>   # Default configuration for riscv64-softmmu
>   
> +# TODO: semihosting is always required - move to default-configs/targets/
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> +
>   # Uncomment the following lines to disable these optional devices:
>   #
>   #CONFIG_PCI_DEVICES=n
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>   
>   # Boards:
>   #
> 


