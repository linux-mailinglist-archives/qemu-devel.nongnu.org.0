Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A819966BA7A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:35:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLsR-0007z2-Cu; Mon, 16 Jan 2023 04:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHLsG-0007xq-Ue
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:33:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHLsE-0005Z5-3S
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673861628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xx0wr1FsvnwJNL4IdzfYLdflep/PGs517+3nsI8Dat0=;
 b=iq9NGCBN6h32fuERhNVXGzvI7+M+xm1ks93zhsUAvt1pywVJGNTrvnxIbivfqjrxNNedMp
 CsO+D6Neyppyyrbqq8J6lCI1LRjAPHDVKEFkNSSSXX74DiAM7ALIRcFVF1pJURXpGo8Ms3
 IZzKPQUQQp25dekvdpOzYU4m8LKm69g=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-Yjq5pXteOp69vcuAqPAtYg-1; Mon, 16 Jan 2023 04:33:45 -0500
X-MC-Unique: Yjq5pXteOp69vcuAqPAtYg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-4dd4d4591f7so93567097b3.15
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 01:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xx0wr1FsvnwJNL4IdzfYLdflep/PGs517+3nsI8Dat0=;
 b=Djivzp7oJ2ZnRUzE6ir5NAdkvEQNTXIj5ApySxNyk4m1lUttrqBjxSSwuCTLo6wKMe
 XUNVgzw43i7PPrmQQb94reJUzZdaJXjTOgIKTVAVbc9dTo51R3dy8QSLQwfhVlIBHB63
 l8OfqgZO1BepichCt3tu1cBdrJWGCwe7Ci8fvUS6r8vu1Ejj5C35WF/I0zBHa+1Z6Vzr
 SgeNr5aBGhhxlkFgQw1fI4iHHGGXgQFUTsjJANXOvKnVFqXlDfJ3A0OGPgVnyo00vaac
 NKTDmtLf4IHnCkN5N+vDmqhUraMfF3dvye6NC2KvwTo8B+CYMnYhBE0Ei64l4g0kqvLX
 gQ3A==
X-Gm-Message-State: AFqh2kopvavpbTtDbd5Xhh5D2JeOIo1dEmhhC6BMPxYlpoHP3w8NiXIx
 Ifxr5h0u2mrK+FFjH+phM7cwIWYAYozuM8QUesLjLEJFEbWHPQarlpMtqZavhkMadOr8NxPPk2e
 UnDxEoCJgFQAmgWGMuytdoBOJDslYjMQ=
X-Received: by 2002:a25:b7d0:0:b0:707:3f66:a611 with SMTP id
 u16-20020a25b7d0000000b007073f66a611mr13236692ybj.216.1673861624569; 
 Mon, 16 Jan 2023 01:33:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvGTHxxwkuqYtVQXuQyAOyzNDARsCLsfN8JgKTmwqgYdjuoVRRY5cpA3eyJF5uyo5LEFLfS1JhsiBO785yncxg=
X-Received: by 2002:a25:b7d0:0:b0:707:3f66:a611 with SMTP id
 u16-20020a25b7d0000000b007073f66a611mr13236681ybj.216.1673861624349; Mon, 16
 Jan 2023 01:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-6-eperezma@redhat.com>
 <451c3617-61a1-a4bb-791a-6c55e363e961@redhat.com>
 <CAJaqyWfBGyibFq7_nAj61OedpXX2T3c=Mbw39XXpxEvE0OOyig@mail.gmail.com>
 <065243b8-c93f-17e6-72cb-c1db33da6df6@redhat.com>
 <20230116002152-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230116002152-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 16 Jan 2023 10:33:08 +0100
Message-ID: <CAJaqyWd=Lt+41Zrn70v7rN_0ociiRcvRSXuS4ZpevCUFrajEJQ@mail.gmail.com>
Subject: Re: [RFC v2 05/13] vdpa net: add migration blocker if cannot migrate
 cvq
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
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

On Mon, Jan 16, 2023 at 6:24 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jan 16, 2023 at 11:34:20AM +0800, Jason Wang wrote:
> >
> > =E5=9C=A8 2023/1/13 15:46, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > On Fri, Jan 13, 2023 at 5:25 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > =E5=9C=A8 2023/1/13 01:24, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > > > A vdpa net device must initialize with SVQ in order to be migrata=
ble,
> > > > > and initialization code verifies conditions.  If the device is no=
t
> > > > > initialized with the x-svq parameter, it will not expose _F_LOG s=
o vhost
> > > > > sybsystem will block VM migration from its initialization.
> > > > >
> > > > > Next patches change this. Net data VQs will be shadowed only at
> > > > > migration time and vdpa net devices need to expose _F_LOG as long=
 as it
> > > > > can go to SVQ.
> > > > >
> > > > > Since we don't know that at initialization time but at start, add=
 an
