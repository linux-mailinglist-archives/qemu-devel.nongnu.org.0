Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5AE4CBD01
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 12:43:56 +0100 (CET)
Received: from localhost ([::1]:37426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPjsA-0001u5-Un
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 06:43:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nPjqZ-0000Ol-OJ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:42:15 -0500
Received: from [2a00:1450:4864:20::62c] (port=38706
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nPjqY-0007Fi-0s
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:42:15 -0500
Received: by mail-ej1-x62c.google.com with SMTP id r13so10055030ejd.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 03:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DSVjYL36JXmnJT2z9zSXM95gTfWQAKktwXsar/RYgYo=;
 b=RfvDQz/4O4MiEgM19CHgEv7W04uYRZ3fui27tOyTj/+2Zqb97H+e4PjETCfsjz9uwq
 Gh9CnjMIYhOzvCMwUFxQVtO02T5KwHqv7O/Yh5Nh7KB0LEBL6s2EOXUFoLakWBmk8vjX
 i77ac+XZgoHeZd2O6tNUTSDTFZIikHU5IEPZSWArzucYknrla0EXKnxZb/T7YagyVyTi
 paAaTCnqNQan+jWw2xmIKLhxHHUvyQUSuakpGwvGpSjs33ZhX0bL5YCOxiFGReuwYaug
 oqUO4Fc5GLNEALjQ6vQoFuoDgLGtmUPKw/0e/WGaBscSswoLG88AyYlnFyrmTMiz0huW
 ODWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DSVjYL36JXmnJT2z9zSXM95gTfWQAKktwXsar/RYgYo=;
 b=KdfyiNYLfxclgDnrrwDPBAyRz518Zlt/oSSCQNCKnfEY7DUT+211Syqlm4z9xrWqg2
 kfjCv2x08zRL8OMQZsY/F+FshWYE9neTDadudephtkVIW25AWNwVFayzo+dBi3FTLa6P
 alnVukgSdQDP+7IQvZAt+5qnWxgMoE35m4qmGz0eSufKIHUXIxZYji3Z5Le+7kFMV9u2
 aSkj47fLWq/yvr3ndFZkoozBajQ4uUlTX+9lwKgNDK/XvpGPB8ZWKa118qFdAB9qUb/5
 qgQLy0S14GefDfTQiMQWCI5CPUxa2YZQ/gFbGeI+fHhoXB73OkZPJuZUbY5AjsAZHDjs
 RanA==
X-Gm-Message-State: AOAM531Q98x8ZhoUhNPeWAaFKps7ovMal6JoyTsngIJW5tLY+n79lxEN
 /iyhd6ONMgMcoQirLLPi8F8HyA==
X-Google-Smtp-Source: ABdhPJzCTvEIN/2ne0jVo2Z5jAAQIJnC+fWi+1Wn/ChBnq2q+v6J16vDprhGv0Mk0zDOcL6ZJ/NmPQ==
X-Received: by 2002:a17:906:2daa:b0:6cf:3c6:dbb7 with SMTP id
 g10-20020a1709062daa00b006cf03c6dbb7mr26564290eji.688.1646307732015; 
 Thu, 03 Mar 2022 03:42:12 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 l2-20020a1709066b8200b006bbea7e566esm616063ejr.55.2022.03.03.03.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 03:42:11 -0800 (PST)
Date: Thu, 3 Mar 2022 11:41:47 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com, mst@redhat.com
Subject: Re: [PATCH v3 0/4] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
Message-ID: <YiCpe6iJFprJkMGK@myrica>
References: <20220214124356.872985-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214124356.872985-1-jean-philippe@linaro.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, pasic@linux.ibm.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Mon, Feb 14, 2022 at 12:43:52PM +0000, Jean-Philippe Brucker wrote:
> Replace the VIRTIO_IOMMU_F_BYPASS feature with
> VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
> global bypass on and off.
> 
> Add a boot-bypass option, which defaults to 'on' to be in line with
> other vIOMMUs and to allow running firmware/bootloader that are unaware
> of the IOMMU. x86 doesn't need a workaround to boot with virtio-iommu
> anymore.

I just wanted to make sure this doesn't fall through, since it is ready
for v7.0

Thanks,
Jean

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
> -- 
> 2.35.1
> 

