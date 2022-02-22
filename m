Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03124BF43A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 09:59:51 +0100 (CET)
Received: from localhost ([::1]:34570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMR1S-00035v-OJ
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 03:59:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nMQyH-0001iN-5U
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:56:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nMQyC-0000Ob-7S
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 03:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645520187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0mq8j7RFhPIupeQSsnbCsNlndFqRahoUWQfMIy+h5E=;
 b=TGFywp2mGfr7mnF3UBcA+n/IRWS+Anoj6YN6CnJbFG1KcZxugrWvO6T0YBJNq/WsA851mq
 IsWp+qv4rjnraGUsQYktAG2TyKcLHkkF/WM90qUJ+mpW7ue8UNMwyB329TI7cMJzmzdgKb
 B/fjYQoC6fjcTR1o2HSkb2wamlfhV08=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-jTnUwLmQO4qqQrz_n2_QTw-1; Tue, 22 Feb 2022 03:56:26 -0500
X-MC-Unique: jTnUwLmQO4qqQrz_n2_QTw-1
Received: by mail-qk1-f197.google.com with SMTP id
 2-20020a370a02000000b0060df1ac78baso13106723qkk.20
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 00:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y0mq8j7RFhPIupeQSsnbCsNlndFqRahoUWQfMIy+h5E=;
 b=XFFpA40iRVmohD6/HIYf+FFHynOeqm80ont6FQdLsyCf8az1IK47/uNeQ+E5DiemEp
 Nq15UxwUDneKVu3ZSqBHPO1gd0Q58xIpyj+b4iYU+S9LeAjO+rBKPKdvOYtM2Z0urrDy
 TBY2GdZ5xUdJIo8+ocB74PP7trwbs4EYxFScWcCBidqVpM1XumD71EUTcOdhoPemSa6O
 DPUwpqhM/EMttUl4ipiQIhK54wy73CNySxbeZzpamNZRtsvDhOk1fIqBZj08GDDsPFYe
 p3+fJrr6yZttWcRHelak9A4jFyVi4H5GOU75heAP7vdGbKmGlFIp0BUu165yhEk0pKdE
 jLoQ==
X-Gm-Message-State: AOAM533CJUQd35tofL3WTzZKjpW7vo7GHQ/bDFQU2//owxjsACrk7hoB
 Ytz9UwR1iUznktOOkPejAYOgiePyiWUm5nTYx1rVlE72XhS6d9rpPDsGbuH9U5xnNMS5t4ysxxN
 uPP4hFWo9QKwCQro3TpXu+cl7idv2oAI=
X-Received: by 2002:a0c:e98d:0:b0:42c:fcfa:610d with SMTP id
 z13-20020a0ce98d000000b0042cfcfa610dmr18209464qvn.91.1645520185893; 
 Tue, 22 Feb 2022 00:56:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEXPIjxRHdHg0pb5KX/E0o6gMJqO4MYd/Gz9nhZlMN/HmGuKkQdx+5NttTKBTNTJFWo17j8U8vJmeqh466lTE=
X-Received: by 2002:a0c:e98d:0:b0:42c:fcfa:610d with SMTP id
 z13-20020a0ce98d000000b0042cfcfa610dmr18209449qvn.91.1645520185616; Tue, 22
 Feb 2022 00:56:25 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-19-eperezma@redhat.com>
 <62e877ca-51d7-da85-13c9-d469a85f33c9@redhat.com>
 <CAJaqyWfF01k3LntM7RLEmFcej=EY2d4+2MARKXPptQ2J7VnB9A@mail.gmail.com>
 <7c52e50a-4c8e-7865-1c3d-8b156986c13a@redhat.com>
 <CAJaqyWedqtzRW=ur7upchneSc-oOkvkr3FUph_BfphV3zTmnkw@mail.gmail.com>
 <7e72def5-a1e9-ad92-2c83-fda72ffd7b60@redhat.com>
 <CAJaqyWcHhMpjJ4kde1ejV5c_vP7_8PvfXpi5u9rdWuaORFt_zg@mail.gmail.com>
 <24717b73-7aca-dd75-22d4-2b8d9e6bd737@redhat.com>
In-Reply-To: <24717b73-7aca-dd75-22d4-2b8d9e6bd737@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 22 Feb 2022 09:55:49 +0100
Message-ID: <CAJaqyWePWg+eeQjjcMh24k0K+yUQUF2x0yXH32tPPWEw_wYP0Q@mail.gmail.com>
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

On Tue, Feb 22, 2022 at 8:26 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/21 =E4=B8=8B=E5=8D=884:15, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > On Mon, Feb 21, 2022 at 8:44 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2022/2/17 =E4=B8=8B=E5=8D=888:48, Eugenio Perez Martin =E5=
=86=99=E9=81=93:
> >>> On Tue, Feb 8, 2022 at 9:16 AM Jason Wang <jasowang@redhat.com> wrote=
:
> >>>> =E5=9C=A8 2022/2/1 =E4=B8=8B=E5=8D=887:25, Eugenio Perez Martin =E5=
=86=99=E9=81=93:
> >>>>> On Sun, Jan 30, 2022 at 7:47 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> >>>>>> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> >>>>>>> @@ -272,6 +590,28 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVi=
rtqueue *svq, int svq_kick_fd)
> >>>>>>>      void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >>>>>>>      {
> >>>>>>>          event_notifier_set_handler(&svq->svq_kick, NULL);
> >>>>>>> +    g_autofree VirtQueueElement *next_avail_elem =3D NULL;
> >>>>>>> +
> >>>>>>> +    if (!svq->vq) {
> >>>>>>> +        return;
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    /* Send all pending used descriptors to guest */
> >>>>>>> +    vhost_svq_flush(svq, false);
> >>>>>> Do we need to wait for all the pending descriptors to be completed=
 here?
> >>>>>>
> >>>>> No, this function does not wait, it only completes the forwarding o=
f
> >>>>> the *used* descriptors.
> >>>>>
> >>>>> The best example is the net rx queue in my opinion. This call will
> >>>>> check SVQ's vring used_idx and will forward the last used descripto=
rs
> >>>>> if any, but all available descriptors will remain as available for
> >>>>> qemu's VQ code.
> >>>>>
> >>>>> To skip it would miss those last rx descriptors in migration.
> >>>>>
> >>>>> Thanks!
> >>>> So it's probably to not the best place to ask. It's more about the
> >>>> inflight descriptors so it should be TX instead of RX.
> >>>>
> >>>> I can imagine the migration last phase, we should stop the vhost-vDP=
A
> >>>> before calling vhost_svq_stop(). Then we should be fine regardless o=
f
> >>>> inflight descriptors.
> >>>>
> >>> I think I'm still missing something here.
> >>>
> >>> To be on the same page. Regarding tx this could cause repeated tx
> >>> frames (one at source and other at destination), but never a missed
> >>> buffer not transmitted. The "stop before" could be interpreted as "SV=
Q
> >>> is not forwarding available buffers anymore". Would that work?
> >>
> >> Right, but this only work if
> >>
> >> 1) a flush to make sure TX DMA for inflight descriptors are all comple=
ted
> >>
> >> 2) just mark all inflight descriptor used
> >>
> > It currently trusts on the reverse: Buffers not marked as used (by the
> > device) will be available in the destination, so expect
> > retransmissions.
>
>
> I may miss something but I think we do migrate last_avail_idx. So there
> won't be a re-transmission, since we depend on qemu virtqueue code to
> deal with vring base?
>

