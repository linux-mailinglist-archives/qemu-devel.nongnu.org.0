Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D956FCA6F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:44:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPVD-0003TU-UX; Tue, 09 May 2023 11:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPV7-0003NA-41
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:43:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPV5-00052C-7k
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683647018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s74QJwzKN9PoxHU0BoqG+S7cKj+TewaPqI9qtXHyGNs=;
 b=dLPixJIBewRp2zhATpkXeqHOUdV9/HI4y6wCbn8d19oHw/Yv1TzEbqZsmprQRFo64boXN7
 F25bcgt4Ht+xMo/5o9r5aItn6RVIImmZ8xGvYua4MXh0yJqw+Qlpofn/fTWQ6t2aqYRZw4
 QhnomgS8f48dMJqeBzNCX+Kw+KGoayA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-JgaV_odqOvytXxTQi9EZcw-1; Tue, 09 May 2023 11:43:37 -0400
X-MC-Unique: JgaV_odqOvytXxTQi9EZcw-1
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-b9a7d92d0f7so11088260276.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683647017; x=1686239017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s74QJwzKN9PoxHU0BoqG+S7cKj+TewaPqI9qtXHyGNs=;
 b=dYSZWR4Uh+85xATh5Z99q/0No2TGChDVnzG5iyx1r3zYmKbgVpmXNF2iNGghUc6nKA
 YsrmQ5ag7z6ClvcgIeYf/e4YC3QTluDkvZ3DBNgbad0Ru3co/sp2EpHvrg3EOyRUItsY
 cQZbnIYChwGJkQejY3YemOD9g88LFD/mobifvftIHAR9LPTDbEAa8uM1rx729Ni7XGGb
 JkigXda6kFTBCodHU0AdIhkIsFxwK1RKrh5wU6Ak6YtuykNuSUzWpocL7dVua0XEpiMz
 Gfa5Q6IMtNVckibb1+yS5ue45R5LX4sHEdJRLR4h3Ti95dmW5QXLUyik5+YKmqL+c5df
 gmvQ==
X-Gm-Message-State: AC+VfDwtnTzWQb7bCGAUPbKYE2mE32SPBV2RYgKJVmTLDLRJS++58qcQ
 0PZIn0TY8cfN264D6Rl2mjSg27B+B0xbEHKSGc1G5ycc4LijmwXq1bIsm/h8fndx7IfqTTXAp+S
 aODUV0K+Opn9DKKY05hgYACoSrhBB06I=
X-Received: by 2002:a25:d313:0:b0:b8f:2f89:4074 with SMTP id
 e19-20020a25d313000000b00b8f2f894074mr13398771ybf.53.1683647016732; 
 Tue, 09 May 2023 08:43:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5XpecOFiLhuLfx3vIRphbLViE2smybJ0V7jvB0Jel1MlLdXUa/FW8IIjbyiU8sjrvEaIMkiazVCFreGNbPso8=
X-Received: by 2002:a25:d313:0:b0:b8f:2f89:4074 with SMTP id
 e19-20020a25d313000000b00b8f2f894074mr13398752ybf.53.1683647016490; Tue, 09
 May 2023 08:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
 <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
 <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
 <71e47e3e-880d-38d8-c1b0-3287c60365e4@redhat.com>
 <CAJaqyWe13QxuC9BNBULJ1xu1saWE9Y3ET8eEef-7qtyL5R73SQ@mail.gmail.com>
 <20230509153016.GF926999@fedora>
In-Reply-To: <20230509153016.GF926999@fedora>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 9 May 2023 17:43:00 +0200
Message-ID: <CAJaqyWcMdo_-289hC9fD1sGS=Cpr0XXyykKYdsFZ8=aYL1aXSg@mail.gmail.com>
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Hanna Czenczek <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel@nongnu.org, 
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 9, 2023 at 5:30=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
>
> On Fri, May 05, 2023 at 04:26:08PM +0200, Eugenio Perez Martin wrote:
> > On Fri, May 5, 2023 at 11:51=E2=80=AFAM Hanna Czenczek <hreitz@redhat.c=
om> wrote:
> > >
> > > (By the way, thanks for the explanations :))
> > >
> > > On 05.05.23 11:03, Hanna Czenczek wrote:
> > > > On 04.05.23 23:14, Stefan Hajnoczi wrote:
> > >
> > > [...]
> > >
> > > >> I think it's better to change QEMU's vhost code
> > > >> to leave stateful devices suspended (but not reset) across
> > > >> vhost_dev_stop() -> vhost_dev_start(), maybe by introducing
> > > >> vhost_dev_suspend() and vhost_dev_resume(). Have you thought about
> > > >> this aspect?
> > > >
> > > > Yes and no; I mean, I haven=E2=80=99t in detail, but I thought this=
 is what=E2=80=99s
