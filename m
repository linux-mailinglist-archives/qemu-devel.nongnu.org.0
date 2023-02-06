Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1268C330
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 17:28:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP4LQ-0000mu-54; Mon, 06 Feb 2023 11:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pP4LI-0000mK-I8
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 11:27:44 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pP4LG-0000Ow-JD
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 11:27:44 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id t1so5737295ybd.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 08:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RLgX2o3MJyCY39k40u5lR5tLh/jUqo6iE0+PE7qVR88=;
 b=Br3tjDPnDvGAnipp5G/8bGWT/PfHcJ8nrXD43nxqg0M9sWz7brgGzyRrB0v3yttsh1
 xEtsXOKor2zNtvFpJkW8KworUJ3tjR+dmAjLj9u3P2kIB9wR4WLk1G/Z72RM0T9v0z75
 /mojI+Fs26WeIks5A894krmauVIpGjGQ+mtaPeU3CAR9pkwftmCjVwQf19zefIHq4dHq
 8h6RYkqXC3ipl30prW8VcuM1I1GmQyc0BxvbbGT+VlJBMrK9qwCUv8O6vpAiXxVtEEUf
 U8iUvHePRYVtcIQR4MNOigLt2QRNIn8MxrLV9z9gBvcg1bhS2f5sUXjRpq4tdnjFEVAV
 nq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RLgX2o3MJyCY39k40u5lR5tLh/jUqo6iE0+PE7qVR88=;
 b=DPFX9DwqDKx/fc8jesKxPn1NeyUjCy6SlYYPS1+nrVqXzCZI//kdi1fs+WAZxtB1Fg
 u+nsbZ52z8kEiZysueGe6g/vwCEJcL6AxuikiG379AADG+MhGPEiFS5TFbTWjR3ypY8I
 16po6nLBHu/rKjAY7SI4TKFaprteUdB0wnIgflbHBxD9Zg5EjpHoxKaWKlgSHv9MSnXw
 LVItidR4cAvGElBsKG+79196l/XJg+/k18C3sFyBzw0jH5EB6H9o4JRdCv4/Bodygt3C
 7uPGW0ol+adZPHk+OBr/YFybcBDvSf/Mo/H1IrgSbmOQLoqm63IReq1Mu14YglZ7VeMw
 orOw==
X-Gm-Message-State: AO0yUKXj1km81h4Eogxe4ZTPmtTwu4z2xrLuNHGVfMNr2H5zkinx5x5r
 Q1zgvTDkOXbUiIOCeMV4EKQ9HLmpEG5Rf0TaR0Y=
X-Google-Smtp-Source: AK7set9cBnzKVEnMSA5UfOY3gFQivP2f2Qb6N5byp1A1r7Z8YqeTYLFpq8OcFG/fgRn+dX/mC3PNKkKmgFero9Fxh0Q=
X-Received: by 2002:a25:410:0:b0:827:8002:1dc4 with SMTP id
 16-20020a250410000000b0082780021dc4mr26180ybe.209.1675700861473; Mon, 06 Feb
 2023 08:27:41 -0800 (PST)
MIME-Version: 1.0
References: <fb523956-7a8c-608b-6db1-961686b73e9c@redhat.com>
In-Reply-To: <fb523956-7a8c-608b-6db1-961686b73e9c@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 6 Feb 2023 11:27:29 -0500
Message-ID: <CAJSP0QWnq6av7j6x_n-C2mLSPMYBhMeEthr6ayPN-cmsEB3UnA@mail.gmail.com>
Subject: Re: vhost-user (virtio-fs) migration: back end state
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dave Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 6 Feb 2023 at 07:36, Hanna Czenczek <hreitz@redhat.com> wrote:
>
> Hi Stefan,
>
> For true virtio-fs migration, we need to migrate the daemon=E2=80=99s (ba=
ck
> end=E2=80=99s) state somehow.  I=E2=80=99m addressing you because you had=
 a talk on this
