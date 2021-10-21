Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB664436511
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:07:48 +0200 (CEST)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZfX-0006H2-6i
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZd2-0004gX-Gl
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:05:14 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZct-0007aK-2O
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:05:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id e10so605214plh.8
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UP5j9FBbC46FIrSC2i1YkhYx4mcUupSU+N5eJM4Es/Y=;
 b=KZreq+W/u56MKUPEV4ywIXAXmArHjHe7ViK9tm8oJ/TS6oCcTlphjuz87j98XtPoJF
 EbjwJJXJx03hASXIoifw8xj9H347qs3d+y4hL1r5S5+W1be51aTgD5uD9VHaCKJPGdVj
 nuRbj9jpDDM2Rf0otG6SyDafHIx26vXrd5lsp0f30KqjBKvjiVtb/fOmzzXTLIMorotM
 ig842HNLIfTAJ/fEfO6fiXH1+KZX/MsY6K4FaJAWkvjfA+6WnQ429Nrdjp3Lng35ku82
 Rgo+xX8I9aCnh5yqFl1TifInM8MkJCkmWrfDQnUE/iPgYbKbKz5UWMs5NAWWG6JpdHBg
 x6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UP5j9FBbC46FIrSC2i1YkhYx4mcUupSU+N5eJM4Es/Y=;
 b=uTfUesJXsFlKnyRP4dq/OzeDEWTef4kkxuBiGzaDtaMEAcgGQB8KL37JRTJbPl/pnT
 FBQDuprDyFQZ9Jn2NzaGyjZeavgoYJYATIrjafQ0o0ZQGYwLE/kzt35JWD0bx8nzaisD
 HMeUoPobCQu/ljbhTb6DWl8lNe8I5Cay5dxbqDo5BusZTSw1cInRcFHRJDqNqvBMT1Ug
 8ZDEaU2qkOErEtt6tsdL8Bkc1iPX3YW8E1MgZM9JITD+niP0C55Icz0DLq85gXTizm8Z
 Z1Bp1fH5ZsChBzYPA5PR15no1QgNyHF/+uNwvpiQ/TxHG7154LIP3kDRaEhCWctN6rXi
 8dsA==
X-Gm-Message-State: AOAM532qrZjB4n3Jv+Yz2wWajRzlhtNG6Vkn55On0hAJOPOsd8xl+V7o
 tPuvZLhPXD6QlG3XZjSZxE4K3w==
X-Google-Smtp-Source: ABdhPJwKzDrdK21816qbdyHktRpAs7HSwYGjArgl+qjai2rmMWi6Sh4nrwoSuoNh/P0zU8Uozxxrgg==
X-Received: by 2002:a17:90b:4a01:: with SMTP id
 kk1mr7256947pjb.208.1634828701103; 
 Thu, 21 Oct 2021 08:05:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm10927220pjb.2.2021.10.21.08.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 08:05:00 -0700 (PDT)
Subject: Re: [PATCH v9 0/8] hw/arm/virt: Introduce cpu topology support
To: Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20211020142125.7516-1-wangyanan55@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8cb07ece-22fe-cb1e-30d0-11aecdc0ba70@linaro.org>
Date: Thu, 21 Oct 2021 08:04:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020142125.7516-1-wangyanan55@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 7:21 AM, Yanan Wang wrote:
> Hi,
> 
> This is the latest v9 series which supports exposing vCPU topology
> to the guest for Arm virt machines.
> 
> Description of this series:
> Once the view of an accurate virtual cpu topology is provided to guest,
> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> e.g., the scheduling performance improvement. See Dario Faggioli's
> research and the related performance tests in [1] for reference.
> 
> This patch series introduces cpu topology support for Arm platform.
> Both cpu-map in DT and ACPI PPTT table are introduced to store the
> topology information. And we only describe the topology information
> to 6.2 and newer virt machines, considering compatibility.
> 
> [1] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
> -friend-or-foe-dario-faggioli-suse

Queued to target-arm.next, thanks.


r~

> 
> Changelog:
> v8->v9:
> - add Eric's R-bs, thanks!
> - address Eric's suggestions to update some function comments and commit msg (patch #5)
> - make build_processor_hierarchy_node static as it's only used by build_pptt (patch #4)
> - retested.
> - v8: https://lore.kernel.org/qemu-devel/20211014132206.19220-1-wangyanan55@huawei.com/
> 
> v7->v8:
> - rebased on top of master (commit e5b2333f24)
> - only add one generic expected file for PPTT instead of four, which works
>    fine enough for now (patch #6 and #8 updated)
> - v7: https://lore.kernel.org/qemu-devel/20211007030746.10420-1-wangyanan55@huawei.com/
> 
> v6->v7:
> - rebased on top of master (commit ca61fa4b80)
> - use newly introduced acpi_table_begin/acpi_table_end APIs to build PPTT
>    (patch #5 updated)
> - add reference files for PPTT to fix broken bios-table-test for Aarch64
>    virt machine (patch #6-#8 added)
> - v6: https://lore.kernel.org/qemu-devel/20210824122016.144364-1-wangyanan55@huawei.com/
> 
> Andrew Jones (2):
>    hw/arm/virt: Add cpu-map to device tree
>    hw/acpi/aml-build: Add PPTT table
> 
> Yanan Wang (6):
>    hw/arm/virt: Only describe cpu topology since virt-6.2
>    device_tree: Add qemu_fdt_add_path
>    hw/acpi/aml-build: Add Processor hierarchy node structure
>    tests/data/acpi/virt: Add an empty expected file for PPTT
>    hw/arm/virt-acpi-build: Generate PPTT table
>    tests/data/acpi/virt: Update the empty expected file for PPTT
> 
>   hw/acpi/aml-build.c          |  89 +++++++++++++++++++++++++++++++++++
>   hw/arm/virt-acpi-build.c     |   8 +++-
>   hw/arm/virt.c                |  71 ++++++++++++++++++++++++----
>   include/hw/acpi/aml-build.h  |   3 ++
>   include/hw/arm/virt.h        |   4 +-
>   include/sysemu/device_tree.h |   1 +
>   softmmu/device_tree.c        |  44 ++++++++++++++++-
>   tests/data/acpi/virt/PPTT    | Bin 0 -> 76 bytes
>   8 files changed, 206 insertions(+), 14 deletions(-)
>   create mode 100644 tests/data/acpi/virt/PPTT
> 
> --
> 2.19.1
> 


