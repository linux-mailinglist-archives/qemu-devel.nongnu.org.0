Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C45A3C644B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:54:13 +0200 (CEST)
Received: from localhost ([::1]:39762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m320K-0001UQ-LW
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m31vl-0001r0-LB
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:49:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m31vi-0006DT-Ko
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626119365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VglE1nzvJzSAFhKD0U4DV8uK4swT3aiO6J6hKirGq3Q=;
 b=aASQODMa6nbrcK7VO86MNfX7laOKqi5GYUhcQhgBAfJo6IsfeYByABNTGxuf4uUNMNbTVb
 HPfIQy+vMlr6XbSJXAgCMSlRGna99kg4AUVqh+M3WPa0MvrsCynQZaCSyc4viMnQqmHl/f
 5WFiOI/tBbmy8xZsFpZPGWuPsdpy6c4=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-g9LHoRP9Oz6_c8xPdTjyyA-1; Mon, 12 Jul 2021 15:49:24 -0400
X-MC-Unique: g9LHoRP9Oz6_c8xPdTjyyA-1
Received: by mail-oi1-f200.google.com with SMTP id
 64-20020aca06430000b0290240ce72dd5eso13803043oig.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 12:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VglE1nzvJzSAFhKD0U4DV8uK4swT3aiO6J6hKirGq3Q=;
 b=WWfxhwvbRvsgubYBggbbjbQabKLlJ6DdVPgg+/61JAijA7p6C6X6AlKId9cdwvG6YH
 UjKl/aHB41czbw1PfVsh8oPA3pAZZ7B3L286pHTpGBBZLhCNVSE27fjNr7Gll9HUZlm+
 lxRzH1CWjHq7jTaMnGT6zZBUbJibMup8kRf1pd/0S3H2VmygaQYXj3AF2h1qOOxqr3sA
 gL4fkejo4oQ+8vFN9a66DrP9EddK6lYSMIAu+qTFOGaGkryIiwDix3Nc28fKaB1C1MZN
 XXfcCGKh4FtftkWrCVi2UJEEtk92beeN6DQq02OCHKw+wg/gFpPgroVqPtjUkBoUm7jB
 KCoA==
X-Gm-Message-State: AOAM531YvV/CQwzYm14t1eNQ3ai+WFM0V6Z82BH5Wk9PSIQCUpk3Mk8E
 f97qERGONIFMbYT/3C56iepLgRhi7fMcI0bbzJijM1gwDacLnDH98D4BhC/wONs9xyGdVI/NVM2
 2aaQ1cl8qL0IAOjQ=
X-Received: by 2002:aca:3904:: with SMTP id g4mr11456706oia.129.1626119363587; 
 Mon, 12 Jul 2021 12:49:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4PYnvkVygIEknGqt5hKhcHfBdkooiKa6ok7h66xZM2ZWq57htmD2dW3l7rICoize6vmFN/Q==
X-Received: by 2002:aca:3904:: with SMTP id g4mr11456699oia.129.1626119363436; 
 Mon, 12 Jul 2021 12:49:23 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id v203sm3397743oib.37.2021.07.12.12.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:49:23 -0700 (PDT)
Date: Mon, 12 Jul 2021 13:49:22 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Subject: Re: [PATCH] vfio/pci: Add pba_offset PCI quirk for BAIDU KUNLUN AI
 processor
Message-ID: <20210712134922.510d0cff.alex.williamson@redhat.com>
In-Reply-To: <20210712033655.390-1-caihuoqing@baidu.com>
References: <20210712033655.390-1-caihuoqing@baidu.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 11:36:55 +0800
Cai Huoqing <caihuoqing@baidu.com> wrote:

> Fix pba_offset initialization value for BAIDU KUNLUN Virtual
> Function device. The KUNLUN hardware returns an incorrect
> value for the VF PBA offset, and add a quirk to instead
> return a hardcoded value of 0xb400.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  hw/vfio/pci.c            | 8 ++++++++
>  include/hw/pci/pci_ids.h | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index ab4077aad2..72b7abf623 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1499,6 +1499,14 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
>          if (vdev->vendor_id == PCI_VENDOR_ID_CHELSIO &&
>              (vdev->device_id & 0xff00) == 0x5800) {
>              msix->pba_offset = 0x1000;
> +        /*
> +         * BAIDU KUNLUN Virtual Function devices are encoded as 0x3685 for
> +         * KUNLUN AI processor. The KUNLUN hardware returns an incorrect
> +         * value for the VF PBA offset. The correct value is 0xb400.
> +         */

What is the incorrect value and what is the BAR size?  This information
in the comment could help debugging later.

> +        } else if (vdev->vendor_id == PCI_VENDOR_ID_BAIDU &&
> +                   vdev->device_id == PCI_DEVICE_ID_KUNLUN_VF) {

Since we don't have an "encoding" like the previous quirk, we can use
vfio_pci_is() here:

        } else if (vfio_pci_is(vdev, PCI_VENDOR_ID_BAIDU,
                               PCI_DEVICE_ID_KUNLUN_VF)) {

> +            msix->pba_offset = 0xb400;
>          } else if (vdev->msix_relo == OFF_AUTOPCIBAR_OFF) {
>              error_setg(errp, "hardware reports invalid configuration, "
>                         "MSIX PBA outside of specified BAR");
> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> index 5c14681b82..bc73c50277 100644
> --- a/include/hw/pci/pci_ids.h
> +++ b/include/hw/pci/pci_ids.h
> @@ -227,6 +227,10 @@
>  #define PCI_VENDOR_ID_FREESCALE          0x1957
>  #define PCI_DEVICE_ID_MPC8533E           0x0030
>  
> +#define PCI_VENDOR_ID_BAIDU              0x1d22
> +#define PCI_DEVICE_ID_KUNLUN             0x3684

Let's not add a device ID that we don't use elsewhere in the code, we
only use the vendor ID and the VF ID below.  Thanks,

Alex

> +#define PCI_DEVICE_ID_KUNLUN_VF          0x3685
> +
>  #define PCI_VENDOR_ID_INTEL              0x8086
>  #define PCI_DEVICE_ID_INTEL_82378        0x0484
>  #define PCI_DEVICE_ID_INTEL_82441        0x1237


