Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12A530BD18
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:32:13 +0100 (CET)
Received: from localhost ([::1]:57340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6tum-0007nR-NQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ttL-0006rU-K6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:30:46 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ttJ-0007A3-Ad
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:30:43 -0500
Received: by mail-ed1-x530.google.com with SMTP id s11so22511087edd.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 03:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bt+dYY2pkiqPZWPFbHC8cz9MZjZKp5MQ/pRCU/SrHOs=;
 b=FbQclkpbyhTlruUmwTiRuEC7hTtMoWc/BAdokeOqyz6CSj3upu9Xk/0NIoAZFQutFF
 GE/9JlvCOEovrTl0qtZXPNoVMxNLzts1JLa0cs7Pmt6HW+glJnSZ6vh6UEPFcKtTQx+x
 UTsMv6jjPt6ohtDGVM2gsnfiaLFonkzTEnsaIddwtmE0P5j9oMYYQnw6iS2dLMLUs/TJ
 8bOazObtYnJSZcwaDmM/3CaYusaM1XOu6CEUidcAwodZ98OiXhlQMM6o2DgK6hf5Mu3q
 6/PYI1ztE3OSgQcIFNyuAOoxpwfesWZco2AVfVrk3YAH4uzIEIVL3HkrppkVeelXoFEp
 AdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bt+dYY2pkiqPZWPFbHC8cz9MZjZKp5MQ/pRCU/SrHOs=;
 b=s71TSyBG73I3iiK1jjatXNP53L6QRT+HLcxn14bovrGrYt7iD4cbkmLg5Kkd5lM23k
 Ym2DvlDSXUYuYszb1zCEFykvjzqHH8P7yQBP7sHVCurR3prQX7JqGy/nESH7/ZScmg3f
 YWfEVsJlJCKQgoYGAxL8it9ljKdH5DrCMJwAq/V8fAUYmIxUU9i8NkOlwWq5kCfRkPuV
 8qauWt2Z/50aB1Qi9VMz6LklTfbZScBWI8jTy9//ksOOpEv7408b8uG1AEJt0UX7qu/8
 ZCwb0jjeGmQ+zCqrOOKfbl5FB2dJCdH1rbCHAvrITHxmkDaLqlqt3WX1qSnNkesfJWQL
 SSTw==
X-Gm-Message-State: AOAM531LZEYyZYcWao6nwjlzGRfYfB1ZrLo3b/W80+he6+SbQOW96UWE
 12PAqYBTJ6709HrHIB+CGr9ewuxLzUEJMN92PLQFvt+hpeM=
X-Google-Smtp-Source: ABdhPJym7lb1LFNc3Qkfj9gfdHWmGs5897h9NuqtxigRQywyaHzep+yWgW8DuuST2GZ4dI6L6FEdsHQVx7288UINK+U=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr22976255edd.52.1612265440060; 
 Tue, 02 Feb 2021 03:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20210130043220.1345-1-yuzenghui@huawei.com>
In-Reply-To: <20210130043220.1345-1-yuzenghui@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 11:30:28 +0000
Message-ID: <CAFEAcA_eKjhj1262WV-cKGC6dN2JSYsVGME05VFjjj21HgL+Nw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/smmuv3: Fix addr_mask for range-based
 invalidation
To: Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 30 Jan 2021 at 04:32, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> When handling guest range-based IOTLB invalidation, we should decode the TG
> field into the corresponding translation granule size so that we can pass
> the correct invalidation range to backend. Set @granule to (tg * 2 + 10) to
> properly emulate the architecture.
>
> Fixes: d52915616c05 ("hw/arm/smmuv3: Get prepared for range invalidation")
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
> * From v1:
>   - Fix the compilation error
>
>  hw/arm/smmuv3.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index bbca0e9f20..98b99d4fe8 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -801,7 +801,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>  {
>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>      IOMMUTLBEvent event;
> -    uint8_t granule = tg;
> +    uint8_t granule;
>
>      if (!tg) {
>          SMMUEventInfo event = {.inval_ste_allowed = true};
> @@ -821,6 +821,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>              return;
>          }
>          granule = tt->granule_sz;
> +    } else {
> +        granule = tg * 2 + 10;
>      }
>
>      event.type = IOMMU_NOTIFIER_UNMAP;



Applied to target-arm.next, thanks.

-- PMM

