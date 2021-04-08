Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7E3357F76
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:37:56 +0200 (CEST)
Received: from localhost ([::1]:46440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUR6p-0005oS-CC
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUR4B-0004Gp-R8
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:35:13 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUR44-00025y-3N
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:35:10 -0400
Received: by mail-ed1-x52f.google.com with SMTP id s15so1586672edd.4
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9fr384F81qEzKYWkp9qk5hm7AyIcUmksTmvWTPcHgO0=;
 b=YEhDysH1i4QP75ZWTdGRWjHF3n/huONBfBk1gtyx/U37knWsscbT8F0j6kTs8+swix
 p4u6BzXE9lZ9wU06k1vqbHkhgzJLMYCja0XX/k1IZyCM55NRFFPb2+uvQW+Pak824sZh
 +tAdq462uqOehswddqHTaaSNGV2jkwHzl5lORZ2HsmqaK4a+Z0buntRpov9Y1ElVgjKA
 fKilkYVua2fHPe88al5DUxeDyu9vjrpHsotIFRmovJ/ulb0WI079ogMIwD9AIoUI4r7m
 L2gT2FWfbR5dheNlhppvU5RMRWOWvE1JVx6vNQ7AsYUHMl68pT2xdnwCW4xxZeIX5MRM
 O8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9fr384F81qEzKYWkp9qk5hm7AyIcUmksTmvWTPcHgO0=;
 b=GSE4GVWKU5hDpGDIufgF+XlknbpNQJ+qMPckUfzwUrm2fSuZl+Gtbgo2CoEvO/Gm8W
 3FC3owQuALASa+VdLyRF4x1qOkW4QDJaOToPXM/jqiVm84NlwdJlgUmWBVxGw7jmq4DX
 tjIucoJcyjgQ/X/oSVMbtbCqHK2C7fAd4mZl/Y3igyyKlFhAY3tLq5lw1PT5UYfjL+EB
 EtGZZit0MwJV6TUnf4tGYwNhw6LsI46cUtM5G3AHbkjaYFbVfIFBG2G6QIlw1pwQTDZT
 zgBD6cPypluh6taD3+vyNlRdQSBEMYuy2K6imA60K/KTBw1RrDUskWNn7B6olTnF6ELn
 fcjA==
X-Gm-Message-State: AOAM533ovNYJx1oo/w7Kjd6Bl7jL+inmu8yW3qROAkTKAXKOKwbIoq4a
 PxzFbN5tzrV+jyvd7hMsrrjzC4MCudgcb3mHrmQZIQ==
X-Google-Smtp-Source: ABdhPJz8A5JUGlnEHyCtdIvO1SO4FH0wwH4afA9NG2ntKEfXTYHF7dcMKFLF1hZQvDGVUZwy0n9ZU8DGyIA9RcItVQM=
X-Received: by 2002:a05:6402:2746:: with SMTP id
 z6mr10186765edd.146.1617874502688; 
 Thu, 08 Apr 2021 02:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210402084731.93-1-yuzenghui@huawei.com>
In-Reply-To: <20210402084731.93-1-yuzenghui@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 09:34:22 +0000
Message-ID: <CAFEAcA9Bisg-2u9Pc1vqUY6F5rUEQTd-sEgy_a5DiLoMAy=5+A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
To: Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com,
 Prem Mallappa <prem.mallappa@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Apr 2021 at 09:48, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> The GSIV values in SMMUv3 IORT node are not correct as they don't match
> the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
> our emulated vSMMU.
>
> Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f5a2b2d4cb..60fe2e65a7 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -292,8 +292,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
>          smmu->event_gsiv = cpu_to_le32(irq);
>          smmu->pri_gsiv = cpu_to_le32(irq + 1);
> -        smmu->gerr_gsiv = cpu_to_le32(irq + 2);
> -        smmu->sync_gsiv = cpu_to_le32(irq + 3);
> +        smmu->sync_gsiv = cpu_to_le32(irq + 2);
> +        smmu->gerr_gsiv = cpu_to_le32(irq + 3);
>
>          /* Identity RID mapping covering the whole input RID range */
>          idmap = &smmu->id_mapping_array[0];
> --



Applied to target-arm.next, thanks.

-- PMM

