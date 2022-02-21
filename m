Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF66B4BD77E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 09:20:15 +0100 (CET)
Received: from localhost ([::1]:39574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM3va-0002d9-Ae
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 03:20:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nM3s0-0001Bv-23
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 03:16:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nM3rx-0005oR-6k
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 03:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645431383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gdHoVG7g/FZMwk6OlbudwShks24D2mPDWz+vGHa4Oq4=;
 b=Q8PxbmXUoStSmaEyQf0YzObN9khuDIw7ZBETnaKOpj0NyNL2upfNNB9xu7/CT87zz8N+pO
 8/AdNdoFlPNSEGO0fmyGSBY0huFBroxJkRO27bZslDm5YZCAR1CmjvOexSJNP3eLzUtKuk
 oS1Y/tQIqtpcjl+jmjI+jArcga3Vqws=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-_V3CaftUN5COLGVjnyX4JQ-1; Mon, 21 Feb 2022 03:16:22 -0500
X-MC-Unique: _V3CaftUN5COLGVjnyX4JQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 kl13-20020a056214518d00b0042cb237f86bso16503872qvb.0
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 00:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gdHoVG7g/FZMwk6OlbudwShks24D2mPDWz+vGHa4Oq4=;
 b=bb4x6kSC8isJ2yyKJGUhDBP54Qs85srENwLORomRJs7kabgG8alTTS7vvuRBlbQKJ5
 O7E9Y532DJBLHpw2d8N05eluMI9vXjHhlSg4xIDyDCyuP+UAL6C3b8w3OkiVq23hz5cQ
 bUI8/pLd44U+3gpALpv2uUd8YTJXHG4QwyWOR04hUNwrBLf1gprqhB0WWhLTxmt5JWYn
 kiGMpNSDxBpFABRy0bfLMCQLlB3lbfDqYcfXAZQPqofgvueK+G1Q6DEWWZ5xBIdCzFhC
 E0vqXIkFp1BfplfjtpMSqhbYoU7ETC7a1YpeP3sHReDXgrWvd9zWQfInNr0+AJmczr2V
 9p2A==
X-Gm-Message-State: AOAM5332QSEIfk38Ec0vib5vdmY8SRaE6WZqd6cJTjoq59IKL/a64eKM
 RKVX2gKUp2nm2oTADD/45nQhfGASGFXesuBL5AqpujWH4CQMUGb5zs77SxV6bgdH0V0Nv/XPa9w
 L/wLNxCWyw2CNNR2np4ntUg01PnlQXXE=
X-Received: by 2002:a05:6214:5293:b0:42c:f749:971d with SMTP id
 kj19-20020a056214529300b0042cf749971dmr14059262qvb.119.1645431381999; 
 Mon, 21 Feb 2022 00:16:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygR2VrML67Dh8UOwWrsg6k1E5VwVHNg6cEkPYR+ke1IAvv+JokKeu+7X3ZByGhHXiB+UEmY1vJDAOCrLVMqqE=
X-Received: by 2002:a05:6214:5293:b0:42c:f749:971d with SMTP id
 kj19-20020a056214529300b0042cf749971dmr14059248qvb.119.1645431381806; Mon, 21
 Feb 2022 00:16:21 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-19-eperezma@redhat.com>
 <62e877ca-51d7-da85-13c9-d469a85f33c9@redhat.com>
 <CAJaqyWfF01k3LntM7RLEmFcej=EY2d4+2MARKXPptQ2J7VnB9A@mail.gmail.com>
 <7c52e50a-4c8e-7865-1c3d-8b156986c13a@redhat.com>
 <CAJaqyWedqtzRW=ur7upchneSc-oOkvkr3FUph_BfphV3zTmnkw@mail.gmail.com>
 <7e72def5-a1e9-ad92-2c83-fda72ffd7b60@redhat.com>
In-Reply-To: <7e72def5-a1e9-ad92-2c83-fda72ffd7b60@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 21 Feb 2022 09:15:45 +0100
Message-ID: <CAJaqyWcHhMpjJ4kde1ejV5c_vP7_8PvfXpi5u9rdWuaORFt_zg@mail.gmail.com>
Subject: Re: [PATCH 18/31] vhost: Shadow virtqueue buffers forwarding
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Feb 21, 2022 at 8:44 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/17 =E4=B8=8B=E5=8D=888:48, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > On Tue, Feb 8, 2022 at 9:16 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2022/2/1 =E4=B8=8B=E5=8D=887:25, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> >>> On Sun, Jan 30, 2022 at 7:47 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> >>>> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> >>>>> @@ -272,6 +590,28 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirt=
queue *svq, int svq_kick_fd)
> >>>>>     void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >>>>>     {
> >>>>>         event_notifier_set_handler(&svq->svq_kick, NULL);
> >>>>> +    g_autofree VirtQueueElement *next_avail_elem =3D NULL;
> >>>>> +
> >>>>> +    if (!svq->vq) {
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>> +    /* Send all pending used descriptors to guest */
> >>>>> +    vhost_svq_flush(svq, false);
> >>>> Do we need to wait for all the pending descriptors to be completed h=
ere?
> >>>>
> >>> No, this function does not wait, it only completes the forwarding of
> >>> the *used* descriptors.
> >>>
> >>> The best example is the net rx queue in my opinion. This call will
> >>> check SVQ's vring used_idx and will forward the last used descriptors
> >>> if any, but all available descriptors will remain as available for
> >>> qemu's VQ code.
> >>>
> >>> To skip it would miss those last rx descriptors in migration.
> >>>
> >>> Thanks!
> >>
> >> So it's probably to not the best place to ask. It's more about the
> >> inflight descriptors so it should be TX instead of RX.
> >>
> >> I can imagine the migration last phase, we should stop the vhost-vDPA
> >> before calling vhost_svq_stop(). Then we should be fine regardless of
> >> inflight descriptors.
> >>
> > I think I'm still missing something here.
> >
> > To be on the same page. Regarding tx this could cause repeated tx
> > frames (one at source and other at destination), but never a missed
> > buffer not transmitted. The "stop before" could be interpreted as "SVQ
> > is not forwarding available buffers anymore". Would that work?
>
>
> Right, but this only work if
>
> 1) a flush to make sure TX DMA for inflight descriptors are all completed
>
> 2) just mark all inflight descriptor used
>

It currently trusts on the reverse: Buffers not marked as used (by the
device) will be available in the destination, so expect
retransmissions.

Thanks!

> Otherwise there could be buffers that is inflight forever.
>
> Thanks
>
>
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>
> >>>> Thanks
> >>>>
> >>>>
> >>>>> +
> >>>>> +    for (unsigned i =3D 0; i < svq->vring.num; ++i) {
> >>>>> +        g_autofree VirtQueueElement *elem =3D NULL;
> >>>>> +        elem =3D g_steal_pointer(&svq->ring_id_maps[i]);
> >>>>> +        if (elem) {
> >>>>> +            virtqueue_detach_element(svq->vq, elem, elem->len);
> >>>>> +        }
> >>>>> +    }
> >>>>> +
> >>>>> +    next_avail_elem =3D g_steal_pointer(&svq->next_guest_avail_ele=
m);
> >>>>> +    if (next_avail_elem) {
> >>>>> +        virtqueue_detach_element(svq->vq, next_avail_elem,
> >>>>> +                                 next_avail_elem->len);
> >>>>> +    }
> >>>>>     }
>


