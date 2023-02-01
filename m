Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31366860F9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:51:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN7sk-0003d5-5k; Wed, 01 Feb 2023 02:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pN7si-0003cr-IK
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:50:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pN7sg-0008S9-E6
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675237809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wDZRqNu7QriIIn6O4Kc4GrgdPmnEppImbuSpIoO9LYM=;
 b=ZZgCcq/Q44OsBpH5jhD3cWvQ+NSb4HqmATLm3b99w8L6f9jOPfue9DPQ5Fhw4wpHSbYPD+
 B6lZg150A0DTstpKcjJb4dJ2HrkZIFzgEJsgBANn5yDSnZWyAuev4NvmAkZnWY634NrQbw
 bTbA/BDW4HEELNF2jlS3kjYr0F9VH7k=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-D7ELz4c6PgGTzq1gwjfP4w-1; Wed, 01 Feb 2023 02:50:07 -0500
X-MC-Unique: D7ELz4c6PgGTzq1gwjfP4w-1
Received: by mail-yb1-f199.google.com with SMTP id
 h14-20020a258a8e000000b00827819f87e5so6999470ybl.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wDZRqNu7QriIIn6O4Kc4GrgdPmnEppImbuSpIoO9LYM=;
 b=tHpcVBVjJeY8WPSIimVxwNC1eL644g79vqIPT5MNAouuzPfGl0RSCIgeeZaW76GOXk
 t3uKRkzxUsSAM4xpW0ewkAAsZ3NgTyvxLUrhLXOAh+ADZeNX3KrMnN6G5UXALiCrV2pQ
 JHAZaZAZMYsC66VOvinkWKpW5PhyFNherdhZPmc0QddAlBU2OuMPQ+W1Eqv5E4nqjsDz
 DGQl1MKvx7m7pjGcAOvphUWnnRENqqUCljDSAQKnkUEF1WjWFkebOKRJpn1vwrC/CNFV
 eF+WBLDVq/KlNOjRcDXJdIItzc1KvcnbkSIOaoF3KsaDmg/o9ObTr7I6rajFyNB/w0WI
 2W2A==
X-Gm-Message-State: AO0yUKXhLwJjvQ3Qh6h2sRaeJUmjMwSpHf89JalHUMNXKIzzRtzSaj30
 T6dSuxeO/61v/KcnXk4otMJttVlXz1RtxqUAfuBMglz3a+tcHNl3jyBgIOt+irCQ0yijcmOiOYu
 vr5g+/vMtKSoJGWvBo/lHRkABCHjVUUk=
X-Received: by 2002:a05:6902:10f:b0:80b:72cc:3967 with SMTP id
 o15-20020a056902010f00b0080b72cc3967mr208575ybh.123.1675237807336; 
 Tue, 31 Jan 2023 23:50:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8CE1kwvP2UtPif00JWsGDkY1AFjpkEWIbJHP7py/0Dj99uSLOkXbXxNkjRDWseAHn/rwR4G2AG833dg3oVmQY=
X-Received: by 2002:a05:6902:10f:b0:80b:72cc:3967 with SMTP id
 o15-20020a056902010f00b0080b72cc3967mr208565ybh.123.1675237807025; Tue, 31
 Jan 2023 23:50:07 -0800 (PST)
MIME-Version: 1.0
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <CAJaqyWfZX2sgoOq+Poa2tQTc2VTRneaUvzozOdDS+7SoMUdNkg@mail.gmail.com>
 <CACGkMEuwVXTf6FQxShu6QL-BJdQLOYE5Xy-RVEcemmWg1WKAGQ@mail.gmail.com>
