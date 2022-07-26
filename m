Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C82581BDB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 23:57:06 +0200 (CEST)
Received: from localhost ([::1]:36816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGSY5-0005IV-MU
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 17:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGSSn-0001v7-Ro
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 17:51:37 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGSSl-00016Q-Vu
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 17:51:37 -0400
Received: by mail-pj1-x102d.google.com with SMTP id y1so6475988pja.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 14:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yP7ZaLRd8QdOoe8uOfYOxdnz0I0b44XKcQkvqRYwsq0=;
 b=FV6qFrFj91tqhSvzpPHm7fDEqlC8BGUF5WJ3FDBNvtpVKiYy+hgnvIRX0hMAhpLNt/
 u+2pgl71yu1+qu40ZYTUcmGN7++IKkpTvwO3TsA3jJAvCe41f/BX+9NHhdk75a+mr7Qj
 M0/z1J0h/2oKXpmmu3UciU/71NeETEWl6zLF+2IL+Wy8LxFUIXFcjvUqzInoIPnsfiN0
 wd/ROhByFm46dXqQvs22Bu4SxU+KKrlwPOhneaXC8Mc2z7ZGjQ5vgXzeZOof3Ork85On
 8D28VbA/Y0lDVw5Tz0qdg/vD7/qBeGzLaHoMZ9RtGsmGmB0ezuwonJeeey6NA3m2U380
 9yTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yP7ZaLRd8QdOoe8uOfYOxdnz0I0b44XKcQkvqRYwsq0=;
 b=Rw8vv5nSCJz26ZSdrW1Pm5UmSAnBTP+EJoipJ34GJIq+rZGNIb874ysm2JoJoqBa2b
 ldxAGQDauTc5z1j/bQ2hAMDqDXnWIgpezcAhhJTN68SxhN6fRSYbERVAFPB46TaDZyvi
 akxxd6RN4ZeSawttZdA2mWON2n7Cb4jQg9PZQNvbK4NQoWspdJA42Ljnk6oDaAWdl5D3
 HXngjEwNrv/vylWwRC6vsEUwYsHXDf+8IoTd/BZnFZ+jN/qAITHHS4S0S0v1KG9e1gh2
 hRwgVlcTrz+rJ6HlY12ZrmOSMLIZ/Axd3D5F8XgcUYHAfN7FkovuuQYm/PyRmqYwAsJf
 YKJg==
X-Gm-Message-State: AJIora8cd0UfaVRxsJSfg1Zxg5ayu0SxT+pCvILlMJjQ1JlejTTpByeo
 0J0zcqJpCI+PV/Zg7k8he+zNAw==
X-Google-Smtp-Source: AGRyM1sWfYQFRAd1voY5hR5UNUtfEuSk7LdvflgP7DtwHey02WgrlMdTTFRsT1aEXYzFUCiziNgppg==
X-Received: by 2002:a17:90a:2ec5:b0:1f2:ea66:c832 with SMTP id
 h5-20020a17090a2ec500b001f2ea66c832mr1084190pjs.31.1658872294344; 
 Tue, 26 Jul 2022 14:51:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:33b:7a10:8a4c:53bc?
 ([2602:ae:1549:801:33b:7a10:8a4c:53bc])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a170902650200b0016d1d1c376fsm10582007plk.287.2022.07.26.14.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 14:51:33 -0700 (PDT)
Message-ID: <dfa73e9a-9e2f-3b4b-b370-8ff40126eb32@linaro.org>
Date: Tue, 26 Jul 2022 14:51:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 00/16] pc,virtio: fixes
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220726193858.177462-1-mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/22 12:40, Michael S. Tsirkin wrote:
> The following changes since commit d1c912b816844aa045082595eba796b5a025dbc4:
> 
>    Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-07-26 13:29:26 +0100)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 0522be9a0c0094088ccef7aab352c57f483ca250:
> 
>    hw/virtio/virtio-iommu: Enforce power-of-two notify for both MAP and UNMAP (2022-07-26 15:33:29 -0400)
> 
> ----------------------------------------------------------------
> pc,virtio: fixes
> 
> Several fixes. From now on, regression fixes only.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Jean-Philippe Brucker (1):
>        hw/virtio/virtio-iommu: Enforce power-of-two notify for both MAP and UNMAP
> 
> Joao Martins (11):
>        hw/i386: add 4g boundary start to X86MachineState
>        i386/pc: create pci-host qdev prior to pc_memory_init()
>        i386/pc: pass pci_hole64_size to pc_memory_init()
>        i386/pc: factor out above-4g end to an helper
>        i386/pc: factor out cxl range end to helper
>        i386/pc: factor out cxl range start to helper
>        i386/pc: handle unitialized mr in pc_get_cxl_range_end()
>        i386/pc: factor out device_memory base/size to helper
>        i386/pc: bounds check phys-bits against max used GPA
>        i386/pc: relocate 4g start to 1T where applicable
>        i386/pc: restrict AMD only enforcing of 1Tb hole to new machine type
> 
> Jonathan Cameron (3):
>        hw/machine: Clear out left over CXL related pointer from move of state handling to machines.
>        hw/i386/pc: Always place CXL Memory Regions after device_memory
>        hw/cxl: Fix size of constant in interleave granularity function.
> 
> Robert Hoo (1):
>        acpi/nvdimm: Define trace events for NVDIMM and substitute nvdimm_debug()
> 
>   include/hw/boards.h            |   1 -
>   include/hw/cxl/cxl_component.h |   2 +-
>   include/hw/i386/pc.h           |   4 +-
>   include/hw/i386/x86.h          |   3 +
>   include/hw/mem/nvdimm.h        |   8 --
>   include/hw/pci-host/i440fx.h   |   3 +-
>   hw/acpi/nvdimm.c               |  35 ++++---
>   hw/i386/acpi-build.c           |   2 +-
>   hw/i386/pc.c                   | 209 ++++++++++++++++++++++++++++++++---------
>   hw/i386/pc_piix.c              |  15 ++-
>   hw/i386/pc_q35.c               |  15 ++-
>   hw/i386/sgx.c                  |   2 +-
>   hw/i386/x86.c                  |   1 +
>   hw/pci-host/i440fx.c           |   5 +-
>   hw/virtio/virtio-iommu.c       |  47 +++++----
>   hw/acpi/trace-events           |  13 +++
>   16 files changed, 258 insertions(+), 107 deletions(-)
> 
> 


