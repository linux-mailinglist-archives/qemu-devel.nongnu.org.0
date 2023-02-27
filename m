Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525826A3CAB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:26:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWYk7-0007oU-7x; Mon, 27 Feb 2023 03:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWYjz-0007Ns-2j
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:20:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWYjw-0008Cv-4u
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677486007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAeHxyUwJVHN8PzkafY6op1MIGDp3/3HL3aFhUhLx0U=;
 b=bCg7+ByGOh+28wzb7VvSRWX29AwVH6eBEQU9fFhwzckjyUEreD3ayHJtooZLaFizFxCUFa
 1uvCNnCT6x95AvctZOBzuhhYliHCGG/8k43ivhTpe33prviXycJf4O06miOJp/Kcc+uf0s
 mVVfB3Gf66I8qY4jfRm8jmub9GKCFZ0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-t1xt8hKwMQCFWziQy28cQw-1; Mon, 27 Feb 2023 03:20:05 -0500
X-MC-Unique: t1xt8hKwMQCFWziQy28cQw-1
Received: by mail-oi1-f197.google.com with SMTP id
 bb36-20020a05680816a400b00383df099ffdso1365124oib.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 00:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZAeHxyUwJVHN8PzkafY6op1MIGDp3/3HL3aFhUhLx0U=;
 b=NHxpw5cYktZVE8lCYZdafVm6geCnN/ih02InxhceWHAsVH99CSNIzRsSbGCbLPDu+1
 ArCm4UYAWklyl8bVLCmykdofzkq6xdEvHGMn67up3+r6uCLZHJRWiyC+a+AJg3psh/Yk
 3dumHVyAdkChAcNS/r0E294QjOLXTjL/sZr34+Py/jO54fyvd/68IvV1wNEMpj6LumdE
 c5atkyKOlGNoP5iBatagWOKIjNTNO/5ryLp2E/BxUVtV0WTLxnmsF6awIPgqiC73ql5P
 o4sK1vYMH+WcHDa0anGu3gfa/+w9MY9+EOwFYk2ClmONnl8PLyh36H0mQ92zZP954QeU
 cTIg==
X-Gm-Message-State: AO0yUKX6cU26ccy71UVzCrJdtsUOqlMB21hgPrUK6kQEpqjDy0QRyyjp
 gl9C2aM1t0o1wMfizsLFB1zSSyArDlHPTdOXTf/yA6uhYzZOMRKs4QLuKvtJloHFNVpexrUmu1d
 S/3vtD+xxEbrdFrSnONy2xX4e2sJq8Ec=
X-Received: by 2002:aca:911:0:b0:36e:f6f5:604c with SMTP id
 17-20020aca0911000000b0036ef6f5604cmr3061886oij.9.1677486005127; 
 Mon, 27 Feb 2023 00:20:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8zn8gc0mU/teU6Qe0ZjKCtm5c8WmdPv8ShuIiXY4PnGfMOzdf4R8ZsXJ7/s7kQy52fVf9MD7I4Gl436K1if0A=
X-Received: by 2002:aca:911:0:b0:36e:f6f5:604c with SMTP id
 17-20020aca0911000000b0036ef6f5604cmr3061875oij.9.1677486004895; Mon, 27 Feb
 2023 00:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-13-eperezma@redhat.com>
 <2367dcff-e8c3-c3ca-378a-e9e67e10710a@redhat.com>
In-Reply-To: <2367dcff-e8c3-c3ca-378a-e9e67e10710a@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 27 Feb 2023 16:19:53 +0800
Message-ID: <CACGkMEs13RdzLfU8nZwHT0YsZ_hXy47or4t9jkHCoJ1EVa3q9w@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] vdpa: block migration if device has unsupported
 features
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, 
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 alvaro.karsz@solid-run.com, 
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Mon, Feb 27, 2023 at 4:15=E2=80=AFPM Jason Wang <jasowang@redhat.com> wr=
ote:
>
>
> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > A vdpa net device must initialize with SVQ in order to be migratable at
> > this moment, and initialization code verifies some conditions.  If the
> > device is not initialized with the x-svq parameter, it will not expose
> > _F_LOG so the vhost subsystem will block VM migration from its
> > initialization.
> >
> > Next patches change this, so we need to verify migration conditions
> > differently.
> >
> > QEMU only supports a subset of net features in SVQ, and it cannot
> > migrate state that cannot track or restore in the destination.  Add a
> > migration blocker if the device offer an unsupported feature.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> > v3: add mirgation blocker properly so vhost_dev can handle it.
> > ---
> >   net/vhost-vdpa.c | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 4f983df000..094dc1c2d0 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -795,7 +795,8 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >                                          int nvqs,
> >                                          bool is_datapath,
> >                                          bool svq,
> > -                                       struct vhost_vdpa_iova_range io=
va_range)
> > +                                       struct vhost_vdpa_iova_range io=
va_range,
> > +                                       uint64_t features)
> >   {
> >       NetClientState *nc =3D NULL;
> >       VhostVDPAState *s;
> > @@ -818,7 +819,10 @@ static NetClientState *net_vhost_vdpa_init(NetClie=
ntState *peer,
> >       s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >       s->vhost_vdpa.iova_range =3D iova_range;
> >       s->vhost_vdpa.shadow_data =3D svq;
> > -    if (!is_datapath) {
> > +    if (queue_pair_index =3D=3D 0) {
> > +        vhost_vdpa_net_valid_svq_features(features,
> > +                                          &s->vhost_vdpa.migration_blo=
cker);
>
>
> Since we do validation at initialization, is this necessary to valid
> once again in other places?

Ok, after reading patch 13, I think the question is:

The validation seems to be independent to net, can we valid it once
during vhost_vdpa_init()?

Thanks

>
> Thanks
>
>
> > +    } else if (!is_datapath) {
> >           s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_s=
ize(),
> >                                               vhost_vdpa_net_cvq_cmd_pa=
ge_len());
> >           memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_page_=
len());
> > @@ -956,7 +960,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >       for (i =3D 0; i < queue_pairs; i++) {
> >           ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >                                        vdpa_device_fd, i, 2, true, opts=
->x_svq,
> > -                                     iova_range);
> > +                                     iova_range, features);
> >           if (!ncs[i])
> >               goto err;
> >       }
> > @@ -964,7 +968,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >       if (has_cvq) {
> >           nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >                                    vdpa_device_fd, i, 1, false,
> > -                                 opts->x_svq, iova_range);
> > +                                 opts->x_svq, iova_range, features);
> >           if (!nc)
> >               goto err;
> >       }


