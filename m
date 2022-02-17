Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70B24BA081
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:01:03 +0100 (CET)
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKgP7-0003sl-HG
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:01:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nKgEE-0000Hb-2v
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:49:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nKgE4-0001dR-21
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645102174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+lqSgPEksvCdUD/tDN8CZZCT7sTl/Z47HHZioZ9H10=;
 b=YYtT9oXzZctjw1GVK2RWhdVw8XDGZUQ0LdjJphxfxliXIjwAmpI3L7UKZuailJUZpkuiTq
 /TKaqp3ffsqvubC04KCDkz2u66/DN9e2moKaxykyTc3FTZ9SiY8zKDc2PhFx4HIpNylMlE
 lWaVhFPNEKAPSZyeyRBgCcB6SD5OzX4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-t8DRWNjtOImZYXUqt1QbVQ-1; Thu, 17 Feb 2022 07:49:33 -0500
X-MC-Unique: t8DRWNjtOImZYXUqt1QbVQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 t5-20020a056214118500b0042c272ede45so5121325qvv.13
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 04:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a+lqSgPEksvCdUD/tDN8CZZCT7sTl/Z47HHZioZ9H10=;
 b=KPqZb2b1GxP5VAJKHT/3VjBKYnqJ32JkCljrorQ8PhC3Xa+oOpE0NVHysHAxm2C5Kr
 xV3ZcgU28TEO8OY6Nu+iEHCTlDOo/kR3jUDSzh7r8KxGvU9TDEVAEhcUcgMUBIzU/YY/
 ct/mW5f2PeEYd6sfI7ZTFuZSLwyzBp7BqlFNz+i7Hrtm8qcEZCptp+txJThdy2ThC9SG
 3yxiMyN1i0Fx4L8idxIweEZ4SQlC5zdv0AX5BFSLa+Zjvr3i29/fq2ARwksPsCCm4bNI
 PsW871GMEqPUQ2vDh0EcwkhCk+mk3H2Ysfn059Dj2qtrLsagHp0fXwccvWs5Iik2LNje
 SDRQ==
X-Gm-Message-State: AOAM532kLz0e/1X6ItRg9OiV9P6AIngDDa0axFH4AGrw0UvyUuv8gJVh
 KofG9KnW81twqNmo8ZQTFIZpUSSF1Auih3OVYcLg5W1UheGKq3PB9ghMD/1G6bBRkQwiO7HEgfR
 B3GQtfgUpRLarGrNOQU8m36DyPYSbTvY=
X-Received: by 2002:a37:69c6:0:b0:5e9:6a1f:c357 with SMTP id
 e189-20020a3769c6000000b005e96a1fc357mr1416368qkc.632.1645102172998; 
 Thu, 17 Feb 2022 04:49:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNjrOPhbea0CvyXjJkVv9otpsO24dBYm8af7y1esHj7r9wHaKzFZOdgwA9C6026fOP18wPRaLfQJ0tsuLAemI=
X-Received: by 2002:a37:69c6:0:b0:5e9:6a1f:c357 with SMTP id
 e189-20020a3769c6000000b005e96a1fc357mr1416345qkc.632.1645102172772; Thu, 17
 Feb 2022 04:49:32 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-19-eperezma@redhat.com>
 <62e877ca-51d7-da85-13c9-d469a85f33c9@redhat.com>
 <CAJaqyWfF01k3LntM7RLEmFcej=EY2d4+2MARKXPptQ2J7VnB9A@mail.gmail.com>
 <7c52e50a-4c8e-7865-1c3d-8b156986c13a@redhat.com>
In-Reply-To: <7c52e50a-4c8e-7865-1c3d-8b156986c13a@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 17 Feb 2022 13:48:56 +0100
Message-ID: <CAJaqyWedqtzRW=ur7upchneSc-oOkvkr3FUph_BfphV3zTmnkw@mail.gmail.com>
Subject: Re: [PATCH 18/31] vhost: Shadow virtqueue buffers forwarding
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 8, 2022 at 9:16 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/1 =E4=B8=8B=E5=8D=887:25, Eugenio Perez Martin =E5=86=99=
=E9=81=93:
> > On Sun, Jan 30, 2022 at 7:47 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> >>> @@ -272,6 +590,28 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqu=
eue *svq, int svq_kick_fd)
> >>>    void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >>>    {
> >>>        event_notifier_set_handler(&svq->svq_kick, NULL);
> >>> +    g_autofree VirtQueueElement *next_avail_elem =3D NULL;
> >>> +
> >>> +    if (!svq->vq) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    /* Send all pending used descriptors to guest */
> >>> +    vhost_svq_flush(svq, false);
> >>
> >> Do we need to wait for all the pending descriptors to be completed her=
e?
> >>
> > No, this function does not wait, it only completes the forwarding of
> > the *used* descriptors.
> >
> > The best example is the net rx queue in my opinion. This call will
> > check SVQ's vring used_idx and will forward the last used descriptors
> > if any, but all available descriptors will remain as available for
> > qemu's VQ code.
> >
> > To skip it would miss those last rx descriptors in migration.
> >
> > Thanks!
>
>
> So it's probably to not the best place to ask. It's more about the
> inflight descriptors so it should be TX instead of RX.
>
> I can imagine the migration last phase, we should stop the vhost-vDPA
> before calling vhost_svq_stop(). Then we should be fine regardless of
> inflight descriptors.
>

I think I'm still missing something here.

To be on the same page. Regarding tx this could cause repeated tx
frames (one at source and other at destination), but never a missed
buffer not transmitted. The "stop before" could be interpreted as "SVQ
is not forwarding available buffers anymore". Would that work?

Thanks!

> Thanks
>
>
> >
> >> Thanks
> >>
> >>
> >>> +
> >>> +    for (unsigned i =3D 0; i < svq->vring.num; ++i) {
> >>> +        g_autofree VirtQueueElement *elem =3D NULL;
> >>> +        elem =3D g_steal_pointer(&svq->ring_id_maps[i]);
> >>> +        if (elem) {
> >>> +            virtqueue_detach_element(svq->vq, elem, elem->len);
> >>> +        }
> >>> +    }
> >>> +
> >>> +    next_avail_elem =3D g_steal_pointer(&svq->next_guest_avail_elem)=
;
> >>> +    if (next_avail_elem) {
> >>> +        virtqueue_detach_element(svq->vq, next_avail_elem,
> >>> +                                 next_avail_elem->len);
> >>> +    }
> >>>    }
>


