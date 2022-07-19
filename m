Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71355792D0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 07:53:32 +0200 (CEST)
Received: from localhost ([::1]:50444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDgAl-00054J-5k
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 01:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDg10-000581-Ph
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 01:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDg0u-0007cS-H0
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 01:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658209399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VdyG6l3N5AFnb7/smSegPuDSeoochjx3EsZ7cx6mV+M=;
 b=g/261kDEyjSg6s+HQ2bpvGMlLzdhbLp/rLF2DafvkSVZlyZcEe4l7GkSdigK1govQi5G/C
 CeKn3oAmK6KQxERs/ubkawbHUg3kJ7dajQqc4oC9M1UYtItQEcuzqqmEBnACGeldHiKy3e
 /BClSh3l3gqff/5JRuEji7yHNnjkG3Q=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-5cnC7LeXOlSqGFpLq5Zwiw-1; Tue, 19 Jul 2022 01:43:11 -0400
X-MC-Unique: 5cnC7LeXOlSqGFpLq5Zwiw-1
Received: by mail-qv1-f69.google.com with SMTP id
 ld6-20020a056214418600b00472ffe4640eso6800176qvb.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 22:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VdyG6l3N5AFnb7/smSegPuDSeoochjx3EsZ7cx6mV+M=;
 b=Oi87siGM72PSKakGTW27iz8UgY1x6aBdhIESbVD0NJSSZyhmgSja/7ld3ZUuIMtvcF
 5X9FOx6GjadSCs+9jZ5IQkrKpWabkvslwigydmfPB5Q/3AGavepSOyrBC+PSJPnNyOu4
 dWCBFOkIV+cSw2MnVieNweDaFTX1KIuxrHnagmUgSUhU2adbfZ++j7pm85q1fw4NXRb5
 nVwBnvCw7sgts391YwdddgKH7FYNlGUpDQniY4gVzTeycf21MnIRS6TpFLU76oSPpMYG
 WQyT7nTEZQIp14gVWoT7pAH0d7mL/hpViQHUo86dThqBWjeZuzPqvjl5geWHUJP+vdQE
 mOIQ==
X-Gm-Message-State: AJIora/Dgc+5+nPTQ2ty2M1ko0leFnpDpBO23q1ChvG1ojnfE5s9tSnJ
 6cfo/Qh+/nOP2KIOFG72mBHopigp1WqSMJTajpNJJOTQ3oXM7Bl5z9rBtPE5gIDQ7vVsv0hT/rw
 18+JrzYNQKAd1Pn7TGIKeV5lG6aj5fpw=
X-Received: by 2002:a05:6214:27c9:b0:473:9f3b:1ca with SMTP id
 ge9-20020a05621427c900b004739f3b01camr20174276qvb.108.1658209391455; 
 Mon, 18 Jul 2022 22:43:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tZY5TPICF0DR3IV50O79hFgrIRxPDGLw8nsP7Zj40kyzdgXNr2/Rnq5tfG5cLxM+vwS81YRLQL6Utl7b+7yVk=
X-Received: by 2002:a05:6214:27c9:b0:473:9f3b:1ca with SMTP id
 ge9-20020a05621427c900b004739f3b01camr20174260qvb.108.1658209391083; Mon, 18
 Jul 2022 22:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220718102949.2868267-1-eperezma@redhat.com>
 <20220718102949.2868267-17-eperezma@redhat.com>
 <114122cc-8dde-552b-34f5-836efaba5564@redhat.com>
In-Reply-To: <114122cc-8dde-552b-34f5-836efaba5564@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 19 Jul 2022 07:42:34 +0200
Message-ID: <CAJaqyWeh=bjaNXXBTWCU68Cnr4tdaQpMvXo4AXryvJGzjf29fw@mail.gmail.com>
Subject: Re: [PATCH v4 16/19] vdpa: Buffer CVQ support on shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Cornelia Huck <cohuck@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Parav Pandit <parav@mellanox.com>
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

On Tue, Jul 19, 2022 at 4:39 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/18 18:29, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Introduce the control virtqueue support for vDPA shadow virtqueue. This
> > is needed for advanced networking features like rx filtering.
> >
> > Virtio-net control VQ copies the descriptors to qemu's VA, so we avoid
> > TOCTOU with the guest's or device's memory every time there is a device
> > model change.  Otherwise, the guest could change the memory content in
> > the time between qemu and the device read it.
> >
> > To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR is
> > implemented.  If the virtio-net driver changes MAC the virtio-net devic=
e
> > model will be updated with the new one, and a rx filtering change event
> > will be raised.
> >
> > More cvq commands could be added here straightforwardly but they have
> > not been tested.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 211 +++++++++++++++++++++++++++++++++++++++++++++-=
-
> >   1 file changed, 204 insertions(+), 7 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 2e3b6b10d8..3915b148c4 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -33,6 +33,9 @@ typedef struct VhostVDPAState {
> >       NetClientState nc;
> >       struct vhost_vdpa vhost_vdpa;
> >       VHostNetState *vhost_net;
> > +
> > +    /* Control commands shadow buffers */
> > +    void *cvq_cmd_out_buffer, *cvq_cmd_in_buffer;
> >       bool started;
> >   } VhostVDPAState;
> >
> > @@ -131,6 +134,8 @@ static void vhost_vdpa_cleanup(NetClientState *nc)
> >   {
> >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >
> > +    qemu_vfree(s->cvq_cmd_out_buffer);
> > +    qemu_vfree(s->cvq_cmd_in_buffer);
> >       if (s->vhost_net) {
> >           vhost_net_cleanup(s->vhost_net);
> >           g_free(s->vhost_net);
> > @@ -190,24 +195,191 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> >           .check_peer_type =3D vhost_vdpa_check_peer_type,
> >   };
> >
> > +static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
> > +{
> > +    VhostIOVATree *tree =3D v->iova_tree;
> > +    DMAMap needle =3D {
> > +        /*
> > +         * No need to specify size or to look for more translations si=
nce
> > +         * this contiguous chunk was allocated by us.
> > +         */
> > +        .translated_addr =3D (hwaddr)(uintptr_t)addr,
> > +    };
> > +    const DMAMap *map =3D vhost_iova_tree_find_iova(tree, &needle);
> > +    int r;
> > +
> > +    if (unlikely(!map)) {
> > +        error_report("Cannot locate expected map");
> > +        return;
> > +    }
> > +
> > +    r =3D vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
> > +    if (unlikely(r !=3D 0)) {
> > +        error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
> > +    }
> > +
> > +    vhost_iova_tree_remove(tree, map);
> > +}
> > +
> > +static size_t vhost_vdpa_net_cvq_cmd_len(void)
> > +{
> > +    /*
> > +     * MAC_TABLE_SET is the ctrl command that produces the longer out =
buffer.
> > +     * In buffer is always 1 byte, so it should fit here
> > +     */
> > +    return sizeof(struct virtio_net_ctrl_hdr) +
> > +           2 * sizeof(struct virtio_net_ctrl_mac) +
> > +           MAC_TABLE_ENTRIES * ETH_ALEN;
> > +}
> > +
> > +static size_t vhost_vdpa_net_cvq_cmd_page_len(void)
> > +{
> > +    return ROUND_UP(vhost_vdpa_net_cvq_cmd_len(), qemu_real_host_page_=
size());
> > +}
> > +
> > +/** Copy and map a guest buffer. */
> > +static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
> > +                                   const struct iovec *out_data,
> > +                                   size_t out_num, size_t data_len, vo=
id *buf,
> > +                                   size_t *written, bool write)
> > +{
> > +    DMAMap map =3D {};
> > +    int r;
> > +
> > +    if (unlikely(!data_len)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid legnth of %s buffe=
r\n",
> > +                      __func__, write ? "in" : "out");
> > +        return false;
> > +    }
> > +
> > +    *written =3D iov_to_buf(out_data, out_num, 0, buf, data_len);
> > +    map.translated_addr =3D (hwaddr)(uintptr_t)buf;
> > +    map.size =3D vhost_vdpa_net_cvq_cmd_page_len() - 1;
> > +    map.perm =3D write ? IOMMU_RW : IOMMU_RO,
> > +    r =3D vhost_iova_tree_map_alloc(v->iova_tree, &map);
> > +    if (unlikely(r !=3D IOVA_OK)) {
> > +        error_report("Cannot map injected element");
> > +        return false;
> > +    }
> > +
> > +    r =3D vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_page_=
len(), buf,
> > +                           !write);
> > +    if (unlikely(r < 0)) {
> > +        goto dma_map_err;
> > +    }
> > +
> > +    return true;
> > +
> > +dma_map_err:
> > +    vhost_iova_tree_remove(v->iova_tree, &map);
> > +    return false;
> > +}
> > +
> >   /**
> > - * Forward buffer for the moment.
> > + * Copy the guest element into a dedicated buffer suitable to be sent =
to NIC
> > + *
> > + * @iov: [0] is the out buffer, [1] is the in one
> > + */
> > +static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> > +                                        VirtQueueElement *elem,
> > +                                        struct iovec *iov)
> > +{
> > +    size_t in_copied;
> > +    bool ok;
> > +
> > +    iov[0].iov_base =3D s->cvq_cmd_out_buffer;
> > +    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->=
out_num,
> > +                                vhost_vdpa_net_cvq_cmd_len(), iov[0].i=
ov_base,
> > +                                &iov[0].iov_len, false);
> > +    if (unlikely(!ok)) {
> > +        return false;
> > +    }
> > +
> > +    iov[1].iov_base =3D s->cvq_cmd_in_buffer;
> > +    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
> > +                                sizeof(virtio_net_ctrl_ack), iov[1].io=
v_base,
> > +                                &in_copied, true);
> > +    if (unlikely(!ok)) {
> > +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer=
);
> > +        return false;
> > +    }
> > +
> > +    iov[1].iov_len =3D sizeof(virtio_net_ctrl_ack);
> > +    return true;
> > +}
> > +
> > +/**
> > + * Do not forward commands not supported by SVQ. Otherwise, the device=
 could
> > + * accept it and qemu would not know how to update the device model.
> > + */
> > +static bool vhost_vdpa_net_cvq_validate_cmd(const struct iovec *out,
> > +                                            size_t out_num)
> > +{
> > +    struct virtio_net_ctrl_hdr ctrl;
> > +    size_t n;
> > +
> > +    n =3D iov_to_buf(out, out_num, 0, &ctrl, sizeof(ctrl));
> > +    if (unlikely(n < sizeof(ctrl))) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: invalid legnth of out buffer %zu\n", __func=
__, n);
> > +        return false;
> > +    }
> > +
> > +    switch (ctrl.class) {
> > +    case VIRTIO_NET_CTRL_MAC:
> > +        switch (ctrl.cmd) {
> > +        case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> > +            return true;
> > +        default:
> > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mac cmd %u\n",
> > +                          __func__, ctrl.cmd);
> > +        };
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n=
",
> > +                      __func__, ctrl.class);
> > +    };
> > +
> > +    return false;
> > +}
> > +
> > +/**
> > + * Validate and copy control virtqueue commands.
> > + *
> > + * Following QEMU guidelines, we offer a copy of the buffers to the de=
vice to
> > + * prevent TOCTOU bugs.
> >    */
> >   static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq=
,
> >                                               VirtQueueElement *elem,
> >                                               void *opaque)
> >   {
> > -    unsigned int n =3D elem->out_num + elem->in_num;
> > -    g_autofree struct iovec *dev_buffers =3D g_new(struct iovec, n);
> > +    VhostVDPAState *s =3D opaque;
> >       size_t in_len, dev_written;
> >       virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > +    /* out and in buffers sent to the device */
> > +    struct iovec dev_buffers[2] =3D {
> > +        { .iov_base =3D s->cvq_cmd_out_buffer },
> > +        { .iov_base =3D s->cvq_cmd_in_buffer },
> > +    };
> > +    /* in buffer used for device model */
> > +    const struct iovec in =3D {
> > +        .iov_base =3D &status,
> > +        .iov_len =3D sizeof(status),
> > +    };
> >       int r;
>
>
> I got this:
>
> FAILED: libcommon.fa.p/net_vhost-vdpa.c.o
> cc -m64 -mcx16 -Ilibcommon.fa.p -I../dtc/libfdt -I../slirp
> -I../slirp/src -I/usr/include/capstone -I/usr/include/pixman-1
> -I/usr/include/libpng16 -I/usr/include/libmount -I/usr/include/blkid
> -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
> -I/usr/include/gio-unix-2.0 -fdiagnostics-color=3Dauto -Wall -Winvalid-pc=
h
> -Werror -std=3Dgnu11 -O2 -g -isystem /home/devel/git/qemu/linux-headers
> -isystem linux-headers -iquote . -iquote /home/devel/git/qemu -iquote
> /home/devel/git/qemu/include -iquote /home/devel/git/qemu/tcg/i386
> -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE
> -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
> -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration
> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2
> -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi
> -fstack-protector-strong -fPIE -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=3D600
> -DNCURSES_WIDECHAR=3D1 -MD -MQ libcommon.fa.p/net_vhost-vdpa.c.o -MF
> libcommon.fa.p/net_vhost-vdpa.c.o.d -o libcommon.fa.p/net_vhost-vdpa.c.o
> -c ../net/vhost-vdpa.c
> ../net/vhost-vdpa.c: In function =E2=80=98vhost_vdpa_net_handle_ctrl_avai=
l=E2=80=99:
> ../net/vhost-vdpa.c:427:12: error: =E2=80=98r=E2=80=99 may be used uninit=
ialized in this
> function [-Werror=3Dmaybe-uninitialized]
>    427 |     return r;
>        |            ^
> cc1: all warnings being treated as errors
>

Sorry, I rebase with these applied (or half applied) [1].

I'll send a new version based on the current master in a moment.

Thanks!

[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg01986.html

>
> > +    bool ok;
> >
> > -    memcpy(dev_buffers, elem->out_sg, elem->out_num);
> > -    memcpy(dev_buffers + elem->out_num, elem->in_sg, elem->in_num);
> > +    ok =3D vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
>
>
> I think it's good idea to let this function return int instead of a boole=
an.
>
> Thanks
>
>
> > +    if (unlikely(!ok)) {
> > +        goto out;
> > +    }
> >
> > -    r =3D vhost_svq_add(svq, &dev_buffers[0], elem->out_num, &dev_buff=
ers[1],
> > -                      elem->in_num, elem);
> > +    ok =3D vhost_vdpa_net_cvq_validate_cmd(&dev_buffers[0], 1);
> > +    if (unlikely(!ok)) {
> > +        goto out;
> > +    }
> > +
> > +    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, e=
lem);
> >       if (unlikely(r !=3D 0)) {
> >           if (unlikely(r =3D=3D -ENOSPC)) {
> >               qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device qu=
eue\n",
> > @@ -224,6 +396,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostS=
hadowVirtqueue *svq,
> >       dev_written =3D vhost_svq_poll(svq);
> >       if (unlikely(dev_written < sizeof(status))) {
> >           error_report("Insufficient written data (%zu)", dev_written);
> > +        goto out;
> > +    }
> > +
> > +    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
> > +    if (status !=3D VIRTIO_NET_OK) {
> > +        goto out;
> > +    }
> > +
> > +    status =3D VIRTIO_NET_ERR;
> > +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
> > +    if (status !=3D VIRTIO_NET_OK) {
> > +        error_report("Bad CVQ processing in model");
> >       }
> >
> >   out:
> > @@ -234,6 +418,12 @@ out:
> >       }
> >       vhost_svq_push_elem(svq, elem, MIN(in_len, sizeof(status)));
> >       g_free(elem);
> > +    if (dev_buffers[0].iov_base) {
> > +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[0].iov_ba=
se);
> > +    }
> > +    if (dev_buffers[1].iov_base) {
> > +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].iov_ba=
se);
> > +    }
> >       return r;
> >   }
> >
> > @@ -266,6 +456,13 @@ static NetClientState *net_vhost_vdpa_init(NetClie=
ntState *peer,
> >       s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >       s->vhost_vdpa.index =3D queue_pair_index;
> >       if (!is_datapath) {
> > +        s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_si=
ze(),
> > +                                            vhost_vdpa_net_cvq_cmd_pag=
e_len());
> > +        memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_page_l=
en());
> > +        s->cvq_cmd_in_buffer =3D qemu_memalign(qemu_real_host_page_siz=
e(),
> > +                                            vhost_vdpa_net_cvq_cmd_pag=
e_len());
> > +        memset(s->cvq_cmd_in_buffer, 0, vhost_vdpa_net_cvq_cmd_page_le=
n());
> > +
> >           s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
> >           s->vhost_vdpa.shadow_vq_ops_opaque =3D s;
> >       }
>