> > > > > independent blocker at CVQ.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >    net/vhost-vdpa.c | 35 +++++++++++++++++++++++++++++------
> > > > >    1 file changed, 29 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 631424d9c4..2ca93e850a 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -26,12 +26,14 @@
> > > > >    #include <err.h>
> > > > >    #include "standard-headers/linux/virtio_net.h"
> > > > >    #include "monitor/monitor.h"
> > > > > +#include "migration/blocker.h"
> > > > >    #include "hw/virtio/vhost.h"
> > > > >
> > > > >    /* Todo:need to add the multiqueue support here */
> > > > >    typedef struct VhostVDPAState {
> > > > >        NetClientState nc;
> > > > >        struct vhost_vdpa vhost_vdpa;
> > > > > +    Error *migration_blocker;
> > > >
> > > > Any reason we can't use the mivration_blocker in vhost_dev structur=
e?
> > > >
> > > > I believe we don't need to wait until start to know we can't migrat=
e.
> > > >
> > > Device migratability also depends on features that the guest acks.
> >
> >
> > This sounds a little bit tricky, more below:
> >
> >
> > >
> > > For example, if the device does not support ASID it can be migrated a=
s
> > > long as _F_CVQ is not acked.
> >
> >
> > The management may notice a non-consistent behavior in this case. I won=
der
> > if we can simply check the host features.
> >

That's right, and I can see how that can be an issue.

However, the check for the ASID is based on queue indexes at the
moment. If we want to register the blocker at the initialization
moment the only option I see is to do two features ack & reset cycle:
one with MQ and another one without MQ.

Would it be more correct to assume the device will assign the right
ASID only probing one configuration? I don't think so but I'm ok to
leave the code that way if we agree it is more viable.

> > Thanks
>
>
> Yes the issue is that ack can happen after migration started.
> I don't think this kind of blocker appearing during migration
> is currently expected/supported well. Is it?
>

In that case the guest cannot DRIVER_OK the device, because the call
to migrate_add_blocker fails and the error propagates from
vhost_net_start up to the virtio device.

But I can also see how this is inconvenient and to add a migration
blocker at initialization can simplify things here. As long as we
agree on the right way to probe I can send a new version that way for
sure.

Thanks!

> >
> > >
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > > >
> > > > >        VHostNetState *vhost_net;
> > > > >
> > > > >        /* Control commands shadow buffers */
> > > > > @@ -433,9 +435,15 @@ static int vhost_vdpa_net_cvq_start(NetClien=
tState *nc)
> > > > >                g_strerror(errno), errno);
> > > > >            return -1;
> > > > >        }
> > > > > -    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)=
) ||
> > > > > -        !vhost_vdpa_net_valid_svq_features(v->dev->features, NUL=
L)) {
> > > > > -        return 0;
> > > > > +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)=
)) {
> > > > > +        error_setg(&s->migration_blocker,
> > > > > +                   "vdpa device %s does not support ASID",
> > > > > +                   nc->name);
> > > > > +        goto out;
> > > > > +    }
> > > > > +    if (!vhost_vdpa_net_valid_svq_features(v->dev->features,
> > > > > +                                           &s->migration_blocker=
)) {
> > > > > +        goto out;
> > > > >        }
> > > > >
> > > > >        /*
> > > > > @@ -455,7 +463,10 @@ static int vhost_vdpa_net_cvq_start(NetClien=
tState *nc)
> > > > >            }
> > > > >
> > > > >            if (group =3D=3D cvq_group) {
> > > > > -            return 0;
> > > > > +            error_setg(&s->migration_blocker,
> > > > > +                "vdpa %s vq %d group %"PRId64" is the same as cv=
q group "
> > > > > +                "%"PRId64, nc->name, i, group, cvq_group);
> > > > > +            goto out;
> > > > >            }
> > > > >        }
> > > > >
> > > > > @@ -468,8 +479,15 @@ static int vhost_vdpa_net_cvq_start(NetClien=
tState *nc)
> > > > >        s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_CVQ_ASID=
;
> > > > >
> > > > >    out:
> > > > > -    if (!s->vhost_vdpa.shadow_vqs_enabled) {
> > > > > -        return 0;
> > > > > +    if (s->migration_blocker) {
> > > > > +        Error *errp =3D NULL;
> > > > > +        r =3D migrate_add_blocker(s->migration_blocker, &errp);
> > > > > +        if (unlikely(r !=3D 0)) {
> > > > > +            g_clear_pointer(&s->migration_blocker, error_free);
> > > > > +            error_report_err(errp);
> > > > > +        }
> > > > > +
> > > > > +        return r;
> > > > >        }
> > > > >
> > > > >        s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> > > > > @@ -513,6 +531,11 @@ static void vhost_vdpa_net_cvq_stop(NetClien=
tState *nc)
> > > > >            vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
> > > > >        }
> > > > >
> > > > > +    if (s->migration_blocker) {
> > > > > +        migrate_del_blocker(s->migration_blocker);
> > > > > +        g_clear_pointer(&s->migration_blocker, error_free);
> > > > > +    }
> > > > > +
> > > > >        vhost_vdpa_net_client_stop(nc);
> > > > >    }
> > > > >
>


