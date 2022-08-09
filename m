Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4658D4E4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 09:53:28 +0200 (CEST)
Received: from localhost ([::1]:47062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLK3K-0008Of-TC
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 03:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJz7-0004DZ-RV
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:49:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJz3-0001Xs-TO
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660031340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82yWafSCoxNoi1wXan2hsjAlpZIn714yUEXrCjjc1HM=;
 b=TSc03fueb/JVAz0ExyiGiJmnK8tbTf1K45CG68eB9iGvfsSO2gX+gVPkr8XysKivtwXyNg
 8P+n2+4UfOg2PzNLIcNqTU9lLAoqRt2gtBtCXPvQ1UaCXshJZ2DC6L4ocjH3V+k9+poFhG
 dJY3xeN2wXUt4f/8kE9YxwxTiqKGRXc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-AtQi8sjzO-acXvFg4GnkZg-1; Tue, 09 Aug 2022 03:48:58 -0400
X-MC-Unique: AtQi8sjzO-acXvFg4GnkZg-1
Received: by mail-lf1-f70.google.com with SMTP id
 p25-20020a056512329900b0048b16448af2so2540786lfe.5
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 00:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=82yWafSCoxNoi1wXan2hsjAlpZIn714yUEXrCjjc1HM=;
 b=fKmgWzqjnIEcV2Adzfh1e84rUqcoJQMzvE1cEyOHv3YRv+pygRio6L2u0BubIeKsyk
 Bra6p+kA74jde766Asg7u0lPY6phrLN2pam2DW+VuoQgsGpC1wW79FVrc6xXrm0qRkA4
 fPjlAq5bsnp5GgXz4XlcOrhgVKZ+9bQKX/Vfag1Zo7UcwgzoAhvV+JdaXmo4FIPsIAqX
 WgatOJPxUkmPX56yRWn9qeYPjKHZ/wNaJN51GyZLZKumVjhPVOIuLZ20Utgj1dd8xXfk
 76bkhOzrLuFlT36K3f5j/kYckHwklSfY09BvQp0+jaWNNF2Pnxgtbo7vAgwYEYekUq6A
 q9uA==
X-Gm-Message-State: ACgBeo1w/4uFI8c4ZFrxTHkezGt8vv7pGP42BB8PT7Fqme49TtydoaWA
 OGljMHy+ecQ5s8dkpb+JMXQlJIUZDGJZoAJBXfPK1SeFxPYIREwdyFYIDJ4Vh1oMtsbGKU2kJfP
 Tp39H+CE+SgnHScGbf3ZFMD5p8IZe5Gs=
X-Received: by 2002:ac2:43b0:0:b0:48b:1eb:d1e5 with SMTP id
 t16-20020ac243b0000000b0048b01ebd1e5mr8122064lfl.641.1660031336913; 
 Tue, 09 Aug 2022 00:48:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7jkRsXixj/SyWTj07OXqtiUIBXJmt84r6ehYAS4BYxwQwMKW7CJ/IUDZEA1/VQyLI/fb2vNtlvhCdKAoPT1lI=
X-Received: by 2002:ac2:43b0:0:b0:48b:1eb:d1e5 with SMTP id
 t16-20020ac243b0000000b0048b01ebd1e5mr8122052lfl.641.1660031336638; Tue, 09
 Aug 2022 00:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-9-eperezma@redhat.com>
 <CACGkMEt9GhbKq2vbzJcS50rzCiJCy76fPaEMksJR1s-JqB7yrg@mail.gmail.com>
 <CAJaqyWdp9whO3nRun4k7ZfN0pwqbsjFk_AhBbmXmnFRz7E2ikg@mail.gmail.com>
In-Reply-To: <CAJaqyWdp9whO3nRun4k7ZfN0pwqbsjFk_AhBbmXmnFRz7E2ikg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Aug 2022 15:48:45 +0800
Message-ID: <CACGkMEuCDc7nYppJs0xsKwLSntXJgyFz+iAiqugN0eh_uCN7cQ@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] vdpa: Move command buffers map to start of net
 device
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Eric Blake <eblake@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
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

On Tue, Aug 9, 2022 at 3:34 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Tue, Aug 9, 2022 at 9:04 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> > >
> > > As this series will reuse them to restore the device state at the end=
 of