> > > > meant by suspending instead of resetting when the VM is stopped.
> > >
> > > So, now looking at vhost_dev_stop(), one problem I can see is that
> > > depending on the back-end, different operations it does will do
> > > different things.
> > >
> > > It tries to stop the whole device via vhost_ops->vhost_dev_start(),
> > > which for vDPA will suspend the device, but for vhost-user will reset=
 it
> > > (if F_STATUS is there).
> > >
> > > It disables all vrings, which doesn=E2=80=99t mean stopping, but may =
be
> > > necessary, too.  (I haven=E2=80=99t yet really understood the use of =
disabled
> > > vrings, I heard that virtio-net would have a need for it.)
> > >
> > > It then also stops all vrings, though, so that=E2=80=99s OK.  And bec=
ause this
> > > will always do GET_VRING_BASE, this is actually always the same
> > > regardless of transport.
> > >
> > > Finally (for this purpose), it resets the device status via
> > > vhost_ops->vhost_reset_status().  This is only implemented on vDPA, a=
nd
> > > this is what resets the device there.
> > >
> > >
> > > So vhost-user resets the device in .vhost_dev_start, but vDPA only do=
es
> > > so in .vhost_reset_status.  It would seem better to me if vhost-user
> > > would also reset the device only in .vhost_reset_status, not in
> > > .vhost_dev_start.  .vhost_dev_start seems precisely like the place to
> > > run SUSPEND/RESUME.
> > >
> >
> > I think the same. I just saw It's been proposed at [1].
> >
> > > Another question I have (but this is basically what I wrote in my las=
t
> > > email) is why we even call .vhost_reset_status here.  If the device
> > > and/or all of the vrings are already stopped, why do we need to reset
> > > it?  Na=C3=AFvely, I had assumed we only really need to reset the dev=
ice if
> > > the guest changes, so that a new guest driver sees a freshly initiali=
zed
> > > device.
> > >
> >
> > I don't know why we didn't need to call it :). I'm assuming the
> > previous vhost-user net did fine resetting vq indexes, using
> > VHOST_USER_SET_VRING_BASE. But I don't know about more complex
> > devices.
>
> It was added so DPDK can batch rx virtqueue RSS updates:
>
> commit 923b8921d210763359e96246a58658ac0db6c645
> Author: Yajun Wu <yajunw@nvidia.com>
> Date:   Mon Oct 17 14:44:52 2022 +0800
>
>     vhost-user: Support vhost_dev_start
>
>     The motivation of adding vhost-user vhost_dev_start support is to
>     improve backend configuration speed and reduce live migration VM
>     downtime.
>
>     Today VQ configuration is issued one by one. For virtio net with
>     multi-queue support, backend needs to update RSS (Receive side
>     scaling) on every rx queue enable. Updating RSS is time-consuming
>     (typical time like 7ms).
>
>     Implement already defined vhost status and message in the vhost
>     specification [1].
>     (a) VHOST_USER_PROTOCOL_F_STATUS
>     (b) VHOST_USER_SET_STATUS
>     (c) VHOST_USER_GET_STATUS
>
>     Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
>     device start and reset(0) for device stop.
>
>     On reception of the DRIVER_OK message, backend can apply the needed s=
etting
>     only once (instead of incremental) and also utilize parallelism on en=
abling
>     queues.
>
>     This improves QEMU's live migration downtime with vhost user backend
>     implementation by great margin, specially for the large number of VQs=
 of 64
>     from 800 msec to 250 msec.
>
>     [1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html
>
>     Signed-off-by: Yajun Wu <yajunw@nvidia.com>
>     Acked-by: Parav Pandit <parav@nvidia.com>
>     Message-Id: <20221017064452.1226514-3-yajunw@nvidia.com>
>     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>

Sorry for the confusion, what I was wondering is how vhost-user
devices do not need any signal to reset the device before
VHOST_USER_SET_STATUS. And my guess is that it is enough to get / set
the vq indexes.

vhost_user_reset_device is limited to scsi, so it would not work for
the rest of devices.

Thanks!


