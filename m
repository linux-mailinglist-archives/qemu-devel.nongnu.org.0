Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9870448221A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 06:24:22 +0100 (CET)
Received: from localhost ([::1]:50314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3AOr-0002Be-6e
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 00:24:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3AN6-000180-Rz
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 00:22:32 -0500
Received: from [2607:f8b0:4864:20::102e] (port=40535
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3AN5-0008US-0o
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 00:22:32 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so29715776pjo.5
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 21:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H3LNc3FjkzfcdFc3tj4ZQCzHKkdPl2RrUZpfxzhF/jM=;
 b=d/1AYHQFGXo/R/CovzL+rOeHrqBW+zP5hS8w8H73HDy3oKaw8OCh5VbQugpOOCxuZJ
 uW9nibY7ZYqSGHfBX+o4Yh3ZRWHwl5/E1fKwAR4/V7Wcp8T9WluqylYG/DOr6tk2ZZJy
 DTHaDN26B51ckcTRJ7vtP16rpI2glc0KCO10rIDV/1FKKHe4xStLvbV6uGu4kvnC0iAA
 vFhXPW/WQv79tHvIlocG4iD5H7757iKDj01nxrkZrm919LhRF/JnGSQ8A79jh+w4Kd3k
 lYLoVk30d8SHGlsMwW8l6HOQmNhAtqNSDp1H6J2p384+qdZnCWTYdup9+TlQffPJkd0/
 sIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H3LNc3FjkzfcdFc3tj4ZQCzHKkdPl2RrUZpfxzhF/jM=;
 b=jdPAcKH8qHDcTKO1dhZ65AeiStw8Pv06LuKENLiRj0Co/z5r6+q5tsWZyqmXiJwkBz
 MEbSzdqVTxkz3RAy+P6HcvbYPg+cSdOq9zC/c2WYKI+S5mfpEyFlpdAov+VLBLGbsyNd
 o9LazfKz9D6jOWiifwYAhLbiZQcqHh7PuWp+tn7MZypSn6YmSKipj561hKU/VLFrWJWC
 G7e/nlyZqS0y7h1jLmOzen8DmOrQTxXX+iAJEIwMRCGc0dMnCnnCR2PJzGVVkjtUFjPz
 hSj16iSp9Y6/6P403aBP6OHdlN3kOwkYbCwSPLbFGiYcLcGoEHj92zGfqElMw5U7a+b/
 mjPg==
X-Gm-Message-State: AOAM532CTL46qrkfdto9f4xcojeo8hRSq4SMyU/JuTQwnzlLxIZ+HOdA
 G+NXdr3oeUnC9QGEf1qMLRmeAg==
X-Google-Smtp-Source: ABdhPJxe3Cfu0xh9Mein/ybdMl+boolOfnlYAU0VGNTxWetogSe+11VkIXT/ywFL//wwfvgaVVzLDw==
X-Received: by 2002:a17:902:c94b:b0:149:22af:ed1c with SMTP id
 i11-20020a170902c94b00b0014922afed1cmr33441953pla.78.1640928149449; 
 Thu, 30 Dec 2021 21:22:29 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:23dc:65c4:ecfd:93ff?
 ([2601:1c0:6101:be80:23dc:65c4:ecfd:93ff])
 by smtp.gmail.com with ESMTPSA id 36sm17763500pgq.94.2021.12.30.21.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 21:22:29 -0800 (PST)
Subject: Re: [PULL 00/22] Memory API patches for 2021-12-31
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211231005546.723396-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fe54a136-04b4-61dd-d548-6cfcc16894fd@linaro.org>
Date: Thu, 30 Dec 2021 21:22:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231005546.723396-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/21 4:55 PM, Philippe Mathieu-Daudé wrote:
> The following changes since commit d5a9f352896fe43183ef01072b374e89a3488315:
> 
>    Merge tag 'pull-jobs-2021-12-29' of https://src.openvz.org/scm/~vsementsov/qemu into staging (2021-12-29 14:33:23 -0800)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/memory-api-20211231
> 
> for you to fetch changes up to 4a63054bce23982b99f4d3c65528e47e614086b2:
> 
>    pci: Let ld*_pci_dma() propagate MemTxResult (2021-12-31 01:05:27 +0100)
> 
> ----------------------------------------------------------------
> Memory API patches
> 
> Have various functions from the Memory API:
> - take a MemTxAttrs argument,
> - propagate a MemTxResult.
> 
> Some patches trigger "WARNING: line over 80 characters",
> and a pair "ERROR: spaces required around that '*' (ctx:WxV)",
> both false positives.
> ----------------------------------------------------------------
> 
> Philippe Mathieu-Daudé (22):
>    hw/scsi/megasas: Use uint32_t for reply queue head/tail values
>    dma: Let dma_memory_valid() take MemTxAttrs argument
>    dma: Let dma_memory_set() take MemTxAttrs argument
>    dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument
>    dma: Let dma_memory_rw() take MemTxAttrs argument
>    dma: Let dma_memory_read/write() take MemTxAttrs argument
>    dma: Let dma_memory_map() take MemTxAttrs argument
>    dma: Have dma_buf_rw() take a void pointer
>    dma: Have dma_buf_read() / dma_buf_write() take a void pointer
>    pci: Let pci_dma_rw() take MemTxAttrs argument
>    dma: Let dma_buf_rw() take MemTxAttrs argument
>    dma: Let dma_buf_write() take MemTxAttrs argument
>    dma: Let dma_buf_read() take MemTxAttrs argument
>    dma: Let dma_buf_rw() propagate MemTxResult
>    dma: Let st*_dma() take MemTxAttrs argument
>    dma: Let ld*_dma() take MemTxAttrs argument
>    dma: Let st*_dma() propagate MemTxResult
>    dma: Let ld*_dma() propagate MemTxResult
>    pci: Let st*_pci_dma() take MemTxAttrs argument
>    pci: Let ld*_pci_dma() take MemTxAttrs argument
>    pci: Let st*_pci_dma() propagate MemTxResult
>    pci: Let ld*_pci_dma() propagate MemTxResult
> 
>   include/hw/pci/pci.h          | 38 +++++++++------
>   include/hw/ppc/spapr_vio.h    | 30 ++++++++----
>   include/sysemu/dma.h          | 88 ++++++++++++++++++++---------------
>   hw/arm/musicpal.c             | 13 +++---
>   hw/arm/smmu-common.c          |  3 +-
>   hw/arm/smmuv3.c               | 14 ++++--
>   hw/audio/intel-hda.c          | 13 ++++--
>   hw/core/generic-loader.c      |  3 +-
>   hw/display/virtio-gpu.c       | 10 ++--
>   hw/dma/pl330.c                | 12 +++--
>   hw/dma/sparc32_dma.c          | 16 ++++---
>   hw/dma/xlnx-zynq-devcfg.c     |  6 ++-
>   hw/dma/xlnx_dpdma.c           | 10 ++--
>   hw/hyperv/vmbus.c             |  8 ++--
>   hw/i386/amd_iommu.c           | 16 ++++---
>   hw/i386/intel_iommu.c         | 28 ++++++-----
>   hw/ide/ahci.c                 | 18 ++++---
>   hw/ide/macio.c                |  2 +-
>   hw/intc/pnv_xive.c            |  7 +--
>   hw/intc/spapr_xive.c          |  3 +-
>   hw/intc/xive.c                |  7 +--
>   hw/misc/bcm2835_property.c    |  3 +-
>   hw/misc/macio/mac_dbdma.c     | 10 ++--
>   hw/net/allwinner-sun8i-emac.c | 18 ++++---
>   hw/net/eepro100.c             | 49 +++++++++++--------
>   hw/net/ftgmac100.c            | 25 ++++++----
>   hw/net/imx_fec.c              | 32 ++++++++-----
>   hw/net/npcm7xx_emc.c          | 20 ++++----
>   hw/net/tulip.c                | 36 +++++++-------
>   hw/nvme/ctrl.c                |  5 +-
>   hw/nvram/fw_cfg.c             | 16 ++++---
>   hw/pci-host/pnv_phb3.c        |  5 +-
>   hw/pci-host/pnv_phb3_msi.c    |  9 ++--
>   hw/pci-host/pnv_phb4.c        |  5 +-
>   hw/scsi/esp-pci.c             |  2 +-
>   hw/scsi/megasas.c             | 64 ++++++++++++++-----------
>   hw/scsi/mptsas.c              | 16 +++++--
>   hw/scsi/scsi-bus.c            |  4 +-
>   hw/scsi/vmw_pvscsi.c          | 20 +++++---
>   hw/sd/allwinner-sdhost.c      | 14 +++---
>   hw/sd/sdhci.c                 | 35 ++++++++------
>   hw/usb/hcd-dwc2.c             |  8 ++--
>   hw/usb/hcd-ehci.c             |  6 ++-
>   hw/usb/hcd-ohci.c             | 28 ++++++-----
>   hw/usb/hcd-xhci.c             | 26 +++++++----
>   hw/usb/libhw.c                |  3 +-
>   hw/virtio/virtio.c            |  6 ++-
>   softmmu/dma-helpers.c         | 40 ++++++++++------
>   hw/scsi/trace-events          |  8 ++--
>   49 files changed, 526 insertions(+), 332 deletions(-)

Applied, thanks.

r~


