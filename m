Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B17B6AB521
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 04:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ1lE-0008QD-PL; Sun, 05 Mar 2023 22:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ1lC-0008Q0-R5
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:43:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ1lA-0003JV-Q4
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678074216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnwHyT3uSM5IBceLfXPZR/OqLBe8gbNwXJdgTZJRiEo=;
 b=IwMnYWEfY1tWIeJS89jQmFaPKe+o2jK2gfGKSPzO1RgkU1Zamx06jBVD3kbcunP3JSPC3y
 kA1+NlbrHDOFvtUC+ehS6lbIwzfqhU0mca+I9n0DVQjQYT9W7kRnJ+7YADcAZ5v02zJ3Ym
 W1kOD0CPTcxOMlsf9SqXPbtvQJV0qMo=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-Ff-MUyd4ODKdeVJbLxNvUA-1; Sun, 05 Mar 2023 22:43:34 -0500
X-MC-Unique: Ff-MUyd4ODKdeVJbLxNvUA-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1767ec35ce2so4539924fac.0
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 19:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678074214;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xnwHyT3uSM5IBceLfXPZR/OqLBe8gbNwXJdgTZJRiEo=;
 b=pv/F9J9pJx4u2S5gbWELGVFvd0SFMg2L+TcZnoRWone71yJs3GmoyG7JlXKl9IqzBT
 5+59v0MtymM/CFgwmDVnq0x37Ql2K3gx8NmInv3tC8xf1HPfrgIGsTd05G8hH5U+meSi
 VDj2LreOvt2/HJZTW0tziiCc+8IL9VjMQbFUw5gofFYmmLZMP1bJWx+e4+HrFm1f4Bxp
 PVP6SAMH2pKCb9z3Fdx5QocphZS0LFxxKGVW645gqD4PUIWlbwi2VpsU5mDOR8FAAGgx
 nAd548yNQSo5HHQIABMF5YzpEr8fRl2vmrTkucZvqqwhJxCPeC8wuQ+P2T3NbTiucsML
 EU2w==
X-Gm-Message-State: AO0yUKWBigvmeWy4MvJtrRZEp41h9UKT4DgFIGIQK6YAnwORNi5g7TEG
 /Tbva2KvMO9tUZ5ouvAXDZBB8mWsbu4IiB5+vXepIA7nj+P1ekHO7GOFjzXDODXTpHVIHISzehl
 LZ+qyQEcAuV2t6VmpUL3Tr0u0BBynoj8=
X-Received: by 2002:a05:6870:c384:b0:175:31d3:e12d with SMTP id
 g4-20020a056870c38400b0017531d3e12dmr3195414oao.9.1678074214089; 
 Sun, 05 Mar 2023 19:43:34 -0800 (PST)
X-Google-Smtp-Source: AK7set996nG/yuKesqG7uNDJXG/soRYFOnOkxK9+isRrlgxaOtzI8AU/BZIfdHXYf/ucQUoztRjNcJwrJZngMcRm56s=
X-Received: by 2002:a05:6870:c384:b0:175:31d3:e12d with SMTP id
 g4-20020a056870c38400b0017531d3e12dmr3195405oao.9.1678074213825; Sun, 05 Mar
 2023 19:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-2-eperezma@redhat.com>
 <a2f01833-0709-4155-e922-4624e31ac3b3@redhat.com>
 <CAJaqyWebiu1oTAgpnVvjUZ672OLLHSqt1vjn8rNkMGy5n4vq-g@mail.gmail.com>
 <fcd6405d-294e-3af7-5574-30870904257e@redhat.com>
 <CAJaqyWegUt0KLqudacTYV2HAe85qJ3g+8sEgQ_iVnEzUo=JXNw@mail.gmail.com>
In-Reply-To: <CAJaqyWegUt0KLqudacTYV2HAe85qJ3g+8sEgQ_iVnEzUo=JXNw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 6 Mar 2023 11:43:22 +0800
Message-ID: <CACGkMEsFVLRN9HnjAT9A6PP3BEJ-3rdGkuZxC7z-QepMgngT5w@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] vdpa net: move iova tree creation from init to
 start
