Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77905473340
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 18:52:47 +0100 (CET)
Received: from localhost ([::1]:47694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwpVF-0004zH-8X
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 12:52:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwpTv-0003XT-Rb
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 12:51:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mwpTi-0007Ds-2x
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 12:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639417868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f0LxNXb4IQNUC9OuIExKo2Mj0cTDj2VFL7x6COsjBrU=;
 b=VC9c4svWyA6YXkNkrmZI1zrpQ4OKyXaH5b0T9A8G5d+UKvTf1irPZRdmeSIDVs1MkxC0zF
 jTPIvfxAjA2FBT8cWrh+bZglE9Z6U7s8nIChIBAWEA22x4YW5x8XXicwP5Dv8EiqWth/gm
 ygGLRFc5xYMOZe9kF1/ZsRRfN+KY2tM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-h62SIcfDOJuHH-hCPRhZtg-1; Mon, 13 Dec 2021 12:51:06 -0500
X-MC-Unique: h62SIcfDOJuHH-hCPRhZtg-1
Received: by mail-ed1-f72.google.com with SMTP id
 n11-20020aa7c68b000000b003e7d68e9874so14630011edq.8
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 09:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f0LxNXb4IQNUC9OuIExKo2Mj0cTDj2VFL7x6COsjBrU=;
 b=0gB15Dl8OTypIB4RVheOMULWoAzjDJe8wOOeMziP3p7H/3PJs8kof1zrNsJS6H8CYD
 BvoJLyv1bqego1wu7uNw7A3kRqOH1v97h1NCQyGuwJCROiW3TmovFoFi7ukaVFKWRu5I
 RUUOiINtfZJTowQei52ypSU4UmB8+PfYRWOUTv0KG0UfRfKZ59I09m68a7HmkyIGRSEx
 rEIqVjA7x/YWvpF/CoP63nDC01yC9KT35q1AfwEkTNpcLPmo0XWtvFVnmpusekozkOc9
 usMEi85j5G855ycY7D7qsH0T7tI2lDKuyT4/cQwWKbpWySV7U1H57NM/NHIYWEmftOdW
 awVg==
X-Gm-Message-State: AOAM532wQhlFxi3YfdfQ5HTzXBACA9ouEr1nLEKXkdkWoRt7Hee4MMV1
 kHApDUbB/8DPYDBkgOIKI9NoYekcU3WD06Zgi1EMqHpazdd7iyBiAPuBAskScPWkStUsaarCmnU
 ffhnkYNDAeTHdG2I=
X-Received: by 2002:a50:fe8e:: with SMTP id d14mr282535edt.51.1639417865459;
 Mon, 13 Dec 2021 09:51:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPKKQc89Oj1muhFA5dd/JccOfIjOghXnqAILvZWTHY++iAGGGTuVtRiW95fgLcCsA2kGqdwQ==
X-Received: by 2002:a50:fe8e:: with SMTP id d14mr282508edt.51.1639417865241;
 Mon, 13 Dec 2021 09:51:05 -0800 (PST)
Received: from redhat.com ([2.55.148.125])
 by smtp.gmail.com with ESMTPSA id f29sm42180ejj.209.2021.12.13.09.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 09:51:03 -0800 (PST)
Date: Mon, 13 Dec 2021 12:50:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
Message-ID: <20211213125048-mutt-send-email-mst@kernel.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 05:04:08PM +0000, Jean-Philippe Brucker wrote:
> Add ACPI support for virtio-iommu on the virt machine, by instantiating
> a VIOT table. Also add the tests for the ACPI table.

ACPI parts:
Acked-by: Michael S. Tsirkin <mst@redhat.com>

> Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> series [2] only contained the table and x86 support, which have been
> merged. Everything has now been reviewed and should be good to go.
> 
> * Patches 1-2 add the VIOT table for the virt machine
> * Patches 3-4 are minor fixes
> * Patches 5-8 add tests for the VIOT table. They contain the tests for
>   q35 as well, which didn't make it last time because they depended on
>   another fix that has now been merged.
> 
> [1] https://lore.kernel.org/qemu-devel/20211020172745.620101-1-jean-philippe@linaro.org/
> [2] https://lore.kernel.org/qemu-devel/20211026182024.2642038-1-jean-philippe@linaro.org/
> 
> Jean-Philippe Brucker (8):
>   hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
>   hw/arm/virt: Remove device tree restriction for virtio-iommu
>   hw/arm/virt: Reject instantiation of multiple IOMMUs
>   hw/arm/virt: Use object_property_set instead of qdev_prop_set
>   tests/acpi: allow updates of VIOT expected data files
>   tests/acpi: add test case for VIOT
>   tests/acpi: add expected blobs for VIOT test on q35 machine
>   tests/acpi: add expected blob for VIOT test on virt machine
> 
>  hw/arm/virt-acpi-build.c       |   7 ++++++
>  hw/arm/virt.c                  |  20 ++++++++---------
>  hw/virtio/virtio-iommu-pci.c   |  12 ++---------
>  tests/qtest/bios-tables-test.c |  38 +++++++++++++++++++++++++++++++++
>  hw/arm/Kconfig                 |   1 +
>  tests/data/acpi/q35/DSDT.viot  | Bin 0 -> 9398 bytes
>  tests/data/acpi/q35/VIOT.viot  | Bin 0 -> 112 bytes
>  tests/data/acpi/virt/VIOT      | Bin 0 -> 88 bytes
>  8 files changed, 58 insertions(+), 20 deletions(-)
>  create mode 100644 tests/data/acpi/q35/DSDT.viot
>  create mode 100644 tests/data/acpi/q35/VIOT.viot
>  create mode 100644 tests/data/acpi/virt/VIOT
> 
> -- 
> 2.34.1


