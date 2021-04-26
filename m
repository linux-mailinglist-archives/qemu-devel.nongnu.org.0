Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAEF36B5BF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 17:26:48 +0200 (CEST)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb38J-00083F-MJ
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 11:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lb36V-0007ER-1z
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:24:55 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lb36T-0001UK-C0
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:24:54 -0400
Received: by mail-ed1-x535.google.com with SMTP id z5so29718794edr.11
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ZeKBskqJEItaDMuNuz8UazwRPj/yOTK7rQN3mM3riY=;
 b=wHmhGOgO9GxbZTadlvJ6mEwnrzcH19UwUi/NnyzPjrJi/DQ57f5XshyI2Q/wLPvafK
 BKzHvlyMJ7AUuqXdxHRPDQ+W7YXDhjtidNGSFqNBfZxw7ujQpS8y2xrkq7HA7cu+71ht
 pBicRbbLsS0Zn8FnfCjmx9f1umAAWKJuF5GcI+pLOSgH4g1ej0phNRwzUb+bVCC/A5S1
 +ny0q+vjl3yyXLQ0uZFfhlnoN+6TV18L/T7LamuRJiZyacGsE61pltwsAKTNVjdSks3G
 CztiJSt2miZJY16K9w4JxLZ1Vg/PbNSDiGZICO6BAIn77s7oE83kr/+a67w33dNLQV8P
 sJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ZeKBskqJEItaDMuNuz8UazwRPj/yOTK7rQN3mM3riY=;
 b=AlnHFaoPePQo2cKu+bLDRYy3PwJ9uiXW7BEv+BqHteBEEM97EIsdN7NYk2RhQfnLMt
 DixzVwQcQKRqYFlnXZkQyrvH2DTk9C0XD1BwckkDO7AKmDIVDv25koeht3LShGyt8gDq
 rrWAxbBqoMjociA9MzBaP0N8621roS49VkUhqWeh5kGDDfvzcLxz85zVI7oyw+RNffS7
 loXhAT3BicWQAba+7enzSWcZ1HL8fXs8KhuZsiOMSQ+3Ta8bWNS2Dmkk45dGnbPztRjO
 /rCv+EKR/fW/d0jcTuAF2sVVMmMzOoEJfX4RXCYzTwQ9SCsj1Mg6gvAmxdMkGv+edDcW
 JW9Q==
X-Gm-Message-State: AOAM533siH0k6UICRinANeihTumxmaoZrMryobg7m8MjXAGbstdz39oY
 +Z2m9L/+S8AiQZhrvgZDIeBRm5ph9YsTgX6Qlbu37A==
X-Google-Smtp-Source: ABdhPJxTNT0qBInXGPC7GxHdo7U3fwxXgck6r+Qf2nhVrUcZ9kMm2ZrfsK9ku6HlURE4b3lsO4O7KcAA9zVS13oLY/U=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr21497894edv.44.1619450691552; 
 Mon, 26 Apr 2021 08:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210423052127.512489-1-its@irrelevant.dk>
 <20210423052127.512489-2-its@irrelevant.dk>
In-Reply-To: <20210423052127.512489-2-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Apr 2021 16:23:53 +0100
Message-ID: <CAFEAcA8c39XfjjKp74zMLSiS+RFjX00kpiCrSGTOGqczBb=V+A@mail.gmail.com>
Subject: Re: [PATCH for-6.0 v2 1/2] hw/block/nvme: fix invalid msix exclusive
 uninit
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
> --

Applied this patch (but not patch 2) to master for 6.0; thanks.

-- PMM

