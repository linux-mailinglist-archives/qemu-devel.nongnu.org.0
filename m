Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E11966B6F7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 06:48:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHIL8-0002ks-K7; Mon, 16 Jan 2023 00:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pHIL5-0002ka-Rm
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 00:47:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pHIKo-0006FS-UB
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 00:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673848020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MjLa9cLL8u6xDuXYDCiITPrO3fZrSI2z2Re4HrPX5w=;
 b=UCkj2y78BTgYSV9TjO9oCwluVQ43R8qDLI3pxzcgHk+xl2lJcWums29oN/lTmTbl4f+OaB
 B/TuEA0Yr7BYNvqDFcl9FVA96FbzwbDP8mds8RUvZbouIl6ObEQ8BLl2JzOS9uGsIWfd12
 4s/vn8OMZQsX1oJgF3VUVqBeLtUkIb4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-TtPLbMVEMimx3KHll6t88Q-1; Mon, 16 Jan 2023 00:24:05 -0500
X-MC-Unique: TtPLbMVEMimx3KHll6t88Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 q19-20020a1cf313000000b003d96c95e2f9so5633791wmq.2
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 21:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6MjLa9cLL8u6xDuXYDCiITPrO3fZrSI2z2Re4HrPX5w=;
 b=sr/nJS0BkN0myhP1WZFrcbUMr3pgkF2e4ddQ3Qx9nTWq1tr9j2fQqEANjLaNSc19Yy
 FWqEytWwFsWFycAFcqTUofy1qXD90844PpdCdWqnU+ZIBESx1bY29XD6lSlmkWcm1NBA
 opmorEVkAC/VVw7AcxrFdUradfzyVFex7kyi8zYPlgt5c1wFMdQGjhX01hcZK0e/sXJY
 YISkRrtBbWnjjiMA9kAECGbauPd5BW7q9AMjLO6BodBNfzK2b18wAt9CEnWSsDJ2a2Em
 KR/PCfAywrs5E9OBKaGq+OlH6XDXnQ59FGpaRbJPZNpKowA9blzrc4CUewgMwFm2Gq2A
 kB9Q==
X-Gm-Message-State: AFqh2koTVYD/FKSwXNAMs74xypAKGoEDmguVm0fCkEYBBS1C2klod2zc
 0BldHJXDo82SJ8kuTBu8hGLR71WHwJ0p1l5FLVhfGO9gvNFQmmeHoSqrCLGjZb8mQPu1qqYr2WB
 h4f1eK2xGGMNK6g0=
X-Received: by 2002:a05:600c:5113:b0:3d3:5c21:dd99 with SMTP id
 o19-20020a05600c511300b003d35c21dd99mr65930739wms.18.1673846643866; 
 Sun, 15 Jan 2023 21:24:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsC1UcV7LujHp1kAG3SSsN7mnMTIPkIRmJKLAJ60PPI4hLQSRXPAhtE3qnhbCBNr9Ru3EdQlQ==
X-Received: by 2002:a05:600c:5113:b0:3d3:5c21:dd99 with SMTP id
 o19-20020a05600c511300b003d35c21dd99mr65930684wms.18.1673846642748; 
 Sun, 15 Jan 2023 21:24:02 -0800 (PST)
