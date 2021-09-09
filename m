Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFAB4053D1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 15:18:53 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOJx6-0006yK-ED
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 09:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOJvP-00053K-Ug
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:17:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOJvM-0003HQ-59
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631193422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LfooXvQC6/ne4Tb/rq/FPcwBAKuWkwG0iSUyKvURdPM=;
 b=TofUuabqTd4Z3pZJuMDXFdMi8Wi4T0HQwjrRWOCxLzdmkY9fBEOCQ42xxoblsfRLEYepeM
 ysNyuqxFQOE4+cob9Xj8HsorX4DXZue64iZqBbPmAohBhIAVFsEzBWwyjjWQO2T6xjHoSG
 Aw5KUzxCP0hfrYx0qoTiBnmLXFABEAE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-2VODb_l2O1KS7PZr_Rci0Q-1; Thu, 09 Sep 2021 09:17:01 -0400
X-MC-Unique: 2VODb_l2O1KS7PZr_Rci0Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 n30-20020a05600c3b9e00b002fbbaada5d7so745203wms.7
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 06:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LfooXvQC6/ne4Tb/rq/FPcwBAKuWkwG0iSUyKvURdPM=;
 b=RsiPRZVQzQtS7Q8RmkN3NPeY5QSPK/V3pwoA0cp6D0VMT2BEnqPNZM+sBu/tzvF0uD
 muyXuQLS2Bh9fCwmcbTQMFyGkF7B3BBOsXTwkeFZisLWGNNmvwYLcqEDFqmGbBztg0TH
 gavQr38M8B78TtvyOTDdjt3uisSSClblmPS0Usx2a+yS23fIoWsIqTvrCOkXM1b/tDHC
 yzhx9LDjH8t6AAk0SyeJPT5TFxauUNcqeD/caE4Om8wzpq4o/8H3slszZ314xG6exi+r
 ZuTFK6X3A7inlgQfSdhGupgYfdnr03DTB2H5w1zAODc9yU/LcWAwBcmUXoXqwp9zvzZ7
 iNLA==
X-Gm-Message-State: AOAM530PbiWLIvJiyj4Oy2exn6kg2vfb41zCpQDQ3x9+lS8wYdsbHyLN
 XCoXWivl4iPJ3EMkqFxIL7+qMZgZ+Ckidy/F0TDyXWjqmqeKhNTpiDRZQTgdik+Pk8ws+QcpPnD
 yWE4ZUpM99LmlPU4=
X-Received: by 2002:a7b:cb02:: with SMTP id u2mr3009948wmj.103.1631193419600; 
 Thu, 09 Sep 2021 06:16:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7fxRTUNOZQpgG/CKqC53bWpF6s88safLtJ/6DjBLY4H4EhUuUQTo4Pbf9w6C1+ep0MEpUWw==
X-Received: by 2002:a7b:cb02:: with SMTP id u2mr3009918wmj.103.1631193419342; 
 Thu, 09 Sep 2021 06:16:59 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id k14sm1726989wri.46.2021.09.09.06.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 06:16:58 -0700 (PDT)
Subject: Re: [PULL v4 35/43] Kconfig: Add CONFIG_SGX support
To: qemu-devel@nongnu.org, Yang Zhong <yang.zhong@intel.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
 <20210908100426.264356-36-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e76efd92-dad7-12e2-d5ca-08609f641baa@redhat.com>
