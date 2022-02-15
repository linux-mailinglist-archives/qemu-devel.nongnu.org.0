Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3444B678A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:26:54 +0100 (CET)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJu6o-0001EK-3e
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:26:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nJu5S-0000SK-Br
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:25:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nJu5P-0007BN-3P
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644917125;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKKAIdDkVSr8c+o+POp7w+f9bS9TGCLkH0rTEJj5ZW0=;
 b=RJdhxBYMOLCkIMR2C/1lAgXprNEfyQWcSXp8UiFe+F9C4KEHMAqliT2RHx1lSrNwEjM+2B
 AsOEYoOxkg60RuFXGMdMgLPT6QqqHAZ1zSYERMkgffzH8mi0x7Nhv6HJk4udXqtudywfVa
 Ci5wwMG6DRa8Lt5PdnB0LrB+5IcMg1w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-hqGem0hMOZOxDzJN_LLcIQ-1; Tue, 15 Feb 2022 04:25:24 -0500
X-MC-Unique: hqGem0hMOZOxDzJN_LLcIQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so8109312wrd.22
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:25:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=RKKAIdDkVSr8c+o+POp7w+f9bS9TGCLkH0rTEJj5ZW0=;
 b=QwQxpvJ3XnocWV5q1Re33e7pOWWIFgRZLWv5HR3KpA1QPsGq6uSLjkVd7xT9/3v+ah
 MN8e4K8RzhthYiKTFBQj3OfqRMZiBhG9lUidIzJnVmmd3iBQa9cpf4VciwgshZACg+Oa
 /xQO54UaKRFAP7yVg1DVYv3O2JUf5z2F4YtDd2jChgM2ObYF3gE4VS0gY7STaq3pBjNJ
 kP2eOnFUrRdwFLq+gyRS/r72b53UQEYJuR+y3LZVX1yZAysUXtFObyAQtsyxcXjSmgnf
 NBnrgf5a6j96PhveGWiNSNzN8gcCzUnQg/pnR3tEC+Wan2lhbam7gjZTJ/NnLEsxgRXD
 vhoQ==
X-Gm-Message-State: AOAM532o+9z3MIYock6ep62dVLRqwgxYJQUb11vbkDe8ymsfyCo+iLU3
 dVkpU8Jat42Z3ssz1QNaYSi4JikoRdHbuPXRPNQ9p6A450aVXiLovGl6Zb5Cc/zXvXFIQj7xacf
 EGIJshPAEBUcyqho=
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr2276297wmj.157.1644917123223; 
 Tue, 15 Feb 2022 01:25:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSgAPkLzlSFsi9qPh4RUuxECa/Cw3vlhCiWCdV5G7YOYLiTUW5zzLblm4mVaiC5H21jzLveg==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr2276270wmj.157.1644917122988; 
 Tue, 15 Feb 2022 01:25:22 -0800 (PST)
Received: from ?IPv6:2a01:e0a:92b:6460:3f38:a137:6502:95a4?
 ([2a01:e0a:92b:6460:3f38:a137:6502:95a4])
 by smtp.gmail.com with ESMTPSA id bg23sm19171557wmb.5.2022.02.15.01.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 01:25:22 -0800 (PST)
Subject: Re: [PATCH v3 0/4] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220214124356.872985-1-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <f70a113d-5762-3b4c-6125-0081a1d5ab63@redhat.com>
Date: Tue, 15 Feb 2022 10:25:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220214124356.872985-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, pasic@linux.ibm.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 2/14/22 1:43 PM, Jean-Philippe Brucker wrote:
> Replace the VIRTIO_IOMMU_F_BYPASS feature with
> VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
> global bypass on and off.
>
> Add a boot-bypass option, which defaults to 'on' to be in line with
> other vIOMMUs and to allow running firmware/bootloader that are unaware
> of the IOMMU. x86 doesn't need a workaround to boot with virtio-iommu
> anymore.
>
> Since v2 [1]:
> * Added the new bypass bits to the migration stream.
>   As discussed on the v2 thread, we assume that cross-version
>   compatibility is not required for live migration at the moment, so we
>   only increase the version number. Patch 2 says: "We add the bypass
>   field to the migration stream without introducing subsections, based
>   on the assumption that this virtio-iommu device isn't being used in
>   production enough to require cross-version migration at the moment
>   (all previous version required workarounds since they didn't support
>   ACPI and boot-bypass)."
>
> [1] https://lore.kernel.org/qemu-devel/20220127142940.671333-1-jean-philippe@linaro.org/
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

I tested both the boot bypass feature with virtio-blk-pci,
virtio-net-pci and virtio-gpu-pci and migration.

Thanks

Eric

>
> Jean-Philippe Brucker (4):
>   linux-headers: update to v5.17-rc1
>   virtio-iommu: Default to bypass during boot
>   virtio-iommu: Support bypass domain
>   tests/qtest/virtio-iommu-test: Check bypass config
>
>  include/hw/virtio/virtio-iommu.h              |   1 +
>  include/standard-headers/asm-x86/kvm_para.h   |   1 +
>  include/standard-headers/drm/drm_fourcc.h     |  11 ++
>  include/standard-headers/linux/ethtool.h      |   1 +
>  include/standard-headers/linux/fuse.h         |  60 +++++++-
>  include/standard-headers/linux/pci_regs.h     | 142 +++++++++---------
>  include/standard-headers/linux/virtio_gpio.h  |  72 +++++++++
>  include/standard-headers/linux/virtio_i2c.h   |  47 ++++++
>  include/standard-headers/linux/virtio_iommu.h |   8 +-
>  .../standard-headers/linux/virtio_pcidev.h    |  65 ++++++++
>  include/standard-headers/linux/virtio_scmi.h  |  24 +++
>  linux-headers/asm-generic/unistd.h            |   5 +-
>  linux-headers/asm-mips/unistd_n32.h           |   2 +
>  linux-headers/asm-mips/unistd_n64.h           |   2 +
>  linux-headers/asm-mips/unistd_o32.h           |   2 +
>  linux-headers/asm-powerpc/unistd_32.h         |   2 +
>  linux-headers/asm-powerpc/unistd_64.h         |   2 +
>  linux-headers/asm-riscv/bitsperlong.h         |  14 ++
>  linux-headers/asm-riscv/mman.h                |   1 +
>  linux-headers/asm-riscv/unistd.h              |  44 ++++++
>  linux-headers/asm-s390/unistd_32.h            |   2 +
>  linux-headers/asm-s390/unistd_64.h            |   2 +
>  linux-headers/asm-x86/kvm.h                   |  16 +-
>  linux-headers/asm-x86/unistd_32.h             |   1 +
>  linux-headers/asm-x86/unistd_64.h             |   1 +
>  linux-headers/asm-x86/unistd_x32.h            |   1 +
>  linux-headers/linux/kvm.h                     |  17 +++
>  hw/virtio/virtio-iommu.c                      |  99 ++++++++++--
>  tests/qtest/virtio-iommu-test.c               |   2 +
>  hw/virtio/trace-events                        |   4 +-
>  30 files changed, 561 insertions(+), 90 deletions(-)
>  create mode 100644 include/standard-headers/linux/virtio_gpio.h
>  create mode 100644 include/standard-headers/linux/virtio_i2c.h
>  create mode 100644 include/standard-headers/linux/virtio_pcidev.h
>  create mode 100644 include/standard-headers/linux/virtio_scmi.h
>  create mode 100644 linux-headers/asm-riscv/bitsperlong.h
>  create mode 100644 linux-headers/asm-riscv/mman.h
>  create mode 100644 linux-headers/asm-riscv/unistd.h
>


