Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35EA6EB85C
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 12:04:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqA5A-0003T6-10; Sat, 22 Apr 2023 06:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pqA54-0003Sl-9f
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 06:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pqA51-0000R7-Fr
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 06:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682157773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DN3SnwfLeKponrKrxV5wENQMqk4Pxd6ONNk6rXHfJHM=;
 b=O05NVFszPqiQivfRg6IBIAsu0zGX8O2vtZthhKv650t8+3QD5hUGmBzhPT8wDZcPKpVKCn
 EAtPyejTCUvLhDnOBjOS9FZEBe3csZrMrgdV0p9HMtdrdIqk9VikCl6G7k1ypBlXe+dj2f
 OLpHgYa9NxXDoiG2tpgk9kUJCD6/wdI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-laRB3bxiO7-oWzXmHcwGVg-1; Sat, 22 Apr 2023 06:02:51 -0400
X-MC-Unique: laRB3bxiO7-oWzXmHcwGVg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f191fc08b7so5690795e9.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 03:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682157770; x=1684749770;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DN3SnwfLeKponrKrxV5wENQMqk4Pxd6ONNk6rXHfJHM=;
 b=OTsUfIPtD+7szEO9pJbDSjDH3vI6dSIJGfRIQw7EjV3F7x48JJhG0JQENRc97j7VcC
 G6Idx8phQZY850GppX2vci4SAoJOs0h0E6RZfdBMyweiaNMPXfyFJnZKFhLnPONKNwRv
 H3yQFvkrSlIqXy6CEousY6SKC0gWJ8prAbz2V7V8te8RYJ43lZ67bkSQiWTBuBZi73Sy
 IVBEwD77wXKiVzfkvY9dCkXyQIp9F03oPPTPDtpKxp0rMVuOWKFCwSGqV5EIMoPDJxXO
 0uRyM30CUAl/D7nJ7rPcx5onpmpqnwG3B5azfAOqEFzC/jzRRElwnA/ogAWycU3fkNC0
 iiIw==
X-Gm-Message-State: AAQBX9ddO7rbLr5N9dnyKqlRxjhe08OKIe55n8T+JjOctMcw3bOsz6Qt
 EID1UIg4llmNoMdQJLH05lsNamyEeazqpDbzE2xYurXwXTC2FEfwXEbsVPwQH5rAA2qwpmzFEaX
 QB6ngPuT91TSuL88=
X-Received: by 2002:a1c:cc14:0:b0:3f1:7a44:317c with SMTP id
 h20-20020a1ccc14000000b003f17a44317cmr3592110wmb.24.1682157770602; 
 Sat, 22 Apr 2023 03:02:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350aCRZG4us2uy2S3bi68kPuank8C3YbyYn0kYx3NTTsybKU+mqUwXEtZRNg9W2+Q0MlmrMD2iQ==
X-Received: by 2002:a1c:cc14:0:b0:3f1:7a44:317c with SMTP id
 h20-20020a1ccc14000000b003f17a44317cmr3592098wmb.24.1682157770175; 
 Sat, 22 Apr 2023 03:02:50 -0700 (PDT)
Received: from redhat.com ([147.235.210.51]) by smtp.gmail.com with ESMTPSA id
 ip29-20020a05600ca69d00b003f1712b1402sm10302098wmb.30.2023.04.22.03.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 03:02:49 -0700 (PDT)
Date: Sat, 22 Apr 2023 06:02:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Fan Ni <fan.ni@samsung.com>, linuxarm@huawei.com
Subject: Re: [PATCH 0/2] hw/pci-bridge: pci_expander_bridge: Fix wrong type
 and rework inheritance.
Message-ID: <20230422060008-mutt-send-email-mst@kernel.org>
References: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
 <20230421041812-mutt-send-email-mst@kernel.org>
 <CAFEAcA8g2GeCmQkx3MvotqNVV7AOD7-6BxFckiYcooJj9-UFyg@mail.gmail.com>
 <20230421131908.000052f4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421131908.000052f4@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Fri, Apr 21, 2023 at 01:19:08PM +0100, Jonathan Cameron wrote:
> On Fri, 21 Apr 2023 09:59:57 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> > On Fri, 21 Apr 2023 at 09:19, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Thu, Apr 20, 2023 at 03:27:48PM +0100, Jonathan Cameron wrote:  
> > > > Peter Maydell highlighted an incorrect conversion to TYPE_PXB_DEVICE from
> > > > a device that didn't have that a an ancestor type. PXB_DEV() used instead of
> > > > PXB_CXL_DEV()/
> > > >
> > > > https://lore.kernel.org/qemu-devel/CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com/
> > > >
> > > > During the discussion it became clear that the inheritance of the various
> > > > TYPE_PXB*_DEVICE was unusual. This patchset first provides the minimal
> > > > fix then cleans up the inheritance of types based on functionality.
> > > >
> > > > There is also a rename to TYPE_PXB*_DEV to allow removal of some boilerplate.
> > > >
> > > > Before this series
> > > > TYPE_PXB_DEVICE, TYPE_PXB_PCIE_DEVICE and TYPE_PXB_CXL_DEVICE all
> > > > had TYPE_PCI_DEVICE as their direct parent though they shared a common
> > > > struct PXBDev for their state.  As a result this state contained
> > > > some data that was irrelevant for some the types.
> > > >
> > > > This series changes to
> > > > TYPE_PXB_CXL_DEV has a parent of TYPE_PXB_PCIE_DEV
> > > > TYPE_PXB_PCIE_DEV has a parent of TYPE_PXB_DEV
> > > > TYPE_PXB_DEV continues to have a parent of TYPE_PCI_DEVICE.
> > > >
> > > > Each of the TYPE_PXB*_DEV has a state structure adding those elements
> > > > to their parent that they need. This also allowed dropping a wrapping
> > > > structure for the CXL state as the PXBCXLDev structure already provides
> > > > the equivalent grouping.
> > > >
> > > > Patches are similar to those posted in the thread but rebased on v8.0.0.  
> > >
> > > this conflicts with
> > >     Revert "hw/pxb-cxl: Support passthrough HDM Decoders unless overridden"
> > >
> > > I think you acked that one?  
> > 
> > We should take one or the other, but not both. If this patchset
> > is good then it's probably better to fix the bug rather than
> > revert the feature, I think.
> 
> If it's easy to drop the revert that would be my preference.

OK, I'll do that. Thanks!

> If not, then I'm fine spinning a new version of that patch without
> the bug (so with patch 1 of this squashed in).  Patch 2 is somewhat related
> refactoring.  Not necessary to fix the issue even though it was motivated
> by that bug.
> 
> Jonathan
> 
> > 
> > -- PMM