Date: Thu, 9 Sep 2021 15:16:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908100426.264356-36-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.975, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 12:04 PM, Paolo Bonzini wrote:
> From: Yang Zhong <yang.zhong@intel.com>
> 
> Add new CONFIG_SGX for sgx support in the Qemu, and the Kconfig
> default enable sgx in the i386 platform.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Message-Id: <20210719112136.57018-32-yang.zhong@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  backends/meson.build                     |  2 +-
>  configs/devices/i386-softmmu/default.mak |  1 +
>  hw/i386/Kconfig                          |  5 +++++
>  hw/i386/meson.build                      |  4 ++--
>  hw/i386/sgx-stub.c                       | 13 +++++++++++++
>  5 files changed, 22 insertions(+), 3 deletions(-)
>  create mode 100644 hw/i386/sgx-stub.c
> 
> diff --git a/backends/meson.build b/backends/meson.build
> index 46fd16b269..6e68945528 100644
> --- a/backends/meson.build
> +++ b/backends/meson.build
> @@ -16,6 +16,6 @@ softmmu_ss.add(when: ['CONFIG_VHOST_USER', 'CONFIG_VIRTIO'], if_true: files('vho
>  softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost.c'))
>  softmmu_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VHOST_CRYPTO'], if_true: files('cryptodev-vhost-user.c'))
>  softmmu_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus-vmstate.c'), gio])
> -softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('hostmem-epc.c'))
> +softmmu_ss.add(when: 'CONFIG_SGX', if_true: files('hostmem-epc.c'))
>  
>  subdir('tpm')
> diff --git a/configs/devices/i386-softmmu/default.mak b/configs/devices/i386-softmmu/default.mak
> index 84d1a2487c..598c6646df 100644
> --- a/configs/devices/i386-softmmu/default.mak
> +++ b/configs/devices/i386-softmmu/default.mak
> @@ -22,6 +22,7 @@
>  #CONFIG_TPM_CRB=n
>  #CONFIG_TPM_TIS_ISA=n
>  #CONFIG_VTD=n
> +#CONFIG_SGX=n
>  
>  # Boards:
>  #
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index ddedcef0b2..962d2c981b 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -6,6 +6,10 @@ config SEV
>      select X86_FW_OVMF
>      depends on KVM
>  
> +config SGX
> +    bool
> +    depends on KVM
> +
>  config PC
>      bool
>      imply APPLESMC
> @@ -21,6 +25,7 @@ config PC
>      imply PVPANIC_ISA
>      imply QXL
>      imply SEV
> +    imply SGX
>      imply SGA
>      imply TEST_DEVICES
>      imply TPM_CRB
> diff --git a/hw/i386/meson.build b/hw/i386/meson.build
> index fefce9e4ba..c502965219 100644
> --- a/hw/i386/meson.build
> +++ b/hw/i386/meson.build
> @@ -5,8 +5,6 @@ i386_ss.add(files(
>    'e820_memory_layout.c',
>    'multiboot.c',
>    'x86.c',
> -  'sgx-epc.c',
> -  'sgx.c'
>  ))
>  
>  i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
> @@ -18,6 +16,8 @@ i386_ss.add(when: 'CONFIG_Q35', if_true: files('pc_q35.c'))
>  i386_ss.add(when: 'CONFIG_VMMOUSE', if_true: files('vmmouse.c'))
>  i386_ss.add(when: 'CONFIG_VMPORT', if_true: files('vmport.c'))
>  i386_ss.add(when: 'CONFIG_VTD', if_true: files('intel_iommu.c'))
> +i386_ss.add(when: 'CONFIG_SGX', if_true: files('sgx-epc.c','sgx.c'),
> +                                if_false: files('sgx-stub.c'))
>  
>  i386_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-common.c'))
>  i386_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device_x86.c'))
> diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
> new file mode 100644
> index 0000000000..edf17c3309
> --- /dev/null
> +++ b/hw/i386/sgx-stub.c

Ah, here comes the stub.

> @@ -0,0 +1,13 @@
> +#include "qemu/osdep.h"
> +#include "hw/i386/pc.h"
> +#include "hw/i386/sgx-epc.h"
> +
> +void pc_machine_init_sgx_epc(PCMachineState *pcms)
> +{
> +    return;

Nack.

If an user tries to use sgx-epc.0.memdev=memid with a build with SGX
not built in, you silently ignore the security request and keep booting
the machine... Use something like:

    error_report("Support for SGX EPC not built-in");
    exit(EXIT_FAILURE);

Or better pass an Error* argument to pc_machine_init_sgx_epc() to
propagate the error.

> +}
> +
> +int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
> +{
> +    return 1;

No, this code is unreachable:

       g_assert_not_reached();

> +}
> 


