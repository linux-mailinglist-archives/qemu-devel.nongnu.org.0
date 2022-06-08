Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CCF543927
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:35:21 +0200 (CEST)
Received: from localhost ([::1]:48470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyeN-0003Nk-CW
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nyyax-0001GG-EE
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:31:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nyyad-0005JV-EG
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654705882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9saScUDAX9rCzTAKd4Sj1svYbAdxn/p5FzPWkT7nak=;
 b=e9xGpuwl0YtET//HZhcIV4UPpecg8JbpBpYBpbrXZxnM7RYJP7aLAJxFp+XEVuozafoXsb
 EpRyg1KoPdOXynfnU9QpEs/zWKEk8z6++rcRDnhpHVMJoZnj0zXlmja3bP9FKH9YeyHreQ
 psLMpiDZFP6hrmQJoUmd09TlH+rXpLo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-n8clwji4NOav-qrV4GhZZA-1; Wed, 08 Jun 2022 12:31:21 -0400
X-MC-Unique: n8clwji4NOav-qrV4GhZZA-1
Received: by mail-qk1-f197.google.com with SMTP id
 j11-20020a37c24b000000b006a6bd97578aso7552343qkm.15
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B9saScUDAX9rCzTAKd4Sj1svYbAdxn/p5FzPWkT7nak=;
 b=Ml36nLO2WJmSsthMezxSbbjTwwwGs6YIE/e16o1AumSrtq9YJQChlTxbqEnnLn5FuZ
 F3Uy9XpZkLpBLu4uqq1cF7xRB7SwBKZzxEEJcpAbtemzXlwbVR9l79zzWRQNS2zhHckV
 63+WcmPsZpJqz1/aQHX+MNP6rzBXFwNiWm766LeLuxJArYhEK6sGEbSTX+QM1srBkXhw
 rcDuDfitsztIpq/w4nRHtAMOKngWy/rRzK5I71bc0+1YLxvGOU9EvhjBlACMoUcvb0yc
 ydabZQG7TybvbXyUmzTYgXZ8Ru5deGBJEmE2h1Fztcu6Jr5P/bHbVTAF7W/XK/c599Lt
 aJeQ==
X-Gm-Message-State: AOAM53092jNrA5uOvPJQBAw90FImPwwVmpj+wBz1OeXCyA+Djd6ETYdH
 FGlPTBQGXNgPRvUNjx8BrwyjmSUhr3uCdDx/KsKlAFUgy8UIEiIQRJLlR0kPzXHwhPvgF0OBadR
 +hIOo3Y9iBtQm5kTLtKStMXKUinkKrNA=
X-Received: by 2002:a0c:fe48:0:b0:462:6a02:a17d with SMTP id
 u8-20020a0cfe48000000b004626a02a17dmr26242963qvs.108.1654705879207; 
 Wed, 08 Jun 2022 09:31:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe9mZyUm1903k0r9S4AohvFXyOemSJRk9ouZOWsExpaHwNR53TPssUc3oiQUZpTj98Max/5xKSDwWQ6QvUpZ8=
X-Received: by 2002:a0c:fe48:0:b0:462:6a02:a17d with SMTP id
 u8-20020a0cfe48000000b004626a02a17dmr26242925qvs.108.1654705878841; Wed, 08
 Jun 2022 09:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-2-eperezma@redhat.com>
 <fba403b1-b06d-9d19-204e-f9fcf737d856@redhat.com>
In-Reply-To: <fba403b1-b06d-9d19-204e-f9fcf737d856@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 8 Jun 2022 18:30:42 +0200
Message-ID: <CAJaqyWfq3e+1f+Ryse9sZiEAbDrgFd7Uf-Xwy_AcHd66H6yAWQ@mail.gmail.com>
Subject: Re: [RFC PATCH v8 01/21] virtio-net: Expose ctrl virtqueue logic
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eric Blake <eblake@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 7, 2022 at 8:13 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > This allows external vhost-net devices to modify the state of the
> > VirtIO device model once vhost-vdpa device has acknowledge the control
> > commands.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   include/hw/virtio/virtio-net.h |  4 ++
> >   hw/net/virtio-net.c            | 84 ++++++++++++++++++++-------------=
-
> >   2 files changed, 53 insertions(+), 35 deletions(-)
> >
> > diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-=
net.h
> > index eb87032627..cd31b7f67d 100644
> > --- a/include/hw/virtio/virtio-net.h
> > +++ b/include/hw/virtio/virtio-net.h
> > @@ -218,6 +218,10 @@ struct VirtIONet {
> >       struct EBPFRSSContext ebpf_rss;
> >   };
> >
> > +unsigned virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
> > +                                    const struct iovec *in_sg, size_t =
in_num,
> > +                                    const struct iovec *out_sg,
> > +                                    unsigned out_num);
> >   void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
> >                                      const char *type);
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 7ad948ee7c..0e350154ec 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -1434,57 +1434,71 @@ static int virtio_net_handle_mq(VirtIONet *n, u=
int8_t cmd,
> >       return VIRTIO_NET_OK;
> >   }
> >
> > -static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
> > +unsigned virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
>
>
> Should we use size_t here?
>

I think it's a better type, yes. I used "unsigned" because
virtqueue_push uses unsigned for "len", maybe it's a good idea to
replace it there too.

