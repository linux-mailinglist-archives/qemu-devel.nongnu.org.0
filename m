Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2834437B767
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 10:05:30 +0200 (CEST)
Received: from localhost ([::1]:51888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjs1-00082S-8f
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 04:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjp5-0004Cg-V8
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjox-00041d-3Q
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620806538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JePiNTF3b0qDirEWU/u5+nL5bO95RuC/8ONEXQps24A=;
 b=baA0Y0f2+h3sCCGpyUao0iaobVIcaTFmab4MEGM5xoCT7XSPOWQZCqOPN/lcWAtPYItcLi
 VD+CHLNHgMUqkApmGN66UUxkvNHNdETKcVL0gFHf5odUUZ6JLL/WD4RK/pVMBoW03kh0i2
 qklV/LD5zsgAqrUUWgcdI7eyyRMXrBw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-wMNLT5KbOjySPQ0q3DKGnw-1; Wed, 12 May 2021 04:02:16 -0400
X-MC-Unique: wMNLT5KbOjySPQ0q3DKGnw-1
Received: by mail-ed1-f69.google.com with SMTP id
 z12-20020aa7d40c0000b0290388179cc8bfso12334602edq.21
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 01:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JePiNTF3b0qDirEWU/u5+nL5bO95RuC/8ONEXQps24A=;
 b=sX1YLtRluwpFALdf06I5qm9J04G98FtUMQtXP1PdK+xkW3V+tJtrumw2dYsmu/ViiQ
 R4fY1zk8x79Pv28/0djRg2NSvoSL5IT/EDBLsJt/V8QlfczRd4U55LpLBuSmtSI7PaoB
 eL4y/LUIq53KlUUVvkXi4w6ab5WfdGI69+nHrNcUdf4dCasQwCyOzWPXEYDDdfTH34As
 g8BCCyNuSnkSlhIzG9u2rm5UTiKXepFFl/ASzTFcBO2izPTONZMOjyFavxk+/gAHt9x4
 Lvw43YpRhE4AbZbimePSvLVkkZDs4yv+11MtyCQsMOQ8/E/G3VLMEY+EmyVQQcJqKtAF
 Pmag==
X-Gm-Message-State: AOAM530BWWl0f31Qgzf0m1wZVJJpHF+xuz8xgwT40CsZ5tyRGNKlo7ul
 YvQCC6JEcrWYvK0PrKPsZULzZRqE7oitE5XqlVlEpLRdQXS2uHoSXUmK0c+ZG0C8xZFcDKDRi5X
 FySFpJaXVtORBGlg=
X-Received: by 2002:a17:906:5814:: with SMTP id
 m20mr35028026ejq.152.1620806535538; 
 Wed, 12 May 2021 01:02:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiWTYT7PMt8zGyvGkmETxK7m7+1a0m0lVKcTxiWqYUBeJdoQwEuOws+s6Szs0MXnbd7LVFlg==
X-Received: by 2002:a17:906:5814:: with SMTP id
 m20mr35027987ejq.152.1620806535312; 
 Wed, 12 May 2021 01:02:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id da25sm17473662edb.38.2021.05.12.01.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 01:02:14 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2dd5f261-658d-a13e-b34c-c5c70e19e77c@redhat.com>
Date: Wed, 12 May 2021 10:02:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511155354.3069141-2-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/21 17:53, Philippe Mathieu-Daudé wrote:
> Per the kconfig.rst:
> 
>    A device should be listed [...] ``imply`` if (depending on
>    the QEMU command line) the board may or  may not be started
>    without it.
> 
> This is the case with the NVDIMM device, so use the 'imply'
> weak reverse dependency to select the symbol.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Unrelated to the rest, so I've queued this one.

Paolo

> ---
>   default-configs/devices/ppc64-softmmu.mak | 1 -
>   hw/arm/Kconfig                            | 1 +
>   hw/i386/Kconfig                           | 1 +
>   hw/mem/Kconfig                            | 2 --
>   hw/ppc/Kconfig                            | 1 +
>   5 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/devices/ppc64-softmmu.mak
> index ae0841fa3a1..cca52665d90 100644
> --- a/default-configs/devices/ppc64-softmmu.mak
> +++ b/default-configs/devices/ppc64-softmmu.mak
> @@ -8,4 +8,3 @@ CONFIG_POWERNV=y
>   
>   # For pSeries
>   CONFIG_PSERIES=y
> -CONFIG_NVDIMM=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index b887f6a5b17..67723d9ea6a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -6,6 +6,7 @@ config ARM_VIRT
>       imply VFIO_PLATFORM
>       imply VFIO_XGMAC
>       imply TPM_TIS_SYSBUS
> +    imply NVDIMM
>       select ARM_GIC
>       select ACPI
>       select ARM_SMMUV3
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 7f91f30877f..66838fa397b 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -23,6 +23,7 @@ config PC
>       imply TPM_TIS_ISA
>       imply VGA_PCI
>       imply VIRTIO_VGA
> +    imply NVDIMM
>       select FDC
>       select I8259
>       select I8254
> diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
> index a0ef2cf648e..8b19fdc49f1 100644
> --- a/hw/mem/Kconfig
> +++ b/hw/mem/Kconfig
> @@ -7,6 +7,4 @@ config MEM_DEVICE
>   
>   config NVDIMM
>       bool
> -    default y
> -    depends on (PC || PSERIES || ARM_VIRT)
>       select MEM_DEVICE
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index e51e0e5e5ac..66e0b15d9ef 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -3,6 +3,7 @@ config PSERIES
>       imply PCI_DEVICES
>       imply TEST_DEVICES
>       imply VIRTIO_VGA
> +    imply NVDIMM
>       select DIMM
>       select PCI
>       select SPAPR_VSCSI
> 


