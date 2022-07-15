Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E291D575DED
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:56:19 +0200 (CEST)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCH7S-00038q-OW
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCH2P-0004jS-11
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oCH2K-00062v-Jm
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657875059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HC84lA+4N7dnAmfdaq6rT2ic8LqOblvIvqPjiCSY1T8=;
 b=PTY9zjJ0xa+4NE07uAXawvtBMKEPUu8IkGegnW/IHBWBsrwJCxHivT+yjyqCfLOPJ9jqdb
 Tic1jU2m3LTnKYk1nEXKbNqiG15S+6CZWuuiL7Dd1JgGO7hHKy9nN9KZSd1afNgg/GcyDP
 /sJ3dFpY8KVua/TSp1XK7aW5GAZ0yFg=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-KIQzWjI8Nly91eJOB63r5A-1; Fri, 15 Jul 2022 04:50:56 -0400
X-MC-Unique: KIQzWjI8Nly91eJOB63r5A-1
Received: by mail-lj1-f199.google.com with SMTP id
 b23-20020a2e8497000000b0025d4590922cso1002979ljh.7
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 01:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HC84lA+4N7dnAmfdaq6rT2ic8LqOblvIvqPjiCSY1T8=;
 b=QEJEBCWQfd2OLRgKC0PtLnVmmsdPI7/fa/ghXXzgXK6Fnq9zEdNxjV4pezGdfcbNoX
 JbyRVDm7UetoB7+l3xD+dhhqD9RJiG2Ud9ydkWz1QnpbARNYYRKkDlKAYkvp2kl8OPkF
 oeezIddbFvuNK90B/4BA2t/DQallhLUnP+FGLoFGW4nkcFQsp8Zup5GsnMG7RK2/PwMH
 DovQ/3SqpPv/aBEz+oWGQfWS2LsGtk0hlLibrphiXtYXgk/zSBjKjDnq/vByi7ELEgex
 ys8BJkmEl6VgYgc5tELeuC4+R8cMrKXkb/70s3Wj0gPfzv05qeOeTaVbbUSnDM3ehCQW
 Xsaw==
X-Gm-Message-State: AJIora/dIVMCRigzIJn5TBawg2dIIqEOXlUkDkjTaH/pBN7b45rtYGGG
 UgyGUkKywyWfVorRWj47oVR8RwhiwE9FSgSaAT28JN92YfGbCmomk0Ir18j8ed2e+DDn/FetnCF
 s1eTFGRqDcAGeN3PuJN5EyMrMwVzjMqw=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr7159057lfu.442.1657875054543; 
 Fri, 15 Jul 2022 01:50:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usePuUjVTlu998Y8kWOIkQ6DcQY2iiCsRUPse6S/PVJALq9lSKEbXLLKPVxADw5fOUbQD0ykf6UttwBCmeAYU=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr7159039lfu.442.1657875054299; Fri, 15
 Jul 2022 01:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-19-eperezma@redhat.com>
 <CACGkMEsmSygJVtuXMZ_Fj4xgL-xb65UqGFXFOv1FE+wzbKeVHA@mail.gmail.com>
 <CAJaqyWcYWF8Q565XyvOSM6WfMK9kgnyqCd32tZpy2Tgx2UwxNQ@mail.gmail.com>
In-Reply-To: <CAJaqyWcYWF8Q565XyvOSM6WfMK9kgnyqCd32tZpy2Tgx2UwxNQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Jul 2022 16:50:43 +0800
Message-ID: <CACGkMEvr1eakhMEbTrCtEboThc+vJfuZDADuQnJgaMUWajSdSg@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] vdpa: Add device migration blocker
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 15, 2022 at 1:40 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 6:03 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> > >
> > > Since the vhost-vdpa device is exposing _F_LOG,
> >
> > I may miss something but I think it doesn't?
> >
>
> It's at vhost_vdpa_get_features. As long as SVQ is enabled, it's
> exposing VHOST_F_LOG_ALL.

Ok, so this needs to be specified in the change log. But I'm kind of
confused here, we do want to allow migration to work so why we disable
it?

Thanks

>
> Thanks!
>
> > Note that the features were fetched from the vDPA parent.
> >
> > Thanks
> >
> > > adding a migration blocker if
> > > it uses CVQ.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  include/hw/virtio/vhost-vdpa.h |  1 +
> > >  hw/virtio/vhost-vdpa.c         | 14 ++++++++++++++
> > >  2 files changed, 15 insertions(+)
> > >
> > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost=
-vdpa.h
> > > index 1111d85643..d10a89303e 100644
> > > --- a/include/hw/virtio/vhost-vdpa.h
> > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > @@ -35,6 +35,7 @@ typedef struct vhost_vdpa {
> > >      bool shadow_vqs_enabled;
> > >      /* IOVA mapping used by the Shadow Virtqueue */
> > >      VhostIOVATree *iova_tree;
> > > +    Error *migration_blocker;
> > >      GPtrArray *shadow_vqs;
> > >      const VhostShadowVirtqueueOps *shadow_vq_ops;
> > >      void *shadow_vq_ops_opaque;
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index beaaa7049a..795ed5a049 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -20,6 +20,7 @@
> > >  #include "hw/virtio/vhost-shadow-virtqueue.h"
> > >  #include "hw/virtio/vhost-vdpa.h"
> > >  #include "exec/address-spaces.h"
> > > +#include "migration/blocker.h"
> > >  #include "qemu/cutils.h"
> > >  #include "qemu/main-loop.h"
> > >  #include "cpu.h"
> > > @@ -1022,6 +1023,13 @@ static bool vhost_vdpa_svqs_start(struct vhost=
_dev *dev)
> > >          return true;
> > >      }
> > >
> > > +    if (v->migration_blocker) {
> > > +        int r =3D migrate_add_blocker(v->migration_blocker, &err);
> > > +        if (unlikely(r < 0)) {
> > > +            goto err_migration_blocker;
> > > +        }
> > > +    }
> > > +
> > >      for (i =3D 0; i < v->shadow_vqs->len; ++i) {
> > >          VirtQueue *vq =3D virtio_get_queue(dev->vdev, dev->vq_index =
+ i);
> > >          VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vq=
s, i);
> > > @@ -1064,6 +1072,9 @@ err:
> > >          vhost_svq_stop(svq);
> > >      }
> > >
> > > +err_migration_blocker:
> > > +    error_reportf_err(err, "Cannot setup SVQ %u: ", i);
> > > +
> > >      return false;
> > >  }
> > >
> > > @@ -1083,6 +1094,9 @@ static bool vhost_vdpa_svqs_stop(struct vhost_d=
ev *dev)
> > >          }
> > >      }
> > >
> > > +    if (v->migration_blocker) {
> > > +        migrate_del_blocker(v->migration_blocker);
> > > +    }
> > >      return true;
> > >  }
> > >
> > > --
> > > 2.31.1
> > >
> >
>


