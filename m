Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B596864D6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:55:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNAbp-0000Qz-TY; Wed, 01 Feb 2023 05:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pNAbn-0000QI-Ly
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:44:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pNAbl-0005tT-OB
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675248292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9dHd2O8GlgKoVZgQRJ7kJvfdnu4+06Wz1RO1lIZHxGo=;
 b=aAlYXxuZOLC4Tg6eNNT72ck6oKHbIY1dINzuuvikl0ux1VARB8Vyabta4jU1vLk58N+PRY
 zLCUvLj7o7VK7MlvcrDgmuisMRMYX2LotUoNATqm+8AQ18kWDhhydCrxtgSAJ0FrCJ7zfs
 6o/7/FvHJrWr6XQ62fOxwZ2tk6kOGRg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-5KqEYPVLO9GJze219AFFzg-1; Wed, 01 Feb 2023 05:44:51 -0500
X-MC-Unique: 5KqEYPVLO9GJze219AFFzg-1
Received: by mail-ej1-f70.google.com with SMTP id
 sa8-20020a170906eda800b0087875c99e6bso11158035ejb.22
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9dHd2O8GlgKoVZgQRJ7kJvfdnu4+06Wz1RO1lIZHxGo=;
 b=ez6DmiXUe9wcF+b+loLzFNPf4rvlSRmXycMrQrDLr3cxDF/yDK0Y7kfHbCwekmVrvW
 xLTgttzBZ0R9rQxhxGSupDhXhOz0xcLhqYsUlmPo4FLKFPsT9inNp1/uS2i6i6+oEtSt
 ox39a5PBBFSVgEOpXyiYDGouyuM0FqWaRUYOAe0HNvDBgv4XwO7zN9s/BtsXcj1ffbn7
 04p++L16KhmFj/AIV7dZdtHOJaVNPpzSknnClcfe6WFPGmJxU2HWpGLX57/kuHHoq4AG
 MTEVFu6xbhhqYvQ8qW1jIYhKTFkco2mzXmxtOwWdRdItVKh2jnNCA6RLwDRZ/3ulzVWg
 7JKw==
X-Gm-Message-State: AO0yUKXdHsXOXmWHTJdds5BrXbkh05g+n+tgups1TIWYqaAGknZS78ZW
 lxX2s/oWMZHk9YoPsVcRzTavUM58Qv2m7RD4b90h+eRsdQp/6v4vLOBvGb50zG2rB1bUxISzdkc
 Y+cp5wuPjm+pMWUQ=
X-Received: by 2002:aa7:d959:0:b0:4a1:7543:d6ad with SMTP id
 l25-20020aa7d959000000b004a17543d6admr1414032eds.28.1675248289891; 
 Wed, 01 Feb 2023 02:44:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8Bp7hxJfTfO0Dp+xJbj2O5Lo/iY5glGfi1eFq5QgwbID+faX4+LpeC9+SZwMXMOHGaEbWqCA==
X-Received: by 2002:aa7:d959:0:b0:4a1:7543:d6ad with SMTP id
 l25-20020aa7d959000000b004a17543d6admr1414011eds.28.1675248289607; 
 Wed, 01 Feb 2023 02:44:49 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 b13-20020aa7cd0d000000b004a028d443f9sm9600186edw.55.2023.02.01.02.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:44:48 -0800 (PST)
Date: Wed, 1 Feb 2023 05:44:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
Message-ID: <20230201054323-mutt-send-email-mst@kernel.org>
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <CAJaqyWfZX2sgoOq+Poa2tQTc2VTRneaUvzozOdDS+7SoMUdNkg@mail.gmail.com>
 <CACGkMEuwVXTf6FQxShu6QL-BJdQLOYE5Xy-RVEcemmWg1WKAGQ@mail.gmail.com>
 <CAJaqyWdxL+9gvjawpFTMg_ut8WpcZErdipAMMCSXYdOTcYK61w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJaqyWdxL+9gvjawpFTMg_ut8WpcZErdipAMMCSXYdOTcYK61w@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Feb 01, 2023 at 08:49:30AM +0100, Eugenio Perez Martin wrote:
> On Wed, Feb 1, 2023 at 4:29 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Feb 1, 2023 at 3:11 AM Eugenio Perez Martin <eperezma@redhat.com> wrote:
> > >
> > > On Tue, Jan 31, 2023 at 8:10 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > The current approach of offering an emulated CVQ to the guest and map
> > > > the commands to vhost-user is not scaling well:
> > > > * Some devices already offer it, so the transformation is redundant.
> > > > * There is no support for commands with variable length (RSS?)
> > > >
> > > > We can solve both of them by offering it through vhost-user the same
> > > > way as vhost-vdpa do. With this approach qemu needs to track the
> > > > commands, for similar reasons as vhost-vdpa: qemu needs to track the
> > > > device status for live migration. vhost-user should use the same SVQ
> > > > code for this, so we avoid duplications.
> > > >
> > > > One of the challenges here is to know what virtqueue to shadow /
> > > > isolate. The vhost-user device may not have the same queues as the
> > > > device frontend:
> > > > * The first depends on the actual vhost-user device, and qemu fetches
> > > > it with VHOST_USER_GET_QUEUE_NUM at the moment.
> > > > * The qemu device frontend's is set by netdev queues= cmdline parameter in qemu
> > > >
> > > > For the device, the CVQ is the last one it offers, but for the guest
> > > > it is the last one offered in config space.
> > > >
> > > > To create a new vhost-user command to decrease that maximum number of
> > > > queues may be an option. But we can do it without adding more
> > > > commands, remapping the CVQ index at virtqueue setup. I think it
> > > > should be doable using (struct vhost_dev).vq_index and maybe a few
> > > > adjustments here and there.
> > > >
> > > > Thoughts?
> > > >
> > > > Thanks!
> > >
> > >
> > > (Starting a separated thread to vhost-vdpa related use case)
> > >
> > > This could also work for vhost-vdpa if we ever decide to honor netdev
> > > queues argument. It is totally ignored now, as opposed to the rest of
> > > backends:
> > > * vhost-kernel, whose tap device has the requested number of queues.
> > > * vhost-user, that errors with ("you are asking more queues than
> > > supported") if the vhost-user parent device has less queues than
> > > requested (by vhost-user msg VHOST_USER_GET_QUEUE_NUM).
> > >
> > > One of the reasons for this is that device configuration space is
> > > totally passthrough, with the values for mtu, rss conditions, etc.
> > > This is not ideal, as qemu cannot check src and destination
> > > equivalence and they can change under the feets of the guest in the
> > > event of a migration.
> >
> > This looks not the responsibility of qemu but the upper layer (to
> > provision the same config/features in src/dst).
> 
> I think both share it. Or, at least, that it is inconsistent that QEMU
> is in charge of checking / providing consistency for virtio features,
> but not virtio-net config space.
> 
> If we follow that to the extreme, we could simply delete the feature
> checks, right?
> 
> >
> > > External tools are needed for this, duplicating
> > > part of the effort.
> > >
> > > Start intercepting config space accesses and offering an emulated one
> > > to the guest with this kind of adjustments is beneficial, as it makes
> > > vhost-vdpa more similar to the rest of backends, making the surprise
> > > on a change way lower.
> >
> > This probably needs more thought, since vDPA already provides a kind
> > of emulation in the kernel. My understanding is that it would be
> > sufficient to add checks to make sure the config that guests see is
> > consistent with what host provisioned?
> >
> 
> With host provisioned you mean with "vdpa" tool or with qemu? Also, we
> need a way to communicate the guest values to it If those checks are
> added in the kernel.
> 
> The reasoning here is the same as above: QEMU already filters features
> with its own emulated layer, so the operator can specify a feature
> that will never appear to the guest. It has other uses (abstract
> between transport for example), but feature filtering is definitely a
> thing there.
> 
> A feature set to off in a VM (or that does not exist in that
> particular qemu version) will never appear as on even in the case of
> migration to modern qemu versions.
> 
> We don't have the equivalent protection for device config space. QEMU
> could assure a consistent MTU, number of queues, etc for the guest in
> virtio_net_get_config (and equivalent for other kinds of devices).
> QEMU already has some transformations there. It shouldn't take a lot
> of code.

I think I agree. It's the easiest way to ensure migration
consistency without troubles.

> Having said that:
> * I'm ok with starting just with checks there instead of
> transformations like the queues remap proposed here.
> * If we choose not to implement it, I'm not proposing to actually
> delete the features checks, as I see them useful :).
> 
> Thanks!


