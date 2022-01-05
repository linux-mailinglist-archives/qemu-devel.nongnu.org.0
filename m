Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF105485C2B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 00:13:36 +0100 (CET)
Received: from localhost ([::1]:55276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5FTL-0006XH-8X
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 18:13:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5FPz-0004rA-4v
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 18:10:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5FPw-0001xC-2X
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 18:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641424202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/BBh5eBsSqieyotYe/KIyhdlBm7PxEsGPT54a5Uu11w=;
 b=CohZ1+SUAeLP8RlzjupT73BRUDnmW5aYcaUnbVA0Tv5RLVqTgZzeb713K38tFHSWxSJ+rE
 5C0L18J0sd9veBAQB1tyLt0C46N5tf6gymZH1vUUQBYs3+Q3mZjx/pluuF3IEIglYj/Q3q
 H85jx3haOO6YviBalsppHMGkhb47wP4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-HzuhVnGZNveXUtxa4MIcJQ-1; Wed, 05 Jan 2022 18:10:00 -0500
X-MC-Unique: HzuhVnGZNveXUtxa4MIcJQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 l9-20020adfa389000000b001a23bd1c661so342844wrb.6
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 15:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/BBh5eBsSqieyotYe/KIyhdlBm7PxEsGPT54a5Uu11w=;
 b=TlmCMiGQgqaD7iRVd8o3IXWvrIdhH+bO9QthgZKyT+vgEzO7D2GziOzwKNemyo1ZVu
 6p0l6g9shKVt2JRjQ0l33eVmz5nTKQwA6s4Wy8IK9GPwep/QP6m+PxGfIWwTt/3EvBBZ
 +fiPh7bprCTuGN1Tbgo64MhaS1TxNwpz4xJGT05rXyv1WJQ7AddoRpJMV3YOAp7xapsA
 OCs9ZGfr71URCzjIhKz2itq+dSCps4RTBzZuzHO8ULyrMmlG3Y+NpWhtaLsHCVQ5qG5H
 oZCANTfgvqn1k+K2pTM71ME02P/HJkxwDCW2R8+2zIEM6jrlxUrlmNj52RpzyMGZgLHC
 KyNw==
X-Gm-Message-State: AOAM530sbxjVUAtUHvHDVtTDfmU1EhvcChdQ0OJniCR6+CLQa1Mb/5Le
 c2fr/Jw/WbBZ06iwaV08Y1qa4vJkEiW9rVmmDz2IuLAIfxPkmbFgbLiFvFdU4mGuh6dpHobhOJk
 MM0e1I++IHoDIPAA=
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr46734235wri.180.1641424199514; 
 Wed, 05 Jan 2022 15:09:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGXgxAEkATNZVrRuDLFb1fKntC6oevgZt0XazhCjMJqqOXSW61BOZTJgB0KRV2/Yl58Pycnw==
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr46734204wri.180.1641424199223; 
 Wed, 05 Jan 2022 15:09:59 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id r9sm312524wrm.76.2022.01.05.15.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 15:09:58 -0800 (PST)
Date: Wed, 5 Jan 2022 18:09:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 19/29] vfio-pci: cpr part 1 (fd and dma)
Message-ID: <20220105180332-mutt-send-email-mst@kernel.org>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
 <20211222181003-mutt-send-email-mst@kernel.org>
 <f1cadf51-795b-200c-8abb-f8f97b34c228@oracle.com>
 <20220105161046-mutt-send-email-mst@kernel.org>
 <e95009cf-aea2-7fc7-c049-687c1badc471@oracle.com>
