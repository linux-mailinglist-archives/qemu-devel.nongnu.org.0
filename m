Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925CB668F86
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:48:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGEmi-0007Ss-GZ; Fri, 13 Jan 2023 02:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGEmd-0007R6-Jz
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:47:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGEmb-0001KV-PR
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673596044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pi7z+YQrUd50aSUrorqRr0eLMnXEgQeRMpUwSBhOph8=;
 b=KCMQblM4lvXghO26NJgzQNcSfzhTgAxsC1Y2qhlXZ0Dty4715YxtS/Qyez0Yu2eb3wGg+L
 c5CW274zRpN94BIiCmMuj+0PsgufisFC63tK5XNeAptCcez38ZFHbtw5SByXsBTboHc6u9
 r2PnJ1sNzlobDJiK66oIgb9A0Yj5VbE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-cazpYofKPiGuzkvPcK1jUg-1; Fri, 13 Jan 2023 02:47:23 -0500
X-MC-Unique: cazpYofKPiGuzkvPcK1jUg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-4ce566db73eso150612257b3.11
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 23:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pi7z+YQrUd50aSUrorqRr0eLMnXEgQeRMpUwSBhOph8=;
 b=eIav6BNSDmp5lCaGPLzkQxWH1ePwcl1A8rj9dSJ8M9SE719Q8/j+Z5qF8RfavRCuzK
 B71QwQUNFSQbToAIiN30zWHg/MXM8ib+kRgVDpKPO6aMB8ios9qwSHdMFS9urxQHSX4z
 QGa/S5nkNbTt/toP/Rj1FTD6bfldrl1Cidp38O5A2H7AXpsulHOGSv2p41kHV/Ul3CCs
 KwIA9J6PxTK0cccubGB2AILmJv11mWbcJiTFNvgvlsh+0pUnnV3Ze74+gvJmMmh9gocF
 7juFbWOue/gm2p+KecDe4Kkr6s/Wxefcy/fkn1GlRLVWQH/RJZx56e1s5rJiFefH2rwQ
 UD4A==
X-Gm-Message-State: AFqh2ko7ypNT9M4g9L2vO+75V7UQSOWfnBJ4aIidV8UFXTks5t7WbRR9
 3pTsA3YZnRo3xzQfxECLOqTrPr/Nh5ty+DOTHrGcjO+zZ+u/fbSE28RQOvimxHI3ME0mrdDeg2S
 BeQMa+yIf+qQ4j8+ED91WNY0Ul+bfgIM=
X-Received: by 2002:a81:5794:0:b0:464:4ea1:3baa with SMTP id
 l142-20020a815794000000b004644ea13baamr2406840ywb.302.1673596042944; 
 Thu, 12 Jan 2023 23:47:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuC8TupGsMezl+Lq6CaQ+28T288mEtv9LXj5yCjXoKX0Ehpj31tq1fImZRgdyk/RdNiNptWDmpcrl46QvWQe2k=
X-Received: by 2002:a81:5794:0:b0:464:4ea1:3baa with SMTP id
 l142-20020a815794000000b004644ea13baamr2406834ywb.302.1673596042713; Thu, 12
 Jan 2023 23:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-6-eperezma@redhat.com>
 <451c3617-61a1-a4bb-791a-6c55e363e961@redhat.com>
In-Reply-To: <451c3617-61a1-a4bb-791a-6c55e363e961@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 13 Jan 2023 08:46:46 +0100
Message-ID: <CAJaqyWfBGyibFq7_nAj61OedpXX2T3c=Mbw39XXpxEvE0OOyig@mail.gmail.com>
Subject: Re: [RFC v2 05/13] vdpa net: add migration blocker if cannot migrate
 cvq
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Jan 13, 2023 at 5:25 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/1/13 01:24, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > A vdpa net device must initialize with SVQ in order to be migratable,
> > and initialization code verifies conditions.  If the device is not
> > initialized with the x-svq parameter, it will not expose _F_LOG so vhos=
t
> > sybsystem will block VM migration from its initialization.
> >
> > Next patches change this. Net data VQs will be shadowed only at
> > migration time and vdpa net devices need to expose _F_LOG as long as it
> > can go to SVQ.
> >
> > Since we don't know that at initialization time but at start, add an
> > independent blocker at CVQ.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 35 +++++++++++++++++++++++++++++------
> >   1 file changed, 29 insertions(+), 6 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 631424d9c4..2ca93e850a 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -26,12 +26,14 @@
> >   #include <err.h>
> >   #include "standard-headers/linux/virtio_net.h"
> >   #include "monitor/monitor.h"
> > +#include "migration/blocker.h"
> >   #include "hw/virtio/vhost.h"
> >
> >   /* Todo:need to add the multiqueue support here */
> >   typedef struct VhostVDPAState {
> >       NetClientState nc;
> >       struct vhost_vdpa vhost_vdpa;
> > +    Error *migration_blocker;
>
>
> Any reason we can't use the mivration_blocker in vhost_dev structure?
>
> I believe we don't need to wait until start to know we can't migrate.
>

Device migratability also depends on features that the guest acks.

For example, if the device does not support ASID it can be migrated as
long as _F_CVQ is not acked.

Thanks!

>
> Thanks
>
>
> >       VHostNetState *vhost_net;
> >
> >       /* Control commands shadow buffers */
> > @@ -433,9 +435,15 @@ static int vhost_vdpa_net_cvq_start(NetClientState=
 *nc)
> >               g_strerror(errno), errno);
> >           return -1;
> >       }
> > -    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
> > -        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
> > -        return 0;
> > +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
> > +        error_setg(&s->migration_blocker,
> > +                   "vdpa device %s does not support ASID",
> > +                   nc->name);
> > +        goto out;
> > +    }
> > +    if (!vhost_vdpa_net_valid_svq_features(v->dev->features,
> > +                                           &s->migration_blocker)) {
> > +        goto out;
> >       }
> >
> >       /*
> > @@ -455,7 +463,10 @@ static int vhost_vdpa_net_cvq_start(NetClientState=
 *nc)
> >           }
> >
> >           if (group =3D=3D cvq_group) {
> > -            return 0;
> > +            error_setg(&s->migration_blocker,
> > +                "vdpa %s vq %d group %"PRId64" is the same as cvq grou=
p "
> > +                "%"PRId64, nc->name, i, group, cvq_group);
> > +            goto out;
> >           }
> >       }
> >
> > @@ -468,8 +479,15 @@ static int vhost_vdpa_net_cvq_start(NetClientState=
 *nc)
> >       s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_CVQ_ASID;
> >
> >   out:
> > -    if (!s->vhost_vdpa.shadow_vqs_enabled) {
> > -        return 0;
> > +    if (s->migration_blocker) {
> > +        Error *errp =3D NULL;
> > +        r =3D migrate_add_blocker(s->migration_blocker, &errp);
> > +        if (unlikely(r !=3D 0)) {
> > +            g_clear_pointer(&s->migration_blocker, error_free);
> > +            error_report_err(errp);
> > +        }
> > +
> > +        return r;
> >       }
> >
> >       s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> > @@ -513,6 +531,11 @@ static void vhost_vdpa_net_cvq_stop(NetClientState=
 *nc)
> >           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
> >       }
> >
> > +    if (s->migration_blocker) {
> > +        migrate_del_blocker(s->migration_blocker);
> > +        g_clear_pointer(&s->migration_blocker, error_free);
> > +    }
> > +
> >       vhost_vdpa_net_client_stop(nc);
> >   }
> >
>