Thanks!

> Thanks
>
>
> > +                                    const struct iovec *in_sg, size_t =
in_num,
> > +                                    const struct iovec *out_sg,
> > +                                    unsigned out_num)
> >   {
> >       VirtIONet *n =3D VIRTIO_NET(vdev);
> >       struct virtio_net_ctrl_hdr ctrl;
> >       virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > -    VirtQueueElement *elem;
> >       size_t s;
> >       struct iovec *iov, *iov2;
> > -    unsigned int iov_cnt;
> > +
> > +    if (iov_size(in_sg, in_num) < sizeof(status) ||
> > +        iov_size(out_sg, out_num) < sizeof(ctrl)) {
> > +        virtio_error(vdev, "virtio-net ctrl missing headers");
> > +        return 0;
> > +    }
> > +
> > +    iov2 =3D iov =3D g_memdup2(out_sg, sizeof(struct iovec) * out_num)=
;
> > +    s =3D iov_to_buf(iov, out_num, 0, &ctrl, sizeof(ctrl));
> > +    iov_discard_front(&iov, &out_num, sizeof(ctrl));
> > +    if (s !=3D sizeof(ctrl)) {
> > +        status =3D VIRTIO_NET_ERR;
> > +    } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_RX) {
> > +        status =3D virtio_net_handle_rx_mode(n, ctrl.cmd, iov, out_num=
);
> > +    } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_MAC) {
> > +        status =3D virtio_net_handle_mac(n, ctrl.cmd, iov, out_num);
> > +    } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_VLAN) {
> > +        status =3D virtio_net_handle_vlan_table(n, ctrl.cmd, iov, out_=
num);
> > +    } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_ANNOUNCE) {
> > +        status =3D virtio_net_handle_announce(n, ctrl.cmd, iov, out_nu=
m);
> > +    } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_MQ) {
> > +        status =3D virtio_net_handle_mq(n, ctrl.cmd, iov, out_num);
> > +    } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_GUEST_OFFLOADS) {
> > +        status =3D virtio_net_handle_offloads(n, ctrl.cmd, iov, out_nu=
m);
> > +    }
> > +
> > +    s =3D iov_from_buf(in_sg, in_num, 0, &status, sizeof(status));
> > +    assert(s =3D=3D sizeof(status));
> > +
> > +    g_free(iov2);
> > +    return sizeof(status);
> > +}
> > +
> > +static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
> > +{
> > +    VirtQueueElement *elem;
> >
> >       for (;;) {
> > +        unsigned written;
> >           elem =3D virtqueue_pop(vq, sizeof(VirtQueueElement));
> >           if (!elem) {
> >               break;
> >           }
> > -        if (iov_size(elem->in_sg, elem->in_num) < sizeof(status) ||
> > -            iov_size(elem->out_sg, elem->out_num) < sizeof(ctrl)) {
> > -            virtio_error(vdev, "virtio-net ctrl missing headers");
> > +
> > +        written =3D virtio_net_handle_ctrl_iov(vdev, elem->in_sg, elem=
->in_num,
> > +                                             elem->out_sg, elem->out_n=
um);
> > +        if (written > 0) {
> > +            virtqueue_push(vq, elem, written);
> > +            virtio_notify(vdev, vq);
> > +            g_free(elem);
> > +        } else {
> >               virtqueue_detach_element(vq, elem, 0);
> >               g_free(elem);
> >               break;
> >           }
> > -
> > -        iov_cnt =3D elem->out_num;
> > -        iov2 =3D iov =3D g_memdup2(elem->out_sg,
> > -                               sizeof(struct iovec) * elem->out_num);
> > -        s =3D iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
> > -        iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
> > -        if (s !=3D sizeof(ctrl)) {
> > -            status =3D VIRTIO_NET_ERR;
> > -        } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_RX) {
> > -            status =3D virtio_net_handle_rx_mode(n, ctrl.cmd, iov, iov=
_cnt);
> > -        } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_MAC) {
> > -            status =3D virtio_net_handle_mac(n, ctrl.cmd, iov, iov_cnt=
);
> > -        } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_VLAN) {
> > -            status =3D virtio_net_handle_vlan_table(n, ctrl.cmd, iov, =
iov_cnt);
> > -        } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_ANNOUNCE) {
> > -            status =3D virtio_net_handle_announce(n, ctrl.cmd, iov, io=
v_cnt);
> > -        } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_MQ) {
> > -            status =3D virtio_net_handle_mq(n, ctrl.cmd, iov, iov_cnt)=
;
> > -        } else if (ctrl.class =3D=3D VIRTIO_NET_CTRL_GUEST_OFFLOADS) {
> > -            status =3D virtio_net_handle_offloads(n, ctrl.cmd, iov, io=
v_cnt);
> > -        }
> > -
> > -        s =3D iov_from_buf(elem->in_sg, elem->in_num, 0, &status, size=
of(status));
> > -        assert(s =3D=3D sizeof(status));
> > -
> > -        virtqueue_push(vq, elem, sizeof(status));
> > -        virtio_notify(vdev, vq);
> > -        g_free(iov2);
> > -        g_free(elem);
> >       }
> >   }
> >
>