In-Reply-To: <CACGkMEuwVXTf6FQxShu6QL-BJdQLOYE5Xy-RVEcemmWg1WKAGQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 1 Feb 2023 08:49:30 +0100
Message-ID: <CAJaqyWdxL+9gvjawpFTMg_ut8WpcZErdipAMMCSXYdOTcYK61w@mail.gmail.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
To: Jason Wang <jasowang@redhat.com>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Wed, Feb 1, 2023 at 4:29 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Feb 1, 2023 at 3:11 AM Eugenio Perez Martin <eperezma@redhat.com> wrote:
> >
> > On Tue, Jan 31, 2023 at 8:10 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > Hi,
> > >
> > > The current approach of offering an emulated CVQ to the guest and map
> > > the commands to vhost-user is not scaling well:
> > > * Some devices already offer it, so the transformation is redundant.
> > > * There is no support for commands with variable length (RSS?)
> > >
> > > We can solve both of them by offering it through vhost-user the same
> > > way as vhost-vdpa do. With this approach qemu needs to track the
> > > commands, for similar reasons as vhost-vdpa: qemu needs to track the
> > > device status for live migration. vhost-user should use the same SVQ
> > > code for this, so we avoid duplications.
> > >
> > > One of the challenges here is to know what virtqueue to shadow /
> > > isolate. The vhost-user device may not have the same queues as the
> > > device frontend:
> > > * The first depends on the actual vhost-user device, and qemu fetches
> > > it with VHOST_USER_GET_QUEUE_NUM at the moment.
> > > * The qemu device frontend's is set by netdev queues= cmdline parameter in qemu
> > >
> > > For the device, the CVQ is the last one it offers, but for the guest
> > > it is the last one offered in config space.
> > >
> > > To create a new vhost-user command to decrease that maximum number of
> > > queues may be an option. But we can do it without adding more
> > > commands, remapping the CVQ index at virtqueue setup. I think it
> > > should be doable using (struct vhost_dev).vq_index and maybe a few
> > > adjustments here and there.
> > >
> > > Thoughts?
> > >
> > > Thanks!
> >
> >
> > (Starting a separated thread to vhost-vdpa related use case)
> >
> > This could also work for vhost-vdpa if we ever decide to honor netdev
> > queues argument. It is totally ignored now, as opposed to the rest of
> > backends:
> > * vhost-kernel, whose tap device has the requested number of queues.
> > * vhost-user, that errors with ("you are asking more queues than
> > supported") if the vhost-user parent device has less queues than
> > requested (by vhost-user msg VHOST_USER_GET_QUEUE_NUM).
> >
> > One of the reasons for this is that device configuration space is
> > totally passthrough, with the values for mtu, rss conditions, etc.
> > This is not ideal, as qemu cannot check src and destination
> > equivalence and they can change under the feets of the guest in the
> > event of a migration.
>
> This looks not the responsibility of qemu but the upper layer (to
> provision the same config/features in src/dst).

I think both share it. Or, at least, that it is inconsistent that QEMU
is in charge of checking / providing consistency for virtio features,
but not virtio-net config space.

If we follow that to the extreme, we could simply delete the feature
checks, right?

>
> > External tools are needed for this, duplicating
> > part of the effort.
> >
> > Start intercepting config space accesses and offering an emulated one
> > to the guest with this kind of adjustments is beneficial, as it makes
> > vhost-vdpa more similar to the rest of backends, making the surprise
> > on a change way lower.
>
> This probably needs more thought, since vDPA already provides a kind
> of emulation in the kernel. My understanding is that it would be
> sufficient to add checks to make sure the config that guests see is
> consistent with what host provisioned?
>

With host provisioned you mean with "vdpa" tool or with qemu? Also, we
need a way to communicate the guest values to it If those checks are
added in the kernel.

The reasoning here is the same as above: QEMU already filters features
with its own emulated layer, so the operator can specify a feature
that will never appear to the guest. It has other uses (abstract
between transport for example), but feature filtering is definitely a
thing there.

A feature set to off in a VM (or that does not exist in that
particular qemu version) will never appear as on even in the case of
migration to modern qemu versions.

We don't have the equivalent protection for device config space. QEMU
could assure a consistent MTU, number of queues, etc for the guest in
virtio_net_get_config (and equivalent for other kinds of devices).
QEMU already has some transformations there. It shouldn't take a lot
of code.

Having said that:
* I'm ok with starting just with checks there instead of
transformations like the queues remap proposed here.
* If we choose not to implement it, I'm not proposing to actually
delete the features checks, as I see them useful :).

Thanks!


