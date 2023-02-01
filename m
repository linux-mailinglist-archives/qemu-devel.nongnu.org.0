Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF57686592
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:50:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNBc2-0003Jm-76; Wed, 01 Feb 2023 06:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNBbz-0003JF-U0
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:49:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNBbx-0004gW-Py
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675252148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=maHbX8ATTJZ866QYAa8ufpLrp/Cl7Wr8DO8HDMjbEFE=;
 b=HSdT//OID7lWxoo6RfiDnu47cVnlsQEq0emYv9TEhxXuQlUt/LGcoFkR5PyMSKbnYyiUCK
 F7XeQcAlnZ+Nio9wju4eokMAFskRRCG6z1kqvKTsNL81iFi2XiUg5JtKceaxjG1OGAE6FQ
 4r39QinhHbOmQYbAQfQP7iAtLfcAekw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-kTFG6DLTOO-fr4FR_tDsKg-1; Wed, 01 Feb 2023 06:49:06 -0500
X-MC-Unique: kTFG6DLTOO-fr4FR_tDsKg-1
Received: by mail-yb1-f198.google.com with SMTP id
 t13-20020a056902018d00b0074747131938so19537719ybh.12
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 03:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=maHbX8ATTJZ866QYAa8ufpLrp/Cl7Wr8DO8HDMjbEFE=;
 b=Sw1Gw7OlVIGI/H1TXftrRZeI2idl2SNWpbHL5FzcOZd3e0xLL2KCpNl29krc1xM1Xa
 g1R1Y0U7tfK5dPwXTkJtRy2UpnusAYaZyeQinxK8w575iD1nJ9NTIcXmp/SqompNwzOv
 WqxQqdkvkiq3zJWLYC5Sg6vzwRmRIpwV07mqp2VgAd/OoZlCS3l+kP3EHJS2ceWIG2bq
 CuT+Km58fYb5qmH27TDD7dYGql1OkB9sdBaPucD8P2cEcS7O6xxONO1vQFVbuthgp7Xp
 4/XCnu6OdDZTWKUAdFA8ta84/p3b2EW/9VImcy+p0+nKjyFiwW74cAgDWJVqN9bHSlGn
 f9ag==
X-Gm-Message-State: AO0yUKXMVXSDjT8mEVWzyLILoET2RQES5qiAjs7iZI6d39q4YDRwJLlh
 EDtgQCikuaLbhC+Pj3+xC/OzMoF1l5UD/mZMWojw1IkVXN7TAtqCulDaI1CAGkys6vx95HiUwj5
 fpkyIhPqzpktXgdPBgWKE7kfziTNyRl0=
X-Received: by 2002:a05:690c:9e:b0:464:4ea1:3baa with SMTP id
 be30-20020a05690c009e00b004644ea13baamr207793ywb.302.1675252146363; 
 Wed, 01 Feb 2023 03:49:06 -0800 (PST)
X-Google-Smtp-Source: AK7set978WcT/twlnqvAOPICVxd3sB93oHOvON71P9SBc6pf4htvlrOU4mXtbp3VNMm6SCEA/tB9NP5IscU4FOtp3PU=
X-Received: by 2002:a05:690c:9e:b0:464:4ea1:3baa with SMTP id
 be30-20020a05690c009e00b004644ea13baamr207786ywb.302.1675252146131; Wed, 01
 Feb 2023 03:49:06 -0800 (PST)
MIME-Version: 1.0
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <6684066f-452d-a8b3-58b2-b0db2a3c2015@redhat.com>
 <20230201061709-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230201061709-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 1 Feb 2023 12:48:29 +0100
Message-ID: <CAJaqyWcmxwKSVLY7sDTmYwLdzhVV78XDa5M4FAvmHq4X2Kin8Q@mail.gmail.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
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

On Wed, Feb 1, 2023 at 12:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Feb 01, 2023 at 12:14:18PM +0100, Maxime Coquelin wrote:
> > Thanks Eugenio for working on this.
> >
> > On 1/31/23 20:10, Eugenio Perez Martin wrote:
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
> >
> > I am fine with both proposals.
> > I think index remapping will require a bit more rework in the DPDK
> > Vhost-user library, but nothing insurmountable.
> >
> > I am currently working on a PoC adding support for VDUSE in the DPDK
> > Vhost library, and recently added control queue support. We can reuse it
> > if we want to prototype your proposal.
> >
> > Maxime
> >
> > > Thanks!
> > >
>
>
> technically backend knows how many vqs are there, last one is cvq...
> not sure we need full blown remapping ...
>

The number of queues may not be the same between cmdline and the device.

If vhost-user device cmdline wants more queues than offered by the
device qemu will print an error. But the reverse (to offer the same
number of queues or less than the device have) is valid at this
moment.

If we add cvq with this scheme, cvq index will not be the same between
the guest and the device.

vhost-vdpa totally ignores the queues parameter, so we're losing the
opportunity to offer a consistent config space in the event of a
migration. I suggest we should act the same way as I'm proposing here
with vhost-user, so:
* QEMU can block the migration in the case the destination cannot
offer the same number of queues.
* The guest will not see a change of the config space under its feets.

Now there are other fields in the config space for sure (mtu, rss
size, etc), but I think the most complex case is the number of queues
because cvq.

Is that clearer?

Thanks!