To: Eugenio Perez Martin <eperezma@redhat.com>
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

On Fri, Mar 3, 2023 at 4:01=E2=80=AFPM Eugenio Perez Martin <eperezma@redha=
t.com> wrote:
>
> On Fri, Mar 3, 2023 at 4:32 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2023/3/1 15:01, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > On Mon, Feb 27, 2023 at 8:04 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > >>
> > >> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > >>> Only create iova_tree if and when it is needed.
> > >>>
> > >>> The cleanup keeps being responsible of last VQ but this change allo=
ws it
> > >>> to merge both cleanup functions.
> > >>>
> > >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>> Acked-by: Jason Wang <jasowang@redhat.com>
> > >>> ---
> > >>> v4:
> > >>> * Remove leak of iova_tree because double allocation
> > >>> * Document better the sharing of IOVA tree between data and CVQ
> > >>> ---
> > >>>    net/vhost-vdpa.c | 113 ++++++++++++++++++++++++++++++++++-------=
------
> > >>>    1 file changed, 83 insertions(+), 30 deletions(-)
> > >>>
> > >>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > >>> index de5ed8ff22..b89c99066a 100644
> > >>> --- a/net/vhost-vdpa.c
> > >>> +++ b/net/vhost-vdpa.c
> > >>> @@ -178,13 +178,9 @@ err_init:
> > >>>    static void vhost_vdpa_cleanup(NetClientState *nc)
> > >>>    {
> > >>>        VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > >>> -    struct vhost_dev *dev =3D &s->vhost_net->dev;
> > >>>
> > >>>        qemu_vfree(s->cvq_cmd_out_buffer);
> > >>>        qemu_vfree(s->status);
> > >>> -    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> > >>> -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_=
delete);
> > >>> -    }
> > >>>        if (s->vhost_net) {
> > >>>            vhost_net_cleanup(s->vhost_net);
> > >>>            g_free(s->vhost_net);
> > >>> @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientSt=
ate *nc, const uint8_t *buf,
> > >>>        return size;
> > >>>    }
> > >>>
> > >>> +/** From any vdpa net client, get the netclient of first queue pai=
r */
> > >>> +static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState=
 *s)