Received: from redhat.com ([2.52.132.216]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003d04e4ed873sm42457191wmq.22.2023.01.15.21.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 21:24:02 -0800 (PST)
Date: Mon, 16 Jan 2023 00:23:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, qemu-devel@nongnu.org,
 si-wei.liu@oracle.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 alvaro.karsz@solid-run.com, Shannon Nelson <snelson@pensando.io>,
 Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: Re: [RFC v2 05/13] vdpa net: add migration blocker if cannot migrate
 cvq
Message-ID: <20230116002152-mutt-send-email-mst@kernel.org>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-6-eperezma@redhat.com>
 <451c3617-61a1-a4bb-791a-6c55e363e961@redhat.com>
 <CAJaqyWfBGyibFq7_nAj61OedpXX2T3c=Mbw39XXpxEvE0OOyig@mail.gmail.com>
 <065243b8-c93f-17e6-72cb-c1db33da6df6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <065243b8-c93f-17e6-72cb-c1db33da6df6@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Jan 16, 2023 at 11:34:20AM +0800, Jason Wang wrote:
> 
> 在 2023/1/13 15:46, Eugenio Perez Martin 写道:
> > On Fri, Jan 13, 2023 at 5:25 AM Jason Wang <jasowang@redhat.com> wrote:
> > > 
> > > 在 2023/1/13 01:24, Eugenio Pérez 写道:
> > > > A vdpa net device must initialize with SVQ in order to be migratable,
> > > > and initialization code verifies conditions.  If the device is not
> > > > initialized with the x-svq parameter, it will not expose _F_LOG so vhost
> > > > sybsystem will block VM migration from its initialization.
> > > > 
> > > > Next patches change this. Net data VQs will be shadowed only at
> > > > migration time and vdpa net devices need to expose _F_LOG as long as it
> > > > can go to SVQ.
> > > > 
> > > > Since we don't know that at initialization time but at start, add an
> > > > independent blocker at CVQ.
> > > > 
> > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > > ---
> > > >    net/vhost-vdpa.c | 35 +++++++++++++++++++++++++++++------
> > > >    1 file changed, 29 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 631424d9c4..2ca93e850a 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -26,12 +26,14 @@
> > > >    #include <err.h>
> > > >    #include "standard-headers/linux/virtio_net.h"
> > > >    #include "monitor/monitor.h"
> > > > +#include "migration/blocker.h"
> > > >    #include "hw/virtio/vhost.h"
> > > > 
> > > >    /* Todo:need to add the multiqueue support here */
> > > >    typedef struct VhostVDPAState {
> > > >        NetClientState nc;
> > > >        struct vhost_vdpa vhost_vdpa;
> > > > +    Error *migration_blocker;
> > > 
> > > Any reason we can't use the mivration_blocker in vhost_dev structure?
> > > 
> > > I believe we don't need to wait until start to know we can't migrate.
> > > 
> > Device migratability also depends on features that the guest acks.
> 
> 
> This sounds a little bit tricky, more below:
> 
> 
> > 
> > For example, if the device does not support ASID it can be migrated as
> > long as _F_CVQ is not acked.
> 
> 
> The management may notice a non-consistent behavior in this case. I wonder
> if we can simply check the host features.
> 
> Thanks


Yes the issue is that ack can happen after migration started.
I don't think this kind of blocker appearing during migration
is currently expected/supported well. Is it?

> 
> > 
> > Thanks!
> > 
> > > Thanks
> > > 
> > > 
> > > >        VHostNetState *vhost_net;
> > > > 
> > > >        /* Control commands shadow buffers */
> > > > @@ -433,9 +435,15 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> > > >                g_strerror(errno), errno);
> > > >            return -1;
> > > >        }
> > > > -    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
> > > > -        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
> > > > -        return 0;
> > > > +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
> > > > +        error_setg(&s->migration_blocker,
> > > > +                   "vdpa device %s does not support ASID",
> > > > +                   nc->name);
> > > > +        goto out;
> > > > +    }
> > > > +    if (!vhost_vdpa_net_valid_svq_features(v->dev->features,
> > > > +                                           &s->migration_blocker)) {
> > > > +        goto out;
> > > >        }
> > > > 
> > > >        /*
> > > > @@ -455,7 +463,10 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> > > >            }
> > > > 
> > > >            if (group == cvq_group) {
> > > > -            return 0;
> > > > +            error_setg(&s->migration_blocker,
> > > > +                "vdpa %s vq %d group %"PRId64" is the same as cvq group "
> > > > +                "%"PRId64, nc->name, i, group, cvq_group);
> > > > +            goto out;
> > > >            }
> > > >        }
> > > > 
> > > > @@ -468,8 +479,15 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> > > >        s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
> > > > 
> > > >    out:
> > > > -    if (!s->vhost_vdpa.shadow_vqs_enabled) {
> > > > -        return 0;
> > > > +    if (s->migration_blocker) {
> > > > +        Error *errp = NULL;
> > > > +        r = migrate_add_blocker(s->migration_blocker, &errp);
> > > > +        if (unlikely(r != 0)) {
> > > > +            g_clear_pointer(&s->migration_blocker, error_free);
> > > > +            error_report_err(errp);
> > > > +        }
> > > > +
> > > > +        return r;
> > > >        }
> > > > 
> > > >        s0 = vhost_vdpa_net_first_nc_vdpa(s);
> > > > @@ -513,6 +531,11 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
> > > >            vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
> > > >        }
> > > > 
> > > > +    if (s->migration_blocker) {
> > > > +        migrate_del_blocker(s->migration_blocker);
> > > > +        g_clear_pointer(&s->migration_blocker, error_free);
> > > > +    }
> > > > +
> > > >        vhost_vdpa_net_client_stop(nc);
> > > >    }
> > > > 


