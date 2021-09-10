Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D12406563
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 03:48:44 +0200 (CEST)
Received: from localhost ([::1]:55226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOVel-0006Jr-Ep
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 21:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOVdC-0005cm-2C
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 21:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOVd5-0003h2-Ps
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 21:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631238416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rU3MPUB026N7fYc1t1nEGzDPQXLClvCtaysbTJuaigM=;
 b=abmEo7wGR61ZQvkmY84u9mk59IO/iYRgN2Fggu7h5MbRSugDAZv1C1EpX6OzXjKi4pm30J
 uKu28tnbluyFTuc3eX/w916CBamT2BAUvlBluVHY/oZJv0wChBO6uVh3U72lr58+NRJ/Ya
 DXL3JLYJe2BZ11RYhazu5UYGN34/wNc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-ISnKT0fkOgWWjDcAXubJEA-1; Thu, 09 Sep 2021 21:46:55 -0400
X-MC-Unique: ISnKT0fkOgWWjDcAXubJEA-1
Received: by mail-lj1-f198.google.com with SMTP id
 p11-20020a2ea40b000000b001d68cffb055so165755ljn.6
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 18:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rU3MPUB026N7fYc1t1nEGzDPQXLClvCtaysbTJuaigM=;
 b=jlnHcfaM1uvtuoadC/ixdHacMvDJZrCFnjeuDCFl0F0jZ7Bk4OBwTEsY2zJ9ZBfzNT
 FmZk2mtepKQDG/xXWpS1nL6u2Jwat1ro2kbYOOvRrWCTArgeXwqLwy/CRIQ0VmShqA92
 EBelbhnj8OUJKsyedwRfAHVvtrwFQ3/laFkylRZFNlzKRlgXTm6hD3j4GwRLcZXrFJro
 q72bmM/e/H34FDgzR2Wx/b1H/EDhfDs1qht0DUfw8Dhul78mvfZQ7uXctz541SaDDuhl
 SNBabMwdJdm9Cyj0KZdqjUZADcHhlsf7vVERgReybousjhCegHO/yvKxRm/+LXJWpoXM
 FVmA==
X-Gm-Message-State: AOAM530TPDdGmWJMFTNtL+rQfltllYtLydqu9CaasNIn7/fi5XB9PMzU
 AADRIUqfM8PF6LVk2viduTk3lyBdY0GIJxtt5xVQF8/QvThajo9Pa4ul3zrQvRa0pOsy3dkXAzR
 n7nH0pWvbmEJH1xwEicRJsxZ7tklM1Vc=
X-Received: by 2002:ac2:4c0a:: with SMTP id t10mr2042897lfq.481.1631238413351; 
 Thu, 09 Sep 2021 18:46:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ5+sWNAuw8DUMEam24Fy2NFGPNNCHRnP7dnWGdmh20Pxn8zog+EIjROAqzQIA9r/9a+DpElVhKkYa5PWJ5U4=
X-Received: by 2002:ac2:4c0a:: with SMTP id t10mr2042877lfq.481.1631238413108; 
 Thu, 09 Sep 2021 18:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210907090322.1756-1-jasowang@redhat.com>
 <BN0PR11MB57572086C11BCCA72B8306019BD59@BN0PR11MB5757.namprd11.prod.outlook.com>
In-Reply-To: <BN0PR11MB57572086C11BCCA72B8306019BD59@BN0PR11MB5757.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 10 Sep 2021 09:46:41 +0800
Message-ID: <CACGkMEs-1HRKCUsx=xm8TbAHhJ23rGpF8TtfyZKBr185o4ZsQA@mail.gmail.com>
Subject: Re: [PATCH V3 00/10] vhost-vDPA multiqueue
To: "Zhang, Chen" <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "lulu@redhat.com" <lulu@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "gdawar@xilinx.com" <gdawar@xilinx.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, "elic@nvidia.com" <elic@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 9, 2021 at 11:40 PM Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Qemu-devel <qemu-devel-
> > bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Jason Wang
> > Sent: Tuesday, September 7, 2021 5:03 PM
> > To: mst@redhat.com; jasowang@redhat.com; qemu-devel@nongnu.org
> > Cc: eperezma@redhat.com; elic@nvidia.com; gdawar@xilinx.com; Zhu,
> > Lingshan <lingshan.zhu@intel.com>; lulu@redhat.com
> > Subject: [PATCH V3 00/10] vhost-vDPA multiqueue
> >
> > Hi All:
> >
> > This patch implements the multiqueue support for vhost-vDPA. The most
> > important requirement si the control virtqueue support. The virtio-net and
>
> Typo:
>  S/si/is

Will fix (it there's a respin).

Thanks

>
>
> > vhost-net core are tweak to support control virtqueue as if what data queue
> > pairs are done: a dedicated vhost_net device which is coupled with the
> > NetClientState is intrdouced so most of the existing vhost codes could be
> > reused with minor changes. This means the control virtqueue will bypass the
> > Qemu. With the control virtqueue, vhost-vDPA are extend to support
> > creating and destroying multiqueue queue pairs plus the control virtqueue.
> >
> > For the future, if we want to support live migration, we can either do shadow
> > cvq on top or introduce new interfaces for reporting device states.
> >
> > Tests are done via the vp_vdpa driver in L1 guest.
> >
> > Changes since V2:
> >
> > - rebase to qemu master
> > - use "queue_pairs" instead of "qps"
> > - typo fixes
> >
> > Changes since V1:
> >
> > - start and stop vhost devices when all queues were setup
> > - fix the case when driver doesn't support MQ but device support
> > - correctly set the batching capability to avoid a map/unmap storm
> > - various other tweaks
> >
> > Jason Wang (10):
> >   vhost-vdpa: open device fd in net_init_vhost_vdpa()
> >   vhost-vdpa: classify one time request
> >   vhost-vdpa: prepare for the multiqueue support
> >   vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
> >   net: introduce control client
> >   vhost-net: control virtqueue support
> >   virtio-net: use "queue_pairs" instead of "queues" when possible
> >   vhost: record the last virtqueue index for the virtio device
> >   virtio-net: vhost control virtqueue support
> >   vhost-vdpa: multiqueue support
> >
> >  hw/net/vhost_net.c             |  55 ++++++++---
> >  hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
> >  hw/virtio/vhost-vdpa.c         |  56 +++++++++--
> >  include/hw/virtio/vhost-vdpa.h |   1 +
> >  include/hw/virtio/vhost.h      |   2 +
> >  include/hw/virtio/virtio-net.h |   5 +-
> >  include/net/net.h              |   5 +
> >  include/net/vhost_net.h        |   6 +-
> >  net/net.c                      |  24 ++++-
> >  net/vhost-vdpa.c               | 127 ++++++++++++++++++++++---
> >  10 files changed, 328 insertions(+), 118 deletions(-)
> >
> > --
> > 2.25.1
> >
>


