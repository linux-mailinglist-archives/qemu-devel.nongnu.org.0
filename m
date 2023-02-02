Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B766886BE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 19:39:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNeTs-0003yf-Ic; Thu, 02 Feb 2023 13:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNeTd-0003xf-9N
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:38:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pNeTb-0001Et-Dm
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 13:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675363106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDYiiVYgkbsGlbmyuscHKtFxvaEnLHwhMP8LOM6d4fQ=;
 b=cccnMMIaGkvU93r/S4xlgWnhHjHbbUVHKT6OmLch8T/IO7GFu4DBJx9SI+bE+29miu1rYK
 Ip5X1fAiKsNBZAYrhZIjNOziyiHsIZnzJMH/ckWLDaJMlog9aL3+mzXJ7+Yo4vgE+AbzgE
 XnKwlK6ayDnuY8/zegpqAG54dzjwjPo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-166-R7bToqvyO1qCQJDTEBIYzQ-1; Thu, 02 Feb 2023 13:38:24 -0500
X-MC-Unique: R7bToqvyO1qCQJDTEBIYzQ-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-5028c723d28so28447917b3.15
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 10:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dDYiiVYgkbsGlbmyuscHKtFxvaEnLHwhMP8LOM6d4fQ=;
 b=UnAHQ04h1I+vKlVL8F5zXXDjBdyZuV3UeH7I85hCXxmC+XdqAGQGQPa3GWLsebgNUr
 CI9n6J1YyAFzubgoKTjKERs3YAcO2Rrkv3Y2OAFxN7NbxciD+e7y4S85AW9xfP5EnBKB
 i3eiryH4sg0+z+l+XvWmS84XzjCREiyheqTYOH+jYzp3SN0mYm7QtV1O4Gk9Wfm4BMSV
 JOJMm26cvGaBhMbc2LXFHkArQ1QEdzISEz284gIrfB33SzTbTJNQZHhAYp6hpqKy/PgE
 OjGQW06iWzxfsB9YTvw6COVjR7nlYiTJ9AFsqsKTWKt1U1cePokSqDTgpbgL0ROEhOZE
 cXBA==
X-Gm-Message-State: AO0yUKVBIB+oAFhy3SkfiMP5sQBqxGeTjTDuNgrWaqR/yx1AoSHaC+eK
 oN3B72dhMQ3L6Jt5rkkHBAmnRC1aWAYgzgVzSfv0rcLQleHF4x4zTrvXyYhBJ8sg/HUqrjR56mH
 eHDlwoeAQLkqxeAE7sRvRe1UG7/gW4Bw=
X-Received: by 2002:a0d:ebd2:0:b0:499:f27a:2924 with SMTP id
 u201-20020a0debd2000000b00499f27a2924mr1003878ywe.411.1675363104348; 
 Thu, 02 Feb 2023 10:38:24 -0800 (PST)
X-Google-Smtp-Source: AK7set9UdiCUgoDKnK52EMsPq2HxmMX2igBzc4fSPVfxEiWHRBTzrxrJlUEycqiTo0YgpRhXadiDfp5DsTaY1mlxsDM=
X-Received: by 2002:a0d:ebd2:0:b0:499:f27a:2924 with SMTP id
 u201-20020a0debd2000000b00499f27a2924mr1003877ywe.411.1675363104135; Thu, 02
 Feb 2023 10:38:24 -0800 (PST)
MIME-Version: 1.0
References: <CAJaqyWcU5i=caPbbALnV-GcnWH1bu-KVRj54XauDpUZaEfn4Wg@mail.gmail.com>
 <6684066f-452d-a8b3-58b2-b0db2a3c2015@redhat.com>
 <20230201061709-mutt-send-email-mst@kernel.org>
 <CAJaqyWcmxwKSVLY7sDTmYwLdzhVV78XDa5M4FAvmHq4X2Kin8Q@mail.gmail.com>
 <7c076123-42e2-a041-2b5d-95d1afd82143@redhat.com>
In-Reply-To: <7c076123-42e2-a041-2b5d-95d1afd82143@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 2 Feb 2023 19:37:47 +0100
Message-ID: <CAJaqyWd-UtwQCbm=C-3CUS8kFyyY58YdbD+PwfKiGU+==k-DKA@mail.gmail.com>
Subject: Re: Emulating device configuration / max_virtqueue_pairs in
 vhost-vdpa and vhost-user
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Feb 2, 2023 at 4:45 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/1 19:48, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Wed, Feb 1, 2023 at 12:20 PM Michael S. Tsirkin <mst@redhat.com> wro=
te:
> >> On Wed, Feb 01, 2023 at 12:14:18PM +0100, Maxime Coquelin wrote:
> >>> Thanks Eugenio for working on this.
> >>>
> >>> On 1/31/23 20:10, Eugenio Perez Martin wrote:
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
> >>> I am fine with both proposals.
> >>> I think index remapping will require a bit more rework in the DPDK
> >>> Vhost-user library, but nothing insurmountable.
> >>>
> >>> I am currently working on a PoC adding support for VDUSE in the DPDK
> >>> Vhost library, and recently added control queue support. We can reuse=
 it
> >>> if we want to prototype your proposal.
> >>>
> >>> Maxime
> >>>
> >>>> Thanks!
> >>>>
> >>
> >> technically backend knows how many vqs are there, last one is cvq...
> >> not sure we need full blown remapping ...
> >>
> > The number of queues may not be the same between cmdline and the device=
.
> >
> > If vhost-user device cmdline wants more queues than offered by the
> > device qemu will print an error. But the reverse (to offer the same
> > number of queues or less than the device have) is valid at this
> > moment.
> >
> > If we add cvq with this scheme, cvq index will not be the same between
> > the guest and the device.
> >
> > vhost-vdpa totally ignores the queues parameter, so we're losing the
> > opportunity to offer a consistent config space in the event of a
> > migration. I suggest we should act the same way as I'm proposing here
> > with vhost-user, so:
> > * QEMU can block the migration in the case the destination cannot
> > offer the same number of queues.
> > * The guest will not see a change of the config space under its feets.
>
>
> As we discussed in the past, it would be easier to fail the device
> initialization in this case.
>

But qemu does not know the source config space, so it cannot check if
it is equal. I think qemu cmdline combined with the migration protocol
is the security measure about this. It already checks for features,
the plan is to extend that check for config space.

Thanks!

> Thanks
>
>
> >
> > Now there are other fields in the config space for sure (mtu, rss
> > size, etc), but I think the most complex case is the number of queues
> > because cvq.
> >
> > Is that clearer?
> >
> > Thanks!
> >
>


