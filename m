Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065316A9BC2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:30:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8I0-0005QC-R4; Fri, 03 Mar 2023 11:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY8Hy-0005Pz-UN
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:29:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY8Hx-0004D1-DJ
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677860984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuPXA209QQw0Y2f73bPPzALpX/+1h0v92ILxJoGQf8c=;
 b=N80uLB5QJ/xVm3zObdmHioBpvU6L1GHQa4IQAySZnQf6lcwUigILQn0/kwo8H2ZVXB+++4
 jvbzjU9s8IL0yuZ20O29q1aZ55cW4/kaHz31KfeIBw8MZ1umebf54f6+QpwUJY46Aug69B
 ViimaS/3Ni8vx6AeDpvLsCHW4jLgsMY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-PVKPkFIuPxC983s2jfdHBw-1; Fri, 03 Mar 2023 11:29:43 -0500
X-MC-Unique: PVKPkFIuPxC983s2jfdHBw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-536c02ed619so29554877b3.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:29:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677860983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UuPXA209QQw0Y2f73bPPzALpX/+1h0v92ILxJoGQf8c=;
 b=TBBAzbG3OhEtAbh442lo+3F12KVBYZFrrgE9PDYIHQTK7KOPQIzDXbHxrYtD1YWgKr
 zXN2+0vOVsWfI3H6VCtB2EsJDXSEZJmiXhogxL0H9/Pq7GX2ZFECIMmz4j4z34Lfluc7
 HE6PyilJAOktb5XvIJdJjq4n9BjbrICV/vFMtjvGvrGHz7v/PF0B1ZnBXznDPq1TIYPY
 DhqdWgksz2Gp2LaLXCKnvi2j2jCGPM6DPJiGOzOzvp1BcrNdwRzr5U2WuUEIiwp9I2A6
 G3bpJ17GTXFwwu58ch9cJN3tmolEW6X403vmgyIn8OJnP8z27ICgHZOX3bdZUnzyBaNE
 WS+A==
X-Gm-Message-State: AO0yUKWbstXhIlReROFtL3MXnXR1q5DdVERxzQsDQebTtqiBn5A4lJTH
 KbbxYpbcNENVutBpozakitnU8rIgF889ewrHfVVxBK3K19bKeUm6eNsDWgnOHP+1VtAuS8BXFtF
 0kDHlxZVWcf9k0O0Hf2vBnKiJo3RCmE4=
X-Received: by 2002:a05:6902:4c2:b0:a36:3875:564a with SMTP id
 v2-20020a05690204c200b00a363875564amr1360933ybs.2.1677860983128; 
 Fri, 03 Mar 2023 08:29:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9CK4b/1+r95JTwly6wBXefA0nUKcwN1Hs52HwNggZksYN389oKS123uDslB+w7wdnIHKAMcX424rnT7VjMOEI=
X-Received: by 2002:a05:6902:4c2:b0:a36:3875:564a with SMTP id
 v2-20020a05690204c200b00a363875564amr1360910ybs.2.1677860982889; Fri, 03 Mar
 2023 08:29:42 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-4-eperezma@redhat.com>
 <3c485561-b993-1f4f-8003-073c1e27bc6b@redhat.com>
In-Reply-To: <3c485561-b993-1f4f-8003-073c1e27bc6b@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 3 Mar 2023 17:29:07 +0100
Message-ID: <CAJaqyWcQf50CP6hCEex1B74dzFLx6kAUZ9hYq498M0SYWyEgiQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] vdpa: stop svq at vhost_vdpa_dev_start(false)
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>, 
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
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

On Mon, Feb 27, 2023 at 8:15=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
>
> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > It used to be done at vhost_vdpa_svq_cleanup, since a device couldn't
> > switch to SVQ mode dynamically.  Now that we need to fetch the state an=
d
> > trust SVQ will not modify guest's used_idx at migration, stop
> > effectively SVQ at suspend time, as a real device would do.
> >
> > Leaving old vhost_svq_stop call at vhost_vdpa_svq_cleanup, as its
> > supported to call it many times and it follows other operations that ar=
e
> > called redundantly there too:
> > * vhost_vdpa_host_notifiers_uninit
> > * memory_listener_unregister
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> > v3: New in v3
> > ---
> >   hw/virtio/vhost-vdpa.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 4f72a52a43..d9260191cc 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1100,10 +1100,11 @@ static void vhost_vdpa_svqs_stop(struct vhost_d=
ev *dev)
> >
> >       for (unsigned i =3D 0; i < v->shadow_vqs->len; ++i) {
> >           VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs=
, i);
> > +
> > +        vhost_svq_stop(svq);
> >           vhost_vdpa_svq_unmap_rings(dev, svq);
> >
> >           event_notifier_cleanup(&svq->hdev_kick);
> > -        event_notifier_cleanup(&svq->hdev_call);
>
>
> Any reason we need to not clean callfd? (Not explained in the change
> log, or should be another patch?).
>

This was actually an artifact of rebasing, sorry. This patch will be
removed fron v5 as there is already present in staging, commit
2e1a9de96b48 ("vdpa: stop all svq on device deletion").

Thanks!


