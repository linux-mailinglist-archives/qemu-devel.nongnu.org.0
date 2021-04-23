Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E16369661
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:50:08 +0200 (CEST)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZy4F-0001Sn-SP
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZy1x-0008Co-QK
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:47:45 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:33328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZy1w-0006nC-0w
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:47:45 -0400
Received: by mail-ed1-x52f.google.com with SMTP id cq11so14331302edb.0
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 08:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WJ1mOnEQawnDTav1PjlzvDG2KS/bnLX7DV8t4wpSdp4=;
 b=YbY4DeQBVbyWktJKiHBC1Xqwm9yH6TIDD1S6djVTz55xpsJR4BV/zKDS509d9CHjN0
 ukbFKx14r2e6zeXS9Vkdn+AWVneLQn7Cv/WTzrPATSN0N1AKJn4uNJZa0uHquyo9kPWh
 vjxJC2nQEQSUUSBlV261G5kwJwSP/zCLv3P21xO6IRowaisFVNEuNsIzq4J/ivTbfnan
 VjBRbz/K74US90961nnY1fAjNVv/U1RdszvxQR7sVBtvGB8QinSzX3AMX4RfR7l1gkZF
 rJb7p2PkH31Cp/duMpzZ5qQ/t73Nxy7FzfkHGiFWGAxR+2kO4IB6bxtvh1SsGBEkHhJU
 oN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WJ1mOnEQawnDTav1PjlzvDG2KS/bnLX7DV8t4wpSdp4=;
 b=V5403vPSRluUbReSAJpXVq54o3wsf2virTV5C6fk6a5BRzAW8jiyVicbiYA1+Odsd0
 xsvBOkMsOGZ3vmia4oK/OXHIMRS++MWpV9/ZiKXbFMLxN6CaM9OF8CVsDGszg/0wutYd
 ofAXAYD8BTENR2vet8cdzVGFjybFuIZvCrzCqVHe4FdPnmeSCwnx02zOPj3JYCkOEO9B
 adWd+LP0XqGmCM2Rwy33Ipd3cxHCiPAd/anSw1VHhqaF1Ll/ltQe2hEb4pDdw6WvhdGj
 KiHg8LZL6RyaFhOAX1uFURTdJ/PrPayAa31bIXDRSEm3843E+v8Df92A418QtCujo2N1
 l76Q==
X-Gm-Message-State: AOAM530kkmMbsJdYHvNf8bsqVEZOmiIThaAjBW0wIAC/Pm/bQafzT0yb
 h+nFLbxg0qFje8GbNmGcHku8LY/s9qDSjjB9IuC7EQ==
X-Google-Smtp-Source: ABdhPJyuvSiLP+bGzuz15L4h1lgRjHA6NvGzxSh6sy9bX7vLZBfjANGsho8Bel/PJa2oDQ++cZUZckHN+MwXa37ddW8=
X-Received: by 2002:aa7:d28d:: with SMTP id w13mr5195141edq.251.1619192862574; 
 Fri, 23 Apr 2021 08:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210423052127.512489-1-its@irrelevant.dk>
 <20210423052127.512489-2-its@irrelevant.dk>
In-Reply-To: <20210423052127.512489-2-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 16:46:47 +0100
Message-ID: <CAFEAcA-k7fgH_JqBDqbtNuuBtOO4EEJO6T3YS06t5_CjPFuh+w@mail.gmail.com>
Subject: Re: [PATCH for-6.0 v2 1/2] hw/block/nvme: fix invalid msix exclusive
 uninit
To: Klaus Jensen <its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 06:21, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Commit 1901b4967c3f changed the nvme device from using a bar exclusive
> for MSI-x to sharing it on bar0.
>
> Unfortunately, the msix_uninit_exclusive_bar() call remains in
> nvme_exit() which causes havoc when the device is removed with, say,
> device_del. Fix this.
>
> Additionally, a subregion is added but it is not removed on exit which
> causes a reference to linger and the drive to never be unlocked.
>
> Fixes: 1901b4967c3f ("hw/block/nvme: move msix table and pba to BAR 0")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 624a1431d072..5fe082ec34c5 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -6235,7 +6235,8 @@ static void nvme_exit(PCIDevice *pci_dev)
>      if (n->pmr.dev) {
>          host_memory_backend_set_mapped(n->pmr.dev, false);
>      }
> -    msix_uninit_exclusive_bar(pci_dev);
> +    msix_uninit(pci_dev, &n->bar0, &n->bar0);
> +    memory_region_del_subregion(&n->bar0, &n->iomem);
>  }
>
>  static Property nvme_props[] = {

Looks plausible, but if you want this in rc5 could somebody review
it, please ?

thanks
-- PMM

