Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B144460089F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:24:47 +0200 (CEST)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLQT-0002te-Bi
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1okLMx-0007lq-C0
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 04:21:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1okLMr-0000zd-Kp
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 04:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665994860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Aa0XYyZUyNTchAB4/zY6yGvmDZvSZGzwEs6M+KGsT0I=;
 b=a+RP2d0kN2SOsBRt5Fxc2ZI6xJGbGbd7YIUvdXGDbASU8N687L+e2FPzhy8cCJCliQ9jeg
 oui9/3knCj00Z3t8k0qW5F+Kwns1vVBCCJZfPyqCHgyCpK8RbXfRLStePoYyyYwDusqa4G
 YraOMJAYTLGrqtp16z0OiS1w7wv9meg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-17E9zm55NNWJ_eZ17q8pYA-1; Mon, 17 Oct 2022 04:19:34 -0400
X-MC-Unique: 17E9zm55NNWJ_eZ17q8pYA-1
Received: by mail-pf1-f199.google.com with SMTP id
 g3-20020a056a000b8300b00563772d1021so5737689pfj.18
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 01:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aa0XYyZUyNTchAB4/zY6yGvmDZvSZGzwEs6M+KGsT0I=;
 b=k6c6WyeQgreEuNaKG8xGi0S95qJuyeJXIYWDZvP8fWl6tZFZ5T/wqTNW/nhuk85JPj
 Jk1PTh2Q3B0tBKd0P4yi0s9+9tzq0EQClYPsM5Tq8iN+nSweK3WuHIZ4wXJpXzVuWezx
 DA6aczZ3cqcqzD/KUItPtJ3OlrF8h1J1rhGaFEURgFXnLypcdRgf935b0Xun18hq8Hl0
 OpydQrFsiJiN5sPWhk0KWcCpC91DtlYQgQm1JOo2LUgjBOlEZRCpdvL10GNmbBYhGK9T
 KEIk67kAAf3xaV58CXlY8hW2AcSOGw9N8XIBIRBe++M0MeA/q870ziKjxJ5tMDmU7liU
 yiFg==
X-Gm-Message-State: ACrzQf1lY6xeWyMoZg4EmAQBfc5I98Axk/EGj7qkydw8F8F00o0VKDka
 rO05G3EiqLrF5q+PbWRpmyVL8Ql0yJoWx+zIZ5jMh9EO1aFCDWrTlnUJW74OtqMAT5ZPqs2xIXb
 +EieCVwjcX+VOe7HaILS4ZX8VPh4NnWU=
X-Received: by 2002:a17:902:a606:b0:178:57e4:a0c1 with SMTP id
 u6-20020a170902a60600b0017857e4a0c1mr10694050plq.83.1665994773345; 
 Mon, 17 Oct 2022 01:19:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4frGk5p30e8zfPB+lnZfI8YUvIsl1Z6RB17Pb6B0YlXU5Z7cPM++TT8ZSWDGFXYBHSS5SPNb0ISRHNrU5OxFY=
X-Received: by 2002:a17:902:a606:b0:178:57e4:a0c1 with SMTP id
 u6-20020a170902a60600b0017857e4a0c1mr10694026plq.83.1665994772993; Mon, 17
 Oct 2022 01:19:32 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Oct 2022 01:19:32 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20221012163448.121368-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221012163448.121368-1-eric.auger@redhat.com>
Date: Mon, 17 Oct 2022 01:19:32 -0700
Message-ID: <CABJz62OCLNQqrYnenhZsH9KVk_OpExp5otDcS-RZ7dMDz5a_og@mail.gmail.com>
Subject: Re: [PATCH] hw/virtio/virtio-iommu-pci: Enforce the device is plugged
 on the root bus
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, jean-philippe@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Oct 12, 2022 at 12:34:48PM -0400, Eric Auger wrote:
> In theory the virtio-iommu-pci could be plugged anywhere in the PCIe
> topology and as long as the dt/acpi info are properly built this should
> work. However at the moment we fail to do that because the
> virtio-iommu-pci BDF is not computed at plug time and in that case
> vms->virtio_iommu_bdf gets an incorrect value.
>
> For instance if the virtio-iommu-pci is plugged onto a pcie root port
> and the virtio-iommu protects a virtio-block-pci device the guest does
> not boot.
>
> So let's do not pretend we do support this case and fail the initialize()
> if we detect the virtio-iommu-pci is plugged anywhere else than on the
> root bus. Anyway this ability is not needed.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/virtio/virtio-iommu-pci.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

FYI libvirt will already reject any attempts to place the device
anywhere but directly on pcie.0, so from our point of view merging
this patch is perfectly fine.

-- 
Andrea Bolognani / Red Hat / Virtualization