> topic at KVM Forum 2021. :)
>
> As far as I understood your talk, the only standardized way to migrate a
> vhost-user back end=E2=80=99s state is via dbus-vmstate.  I believe that
> interface is unsuitable for our use case, because we will need to
> migrate more than 1 MB of state.  Now, that 1 MB limit has supposedly
> been chosen arbitrarily, but the introducing commit=E2=80=99s message say=
s that
> it=E2=80=99s based on the idea that the data must be supplied basically
> immediately anyway (due to both dbus and qemu migration requirements),
> and I don=E2=80=99t think we can meet that requirement.

Yes, dbus-vmstate is the available today. It's independent of
vhost-user and VIRTIO.

> Has there been progress on the topic of standardizing a vhost-user back
> end state migration channel besides dbus-vmstate?  I=E2=80=99ve looked ar=
ound
> but didn=E2=80=99t find anything.  If there isn=E2=80=99t anything yet, i=
s there still
> interest in the topic?

Not that I'm aware of. There are two parts to the topic of VIRTIO
device state migration:
1. Defining an interface for migrating VIRTIO/vDPA/vhost/vhost-user
devices. It doesn't need to be implemented in all these places
immediately, but the design should consider that each of these
standards will need to participate in migration sooner or later. It
makes sense to choose an interface that works for all or most of these
interfaces instead of inventing something vhost-user-specific.
2. Defining standard device state formats so VIRTIO implementations
can interoperate.

> Of course, we could use a channel that completely bypasses qemu, but I
> think we=E2=80=99d like to avoid that if possible.  First, this would req=
uire
> adding functionality to virtiofsd to configure this channel.  Second,
> not storing the state in the central VM state means that migrating to
> file doesn=E2=80=99t work (well, we could migrate to a dedicated state fi=
le,
> but...).  Third, setting up such a channel after virtiofsd has sandboxed
> itself is hard.  I guess we should set up the migration channel before
> sandboxing, which constrains runtime configuration (basically this would
> only allow us to set up a listening server, I believe).  Well, and
> finally, it isn=E2=80=99t a standard way, which won=E2=80=99t be great if=
 we=E2=80=99re planning
> to add a standard way anyway.

Yes, live migration is hard enough. Duplicating it is probably not
going to make things better. It would still be necessary to support
saving to file as well as live migration.

There are two high-level approaches to the migration interface:
1. The whitebox approach where the vhost-user back-end implements
device-specific messages to get/set migration state (e.g.
VIRTIO_FS_GET_DEVICE_STATE with a struct virtio_fs_device_state
containing the state of the FUSE session or multiple fine-grained
messages that extract pieces of state). The hypervisor is responsible
for the actual device state serialization.
2. The blackbox approach where the vhost-user back-end implements the
device state serialization itself and just produces a blob of data.

An example of the whitebox approach is the existing vhost migration
interface - except that it doesn't really support device-specific
state, only generic virtqueue state.

An example of the blackbox approach is the VFIO v2 migration interface:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/inc=
lude/uapi/linux/vfio.h#n867

Another aspect to consider is whether save/load is sufficient or if
the full iterative migration model needs to be exposed by the
interface. VFIO migration is an example of the full iterative model
while dbus-vmstate is just save/load. Devices with large amounts of
state need the full iterative model while simple devices just need
save/load.

Regarding virtiofs, I think the device state is not
implementation-specific. Different implementations may have different
device states (e.g. in-memory file system implementation versus POSIX
file system-backed implementation), but the device state produced by
https://gitlab.com/virtio-fs/virtiofsd can probably also be loaded by
another implementation.

My suggestion is blackbox migration with a full iterative interface.
The reason I like the blackbox approach is that a device's device
state is encapsulated in the device implementation and does not
require coordinating changes across other codebases (e.g. vDPA and
vhost kernel interface, vhost-user protocol, QEMU, etc). A blackbox
interface only needs to be defined and implemented once. After that,
device implementations can evolve without constant changes at various
layers.

So basically, something like VFIO v2 migration but for vhost-user
(with an eye towards vDPA and VIRTIO support in the future).

Should we schedule a call with Jason, Michael, Juan, David, etc to
discuss further? That way there's less chance of spending weeks
working on something only to be asked to change the approach later.

Stefan

