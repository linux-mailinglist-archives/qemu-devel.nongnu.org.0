Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFD683988
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 23:44:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMzLc-0008UB-9l; Tue, 31 Jan 2023 17:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pMzLQ-0008Sz-6f
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:43:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pMzLN-0007dM-9l
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675204990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5bGok7ndJwsimA9ScNQuyS5g522SXbIEElrX+chCc1M=;
 b=Fl+7zpt2Jk8Gecayb+QdclXFru/OZKxkX0TKmMrKs0FdKAuKJ8iwFQSOyGe+a8khNFrqCz
 TKmtzxSeyZZcDUMovPA4M93ROoKkNlF2mQZ8vF5zqy/kcMQ7wfHTX5pFMIVsRAxGBkTmTq
 9B/3LEBGX/r3BBgeme2uj1csjM4LdLg=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-vP1Q2jQANSGO1DY-KsyIqw-1; Tue, 31 Jan 2023 17:43:05 -0500
X-MC-Unique: vP1Q2jQANSGO1DY-KsyIqw-1
Received: by mail-io1-f72.google.com with SMTP id
 r25-20020a6bd919000000b0071cfef31f97so3849197ioc.4
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 14:43:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5bGok7ndJwsimA9ScNQuyS5g522SXbIEElrX+chCc1M=;
 b=QZAytxJZChG3rGb8NP+f/dpJDhVqhwIvwgL7LomVunvBgbHKploxhGEtaWiBfTwQkK
 oX1AoYn2TUpUpLqjZI19ETHclsL9TdQEdUJi/cg0QW9/59YKPVmKggTcULzfWmRbJxKV
 xw6AGgg+rsvAWrnhOkXKMaY2aQAWR3MSzv9rJO8C4q+kjI+DkrlzXJUJTu8xAxMIbLye
 1ojyukEicmhJ+v8fAEUea9D9F1nPk32B8iBmtaNGNanqns7XwugmiT2Ci+zoZbsLdd9d
 fqF3rBE0tUTShfzfWME6ijvRPhD2Ky2HVLfkVA4uGVdlaKqe+56tVprla2Pw8Loa7NB8
 h8wg==
X-Gm-Message-State: AO0yUKXF6sPFx6B7C0Xtbpt+E6EFgt1NySuw3QTlskfPgcFWxAgUsrdT
 S3Z79boWkBOpog0uWMLNzaceDoMKPDloe/5EcWL/alAzg8Dfw5n34wXM/uFSym8Uf1Hfs2eiKsI
 503E6Pco5DYNhN7U=
X-Received: by 2002:a92:7c02:0:b0:310:d36c:35ef with SMTP id
 x2-20020a927c02000000b00310d36c35efmr146887ilc.7.1675204984126; 
 Tue, 31 Jan 2023 14:43:04 -0800 (PST)
X-Google-Smtp-Source: AK7set95IYk/qKIweJg2h3leS4l/LIlVnW7dpMnpMu7USLDQ7/aeRUWfxJjJMqPkgRFZZBn1Kvb1rA==
X-Received: by 2002:a92:7c02:0:b0:310:d36c:35ef with SMTP id
 x2-20020a927c02000000b00310d36c35efmr146862ilc.7.1675204983767; 
 Tue, 31 Jan 2023 14:43:03 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m16-20020a92c530000000b0031118ebf52esm324832ili.17.2023.01.31.14.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 14:43:03 -0800 (PST)
Date: Tue, 31 Jan 2023 15:43:01 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu
 <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 01/18] vfio/migration: Add VFIO migration pre-copy support
Message-ID: <20230131154301.4aaa8448.alex.williamson@redhat.com>
In-Reply-To: <0c6856e7-ab92-7276-256c-6226aa692698@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-2-avihaih@nvidia.com>
 <20230126165232.0e7a2316.alex.williamson@redhat.com>
 <0c6856e7-ab92-7276-256c-6226aa692698@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 31 Jan 2023 14:44:54 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> On 27/01/2023 1:52, Alex Williamson wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Thu, 26 Jan 2023 20:49:31 +0200
