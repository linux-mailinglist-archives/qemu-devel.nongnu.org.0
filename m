Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C657458B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 09:11:25 +0200 (CEST)
Received: from localhost ([::1]:35582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBt0O-0006Aq-AR
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 03:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBstl-0002Ht-LN
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 03:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBsti-0005bf-Kv
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 03:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657782269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SyDarh+3Za9QgKmAqn5OvWmLFmMKKt19R+s6u55DlBw=;
 b=HJGiCgXyTTZ3BMIyCP5+NZfNHVazwVba56wsF/i7tsQVFBqKZP+nByAR8SXluAGP0x7U/v
 s0s5+0TNquV8RafRAmVcHZzgo0CEARgndyYs8vVbXxN+iOVc1Q4+WygFZCCW2dSR8XfkWi
 FpzcRUW4PvivlfUQl2DOKtxkd+PMYfM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-cqi8zkFSND--MZI5QnNp1A-1; Thu, 14 Jul 2022 03:04:20 -0400
X-MC-Unique: cqi8zkFSND--MZI5QnNp1A-1
Received: by mail-lf1-f72.google.com with SMTP id
 i3-20020a056512318300b0047f86b47910so410017lfe.14
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 00:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SyDarh+3Za9QgKmAqn5OvWmLFmMKKt19R+s6u55DlBw=;
 b=l+BeBfne6BwgIgumqq95eSo137KcxmRua4inlLDDoTFbYSDjhpE3tjKZjHNwLC5KCW
 /cUVUOouB4ObvGGvgIkLvmVpt3nO/wV6G13TmQEy/3j6CJJphsO3f5/KYifJqDMKgX8c
 +mueRQ96+aLtiZ2DAGRzezTszUppSDtrY1itrmn1a9kvTZN1azTyqdO9tWp8e7dy/6fH
 f7ChCLHGfGKl+sNJjlq1pJsAZ9wSTK3ggv+0DkCKOgT07JaylnUd7soJ+tq4qUsJZLni
 HOGlivc+zxi47u+RDLGpEFOeSFQnQ0JC5fxQK/4LEspDw8kd9qsz1qLRKA16PJtDpfOa
 7R5Q==
X-Gm-Message-State: AJIora+BUiSZadvUW+MgZto0bZQtl8MccD/Yuqjz3UMeZXNKSygnSq1x
 7CHS/gruyIQtsOrxzELM5H/DbWuSR/rh9/lrMPmba+jtRlJr9SrhW5gQAmq0eJhxehg3tG+DCvl
 qNhL57A7xm5Wmoi+Xm3z3D2BFjd3ZpJ4=
X-Received: by 2002:a05:6512:3d8a:b0:489:c93c:5970 with SMTP id
 k10-20020a0565123d8a00b00489c93c5970mr4384720lfv.575.1657782259514; 
 Thu, 14 Jul 2022 00:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tbkucNGMmhemuJ6i5qZo+KSmYMUKVKqffNnI24QQaPfvfoFpE5uH8m4Lwz5bGXCL1NSqpjAz2XkwtSSNgjwrw=
X-Received: by 2002:a05:6512:3d8a:b0:489:c93c:5970 with SMTP id
 k10-20020a0565123d8a00b00489c93c5970mr4384698lfv.575.1657782259252; Thu, 14
 Jul 2022 00:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-21-eperezma@redhat.com>
 <0f40536a-8c51-e546-17e8-bd752313123c@redhat.com>
 <CAJaqyWcKstiF8AXsUUppPsdfXiiuRhDi2-8ynLVLM8ncv=Pc+Q@mail.gmail.com>
 <CAJaqyWeLXXBceQjSa-efsTazOXpub_Wr8LZ6sVyf8JdAdFzcQw@mail.gmail.com>
In-Reply-To: <CAJaqyWeLXXBceQjSa-efsTazOXpub_Wr8LZ6sVyf8JdAdFzcQw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Jul 2022 15:04:08 +0800
Message-ID: <CACGkMEtXJfCp+xGDymiqF-ECpiFbikiv4KHb0qjuyr6SUqqz6w@mail.gmail.com>
Subject: Re: [RFC PATCH v9 20/23] vdpa: Buffer CVQ support on shadow virtqueue
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Jul 14, 2022 at 2:54 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> > > > +static void vhost_vdpa_net_handle_ctrl_used(VhostShadowVirtqueue *svq,
> > > > +                                            void *vq_elem_opaque,
> > > > +                                            uint32_t dev_written)
> > > > +{
> > > > +    g_autoptr(CVQElement) cvq_elem = vq_elem_opaque;
> > > > +    virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
> > > > +    const struct iovec out = {
> > > > +        .iov_base = cvq_elem->out_data,
> > > > +        .iov_len = cvq_elem->out_len,
> > > > +    };
> > > > +    const DMAMap status_map_needle = {
> > > > +        .translated_addr = (hwaddr)(uintptr_t)cvq_elem->in_buf,
> > > > +        .size = sizeof(status),
> > > > +    };
> > > > +    const DMAMap *in_map;
> > > > +    const struct iovec in = {
> > > > +        .iov_base = &status,
> > > > +        .iov_len = sizeof(status),
> > > > +    };
> > > > +    g_autofree VirtQueueElement *guest_elem = NULL;
> > > > +
> > > > +    if (unlikely(dev_written < sizeof(status))) {
> > > > +        error_report("Insufficient written data (%llu)",
> > > > +                     (long long unsigned)dev_written);
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    in_map = vhost_iova_tree_find_iova(svq->iova_tree, &status_map_needle);
> > > > +    if (unlikely(!in_map)) {
> > > > +        error_report("Cannot locate out mapping");
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    switch (cvq_elem->ctrl.class) {
> > > > +    case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> > > > +        break;
> > > > +    default:
> > > > +        error_report("Unexpected ctrl class %u", cvq_elem->ctrl.class);
> > > > +        goto out;
> > > > +    };
> > > > +
> > > > +    memcpy(&status, cvq_elem->in_buf, sizeof(status));
> > > > +    if (status != VIRTIO_NET_OK) {
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    status = VIRTIO_NET_ERR;
> > > > +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
> > >
> > >
> > > I wonder if this is the best choice. It looks to me it might be better
> > > to extend the virtio_net_handle_ctrl_iov() logic:
> > >
> > > virtio_net_handle_ctrl_iov() {
> > >      if (svq enabled) {
> > >           host_elem = iov_copy(guest_elem);
> > >           vhost_svq_add(host_elem);
> > >           vhost_svq_poll(host_elem);
> > >      }
> > >      // usersapce ctrl vq logic
> > > }
> > >
> > >
> > > This can help to avoid coupling too much logic in cvq (like the
> > > avail,used and detach ops).
> > >
> >
> > Let me try that way and I'll come back to you.
> >
>
> The problem with that approach is that virtio_net_handle_ctrl_iov is
> called from the SVQ used handler. How could we call it otherwise? I
> find it pretty hard to do unless we return SVQ to the model where we
> used VirtQueue.handle_output, discarded long ago.

I'm not sure I get this. Can we simply let the cvq to be trapped as
the current userspace datapath did?

Thanks

>
> I'm about to send a new version, but I still need to call
> virtio_net_handle_ctrl_iov from the avail handler. The handlers used
> and discard are removed at least.
>
> Thanks!
>