On stop, vhost_virtqueue_stop calls vhost_vdpa_get_vring_base. In SVQ
mode, it returns last_used_idx. After that, vhost.c code set VirtQueue
last_avail_idx =3D=3D last_used_idx, and it's migrated after that if I'm
not wrong.

vhost kernel migrates last_avail_idx, but it makes rx buffers
available on-demand, unlike SVQ. So it does not need to unwind buffers
or anything like that. Because of how SVQ works with the rx queue,
this is not possible, since the destination will find no available
buffers for rx. And for tx you already have described the scenario.

In other words, we cannot see SVQ as a vhost device in that regard:
SVQ looks for total drain (as "make all guest's buffers available for
the device ASAP") vs the vhost device which can live with a lot of
available ones and it will use them on demand. Same problem as
masking. So the difference in behavior is justified in my opinion, and
it can be improved in the future with the vdpa in-flight descriptors.

If we restore the state that way in a virtio-net device, it will see
the available ones as expected, not as in-flight.

Another possibility is to transform all of these into in-flight ones,
but I feel it would create problems. Can we migrate all rx queues as
in-flight, with 0 bytes written? Is it worth it? I didn't investigate
that path too much, but I think the virtio-net emulated device does
not support that at the moment. If I'm not wrong, we should copy
something like the body of virtio_blk_load_device if we want to go
that route.

The current approach might be too net-centric, so let me know if this
behavior is unexpected or we can do better otherwise.

Thanks!

> Thanks
>
>
> >
> > Thanks!
> >
> >> Otherwise there could be buffers that is inflight forever.
> >>
> >> Thanks
> >>
> >>
> >>> Thanks!
> >>>
> >>>> Thanks
> >>>>
> >>>>
> >>>>>> Thanks
> >>>>>>
> >>>>>>
> >>>>>>> +
> >>>>>>> +    for (unsigned i =3D 0; i < svq->vring.num; ++i) {
> >>>>>>> +        g_autofree VirtQueueElement *elem =3D NULL;
> >>>>>>> +        elem =3D g_steal_pointer(&svq->ring_id_maps[i]);
> >>>>>>> +        if (elem) {
> >>>>>>> +            virtqueue_detach_element(svq->vq, elem, elem->len);
> >>>>>>> +        }
> >>>>>>> +    }
> >>>>>>> +
> >>>>>>> +    next_avail_elem =3D g_steal_pointer(&svq->next_guest_avail_e=
lem);
> >>>>>>> +    if (next_avail_elem) {
> >>>>>>> +        virtqueue_detach_element(svq->vq, next_avail_elem,
> >>>>>>> +                                 next_avail_elem->len);
> >>>>>>> +    }
> >>>>>>>      }
>