> > > a migration (or a device start), let's allocate only once at the devi=
ce
> > > start so we don't duplicate their map and unmap.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  net/vhost-vdpa.c | 123 ++++++++++++++++++++++-----------------------=
--
> > >  1 file changed, 58 insertions(+), 65 deletions(-)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 55e8a39a56..2c6a26cca0 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -263,29 +263,20 @@ static size_t vhost_vdpa_net_cvq_cmd_page_len(v=
oid)
> > >      return ROUND_UP(vhost_vdpa_net_cvq_cmd_len(), qemu_real_host_pag=
e_size());
> > >  }
> > >
> > > -/** Copy and map a guest buffer. */
> > > -static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
> > > -                                   const struct iovec *out_data,
> > > -                                   size_t out_num, size_t data_len, =
void *buf,
> > > -                                   size_t *written, bool write)
> > > +/** Map CVQ buffer. */
> > > +static int vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v, void *buf, s=
ize_t size,
> > > +                                  bool write)
> > >  {
> > >      DMAMap map =3D {};
> > >      int r;
> > >
> > > -    if (unlikely(!data_len)) {
> > > -        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid legnth of %s buf=
fer\n",
> > > -                      __func__, write ? "in" : "out");
> > > -        return false;
> > > -    }
> > > -
> > > -    *written =3D iov_to_buf(out_data, out_num, 0, buf, data_len);
> > >      map.translated_addr =3D (hwaddr)(uintptr_t)buf;
> > > -    map.size =3D vhost_vdpa_net_cvq_cmd_page_len() - 1;
> > > +    map.size =3D size - 1;
> >
> > Just noticed this, I think I've asked for the reason before but I
> > don't remember the answer.
> >
> > But it looks like a hint of a defect of the current API design.
> >
>
> I can look for it in the mail list, but long story short:
> vDPA DMA API is *not* inclusive: To map the first page, you map (.iova
> =3D 0, .size =3D 4096).
> IOVA tree API has been inclusive forever: To map the first page, you
> map (.iova =3D 0, .size =3D 4095). If we map with .size =3D 4096, .iova =
=3D
> 4096 is considered mapped too.

This looks like a bug.

{.iova=3D0, size=3D0} should be illegal but if I understand you correctly,
it means [0, 1)?

Thanks

