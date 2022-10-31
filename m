Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C1461350D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 12:58:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTQI-0002r9-W5; Mon, 31 Oct 2022 07:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opTPd-0002Kg-3O
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opTPR-0006Mo-3l
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667217411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=is2kyiKfcs0Jnce8w6Po94cmNanhClWWjKTTiNklvjc=;
 b=fdJj1ykeNK5ZrTS4npnlgmm5C/DKxBFLXzjuA+ACEd/fAlrUBx6UNlnfIN5msridVP5JnD
 jpuMPZ+ddKMaibpUS/YMHKcHUZB2Z//y23+I2I2B6A3bqN8p0fTgoyX98gMZPXPZuP9gjI
 I1I9lrn0B+q3OpUioW7Z9XUKQDodNao=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-Zec66YK2N8CqAD3k60sVVA-1; Mon, 31 Oct 2022 07:56:44 -0400
X-MC-Unique: Zec66YK2N8CqAD3k60sVVA-1
Received: by mail-pg1-f199.google.com with SMTP id
 p24-20020a63f458000000b0043cd718c49dso6036064pgk.15
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 04:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=is2kyiKfcs0Jnce8w6Po94cmNanhClWWjKTTiNklvjc=;
 b=QzmqWt1ky9eL/RP2b+RO6nGFzYfzAHekgfpIw4IRpapIn6bQ1L/xCt/WjYMO4Dzh2x
 SiJ3cQQtbustcrbEPlxNa1hXC1N7TdwsasuDrziqZZbn54sla9unX1TUHjQh16po7H5b
 xVtIyyxzmwBcsv+KipHx5yXhHxwoZDe/k24NcoXMWgG5ATkf1vl1a+jMGJ38D20lXAGO
 3DscpvdJQtYE/WC0iNl7qHPQYt/AnYrBDLlXj/dVCEWlefAZ3IyMZZPSCoC3yJl3N718
 ReziONxaqwSDgpKbb8O1t744vuFXKnX1p9HxeMHzvNM8Hmxr9iHJuB390Bi5duHBQk2J
 Zmwg==
X-Gm-Message-State: ACrzQf2ugAVEKJbsz5uS7Nj9HNBfWCZr0Hg1oSzTAd/y4XSchZRet57N
 QNMCILCrOe6cWrEZ1rjrAzine/0YbG40ZpqSECrmwT0FeOKuPooxJrgEJ/1/4s/w4AYjwfxQ5WW
 poWfwQDjY6YXoc6mqMO2f6pf5xahlM4M=
X-Received: by 2002:a05:6a00:170b:b0:56d:4b31:c4cf with SMTP id
 h11-20020a056a00170b00b0056d4b31c4cfmr7680512pfc.68.1667217403478; 
 Mon, 31 Oct 2022 04:56:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jNLfA45YaiVPR2aKe95bV6YNpfWp8EGXyRhtWDZbco2jkAj0u84LE/gTZRD/lKiZZAaL4B6tRbKn529pc76U=
X-Received: by 2002:a05:6a00:170b:b0:56d:4b31:c4cf with SMTP id
 h11-20020a056a00170b00b0056d4b31c4cfmr7680483pfc.68.1667217403192; Mon, 31
 Oct 2022 04:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221011104154.1209338-1-eperezma@redhat.com>
 <20221011104154.1209338-3-eperezma@redhat.com>
 <20221031041821-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221031041821-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Oct 2022 12:56:06 +0100
Message-ID: <CAJaqyWcaZ32agF0CKPUU89NHj0Di9Q5kFJDsWcUwCG2q0u_kEQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] vdpa: Allocate SVQ unconditionally
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Gautam Dawar <gdawar@xilinx.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Jason Wang <jasowang@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org, 
 Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 9:21 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Oct 11, 2022 at 12:41:50PM +0200, Eugenio P=C3=A9rez wrote:
> > SVQ may run or not in a device depending on runtime conditions (for
> > example, if the device can move CVQ to its own group or not).
> >
> > Allocate the resources unconditionally, and decide later if to use them
> > or not.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> I applied this for now but I really dislike it that we are wasting
> resources like this.
>
> Can I just drop this patch from the series? It looks like things
> will just work anyway ...
>

It will not work simply dropping this patch, because new code expects
SVQ vrings to be already allocated. But that is doable with more work.

> I know, when one works on a feature it seems like everyone should
> enable it - but the reality is qemu already works quite well for
> most users and it is our resposibility to first do no harm.
>

I agree, but then it is better to drop this series entirely for this
merge window. I think it is justified to add it at the beginning of
the next merge window, and to give more time for testing and adding
more features actually.

However, I think shadow CVQ should start by default as long as the
device has the right set of both virtio and vdpa features. Otherwise,
we need another cmdline parameter, something like x-cvq-svq, and the
update of other layers like libvirt.

Thanks!

>
> > ---
> >  hw/virtio/vhost-vdpa.c | 33 +++++++++++++++------------------
> >  1 file changed, 15 insertions(+), 18 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 7f0ff4df5b..d966966131 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -410,6 +410,21 @@ static int vhost_vdpa_init_svq(struct vhost_dev *h=
dev, struct vhost_vdpa *v,
> >      int r;
> >      bool ok;
> >
> > +    shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
> > +    for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > +        g_autoptr(VhostShadowVirtqueue) svq;
> > +
> > +        svq =3D vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> > +                            v->shadow_vq_ops_opaque);
> > +        if (unlikely(!svq)) {
> > +            error_setg(errp, "Cannot create svq %u", n);
> > +            return -1;
> > +        }
> > +        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
> > +    }
> > +
> > +    v->shadow_vqs =3D g_steal_pointer(&shadow_vqs);
> > +
> >      if (!v->shadow_vqs_enabled) {
> >          return 0;
> >      }
> > @@ -426,20 +441,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *h=
dev, struct vhost_vdpa *v,
> >          return -1;
> >      }
> >
> > -    shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
> > -    for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > -        g_autoptr(VhostShadowVirtqueue) svq;
> > -
> > -        svq =3D vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> > -                            v->shadow_vq_ops_opaque);
> > -        if (unlikely(!svq)) {
> > -            error_setg(errp, "Cannot create svq %u", n);
> > -            return -1;
> > -        }
> > -        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
> > -    }
> > -
> > -    v->shadow_vqs =3D g_steal_pointer(&shadow_vqs);
> >      return 0;
> >  }
> >
> > @@ -580,10 +581,6 @@ static void vhost_vdpa_svq_cleanup(struct vhost_de=
v *dev)
> >      struct vhost_vdpa *v =3D dev->opaque;
> >      size_t idx;
> >
> > -    if (!v->shadow_vqs) {
> > -        return;
> > -    }
> > -
> >      for (idx =3D 0; idx < v->shadow_vqs->len; ++idx) {
> >          vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, idx));
> >      }
> > --
> > 2.31.1
>