> > Avihai Horon <avihaih@nvidia.com> wrote:
> >  
> >> Pre-copy support allows the VFIO device data to be transferred while the
> >> VM is running. This helps to accommodate VFIO devices that have a large
> >> amount of data that needs to be transferred, and it can reduce migration
> >> downtime.
> >>
> >> Pre-copy support is optional in VFIO migration protocol v2.
> >> Implement pre-copy of VFIO migration protocol v2 and use it for devices
> >> that support it. Full description of it can be found here [1].
> >>
> >> [1]
> >> https://lore.kernel.org/kvm/20221206083438.37807-3-yishaih@nvidia.com/
> >>
> >> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> >> ---
> >>   docs/devel/vfio-migration.rst |  29 ++++++---
> >>   include/hw/vfio/vfio-common.h |   3 +
> >>   hw/vfio/common.c              |   8 ++-
> >>   hw/vfio/migration.c           | 112 ++++++++++++++++++++++++++++++++--
> >>   hw/vfio/trace-events          |   5 +-
> >>   5 files changed, 140 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
> >> index 1d50c2fe5f..51f5e1a537 100644
> >> --- a/docs/devel/vfio-migration.rst
> >> +++ b/docs/devel/vfio-migration.rst
> >> @@ -7,12 +7,14 @@ the guest is running on source host and restoring this saved state on the
> >>   destination host. This document details how saving and restoring of VFIO
> >>   devices is done in QEMU.
> >>
> >> -Migration of VFIO devices currently consists of a single stop-and-copy phase.
> >> -During the stop-and-copy phase the guest is stopped and the entire VFIO device
> >> -data is transferred to the destination.
> >> -
> >> -The pre-copy phase of migration is currently not supported for VFIO devices.
> >> -Support for VFIO pre-copy will be added later on.
> >> +Migration of VFIO devices consists of two phases: the optional pre-copy phase,
> >> +and the stop-and-copy phase. The pre-copy phase is iterative and allows to
> >> +accommodate VFIO devices that have a large amount of data that needs to be
> >> +transferred. The iterative pre-copy phase of migration allows for the guest to
> >> +continue whilst the VFIO device state is transferred to the destination, this
> >> +helps to reduce the total downtime of the VM. VFIO devices can choose to skip
> >> +the pre-copy phase of migration by not reporting the VFIO_MIGRATION_PRE_COPY
> >> +flag in VFIO_DEVICE_FEATURE_MIGRATION ioctl.
> >>
> >>   A detailed description of the UAPI for VFIO device migration can be found in
> >>   the comment for the ``vfio_device_mig_state`` structure in the header file
> >> @@ -29,6 +31,12 @@ VFIO implements the device hooks for the iterative approach as follows:
> >>     driver, which indicates the amount of data that the vendor driver has yet to
> >>     save for the VFIO device.
> >>
> >> +* An ``is_active_iterate`` function that indicates ``save_live_iterate`` is
> >> +  active only if the VFIO device is in pre-copy states.
> >> +
> >> +* A ``save_live_iterate`` function that reads the VFIO device's data from the
> >> +  vendor driver during iterative phase.
> >> +
> >>   * A ``save_state`` function to save the device config space if it is present.
> >>
> >>   * A ``save_live_complete_precopy`` function that sets the VFIO device in
> >> @@ -91,8 +99,10 @@ Flow of state changes during Live migration
> >>   ===========================================
> >>
> >>   Below is the flow of state change during live migration.
> >> -The values in the brackets represent the VM state, the migration state, and
> >> +The values in the parentheses represent the VM state, the migration state, and
> >>   the VFIO device state, respectively.
> >> +The text in the square brackets represents the flow if the VFIO device supports
> >> +pre-copy.
> >>
> >>   Live migration save path
> >>   ------------------------
> >> @@ -104,11 +114,12 @@ Live migration save path
> >>                                     |
> >>                        migrate_init spawns migration_thread
> >>                   Migration thread then calls each device's .save_setup()
> >> -                       (RUNNING, _SETUP, _RUNNING)
> >> +                  (RUNNING, _SETUP, _RUNNING [_PRE_COPY])
> >>                                     |
> >> -                      (RUNNING, _ACTIVE, _RUNNING)
> >> +                  (RUNNING, _ACTIVE, _RUNNING [_PRE_COPY])
> >>                If device is active, get pending_bytes by .save_live_pending()
> >>             If total pending_bytes >= threshold_size, call .save_live_iterate()
> >> +                  [Data of VFIO device for pre-copy phase is copied]
> >>           Iterate till total pending bytes converge and are less than threshold
> >>                                     |
> >>     On migration completion, vCPU stops and calls .save_live_complete_precopy for
> >> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> >> index 5f8e7a02fe..88c2194fb9 100644
> >> --- a/include/hw/vfio/vfio-common.h
> >> +++ b/include/hw/vfio/vfio-common.h
> >> @@ -67,7 +67,10 @@ typedef struct VFIOMigration {
> >>       int data_fd;
> >>       void *data_buffer;
> >>       size_t data_buffer_size;
> >> +    uint64_t mig_flags;
> >>       uint64_t stop_copy_size;
> >> +    uint64_t precopy_init_size;
> >> +    uint64_t precopy_dirty_size;
> >>   } VFIOMigration;
> >>
> >>   typedef struct VFIOAddressSpace {
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index 9a0dbee6b4..93b18c5e3d 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -357,7 +357,9 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
> >>
> >>               if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
> >>                   (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
> >> -                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
> >> +                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P ||
> >> +                 migration->device_state == VFIO_DEVICE_STATE_PRE_COPY ||
> >> +                 migration->device_state == VFIO_DEVICE_STATE_PRE_COPY_P2P)) {  
> > Should this just turn into a test that we're not in STOP_COPY?  
> 
> Then we would need to check we are not in STOP_COPY and not in STOP.
> The STOP check is for the case where PRE_COPY is not supported, since 
> RAM will ask for dirty page sync when the device is in STOP state.
> Without the STOP check, the device will skip the final dirty page sync.
> 
> >  
> >>                   return false;
> >>               }
> >>           }
> >> @@ -387,7 +389,9 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
> >>               }
> >>
> >>               if (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
> >> -                migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P) {
> >> +                migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P ||
> >> +                migration->device_state == VFIO_DEVICE_STATE_PRE_COPY ||
> >> +                migration->device_state == VFIO_DEVICE_STATE_PRE_COPY_P2P) {
> >>                   continue;
> >>               } else {
> >>                   return false;  
> > Hmm, this only seems to highlight that between this series and the
> > previous, we're adding tests for states that we never actually use, ie.
> > these _P2P states.
> >
> > IIRC, the reason we have these _P2P states is so that we can transition
> > a set of devices, which may have active P2P DMA between them, to STOP,
> > STOP_COPY, and even RUNNING states safely without lost data given that
> > we cannot simultaneously transition all devices.  That suggest that
> > missing from both these series is support for bringing all devices to
> > these _P2P states before we move any device to one of STOP, STOP_COPY,
> > or RUNNING states (in the case of RESUMING).
> >
> > Also, I recall discussions that we need to enforce configuration
> > restrictions when not all devices support the _P2P states?  For example
> > adding a migration blocker when there are multiple vfio devices and at
> > least one of them does not support _P2P migration states.  Or perhaps
> > initially, requiring support for _P2P states.
> >
> > I think what's implemented here, where we don't make use of the _P2P
> > states would require adding a migration blocker whenever there are
> > multiple vfio devices, regardless of the device support for _P2P.  
> 
> Yes, I think you are right.
> 
> I will add a migration blocker if there are multiple devices as part of 
> v9 of the basic series.
> When P2P support is added, I will block migration of multiple devices if 
> one or more of them doesn't support P2P.

How does this affect our path towards supported migration?  I'm
thinking about a user experience where QEMU supports migration if
device A OR device B are attached, but not devices A and B attached to
the same VM.  We might have a device C where QEMU supports migration
with B AND C, but not A AND C, nor A AND B AND C.  This would be the
case if device B and device C both supported P2P states, but device A
did not. The user has no observability of this feature, so all of this
looks effectively random to the user.

Even in the single device case, we need to make an assumption that a
device that does not support P2P migration states (or when QEMU doesn't
make use of P2P states) cannot be a DMA target, or otherwise have its
MMIO space accessed while in a STOP state.  Can we guarantee that when
other devices have not yet transitioned to STOP?

We could disable the direct map MemoryRegions when we move to a STOP
state, which would give QEMU visibility to those accesses, but besides
pulling an abort should such an access occur, could we queue them in
software, add them to the migration stream, and replay them after the
device moves to the RUNNING state?  We'd need to account for the lack of
RESUMING_P2P states as well, trapping and queue accesses from devices
already RUNNING to those still in RESUMING (not _P2P).

This all looks complicated.  Is it better to start with requiring P2P
state support?  Thanks,

Alex