>
> To adapt one to the other would have been an API change even before
> the introduction of vhost-iova-tree.
>
> Thanks!
>
>
> > Thanks
> >
> > >      map.perm =3D write ? IOMMU_RW : IOMMU_RO,
> > >      r =3D vhost_iova_tree_map_alloc(v->iova_tree, &map);
> > >      if (unlikely(r !=3D IOVA_OK)) {
> > >          error_report("Cannot map injected element");
> > > -        return false;
> > > +        return r;
> > >      }
> > >
> > >      r =3D vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_pag=
e_len(), buf,
> > > @@ -294,50 +285,58 @@ static bool vhost_vdpa_cvq_map_buf(struct vhost=
_vdpa *v,
> > >          goto dma_map_err;
> > >      }
> > >
> > > -    return true;
> > > +    return 0;
> > >
> > >  dma_map_err:
> > >      vhost_iova_tree_remove(v->iova_tree, &map);
> > > -    return false;
> > > +    return r;
> > >  }
> > >
> > > -/**
> > > - * Copy the guest element into a dedicated buffer suitable to be sen=
t to NIC
> > > - *
> > > - * @iov: [0] is the out buffer, [1] is the in one
> > > - */
> > > -static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> > > -                                        VirtQueueElement *elem,
> > > -                                        struct iovec *iov)
> > > +static int vhost_vdpa_net_cvq_prepare(NetClientState *nc)
> > >  {
> > > -    size_t in_copied;
> > > -    bool ok;
> > > +    VhostVDPAState *s;
> > > +    int r;
> > >
> > > -    iov[0].iov_base =3D s->cvq_cmd_out_buffer;
> > > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem=
->out_num,
> > > -                                vhost_vdpa_net_cvq_cmd_len(), iov[0]=
.iov_base,
> > > -                                &iov[0].iov_len, false);
> > > -    if (unlikely(!ok)) {
> > > -        return false;
> > > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > > +
> > > +    s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > +    if (!s->vhost_vdpa.shadow_vqs_enabled) {
> > > +        return 0;
> > >      }
> > >
> > > -    iov[1].iov_base =3D s->cvq_cmd_in_buffer;
> > > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
> > > -                                sizeof(virtio_net_ctrl_ack), iov[1].=
iov_base,
> > > -                                &in_copied, true);
> > > -    if (unlikely(!ok)) {
> > > +    r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buff=
er,
> > > +                               vhost_vdpa_net_cvq_cmd_page_len(), fa=
lse);
> > > +    if (unlikely(r < 0)) {
> > > +        return r;
> > > +    }
> > > +
> > > +    r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_in_buffe=
r,
> > > +                               vhost_vdpa_net_cvq_cmd_page_len(), tr=
ue);
> > > +    if (unlikely(r < 0)) {
> > >          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buff=
er);
> > > -        return false;
> > >      }
> > >
> > > -    iov[1].iov_len =3D sizeof(virtio_net_ctrl_ack);
> > > -    return true;
> > > +    return r;
> > > +}
> > > +
> > > +static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
> > > +{
> > > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > +
> > > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > > +
> > > +    if (s->vhost_vdpa.shadow_vqs_enabled) {
> > > +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buff=
er);
> > > +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_in_buffe=
r);
> > > +    }
> > >  }
> > >
> > >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> > >      .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> > >      .size =3D sizeof(VhostVDPAState),
> > >      .receive =3D vhost_vdpa_receive,
> > > +    .prepare =3D vhost_vdpa_net_cvq_prepare,
> > > +    .stop =3D vhost_vdpa_net_cvq_stop,
> > >      .cleanup =3D vhost_vdpa_cleanup,
> > >      .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> > >      .has_ufo =3D vhost_vdpa_has_ufo,
> > > @@ -348,19 +347,17 @@ static NetClientInfo net_vhost_vdpa_cvq_info =
=3D {
> > >   * Do not forward commands not supported by SVQ. Otherwise, the devi=
ce could
> > >   * accept it and qemu would not know how to update the device model.
> > >   */
> > > -static bool vhost_vdpa_net_cvq_validate_cmd(const struct iovec *out,
> > > -                                            size_t out_num)
> > > +static bool vhost_vdpa_net_cvq_validate_cmd(const void *out_buf, siz=
e_t len)
> > >  {
> > >      struct virtio_net_ctrl_hdr ctrl;
> > > -    size_t n;
> > >
> > > -    n =3D iov_to_buf(out, out_num, 0, &ctrl, sizeof(ctrl));
> > > -    if (unlikely(n < sizeof(ctrl))) {
> > > +    if (unlikely(len < sizeof(ctrl))) {
> > >          qemu_log_mask(LOG_GUEST_ERROR,
> > > -                      "%s: invalid legnth of out buffer %zu\n", __fu=
nc__, n);
> > > +                      "%s: invalid legnth of out buffer %zu\n", __fu=
nc__, len);
> > >          return false;
> > >      }
> > >
> > > +    memcpy(&ctrl, out_buf, sizeof(ctrl));
> > >      switch (ctrl.class) {
> > >      case VIRTIO_NET_CTRL_MAC:
> > >          switch (ctrl.cmd) {
> > > @@ -392,10 +389,14 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vho=
stShadowVirtqueue *svq,
> > >      VhostVDPAState *s =3D opaque;
> > >      size_t in_len, dev_written;
> > >      virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > > -    /* out and in buffers sent to the device */
> > > -    struct iovec dev_buffers[2] =3D {
> > > -        { .iov_base =3D s->cvq_cmd_out_buffer },
> > > -        { .iov_base =3D s->cvq_cmd_in_buffer },
> > > +    /* Out buffer sent to both the vdpa device and the device model =
*/
> > > +    struct iovec out =3D {
> > > +        .iov_base =3D s->cvq_cmd_out_buffer,
> > > +    };
> > > +    /* In buffer sent to the device */
> > > +    const struct iovec dev_in =3D {
> > > +        .iov_base =3D s->cvq_cmd_in_buffer,
> > > +        .iov_len =3D sizeof(virtio_net_ctrl_ack),
> > >      };
> > >      /* in buffer used for device model */
> > >      const struct iovec in =3D {
> > > @@ -405,17 +406,15 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vho=
stShadowVirtqueue *svq,
> > >      int r =3D -EINVAL;
> > >      bool ok;
> > >
> > > -    ok =3D vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
> > > -    if (unlikely(!ok)) {
> > > -        goto out;
> > > -    }
> > > -
> > > -    ok =3D vhost_vdpa_net_cvq_validate_cmd(&dev_buffers[0], 1);
> > > +    out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> > > +                             s->cvq_cmd_out_buffer,
> > > +                             vhost_vdpa_net_cvq_cmd_len());
> > > +    ok =3D vhost_vdpa_net_cvq_validate_cmd(s->cvq_cmd_out_buffer, ou=
t.iov_len);
> > >      if (unlikely(!ok)) {
> > >          goto out;
> > >      }
> > >
> > > -    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1,=
 elem);
> > > +    r =3D vhost_svq_add(svq, &out, 1, &dev_in, 1, elem);
> > >      if (unlikely(r !=3D 0)) {
> > >          if (unlikely(r =3D=3D -ENOSPC)) {
> > >              qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device q=
ueue\n",
> > > @@ -435,13 +434,13 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vho=
stShadowVirtqueue *svq,
> > >          goto out;
> > >      }
> > >
> > > -    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
> > > +    memcpy(&status, s->cvq_cmd_in_buffer, sizeof(status));
> > >      if (status !=3D VIRTIO_NET_OK) {
> > >          goto out;
> > >      }
> > >
> > >      status =3D VIRTIO_NET_ERR;
> > > -    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
> > > +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
> > >      if (status !=3D VIRTIO_NET_OK) {
> > >          error_report("Bad CVQ processing in model");
> > >      }
> > > @@ -454,12 +453,6 @@ out:
> > >      }
> > >      vhost_svq_push_elem(svq, elem, MIN(in_len, sizeof(status)));
> > >      g_free(elem);
> > > -    if (dev_buffers[0].iov_base) {
> > > -        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[0].iov_=
base);
> > > -    }
> > > -    if (dev_buffers[1].iov_base) {
> > > -        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].iov_=
base);
> > > -    }
> > >      return r;
> > >  }
> > >
> > > --
> > > 2.31.1
> > >
> >
>


