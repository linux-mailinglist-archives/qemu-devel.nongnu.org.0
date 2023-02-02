Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA66688693
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 19:34:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNeOP-0000mv-11; Thu, 02 Feb 2023 13:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNeOM-0000mV-AW
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:33:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNeOJ-0007DQ-RE
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675362778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xbYQvaM949iNldrcHQiGImlSomCIf2AqkS0hXPfImwQ=;
 b=ceqA+SkN2CjmcOfMrPyCeN30R+zyRsrflxWfD98+0VuZt0tKnRFyi1CFLz0cOryJRlRuG2
 Juavkr12Nw4FqHjb/K1TwGweLy0oXgK+cb31jb2+zTQArkRM8qRLfr9T+WKRnUfbBwJeSy
 kyeHwSM0o0QggxjiW6sBKiuKY2/G2Fg=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-bHAR6KE7NwKnU0hNgkU_tw-1; Thu, 02 Feb 2023 13:32:57 -0500
X-MC-Unique: bHAR6KE7NwKnU0hNgkU_tw-1
Received: by mail-yb1-f198.google.com with SMTP id
 b18-20020a253412000000b0085747dc8317so2491331yba.15
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 10:32:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xbYQvaM949iNldrcHQiGImlSomCIf2AqkS0hXPfImwQ=;
 b=dGDoTDX8Ux9jc/nURhPViFDL1Y3K1e4ij+wX+sZLa52XoT1MO8p+6jU1gexWTQCUd9
 LTEK1KrYc8b4iwiCs3sopX+4BqYYV/bkmeXKbrT+WoU0hf3cjqIEgpCePAc4zaSp6crZ
 3pRsK3cP2D+H0NelPk8GadltcRNuaYFhjSIAsDI4jGLNRcFIEjjH0whKxPHdPoliWOii
 +dznpbZn70qzb9LG2y6B9myMYPqayBcDDY7uMFpCiH95opVGTH9h9Ze9QWx1q+GVvPLx
 Nwi26n+2nmTHAiXxtKiOxtl41YoJdEDQqqeZp0S8hCkwkd4toPHssAiYz8xd9ogFQ5el
 9RRQ==
X-Gm-Message-State: AO0yUKVX+IXdJeFZ1nCRhTOfJ6V1ABFzZLNmEK5OnCUm6S2zIQPNR9BX
 6RNdb0ovoESgj0AB/T4Hlm4UACP7wd0VjwgQtoj1apKJ7PDzT946pqcIjkpAQybLuKhb8eVW8zW
 Dch//TLFhNOu8KoPcJ8GuC5rtcWOqU0w=
X-Received: by 2002:a0d:ebd2:0:b0:499:f27a:2924 with SMTP id
 u201-20020a0debd2000000b00499f27a2924mr1001738ywe.411.1675362776462; 
 Thu, 02 Feb 2023 10:32:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+YvIh/b3Ex0eyNSLU7bnO0w8VNb/V+/EQVYZjwLHcGgM+QOHh8ZEorMugKfI7Ht18jrfLNbbmqK4K2u8QKSfQ=
X-Received: by 2002:a0d:ebd2:0:b0:499:f27a:2924 with SMTP id
 u201-20020a0debd2000000b00499f27a2924mr1001728ywe.411.1675362776148; Thu, 02
 Feb 2023 10:32:56 -0800 (PST)
MIME-Version: 1.0
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <CAJaqyWfZX2sgoOq+Poa2tQTc2VTRneaUvzozOdDS+7SoMUdNkg@mail.gmail.com>
 <CACGkMEuwVXTf6FQxShu6QL-BJdQLOYE5Xy-RVEcemmWg1WKAGQ@mail.gmail.com>
 <CAJaqyWdxL+9gvjawpFTMg_ut8WpcZErdipAMMCSXYdOTcYK61w@mail.gmail.com>
 <10256cb5-1e76-188c-189d-f8c917571550@redhat.com>
