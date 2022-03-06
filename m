Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0041E4CEA8C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 11:39:46 +0100 (CET)
Received: from localhost ([::1]:43768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQoIk-0001pU-43
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 05:39:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQoH0-0000e8-C6
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:37:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQoGy-0002BD-G2
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646563074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=irk64xG3HwFNxPlwGgO3gOfzsducO2rhptLSIH+P36w=;
 b=cV1DdQldnnBeIVZ9kqQP66HxOpHFimv5WQeB1nXAK23IoxsQ3sc49nXOyBTpMkgC6tYjY9
 DJJ50Risf0/qsZO5FpEaREVc/E2M0zaNIMX4j5k21EnkO1f7r+wNtDFzNRhxG/q/IrbxZu
 qATk5TRNyICSilTlabsnZYv2yaRLSY8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-UY9s-YE5Ooik5VdzuyYRMg-1; Sun, 06 Mar 2022 05:37:53 -0500
X-MC-Unique: UY9s-YE5Ooik5VdzuyYRMg-1
Received: by mail-ed1-f72.google.com with SMTP id
 b24-20020a50e798000000b0041631767675so820715edn.23
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 02:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=irk64xG3HwFNxPlwGgO3gOfzsducO2rhptLSIH+P36w=;
 b=LnunFoYCq7r2xX6fl+O/RkManhKtAeeduwRMHwB2WZ4wXtpBmt6hZKuEK3IrI6Dgjl
 Ij8eb9x+lCCrNbx6MYkEJkrsKLi+jpefJt4u8Udf9AHgbTsFcpSvalj6jbEGNiWmxJ26
 h4Rq0h2IhaII9FX5eiEat29CYFKeNaRhaveHDRRwwKaVRNoGG4Busutj+DlaVWKGjNln
 0/CPB9zdW1EYpqKjzZsS6rRWWKsJsiKYZ2Eo3mn6j9DOyFbgGbG1n6083RlhmLgbbUd2
 OV88N18MKuAYLRSFa+0AduG3JfQwcOwIUlxNbvY8wPC2u5v7TiXR1PPS5Ae01c1Tjy2b
 LO0w==
X-Gm-Message-State: AOAM531z7BeDyTviRHvIZMEXvWO7C+pxU3JeABsrxElBx06nRzGSpbfv
 rgFTJ3aMSwSfn/EqGhvbRnV4OIT2SjjYK831FWyumWylkLR89kSF+piRToXn8uSU8in4z7OjqfM
 PN+QcpiZ/MOLhZtM=
X-Received: by 2002:a17:906:b7d2:b0:6db:385:dafd with SMTP id
 fy18-20020a170906b7d200b006db0385dafdmr4503095ejb.139.1646563071645; 
 Sun, 06 Mar 2022 02:37:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbgOPJMoJcANcbIvtPFWaG3LIsLRQzuueYa+XC/YhFmPLkP43vSIDsaq3PAUR8t8CbjMpkGw==
X-Received: by 2002:a17:906:b7d2:b0:6db:385:dafd with SMTP id
 fy18-20020a170906b7d200b006db0385dafdmr4503089ejb.139.1646563071422; 
 Sun, 06 Mar 2022 02:37:51 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 z22-20020a05640240d600b00415d8c59bf5sm4661160edb.25.2022.03.06.02.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 02:37:50 -0800 (PST)
Date: Sun, 6 Mar 2022 05:37:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/45] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20220306053652-mutt-send-email-mst@kernel.org>
References: <20220304133556.233983-1-mst@redhat.com>
 <CAFEAcA8Vo4bi_ar-Av7mzbCO6ZFv9pABpyi=0niGPi0U5Vxdvg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Vo4bi_ar-Av7mzbCO6ZFv9pABpyi=0niGPi0U5Vxdvg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 10:13:13PM +0000, Peter Maydell wrote:
> On Fri, 4 Mar 2022 at 13:37, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f:
> >
> >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220302' into staging (2022-03-03 14:46:48 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to 74bc2c502da74191a34fb61b4c890061368269c8:
> >
> >   docs: vhost-user: add subsection for non-Linux platforms (2022-03-04 08:30:53 -0500)
> >
> > ----------------------------------------------------------------
> > virtio,pc,pci: features, cleanups, fixes
> >
> > vhost-user enabled on non-linux systems
> > beginning of nvme sriov support
> > bigger tx queue for vdpa
> > virtio iommu bypass
> > pci tests for arm
> >
> > Fixes, cleanups all over the place
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > ----------------------------------------------------------------
> 
> This failed an assertion on ppc64:
> 
> >>> G_TEST_DBUS_DAEMON=/home/pm215/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-aarch64 QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon MALLOC_PERTURB_=120 /home/pm215/qemu/build/all/tests/qtest/qos-test --tap -k
> ▶  71/716 /aarch64/xlnx-zcu102/generic-sdhci/sdhci/sdhci-tests/registers
>          OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/AC97/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/e1000/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/e1000-82544gc/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/e1000-82545em/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82550/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82551/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82557a/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82557b/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82557c/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82558a/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82558b/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82559a/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82559b/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82559c/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82559er/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82562/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82801/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/ES1370/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/megasas/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 ERROR:../../tests/qtest/libqos/pci.c:232:qpci_device_enable:
> assertion failed (cmd & PCI_COMMAND_IO == PCI_COMMAND_IO): (0x00000000
> == 0x00000001) ERROR
> 
> 
> 

Clearly yhe addition of aarch tests. I dropped these for now.
Added Ani's FACP patches instead, new pull sent.

-- 
MST


