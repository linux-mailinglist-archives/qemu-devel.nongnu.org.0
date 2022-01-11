Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9772D48B214
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 17:27:04 +0100 (CET)
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7JzB-0006Lx-Tt
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 11:27:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1n7Jx5-0004gK-VB
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:24:51 -0500
Received: from [2a00:1450:4864:20::42c] (port=43806
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1n7Jx4-0008H3-5A
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:24:51 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o3so33958702wrh.10
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 08:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NMx5Wbw7tnMVVLy5MhSyzmefi7KZmSocCWv4HupI3Oc=;
 b=g6msjgQS6UXHtFM1oyHLIrjiF2bkOn07/JNxOZ2LZkrZYaBTeOKpMdabEbCWM2rDsP
 exhhG071kiA9ad+AoisBLKruLhznmJlLG7A76kX2UEqHLlt7H3zjyN9hSTDFClpnLIYK
 JFIPa2t8HSVm4nJ2jB36XNlB5aDG6l/TYaCZN/2kzEYw3EpyDcVpZrO6Zuj+4WOhq+5u
 PqaRVcYnX1k6CbzKx3YmLJzAyzOU96Qy6xPxFnqYG6Ih9MwkiwM6x12PMvteq9kD00HV
 6QT0w03y8JGsBmjwUx7/lfAny5cUuujPcSuFSski9lc/Zg8G8r8yO+42HszgE5AbEkLm
 EKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NMx5Wbw7tnMVVLy5MhSyzmefi7KZmSocCWv4HupI3Oc=;
 b=mz9vO/UYVJ59SrAsOMdZWk/Ro4ucPJMaxSXP4rV68YsZ+/Gr87tK2eJgm1dabell0H
 h5ixsS8psp1y4WORp3rKtAx0M7R377iXwF/N0HoSEXGquau+Jk7yZm+KnzP23nRFJ7/1
 2lJCoRod7+Y1xHGa82BQ83Ose0Yg/bgpuTaHGSTQ/UXhhBMMg25Y5Gyhcty4vG5hvo/d
 wmnLU9oaLqklrFizzvTOO3CYwFiisme7se0MhJ3ubHhKM05AnCZFbPlcczzdG6KkBuUm
 jdZ0grZZpm2Q0t2zFOfJKBZ98R2oN+/Il1PHeq2oMvxsWUI+UrMeHm06dn0ba1abCapD
 NtPQ==
X-Gm-Message-State: AOAM530gcUMfbTWJc6GnccNzmGrlZXF2v6VrUdEbLo0KrvtZ+JYD7Gt4
 kD788JnKXN3ys1gPPXkEjzWLRA==
X-Google-Smtp-Source: ABdhPJwUSsJuorDiLbGStyaJKp5km1r+Cton3XZ246qSoLzzH8TkAPtKg6QRpUFl3qI8b6z5vWvuqA==
X-Received: by 2002:a5d:64c2:: with SMTP id f2mr4534674wri.483.1641918288520; 
 Tue, 11 Jan 2022 08:24:48 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id q3sm9738211wrr.55.2022.01.11.08.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 08:24:48 -0800 (PST)
Date: Tue, 11 Jan 2022 16:24:25 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/3] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
Message-ID: <Yd2vOZjmBdJ5O8wI@myrica>
References: <20210930185050.262759-1-jean-philippe@linaro.org>
 <a98b63f9-000b-7647-0ac5-3e6e5ec7f6a7@redhat.com>
 <20220111103917-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111103917-mutt-send-email-mst@kernel.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On Tue, Jan 11, 2022 at 10:40:28AM -0500, Michael S. Tsirkin wrote:
> On Tue, Jan 11, 2022 at 10:02:12AM +0100, Eric Auger wrote:
> > Hi Jean, Michael,
> > 
> > On 9/30/21 8:50 PM, Jean-Philippe Brucker wrote:
> > > Replace the VIRTIO_IOMMU_F_BYPASS feature with
> > > VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
> > > global bypass on and off.
> > >
> > > Add a boot-bypass option, which defaults to 'on' to be in line with
> > > other vIOMMUs and to allow running firmware/bootloader that are unaware
> > > of the IOMMU.
> > >
> > > See the spec change for more rationale
> > > https://lists.oasis-open.org/archives/virtio-dev/202109/msg00137.html
> > 
> > I guess the kernel bits should be merged in 5.17?
> > 
> > Thanks
> > 
> > Eric
> 
> They are in fact in my tree and set to go into 5.16.
> They've been in linux-next for a whole cycle now.
> But if you feel I'm rushing things, pls let me know.
> Also, pls let me know whether my tree actually works well for you!

Thanks, unfortunately I just noticed that those patches are from an older
version of the series, the latest being v3
https://lore.kernel.org/linux-iommu/20211201173323.1045819-1-jean-philippe@linaro.org/

Since Joerg picked the latest one in his tree [1], I was wondering if you
could drop those patches?

51a4c54f35ae iommu/virtio: Support identity-mapped domains
523e55a406aa iommu/virtio: Pass end address to viommu_add_mapping()
97301219dfb2 iommu/virtio: Sort reserved regions
720552613526 iommu/virtio: Support bypass domains
01444b9c772f iommu/virtio: Add definitions for VIRTIO_IOMMU_F_BYPASS_CONFIG

Thanks,
Jean

[1] https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/