In-Reply-To: <10256cb5-1e76-188c-189d-f8c917571550@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 2 Feb 2023 19:32:20 +0100
Message-ID: <CAJaqyWde+NXeDNTA=Bx4smhy=GE8oVokA9Ss2op+mLh=pCdGWg@mail.gmail.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
To: Jason Wang <jasowang@redhat.com>
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Thu, Feb 2, 2023 at 4:41 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/1 15:49, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Wed, Feb 1, 2023 at 4:29 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Wed, Feb 1, 2023 at 3:11 AM Eugenio Perez Martin <eperezma@redhat.c=
om> wrote:
> >>> On Tue, Jan 31, 2023 at 8:10 PM Eugenio Perez Martin
> >>> <eperezma@redhat.com> wrote:
> >>>> Hi,
> >>>>
> >>>> The current approach of offering an emulated CVQ to the guest and ma=
p
> >>>> the commands to vhost-user is not scaling well:
> >>>> * Some devices already offer it, so the transformation is redundant.
> >>>> * There is no support for commands with variable length (RSS?)
> >>>>
> >>>> We can solve both of them by offering it through vhost-user the same
> >>>> way as vhost-vdpa do. With this approach qemu needs to track the
> >>>> commands, for similar reasons as vhost-vdpa: qemu needs to track the
> >>>> device status for live migration. vhost-user should use the same SVQ
> >>>> code for this, so we avoid duplications.
> >>>>
> >>>> One of the challenges here is to know what virtqueue to shadow /
> >>>> isolate. The vhost-user device may not have the same queues as the
> >>>> device frontend:
> >>>> * The first depends on the actual vhost-user device, and qemu fetche=
s
> >>>> it with VHOST_USER_GET_QUEUE_NUM at the moment.
> >>>> * The qemu device frontend's is set by netdev queues=3D cmdline para=
meter in qemu
> >>>>
> >>>> For the device, the CVQ is the last one it offers, but for the guest
> >>>> it is the last one offered in config space.
> >>>>
> >>>> To create a new vhost-user command to decrease that maximum number o=
f
> >>>> queues may be an option. But we can do it without adding more
> >>>> commands, remapping the CVQ index at virtqueue setup. I think it
> >>>> should be doable using (struct vhost_dev).vq_index and maybe a few
> >>>> adjustments here and there.
> >>>>
> >>>> Thoughts?
> >>>>
> >>>> Thanks!
> >>>
> >>> (Starting a separated thread to vhost-vdpa related use case)
> >>>
> >>> This could also work for vhost-vdpa if we ever decide to honor netdev
> >>> queues argument. It is totally ignored now, as opposed to the rest of
> >>> backends:
> >>> * vhost-kernel, whose tap device has the requested number of queues.
> >>> * vhost-user, that errors with ("you are asking more queues than
> >>> supported") if the vhost-user parent device has less queues than
> >>> requested (by vhost-user msg VHOST_USER_GET_QUEUE_NUM).
> >>>
> >>> One of the reasons for this is that device configuration space is
> >>> totally passthrough, with the values for mtu, rss conditions, etc.
> >>> This is not ideal, as qemu cannot check src and destination
> >>> equivalence and they can change under the feets of the guest in the
> >>> event of a migration.
> >> This looks not the responsibility of qemu but the upper layer (to
> >> provision the same config/features in src/dst).
> > I think both share it. Or, at least, that it is inconsistent that QEMU
> > is in charge of checking / providing consistency for virtio features,
> > but not virtio-net config space.
> >
> > If we follow that to the extreme, we could simply delete the feature
> > checks, right?
>
>
> Just to make sure we are at the same page.
>
> If you mean deleting the feature checks in Qemu, then I think we can't
> do that.
>

So my point is, is it expected for the user that it can trust qemu
will migrate features like packed=3Doff/on or tx/rx_queue_size=3DN but it
will not migrate mtu=3DN or queues=3DN?

I know the difference is if the field depends on virtio common config
or virtio net config space. A little bit higher level, if the feature
is common to all virtio devices or only virtio-net. If I'm working
with qemu, I don't know how think from the user POV the number of
queues is gray here, would it migrate, wouldn't? :).

> What I meant is.
>
> Consider vDPA is provisioned (either netlink or other way) with featureX
> and configY. It would be sufficient to validate if the emulated device
> features and configs matches exactly what vDPA device had.
>
> Technically, it should be possible to doing any mediation in the middle
> but it may cause a lot of troubles in the management and others, consider=
:
>
> featureX is not provisioned but emulated by Qemu, then it's almost
> impossible for the management to check the migration compatibility. If
> feature X can be easily emulated, it should be done in the layer of vDPA
> parent not Qemu, then it could be recognized by the management.
>

I kind of buy this, although I think it would be solvable by asking
qemu what features it emulates and then add to the feature bits mix.

But I'm not proposing to emulate features (here :) ) actually, but to
treat the device config space the same way as we treat the
virtio_pci_common_cfg, and emulate it all the time, effectively
homogenizing the same way as vhost-user etc is homogenized.

I understand the provision tool is a way to do it, maybe even more
convenient. Do all devices support it? Is it reasonable to expect that
all devices that will be migrated (into) will support it?

>
> >
> >>> External tools are needed for this, duplicating
> >>> part of the effort.
> >>>
> >>> Start intercepting config space accesses and offering an emulated one
> >>> to the guest with this kind of adjustments is beneficial, as it makes
> >>> vhost-vdpa more similar to the rest of backends, making the surprise
> >>> on a change way lower.
> >> This probably needs more thought, since vDPA already provides a kind
> >> of emulation in the kernel. My understanding is that it would be
> >> sufficient to add checks to make sure the config that guests see is
> >> consistent with what host provisioned?
> >>
> > With host provisioned you mean with "vdpa" tool or with qemu?
>
>
> Make sure the features and config of emulated device provided by Qemu
> matches the vDPA device provisioned via netlink or other mgmt API.
>

Yes, that is doable for sure. It should be enough with fetching the
config with VHOST_VDPA_GET_CONFIG ioctl, isn't it?

>
> > Also, we
> > need a way to communicate the guest values to it If those checks are
> > added in the kernel.
> >
> > The reasoning here is the same as above: QEMU already filters features
> > with its own emulated layer, so the operator can specify a feature
> > that will never appear to the guest.
>
>
> This needs to be done at the time of vDPA device provisioning. Otherwise
> we will end up with a lot of corner cases. E.g if 8 queue pairs is
> provisioned, do we allow starting a guest with 4 queue pairs?
>

In my proposal, qemu would adjust the number of queue pairs the guest
sees to 4 qps.

>
> >   It has other uses (abstract
> > between transport for example), but feature filtering is definitely a
> > thing there.
> >
> > A feature set to off in a VM (or that does not exist in that
> > particular qemu version) will never appear as on even in the case of
> > migration to modern qemu versions.
> >
> > We don't have the equivalent protection for device config space. QEMU
> > could assure a consistent MTU, number of queues, etc for the guest in
> > virtio_net_get_config (and equivalent for other kinds of devices).
> > QEMU already has some transformations there. It shouldn't take a lot
> > of code.
> >
> > Having said that:
> > * I'm ok with starting just with checks there instead of
> > transformations like the queues remap proposed here.
>
>
> I think we need to keep thing easier. Technically, we could do any kind
> of the mediation/emulation via Qemu, but we need only implement the one
> that is really needed.
>

I agree with this point, but I think we are just moving complexity.

Let's go back to the original vdpa question / problems:

1) There are parameters totally ignored by qemu's vhost-vdpa (mtu,
queues, etc), and a naive operator is surprised by this behavior. And
the guest will see that the config space changes suddenly in a
migration if the device provisioning is not done providing "all and
every" device config space value.

Should qemu forbid cmdline parameters if we're using vhost-vdpa backend? li=
ke:
* Backend queues=3D parameter (unused from its inclusion)
* Set mtu, speed, duplex, etc in qemu cmdline as long as the backend is vdp=
a.

2) For the second problem, maybe a spurious config interrupt is
missing? Is the device allowed to change all of them, like reduce rss
max table length? Or should the provision tool be able to fetch all of
these values from the original device and then send it to the
provision tool in the destination?

Thanks!

> Queue remapping might complicate a lot stuffs like notification area
> mapping etc.
>
> Thanks
>
>
> > * If we choose not to implement it, I'm not proposing to actually
> > delete the features checks, as I see them useful :).
> >
> > Thanks!
> >
>


