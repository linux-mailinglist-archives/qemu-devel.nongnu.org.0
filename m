Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203CD42C4DC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 17:34:25 +0200 (CEST)
Received: from localhost ([::1]:34292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1magGu-0004pb-6F
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 11:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1magDC-0002aB-E3
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1magD5-0006fH-On
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634139027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tWetLlFvuNkZbSyOzjg0wBfAFNwBmAfyusA9DLi69YQ=;
 b=SnBZPNeD+N5xB8V+55dVeXDYaUebB++CXImebeUiWo3LkleOfhSN30yoWDfB2/kMrM1NRh
 OjdiIuDLdBeT8O7hlAHs16r0C7H0ouYAraH2WWMfVja4wK/bDin1Kwady6r8akuhyx8fi6
 MEjyIIUEztzUJgYma8C0QSGheIkQXIs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-qC4x2qvlPoaaBiT3fjvRiA-1; Wed, 13 Oct 2021 11:30:24 -0400
X-MC-Unique: qC4x2qvlPoaaBiT3fjvRiA-1
Received: by mail-wr1-f69.google.com with SMTP id
 10-20020a5d47aa000000b001610cbda93dso2247775wrb.23
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 08:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tWetLlFvuNkZbSyOzjg0wBfAFNwBmAfyusA9DLi69YQ=;
 b=A5hMON0tN/lBggnSRcd7lR5YDAuubj6y8gzhBQqad0SzNH41cI+FfkQvyToLkftJE7
 +NsRnwzQXoVlyyh1qL2YM703zTSkcVsGnaRx3Ue/VbW82gXn2Gwt8bkOHluk7mBxsgeB
 JksZbD4ToHpm2VvJDMgzArYu72v0uz+ojDA4I2V5UeDq2XWAjtecTfnpst9phyHMDwt2
 xM+k/nGeyeGSw13a59e4FwdHTbFaJGW6BOUxz/x/PH7b7l8sytpv2OXEDaunsBejq/FH
 9ert/vF5YS676X9apStxJ4is+NmvThrGSYxpchVh2Gwwq28Czb5pmtyVGZOKMMQGdzm3
 izVA==
X-Gm-Message-State: AOAM530vhZeoCrz+nSmb05ezPZ1BzLAZ0Do9wchOo0UVML8wmw3KZLmg
 vY3DxbmKHF0HPwGSADMQrenPUg3P17t0O65cDWkSBS6CJH5HaSV+9BjM0H0oQsBdLTJDQJmSjGW
 LbJDWbalZ+h5Mids=
X-Received: by 2002:a1c:9dd1:: with SMTP id g200mr13464359wme.42.1634139023787; 
 Wed, 13 Oct 2021 08:30:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfVr3VaBpVm6vkdGd/yKQ9Gq3G+O8KmgeK3UfKl9EzoQft8keJaP9EZwfmPkDdSqdJzI81+A==
X-Received: by 2002:a1c:9dd1:: with SMTP id g200mr13464330wme.42.1634139023569; 
 Wed, 13 Oct 2021 08:30:23 -0700 (PDT)
Received: from redhat.com ([2.55.30.112])
 by smtp.gmail.com with ESMTPSA id g1sm6467694wmk.2.2021.10.13.08.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 08:30:23 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:30:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 00/15] qdev: Add JSON -device
Message-ID: <20211013112957-mutt-send-email-mst@kernel.org>
References: <20211008133442.141332-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211008133442.141332-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, lvivier@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 quintela@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@virtuozzo.com,
 its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 08, 2021 at 03:34:27PM +0200, Kevin Wolf wrote:
> It's still a long way until we'll have QAPIfied devices, but there are
> some improvements that we can already make now to make the future switch
> easier.
> 
> One important part of this is having code paths without QemuOpts, which
> we want to get rid of and replace with the keyval parser in the long
> run. This series adds support for JSON syntax to -device, which bypasses
> QemuOpts.
> 
> While we're not using QAPI yet, devices are based on QOM, so we already
> do have type checks and an implied schema. JSON syntax supported now can
> be supported by QAPI later and regarding command line compatibility,
> actually switching to it becomes an implementation detail this way (of
> course, it will still add valuable user-visible features like
> introspection and documentation).
> 
> Apart from making things more future proof, this also immediately adds
> a way to do non-scalar properties on the command line. nvme could have
> used list support recently, and the lack of it in -device led to some
> rather unnatural solution in the first version (doing the relationship
> between a device and objects backwards) and loss of features in the
> following. With this series, using a list as a device property should be
> possible without any weird tricks.
> 
> Unfortunately, even QMP device_add goes through QemuOpts before this
> series, which destroys any type safety QOM provides and also can't
> support non-scalar properties. This is a bug, but it turns out that
> libvirt actually relies on it and passes only strings for everything.
> So this series still leaves device_add alone until libvirt is fixed.


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

I assume you are merging this?

> v2:
> - Drop type safe QMP device_add because libvirt gets it wrong, too
> - More network patches to eliminate dependencies on the legacy QemuOpts
>   data structures which would not contain all devices any more after
>   this series. Fix some bugs there as a side effect.
> - Remove an unnecessary use of ERRP_GUARD()
> - Replaced error handling patch for qdev_set_id() with Damien's
> - Drop the deprecation patch until libvirt uses the new JSON syntax
> 
> Damien Hedde (1):
>   softmmu/qdev-monitor: add error handling in qdev_set_id
> 
> Kevin Wolf (14):
>   net: Introduce NetClientInfo.check_peer_type()
>   net/vhost-user: Fix device compatibility check
>   net/vhost-vdpa: Fix device compatibility check
>   qom: Reduce use of error_propagate()
>   iotests/245: Fix type for iothread property
>   iotests/051: Fix typo
>   qdev: Avoid using string visitor for properties
>   qdev: Make DeviceState.id independent of QemuOpts
>   qemu-option: Allow deleting opts during qemu_opts_foreach()
>   qdev: Add Error parameter to hide_device() callbacks
>   virtio-net: Store failover primary opts pointer locally
>   virtio-net: Avoid QemuOpts in failover_find_primary_device()
>   qdev: Base object creation on QDict rather than QemuOpts
>   vl: Enable JSON syntax for -device
> 
>  qapi/qdev.json                      | 15 +++--
>  include/hw/qdev-core.h              | 15 +++--
>  include/hw/virtio/virtio-net.h      |  2 +
>  include/monitor/qdev.h              | 27 +++++++-
>  include/net/net.h                   |  2 +
>  hw/arm/virt.c                       |  2 +-
>  hw/core/qdev-properties-system.c    |  6 ++
>  hw/core/qdev.c                      | 11 +++-
>  hw/net/virtio-net.c                 | 85 ++++++++++++-------------
>  hw/pci-bridge/pci_expander_bridge.c |  2 +-
>  hw/ppc/e500.c                       |  2 +-
>  hw/vfio/pci.c                       |  4 +-
>  hw/xen/xen-legacy-backend.c         |  3 +-
>  net/vhost-user.c                    | 41 ++++--------
>  net/vhost-vdpa.c                    | 37 ++++-------
>  qom/object.c                        |  7 +-
>  qom/object_interfaces.c             | 19 ++----
>  softmmu/qdev-monitor.c              | 99 +++++++++++++++++++----------
>  softmmu/vl.c                        | 63 ++++++++++++++++--
>  util/qemu-option.c                  |  4 +-
>  tests/qemu-iotests/051              |  2 +-
>  tests/qemu-iotests/051.pc.out       |  4 +-
>  tests/qemu-iotests/245              |  4 +-
>  23 files changed, 278 insertions(+), 178 deletions(-)
> 
> -- 
> 2.31.1


