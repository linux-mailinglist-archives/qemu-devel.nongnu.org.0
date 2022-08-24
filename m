Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B6159F5D3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:01:40 +0200 (CEST)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmGZ-0003SA-Al
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQm7f-0003SG-LE
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQm7W-0002hp-Oj
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661331137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8hTteaqYw9pPyFiJ/xWum3HOoFLBYx+zlZfXhUuxSg=;
 b=WgP7My4+yHVBSgSF6qCFEHmup7HIj16wUp0ihVgSBuAhuEpOviH8D1l+6IZvOL97BUbFVz
 MiZc9gnWq7yTd/cqCFP4dS7yjpD/iFwyoa+3+UtvWPtTI5YtrlNjydc53CLApEf6wEF2z3
 XUU9EcHZB1bM9noAUiZ1bjppV5mrF2A=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-jk-1pBjeO2avwIjWV6MciQ-1; Wed, 24 Aug 2022 04:52:15 -0400
X-MC-Unique: jk-1pBjeO2avwIjWV6MciQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 b16-20020a056512305000b0048aec76a1ccso5140369lfb.18
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 01:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=o8hTteaqYw9pPyFiJ/xWum3HOoFLBYx+zlZfXhUuxSg=;
 b=VSYobqRjQjjVpe4DRQ9/1p9Rhiwa4Y6sneA5FLx8Kc0ILImZrGXxdCCP9Mg8uwvORf
 JQ7QRoCsU31qt/8Uel1y/KWC+SrNiBndHJJGQhDscuIB2HjP7VpxuJXx74gMBtgcWW41
 oxh/30YtBFOd3gSIHnsoCsM8unAmnVNnUu8T+fdwlteZZr3960mldFvLX36FeTKMwjKg
 IepeXGtZ5M7bNzRtLfzuBvnf9mDXPhUBaQNjYdCGXWLhXYAusjP2SDNQ9A6ZYqEBbg5v
 n036vSDvCEntfLuv1rSArP3kBlIjLLl/0r0hBnBA+miUCVkcZ3SlNW6ijYwEOU07GJQs
 rnlQ==
X-Gm-Message-State: ACgBeo00Zadb9ai2gPTCS4zN4npCOlxV4DHefC1kLARQUC++4wO5OAgU
 MDbptJot/g5c6SLn8vMArvIJp7Qi9hFStbfENOi4uGYx1KOGjZYYdO71LKd0LISJpdb2ubMQOAX
 RYhoy/LWZg+TZT5Up5UZI5Ve+xf0wb6w=
X-Received: by 2002:a2e:a80b:0:b0:261:c107:8823 with SMTP id
 l11-20020a2ea80b000000b00261c1078823mr6211855ljq.323.1661331133449; 
 Wed, 24 Aug 2022 01:52:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Rn2T9cqWaCHpOgMldU8ToanqiTmIpNqs4Uwmko/agybtftgna1aycYFvj++I+g3jPkl9ujyU7Ja5zbPVr6t4=
X-Received: by 2002:a2e:a80b:0:b0:261:c107:8823 with SMTP id
 l11-20020a2ea80b000000b00261c1078823mr6211838ljq.323.1661331133189; Wed, 24
 Aug 2022 01:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-3-eperezma@redhat.com>
 <f517a073-fd73-0220-072c-ea054b643468@redhat.com>
 <CAJaqyWcGH-kAVw-yZ2CX-GuPYt1zL8FFJnjmWMcbi4r1NgyfcA@mail.gmail.com>
In-Reply-To: <CAJaqyWcGH-kAVw-yZ2CX-GuPYt1zL8FFJnjmWMcbi4r1NgyfcA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 24 Aug 2022 16:52:02 +0800
Message-ID: <CACGkMEuNTBPSh2x6LVihCE=fg1zYAsnG4io2MBT32+PF9=omwQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] vdpa: Add vhost_vdpa_net_load_mq
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Aug 24, 2022 at 3:47 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Aug 24, 2022 at 6:23 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/8/20 01:13, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > Same way as with the MAC, restore the expected number of queues at
> > > device's start.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >   net/vhost-vdpa.c | 33 +++++++++++++++++++++++++++++++++
> > >   1 file changed, 33 insertions(+)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 1e0dbfcced..96fd3bc835 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -391,6 +391,35 @@ static int vhost_vdpa_net_load_mac(VhostVDPAStat=
e *s,
> > >       return 0;
> > >   }
> > >
> > > +static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
> > > +                                  const VirtIONet *n)
> > > +{
> > > +    uint64_t features =3D n->parent_obj.guest_features;
> > > +    ssize_t dev_written;
> > > +    void *cursor =3D s->cvq_cmd_out_buffer;
> > > +    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    *(struct virtio_net_ctrl_hdr *)cursor =3D (struct virtio_net_ctr=
l_hdr) {
> > > +        .class =3D VIRTIO_NET_CTRL_MQ,
> > > +        .cmd =3D VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET,
> > > +    };
> > > +    cursor +=3D sizeof(struct virtio_net_ctrl_hdr);
> > > +    *(struct virtio_net_ctrl_mq *)cursor =3D (struct virtio_net_ctrl=
_mq) {
> > > +        .virtqueue_pairs =3D cpu_to_le16(n->curr_queue_pairs),
> > > +    };
> >
> >
> > Such casting is not elegant, let's just prepare buffer and then do the
> > copy inside vhost_vdpa_net_cvq_add()?
> >
>
> I'm not sure what you propose here. I can pre-fill a buffer in the
> stack and then do an extra copy in vhost_vdpa_net_cvq_add. The
> compiler should be able to optimize it, but I'm not sure if it
> simplifies the code.
>
> We can have a dedicated buffer for mac, another for mq, and one for
> each different command, and map all of them at the device's start. But
> this seems too much overhead to me.

Considering we may need to support and restore a lot of other fields,
this looks a little complicated.

I meant the caller can simply do:

struct virtio_net_ctrl_mq mq =3D { ...};

Then we do

vhost_vdpa_net_cvq_add(&mq, sizeof(mq), ...);

Then we can do memcpy inside vhost_vdpa_net_cvq_add() and hide the
cmd_out_buffer etc from the caller.

>
> Some alternatives that come to my mind:
>
> * Declare a struct with both virtio_net_ctrl_hdr and each of the
> control commands (using unions?), and cast s->cvq_cmd_out_buffer
> accordingly.
> * Declare a struct with all of the supported commands one after
> another, and let qemu fill and send these accordingly.
>
> >
> > > +    cursor +=3D sizeof(struct virtio_net_ctrl_mq);
> > > +
> > > +    dev_written =3D vhost_vdpa_net_cvq_add(s, cursor - s->cvq_cmd_ou=
t_buffer,
> > > +                                             sizeof(virtio_net_ctrl_=
ack));
> > > +    if (unlikely(dev_written < 0)) {
> > > +        return dev_written;
> > > +    }
> > > +
> > > +    return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) !=3D VIRTI=
O_NET_OK;
> >
> >
> > So I think we should have a dedicated buffer just for ack, then there's
> > no need for such casting.
> >
>
> You mean to declare cvq_cmd_in_buffer as virtio_net_ctrl_ack type
> directly and map it to the device?

Kind of, considering the ack is the only kind of structure in the near
future, can we simply use the structure virtio_net_ctl_ack?

Thanks

>
> Thanks!
>


