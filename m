Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED97367FD64
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 08:38:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM2Fq-0007SW-IG; Sun, 29 Jan 2023 02:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pM2Fn-0007Qk-KY
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:37:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pM2Fm-0000Nf-12
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674977849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZUn2S9bbDu7skrvAUaLArh236zA4Xs3VRhDfQ5niWmU=;
 b=Ut/lhwmivXVMqO3jLZ5n/n09RKkg1E1POYhSXC8gk1WA9FODYbpBS8LlaHt7Af1PtqX0vd
 pMfCD5qeDlXVdatscBHtFiKqQBnRhQR0UYxBVWxwvQu41YBw+8Fe4VXUMu/OLyx0kySUef
 PUent6wlmKRNdMxH/jThYuDYRdCNUTQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-303-CJfWdf_QMbeKC5EHFYPZKA-1; Sun, 29 Jan 2023 02:37:27 -0500
X-MC-Unique: CJfWdf_QMbeKC5EHFYPZKA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg25-20020a05600c3c9900b003da1f6a7b2dso7402846wmb.1
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 23:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZUn2S9bbDu7skrvAUaLArh236zA4Xs3VRhDfQ5niWmU=;
 b=EMWzssjD4VDolroQs2OmF78UQn4IgQgLdNr4GzrC3SPTpbKJugz1fPTj8jNwyk/iT6
 w3RmftlXs8tcHlnxk7ER3p9zpS9wix7VzDcP/eTXmKUSHXm7I7wyBsGp7bUfHcaV/V4I
 0fzh3jlL6TyIRe53x2GWZuXc912vs9AGQuSL7fgyZQxrWHrvrf9joeezx8DCzhRIOabq
 hf+m2H3RKfpIiD6f7Jn8+ye/6OYRcYmRGb9QN+g2kIS51KlsppsM59sP33TvT8FR8JSY
 rXnQo06MdyHFud20K/rPqTVX6wQBNDYJPR+XX7uvGobdnJxZQYprmkFIOzHh2Nj4Dfku
 5lQQ==
X-Gm-Message-State: AFqh2krbhMJE7a0uJdCjz+VUxXJp0dGiZJxXhqnsHs9y9Kz9MJc4D/GJ
 rIJS9EYfwgKxiP1aCrJsJsAuQ09bMsrvuKfZz4yRjZFuFlGLAM0SN398MH9HJn1pJLwTBHWdi7k
 53RGEWoFV80OZ05w=
X-Received: by 2002:a05:600c:3583:b0:3d2:2d2a:d581 with SMTP id
 p3-20020a05600c358300b003d22d2ad581mr46507925wmq.30.1674977846199; 
 Sat, 28 Jan 2023 23:37:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu3eyPaGFsYN0P6/hM4C+sbilIHfdgSuU/WAujGUp6Bzb00Z8FHCJh98sWFXRRnddJksq4PQA==
X-Received: by 2002:a05:600c:3583:b0:3d2:2d2a:d581 with SMTP id
 p3-20020a05600c358300b003d22d2ad581mr46507909wmq.30.1674977845890; 
 Sat, 28 Jan 2023 23:37:25 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 k4-20020a5d4284000000b00241fde8fe04sm8531504wrq.7.2023.01.28.23.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 23:37:25 -0800 (PST)
Date: Sun, 29 Jan 2023 02:37:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v1 1/2] virtio: struct VirtQueue introduce reset
Message-ID: <20230129023241-mutt-send-email-mst@kernel.org>
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-2-xuanzhuo@linux.alibaba.com>
 <20230129020903-mutt-send-email-mst@kernel.org>
 <1674976516.577517-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674976516.577517-1-xuanzhuo@linux.alibaba.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Jan 29, 2023 at 03:15:16PM +0800, Xuan Zhuo wrote:
> On Sun, 29 Jan 2023 02:12:36 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > subject seems wrong.
> 
> 
> Will fix.
> 
> 
> >
> > On Sun, Jan 29, 2023 at 10:51:49AM +0800, Xuan Zhuo wrote:
> > > In the current design, we stop the device from operating on the vring
> > > during per-queue reset by resetting the structure VirtQueue.
> > >
> > > But before the reset operation, when recycling some resources, we should
> > > stop referencing new vring resources. For example, when recycling
> > > virtio-net's asynchronous sending resources, virtio-net should be able
> > > to perceive that the current queue is in the per-queue reset state, and
> > > stop sending new packets from the tx queue.
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > ---
> > >  hw/virtio/virtio.c         | 15 +++++++++++++++
> > >  include/hw/virtio/virtio.h |  1 +
> > >  2 files changed, 16 insertions(+)
> > >
> > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > index f35178f5fc..c954f2a2b3 100644
> > > --- a/hw/virtio/virtio.c
> > > +++ b/hw/virtio/virtio.c
> > > @@ -142,6 +142,8 @@ struct VirtQueue
> > >      /* Notification enabled? */
> > >      bool notification;
> > >
> > > +    bool disabled_by_reset;
> > > +
> > >      uint16_t queue_index;
> > >
> > >      unsigned int inuse;
> > > @@ -2079,6 +2081,12 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> > >  {
> > >      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> > >
> > > +    /*
> > > +     * Mark this queue is per-queue reset status. The device should release the
> > > +     * references of the vring, and not refer more new vring item.
> >
> > items
> 
> 
> Will fix.
> 
> >
> > > +     */
> > > +    vdev->vq[queue_index].disabled_by_reset = true;
> > > +
> > >      if (k->queue_reset) {
> > >          k->queue_reset(vdev, queue_index);
> > >      }
> >
> > can we set this after calling queue_reset? For symmetry with enable.
> 
> 
> In fact,  queue_reset() will check it.
> 

when you disable you first set it then disable.
so when we are not 100% ready it's already set.
when you enable you first clear it then enable.
so we are not 100% ready but it's no longer set.
inconsistent.


> >
> > > @@ -2102,11 +2110,18 @@ void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> > >      }
> > >      */
> > >
> > > +    vdev->vq[queue_index].disabled_by_reset = false;
> > > +
> > >      if (k->queue_enable) {
> > >          k->queue_enable(vdev, queue_index);
> > >      }
> > >  }
> > >
> > > +bool virtio_queue_reset_state(VirtQueue *vq)
> > > +{
> > > +    return vq->disabled_by_reset;
> > > +}
> > > +
> > >  void virtio_reset(void *opaque)
> > >  {
> > >      VirtIODevice *vdev = opaque;
> > > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > > index 77c6c55929..00e91af7c4 100644
> > > --- a/include/hw/virtio/virtio.h
> > > +++ b/include/hw/virtio/virtio.h
> > > @@ -319,6 +319,7 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val);
> > >  void virtio_reset(void *opaque);
> > >  void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
> > >  void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
> > > +bool virtio_queue_reset_state(VirtQueue *vq);
> > >  void virtio_update_irq(VirtIODevice *vdev);
> > >  int virtio_set_features(VirtIODevice *vdev, uint64_t val);
> >
> > OK I guess ... what about migration. This state won't be
> > set correctly will it?
> 
> I think it has no effect. After the reset, there is actually no state. We can
> migrate.
> 
> The current variable is only used by ->queue_reset().
> 
> Thanks.
> 

Yea maybe it works for this bug but ... yack. This means the state has
no logic consistency.  It's just there because you found a bug and
wanted to fix it.
An ultra specific
	bool this_weird_state_fuzzer_gets_in_issue_1451;
is hard to maintain, not happy :(


> >
> >
> > >
> > > --
> > > 2.32.0.3.g01195cf9f
> >