MIME-Version: 1.0
In-Reply-To: <e95009cf-aea2-7fc7-c049-687c1badc471@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 04:40:43PM -0500, Steven Sistare wrote:
> On 1/5/2022 4:14 PM, Michael S. Tsirkin wrote:
> > On Wed, Jan 05, 2022 at 12:24:21PM -0500, Steven Sistare wrote:
> >> On 12/22/2021 6:15 PM, Michael S. Tsirkin wrote:
> >>> On Wed, Dec 22, 2021 at 11:05:24AM -0800, Steve Sistare wrote:
> >>>> Enable vfio-pci devices to be saved and restored across an exec restart
> >>>> of qemu.
> >>>>
> >>>> At vfio creation time, save the value of vfio container, group, and device
> >>>> descriptors in cpr state.
> >>>>
> >>>> In cpr-save and cpr-exec, suspend the use of virtual addresses in DMA
> >>>> mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
> >>>> at a different VA after exec.  DMA to already-mapped pages continues.  Save
> >>>> the msi message area as part of vfio-pci vmstate, save the interrupt and
> >>>> notifier eventfd's in cpr state, and clear the close-on-exec flag for the
> >>>> vfio descriptors.  The flag is not cleared earlier because the descriptors
> >>>> should not persist across miscellaneous fork and exec calls that may be
> >>>> performed during normal operation.
> >>>>
> >>>> On qemu restart, vfio_realize() finds the saved descriptors, uses
> >>>> the descriptors, and notes that the device is being reused.  Device and
> >>>> iommu state is already configured, so operations in vfio_realize that
> >>>> would modify the configuration are skipped for a reused device, including
> >>>> vfio ioctl's and writes to PCI configuration space.  The result is that
> >>>> vfio_realize constructs qemu data structures that reflect the current
> >>>> state of the device.  However, the reconstruction is not complete until
> >>>> cpr-load is called. cpr-load loads the msi data and finds eventfds in cpr
> >>>> state.  It rebuilds vector data structures and attaches the interrupts to
> >>>> the new KVM instance.  cpr-load then invokes the main vfio listener callback,
> >>>> which walks the flattened ranges of the vfio_address_spaces and calls
> >>>> VFIO_DMA_MAP_FLAG_VADDR to inform the kernel of the new VA's.  Lastly, it
> >>>> starts the VM and suppresses vfio pci device reset.
> >>>>
> >>>> This functionality is delivered by 3 patches for clarity.  Part 1 handles
> >>>> device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
> >>>> support.  Part 3 adds INTX support.
> >>>>
> >>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >>>> ---
> >>>>  MAINTAINERS                   |   1 +
> >>>>  hw/pci/pci.c                  |  10 ++++
> >>>>  hw/vfio/common.c              | 115 ++++++++++++++++++++++++++++++++++++++----
> >>>>  hw/vfio/cpr.c                 |  94 ++++++++++++++++++++++++++++++++++
> >>>>  hw/vfio/meson.build           |   1 +
> >>>>  hw/vfio/pci.c                 |  77 ++++++++++++++++++++++++++++
> >>>>  hw/vfio/trace-events          |   1 +
> >>>>  include/hw/pci/pci.h          |   1 +
> >>>>  include/hw/vfio/vfio-common.h |   8 +++
> >>>>  include/migration/cpr.h       |   3 ++
> >>>>  migration/cpr.c               |  10 +++-
> >>>>  migration/target.c            |  14 +++++
> >>>>  12 files changed, 324 insertions(+), 11 deletions(-)
> >>>>  create mode 100644 hw/vfio/cpr.c
> >>>>
> >>>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>>> index cfe7480..feed239 100644
> >>>> --- a/MAINTAINERS
> >>>> +++ b/MAINTAINERS
> >>>> @@ -2992,6 +2992,7 @@ CPR
> >>>>  M: Steve Sistare <steven.sistare@oracle.com>
> >>>>  M: Mark Kanda <mark.kanda@oracle.com>
> >>>>  S: Maintained
> >>>> +F: hw/vfio/cpr.c
> >>>>  F: include/migration/cpr.h
> >>>>  F: migration/cpr.c
> >>>>  F: qapi/cpr.json
> >>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> >>>> index 0fd21e1..e35df4f 100644
> >>>> --- a/hw/pci/pci.c
> >>>> +++ b/hw/pci/pci.c
> >>>> @@ -307,6 +307,16 @@ static void pci_do_device_reset(PCIDevice *dev)
> >>>>  {
> >>>>      int r;
> >>>>  
> >>>> +    /*
> >>>> +     * A reused vfio-pci device is already configured, so do not reset it
> >>>> +     * during qemu_system_reset prior to cpr-load, else interrupts may be
> >>>> +     * lost.  By contrast, pure-virtual pci devices may be reset here and
> >>>> +     * updated with new state in cpr-load with no ill effects.
> >>>> +     */
> >>>> +    if (dev->reused) {
> >>>> +        return;
> >>>> +    }
> >>>> +
> >>>>      pci_device_deassert_intx(dev);
> >>>>      assert(dev->irq_state == 0);
> >>>>  
> >>>
> >>>
> >>> Hmm that's a weird thing to do. I suspect this works because
> >>> "reused" means something like "in the process of being restored"?
> >>> Because clearly, we do not want to skip this part e.g. when
> >>> guest resets the device.
> >>
> >> Exactly.  vfio_realize sets the flag if it detects the device is reused during
> >> a restart, and vfio_pci_post_load clears the reused flag.
> >>
> >>> So a better name could be called for, but really I don't
> >>> love how vfio gets to poke at internal PCI state.
> >>> I'd rather we found a way just not to call this function.
> >>> If we can't, maybe an explicit API, and make it
> >>> actually say what it's doing?
> >>
> >> How about:
> >>
> >> pci_set_restore(PCIDevice *dev) { dev->restore = true; }
> >> pci_clr_restore(PCIDevice *dev) { dev->restore = false; }
> >>
> >> vfio_realize()
> >>   pci_set_restore(pdev)
> >>
> >> vfio_pci_post_load()
> >>   pci_clr_restore(pdev)
> >>
> >> pci_do_device_reset()
> >>     if (dev->restore)
> >>         return;
> >>
> >> - Steve
> > 
> > 
> > Not too bad. I'd like a better definition of what dev->restore is
> > exactly and to add them in comments near where it
> > is defined and used.
> 
> Will do.
> 
> > E.g. does this mean "device is being restored because of qemu restart"?
> > 
> > Do we need a per device flag for this thing or would a global
> > "qemu restart in progress" flag be enough?
> 
> A global flag (or function, which already exists) would suppress reset for all
> PCI devices, not just vfio-pci.  I am concerned that for some devices, vmstate 
> load may implicitly depend on the device having been reset for correctness, by 
> virtue of some fields being initialized in the reset function.
> 
> - Steve

So just so I understand, how do these other devices work with restart?
Do they use the save/loadvm machinery? And the reason vfio doesn't
is because it generally does not support savevm/loadvm?

-- 
MST