> > >>> +{
> > >>> +    NICState *nic =3D qemu_get_nic(s->nc.peer);
> > >>> +    NetClientState *nc0 =3D qemu_get_peer(nic->ncs, 0);
> > >>> +
> > >>> +    return DO_UPCAST(VhostVDPAState, nc, nc0);
> > >>> +}
> > >>> +
> > >>> +static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> > >>> +{
> > >>> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > >>> +
> > >>> +    if (v->shadow_vqs_enabled) {
> > >>> +        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> > >>> +                                           v->iova_range.last);
> > >>> +    }
> > >>> +}
> > >>> +
> > >>> +static int vhost_vdpa_net_data_start(NetClientState *nc)
> > >>> +{
> > >>> +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > >>> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > >>> +
> > >>> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > >>> +
> > >>> +    if (v->index =3D=3D 0) {
> > >>> +        vhost_vdpa_net_data_start_first(s);
> > >>> +        return 0;
> > >>> +    }
> > >>> +
> > >>> +    if (v->shadow_vqs_enabled) {
> > >>> +        VhostVDPAState *s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> > >>> +        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> > >>> +    }
> > >>> +
> > >>> +    return 0;
> > >>> +}
> > >>> +
> > >>> +static void vhost_vdpa_net_client_stop(NetClientState *nc)
> > >>> +{
> > >>> +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > >>> +    struct vhost_dev *dev;
> > >>> +
> > >>> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > >>> +
> > >>> +    dev =3D s->vhost_vdpa.dev;
> > >>> +    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> > >>> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_=
delete);
> > >>> +    }
> > >>> +}
> > >>> +
> > >>>    static NetClientInfo net_vhost_vdpa_info =3D {
> > >>>            .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> > >>>            .size =3D sizeof(VhostVDPAState),
> > >>>            .receive =3D vhost_vdpa_receive,
> > >>> +        .start =3D vhost_vdpa_net_data_start,
> > >>> +        .stop =3D vhost_vdpa_net_client_stop,
> > >>
> > >> Looking at the implementation, it seems nothing net specific, any re=
ason
> > >> we can't simply use vhost_vdpa_dev_start()?
> > >>
> > > IOVA tree must be shared between (at least) all dataplane vhost_vdpa.
> > > How could we move the call to vhost_vdpa_net_first_nc_vdpa to
> > > vhost_vdpa_dev_start?
> >
> >
> > Ok, I think I get it. We should really consider to implement a parent
> > structure in the future for vhost_vdpa then we can avoid tricks like:
> >
> > vq_index_end and vhost_vdpa_net_first_nc_vdpa()
> >
>
> Sounds right. Maybe it is enough to link all of them with a QLIST?

That's also fine but you need to place the parent data into the head
structure which seems not clean than having pointers to point to the
same parent structure.

Thanks

>
> Thanks!
>
> > Thanks
> >
> >
> > >
> > > A possibility is to always allocate it just in case. But it seems to
> > > me it is better to not start allocating resources just in case :).
> > >
> > >>>            .cleanup =3D vhost_vdpa_cleanup,
> > >>>            .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> > >>>            .has_ufo =3D vhost_vdpa_has_ufo,
> > >>> @@ -351,7 +401,7 @@ dma_map_err:
> > >>>
> > >>>    static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> > >>>    {
> > >>> -    VhostVDPAState *s;
> > >>> +    VhostVDPAState *s, *s0;
> > >>>        struct vhost_vdpa *v;
> > >>>        uint64_t backend_features;
> > >>>        int64_t cvq_group;
> > >>> @@ -415,8 +465,6 @@ static int vhost_vdpa_net_cvq_start(NetClientSt=
ate *nc)
> > >>>            return r;
> > >>>        }
> > >>>
> > >>> -    v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> > >>> -                                       v->iova_range.last);
> > >>>        v->shadow_vqs_enabled =3D true;
> > >>>        s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_CVQ_ASID;
> > >>>
> > >>> @@ -425,6 +473,27 @@ out:
> > >>>            return 0;
> > >>>        }
> > >>>
> > >>> +    s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> > >>> +    if (s0->vhost_vdpa.iova_tree) {
> > >>> +        /*
> > >>> +         * SVQ is already configured for all virtqueues.  Reuse IO=
VA tree for
> > >>> +         * simplicity, wether CVQ shares ASID with guest or not, b=
ecause:
> > >>
> > >> Typo, should be "whether", or "regardless of whether"(not a native s=
peaker).
> > >>
> > > Good catch, I can fix it in the next version.
> > >
> > > Thanks!
> > >
> > >> Other looks good.
> > >>
> > >> Thanks
> > >>
> > >>
> > >>> +         * - Memory listener need access to guest's memory address=
es allocated
> > >>> +         *   in the IOVA tree.
> > >>> +         * - There should be plenty of IOVA address space for both=
 ASID not to
> > >>> +         *   worry about collisions between them.  Guest's transla=
tions are
> > >>> +         *   still validated with virtio virtqueue_pop so there is=
 no risk for
> > >>> +         *   the guest to access memory it shouldn't.
> > >>> +         *
> > >>> +         * To allocate a iova tree per ASID is doable but it compl=
icates the
> > >>> +         * code and it is not worth for the moment.
> > >>> +         */
> > >>> +        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> > >>> +    } else {
> > >>> +        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> > >>> +                                           v->iova_range.last);
> > >>> +    }
> > >>> +
> > >>>        r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_=
buffer,
> > >>>                                   vhost_vdpa_net_cvq_cmd_page_len()=
, false);
> > >>>        if (unlikely(r < 0)) {
> > >>> @@ -449,15 +518,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientS=
tate *nc)
> > >>>        if (s->vhost_vdpa.shadow_vqs_enabled) {
> > >>>            vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_=
buffer);
> > >>>            vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
> > >>> -        if (!s->always_svq) {
> > >>> -            /*
> > >>> -             * If only the CVQ is shadowed we can delete this safe=
ly.
> > >>> -             * If all the VQs are shadows this will be needed by t=
he time the
> > >>> -             * device is started again to register SVQ vrings and =
similar.
> > >>> -             */
> > >>> -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_t=
ree_delete);
> > >>> -        }
> > >>>        }
> > >>> +
> > >>> +    vhost_vdpa_net_client_stop(nc);
> > >>>    }
> > >>>
> > >>>    static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t =
out_len,
> > >>> @@ -667,8 +730,7 @@ static NetClientState *net_vhost_vdpa_init(NetC=
lientState *peer,
> > >>>                                           int nvqs,
> > >>>                                           bool is_datapath,
> > >>>                                           bool svq,
> > >>> -                                       struct vhost_vdpa_iova_rang=
e iova_range,
> > >>> -                                       VhostIOVATree *iova_tree)
> > >>> +                                       struct vhost_vdpa_iova_rang=
e iova_range)
> > >>>    {
> > >>>        NetClientState *nc =3D NULL;
> > >>>        VhostVDPAState *s;
> > >>> @@ -690,7 +752,6 @@ static NetClientState *net_vhost_vdpa_init(NetC=
lientState *peer,
> > >>>        s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > >>>        s->vhost_vdpa.iova_range =3D iova_range;
> > >>>        s->vhost_vdpa.shadow_data =3D svq;
> > >>> -    s->vhost_vdpa.iova_tree =3D iova_tree;
> > >>>        if (!is_datapath) {
> > >>>            s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_p=
age_size(),
> > >>>                                                vhost_vdpa_net_cvq_c=
md_page_len());
> > >>> @@ -760,7 +821,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> > >>>        uint64_t features;
> > >>>        int vdpa_device_fd;
> > >>>        g_autofree NetClientState **ncs =3D NULL;
> > >>> -    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> > >>>        struct vhost_vdpa_iova_range iova_range;
> > >>>        NetClientState *nc;
> > >>>        int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> > >>> @@ -812,12 +872,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, =
const char *name,
> > >>>            goto err;
> > >>>        }
> > >>>
> > >>> -    if (opts->x_svq) {
> > >>> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> > >>> -            goto err_svq;
> > >>> -        }
> > >>> -
> > >>> -        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_r=
ange.last);
> > >>> +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features=
, errp)) {
> > >>> +        goto err;
> > >>>        }
> > >>>
> > >>>        ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> > >>> @@ -825,7 +881,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> > >>>        for (i =3D 0; i < queue_pairs; i++) {
> > >>>            ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, na=
me,
> > >>>                                         vdpa_device_fd, i, 2, true,=
 opts->x_svq,
> > >>> -                                     iova_range, iova_tree);
> > >>> +                                     iova_range);
> > >>>            if (!ncs[i])
> > >>>                goto err;
> > >>>        }
> > >>> @@ -833,13 +889,11 @@ int net_init_vhost_vdpa(const Netdev *netdev,=
 const char *name,
> > >>>        if (has_cvq) {
> > >>>            nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > >>>                                     vdpa_device_fd, i, 1, false,
> > >>> -                                 opts->x_svq, iova_range, iova_tre=
e);
> > >>> +                                 opts->x_svq, iova_range);
> > >>>            if (!nc)
> > >>>                goto err;
> > >>>        }
> > >>>
> > >>> -    /* iova_tree ownership belongs to last NetClientState */
> > >>> -    g_steal_pointer(&iova_tree);
> > >>>        return 0;
> > >>>
> > >>>    err:
> > >>> @@ -849,7 +903,6 @@ err:
> > >>>            }
> > >>>        }
> > >>>
> > >>> -err_svq:
> > >>>        qemu_close(vdpa_device_fd);
> > >>>
> > >>>        return -1;
> >
>


