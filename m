Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C6D577E5D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 11:10:30 +0200 (CEST)
Received: from localhost ([::1]:38054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDMlp-0007jx-75
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 05:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDMjm-0005f3-UU
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:08:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDMjl-00050j-02
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658135300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWtnjAtd8e2Qe1TNIIY+5MXIVI5KzsQ+JvtAbg/iUB4=;
 b=XYDi45OVkCN6Ahj/rk+ZBiZuhf6RuyEc+IasNVkY4dG7rBAwi5JIW50wrWglu+ojuhJ1+a
 toSZdlwpG6B6NQhZVejRWJzDvPuyJXAq5qIsIQY9Tov24vPlXuksvqAOCPSXApLA6qJSx7
 XpP1BknxgkQ1m4OwWKgJMtdj47Du3ug=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-wjvFkzSjO_mVyPyt6nXBxQ-1; Mon, 18 Jul 2022 05:08:12 -0400
X-MC-Unique: wjvFkzSjO_mVyPyt6nXBxQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 a10-20020ac84d8a000000b0031ee6389b7eso3421746qtw.6
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 02:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yWtnjAtd8e2Qe1TNIIY+5MXIVI5KzsQ+JvtAbg/iUB4=;
 b=X3J/Zp3pcElhfVcBNpoz/jHkbAIGe38obpylvm9BoSIducV02a8KTImN/xGPS2Krt4
 5Z6P+sE6B78cU5n4N85JxAwrkT7EDfQQc6djNay8vngG5QgTX53FaNX9HUPHnTrEaiqf
 mofbyfgExBeysIIEXGXQgPwjhbckDRfcoItZIzr226GSFf00b5VhfGLxFpWi5/UNQfCP
 miTMvvWYEFCdjhARkeT9slCicoOhNDi0ur8+jjF7TsJn3v6Wy++WtsSU50H9tUFpvI5D
 UGxOk/32fwGiKyfavobfBYVxAELEBAUPKiSlTVMirxGVIp1vN3vCsXcYWhUTnWLWDDbu
 rIHg==
X-Gm-Message-State: AJIora8pGKFjo6Gjgsw4dcG/GrQGRrawgmt3zN2mCT75BU0PJlL7vyjD
 4OQdYhMy8eR6dg9+agp7golJYmaNq0/OZgviuOSzsKSX222A/pMS+Ab8pcQzzQgGu1slxqsGLfr
 G8pBvITlMtailgFzP9NkA15K5LbmM4CI=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr19569178qvb.45.1658135292398; 
 Mon, 18 Jul 2022 02:08:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tHbIISTbbRVwB+s9sWGyBNQWcaDFsULtPwQlVUfKj8Ax6BVSzkyCqnZpXg21J20LE/4XsGSemn/g1iAj5Q64M=
X-Received: by 2002:a05:6214:238e:b0:470:8ee8:52e6 with SMTP id
 fw14-20020a056214238e00b004708ee852e6mr19569162qvb.45.1658135292168; Mon, 18
 Jul 2022 02:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-12-eperezma@redhat.com>
 <70dc9f92-8aea-4698-57d8-1108d1cf7db2@redhat.com>
In-Reply-To: <70dc9f92-8aea-4698-57d8-1108d1cf7db2@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Jul 2022 11:07:35 +0200
Message-ID: <CAJaqyWfz+M_nuPC0-Y_=Tt9H3OHBquOoe2A0DsSqBZEcpS4qMA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/12] vdpa: Add virtio-net mac address via CVQ at
 start
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Mon, Jul 18, 2022 at 10:55 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/16 19:34, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > This is needed so the destination vdpa device see the same state a the
> > guest set in the source.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++=
-
> >   1 file changed, 52 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 0183fce353..2873be2ba4 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -383,7 +383,7 @@ static virtio_net_ctrl_ack vhost_vdpa_net_svq_add(V=
hostShadowVirtqueue *svq,
> >       return VIRTIO_NET_OK;
> >   }
> >
> > -static int vhost_vdpa_start_control_svq(struct vhost_vdpa *v)
> > +static int vhost_vdpa_enable_control_svq(struct vhost_vdpa *v)
> >   {
> >       struct vhost_vring_state state =3D {
> >           .index =3D v->dev->vq_index,
> > @@ -395,6 +395,57 @@ static int vhost_vdpa_start_control_svq(struct vho=
st_vdpa *v)
> >       return r < 0 ? -errno : r;
> >   }
> >
> > +static int vhost_vdpa_start_control_svq(struct vhost_vdpa *v)
> > +{
> > +
> > +    VirtIONet *n =3D VIRTIO_NET(v->dev->vdev);
> > +    uint64_t features =3D v->dev->vdev->host_features;
> > +    VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs, 0);
> > +    VhostVDPAState *s =3D container_of(v, VhostVDPAState, vhost_vdpa);
> > +    int r;
> > +
> > +    r =3D vhost_vdpa_enable_control_svq(v);
> > +    if (unlikely(r < 0)) {
> > +        return r;
> > +    }
> > +
> > +    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> > +        const struct virtio_net_ctrl_hdr ctrl =3D {
> > +            .class =3D VIRTIO_NET_CTRL_MAC,
> > +            .cmd =3D VIRTIO_NET_CTRL_MAC_ADDR_SET,
> > +        };
> > +        uint8_t mac[6];
> > +        const struct iovec out[] =3D {
> > +            {
> > +                .iov_base =3D (void *)&ctrl,
> > +                .iov_len =3D sizeof(ctrl),
> > +            },{
> > +                .iov_base =3D mac,
> > +                .iov_len =3D sizeof(mac),
> > +            },
> > +        };
> > +        struct iovec dev_buffers[2] =3D {
> > +            { .iov_base =3D s->cvq_cmd_out_buffer },
> > +            { .iov_base =3D s->cvq_cmd_in_buffer },
> > +        };
> > +        bool ok;
> > +        virtio_net_ctrl_ack state;
> > +
> > +        ok =3D vhost_vdpa_net_cvq_map_sg(s, out, ARRAY_SIZE(out), dev_=
buffers);
> > +        if (unlikely(!ok)) {
> > +            return -1;
> > +        }
> > +
> > +        memcpy(mac, n->mac, sizeof(mac));
> > +        state =3D vhost_vdpa_net_svq_add(svq, dev_buffers);
> > +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[0].iov_base);
> > +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[1].iov_base);
>
>
> Any reason we do per buffer unmap instead of the sg unmap here?
>

I think I don't get this comment.

vhost_vdpa_net_handle_ctrl_avail also unmap each buffer individually,
and I need a function to unmap one of them at a time. I could create a
function to unmap a whole sg, but I'm not sure how much value it adds.

Thanks!

> Thanks
>
>
> > +        return state =3D=3D VIRTIO_NET_OK ? 0 : 1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   /**
> >    * Do not forward commands not supported by SVQ. Otherwise, the devic=
e could
> >    * accept it and qemu would not know how to update the device model.
>


