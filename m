Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51186EA5B2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:20:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pplzU-0001Ug-IT; Fri, 21 Apr 2023 04:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplzS-0001UJ-3o
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:19:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplzQ-0006Ni-C8
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682065171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jO2UvjBc7VnlrAlsGRT/lE6IvojoNmx578YvtdEt+0c=;
 b=O2ndrz4grzYzAW297GoOS7uFTKe+YNpYi4f9qmLg2gj6OEgu3Oncvcy3Q08TxdTbh0NHj9
 aRk+xeFuw4tqADQAR6lxuD0hWXhPiQepBIBLgFB/g/oJwuUard7TxGalGfamFosn4HG+zg
 MB378j+lCpLRo/dEsXvJFhKOEapHBB8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-6_pyeHsSN0-fnS9_GTdboA-1; Fri, 21 Apr 2023 04:19:30 -0400
X-MC-Unique: 6_pyeHsSN0-fnS9_GTdboA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f17afcf99cso5439205e9.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 01:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682065169; x=1684657169;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jO2UvjBc7VnlrAlsGRT/lE6IvojoNmx578YvtdEt+0c=;
 b=LXTptygLX620PBRWUuMfJIu3MBQ9Q4bhIuh20Epu18MvBosV55tMvOaIerF6ZXHiy+
 jPsaHzNRgZWyQ3QSNmmh2Ln55u98jny35c/yXFicgV+AcVpOUGeYAAyPICcMTyera2LE
 vsCN3x//AwRdavqGis231Vo0nkBOv7AOYb9jT54syIaqKgX9jN2FxtPWpcOayI3z8+Vt
 kn3YBBLtHpKbI2MhczUnr1NX/gsjJR7GGbrtwrXfh+VPyp7ItdUPj6V3xPZyBYTFuRhk
 bopiS9NLEvDqDZ3QajCVGG7EuTyKHPPQhd3qRv6txlFZhAxE7H9hrAKvQe3ahlO2jsaR
 B6xQ==
X-Gm-Message-State: AAQBX9fNEWpFIRKTwjt0ejYtwZ3EqG3ipQLMqjqZvT41jWvsVcEUn3DU
 IHBFvoUTQFkTmaewCI798altVFbbVdzX5Zz9/hDoopWYlM2W28m7V4RrbrU4IgHGsx8feQYOZsn
 LpPEuCGBksCFnR8A=
X-Received: by 2002:a5d:62c3:0:b0:301:81f8:765f with SMTP id
 o3-20020a5d62c3000000b0030181f8765fmr3391539wrv.38.1682065168953; 
 Fri, 21 Apr 2023 01:19:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350bnjEDB/4RLFVo/kwtvm6kSSYYiCKh6obqNx0F4mb3Cf2FNMVS1oVk5xeZ2QlR25iXtIUH6Fg==
X-Received: by 2002:a5d:62c3:0:b0:301:81f8:765f with SMTP id
 o3-20020a5d62c3000000b0030181f8765fmr3391526wrv.38.1682065168623; 
 Fri, 21 Apr 2023 01:19:28 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 y4-20020a5d6204000000b002f900cfc262sm3814930wru.66.2023.04.21.01.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 01:19:28 -0700 (PDT)
Date: Fri, 21 Apr 2023 04:19:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fan Ni <fan.ni@samsung.com>, linuxarm@huawei.com
Subject: Re: [PATCH 0/2] hw/pci-bridge: pci_expander_bridge: Fix wrong type
 and rework inheritance.
Message-ID: <20230421041812-mutt-send-email-mst@kernel.org>
References: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Apr 20, 2023 at 03:27:48PM +0100, Jonathan Cameron wrote:
> Peter Maydell highlighted an incorrect conversion to TYPE_PXB_DEVICE from
> a device that didn't have that a an ancestor type. PXB_DEV() used instead of
> PXB_CXL_DEV()/
> 
> https://lore.kernel.org/qemu-devel/CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com/
> 
> During the discussion it became clear that the inheritance of the various
> TYPE_PXB*_DEVICE was unusual. This patchset first provides the minimal
> fix then cleans up the inheritance of types based on functionality.
> 
> There is also a rename to TYPE_PXB*_DEV to allow removal of some boilerplate.
> 
> Before this series
> TYPE_PXB_DEVICE, TYPE_PXB_PCIE_DEVICE and TYPE_PXB_CXL_DEVICE all
> had TYPE_PCI_DEVICE as their direct parent though they shared a common
> struct PXBDev for their state.  As a result this state contained
> some data that was irrelevant for some the types.
> 
> This series changes to
> TYPE_PXB_CXL_DEV has a parent of TYPE_PXB_PCIE_DEV
> TYPE_PXB_PCIE_DEV has a parent of TYPE_PXB_DEV
> TYPE_PXB_DEV continues to have a parent of TYPE_PCI_DEVICE.
> 
> Each of the TYPE_PXB*_DEV has a state structure adding those elements
> to their parent that they need. This also allowed dropping a wrapping
> structure for the CXL state as the PXBCXLDev structure already provides
> the equivalent grouping.
> 
> Patches are similar to those posted in the thread but rebased on v8.0.0.

this conflicts with
    Revert "hw/pxb-cxl: Support passthrough HDM Decoders unless overridden"

I think you acked that one?

> Jonathan Cameron (2):
>   hw/pci-bridge: pci_expander_bridge fix type in pxb_cxl_dev_reset()
>   hw/pci-bridge: Make PCIe and CXL PXB Devices inherit from TYPE_PXB_DEV
> 
>  hw/acpi/cxl.c                       | 11 +++---
>  hw/cxl/cxl-host.c                   |  4 +-
>  hw/pci-bridge/pci_expander_bridge.c | 61 ++++++++++-------------------
>  include/hw/cxl/cxl.h                |  4 +-
>  include/hw/pci/pci_bridge.h         | 28 +++++++++----
>  5 files changed, 50 insertions(+), 58 deletions(-)
> 
> -- 
> 2.37.2


