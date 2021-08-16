Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B0B3ECE19
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 07:37:38 +0200 (CEST)
Received: from localhost ([::1]:36582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFVJY-0007gM-Qx
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 01:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mFVIh-00072K-40
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 01:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mFVId-00059n-Hk
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 01:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629092197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNwGhoDE7EVqMFhiX1rVhSfQTBD//vpwPljwAf+xdHI=;
 b=aX/5/kCJYyEpLvJADTEsywD25M/QkUodYnV38VpDCytbWkARTy68t1DHmG0tqfq/lOU98a
 TP8cSge3xOidfcrgTlChU3cgjBaHIlozJJd5dAWpDeOiev2jdFGSHYeoe1Z5UD9occFlb7
 KMYUzsf122j3vFCjhwOVRE7Mew2/+7E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-l6KCPWeKNgGJ08odZtTvZA-1; Mon, 16 Aug 2021 01:36:36 -0400
X-MC-Unique: l6KCPWeKNgGJ08odZtTvZA-1
Received: by mail-wr1-f70.google.com with SMTP id
 n18-20020adfe792000000b00156ae576abdso1358701wrm.9
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 22:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BNwGhoDE7EVqMFhiX1rVhSfQTBD//vpwPljwAf+xdHI=;
 b=RIGomZ86YWh0+Fp1O1hDvkEHZmQx5yVlCScBUxaOczhldbuzPD5+eqWQmnabeDbe/Z
 YCJeRulVvRbkeVQ/PzM4UlNBOFVQftPrnT1l8aET22x083fI+tax3Ur9Ba5qpmN0cy9Y
 xPPBZzJQCrSvtcx5xGGlkmmcfbsRhan5toVy1vQAvPd3F/NqqLWKqp9KdF0zD0FaJkTC
 htZNhIeR9f45sAjZMafl48Zg2NqsSzWRCzeWrXMMsnFS3Cz8OQPl6uUDAnyqgnf1E7wW
 JQsFMS/AFw0I/4QuJjQBQcQ8nekvis48R/4m5XP36f8iauAfN5d+0CX0TflJEXKsCuv3
 OKHQ==
X-Gm-Message-State: AOAM531oCydY8O+9xBi1mrb5/KNuaQBVY9RemSmeBCZcHJZeCOl3XFvU
 lPCJnrznZ74Iz9TihBprBU6qh4y1V47qrlaj0pxkZcOUrwaGZf03gbBRd6gAnTWV2RAsV/Yf+VW
 FELDy3deZO3Fmyh8=
X-Received: by 2002:a5d:6e12:: with SMTP id h18mr16382305wrz.236.1629092195246; 
 Sun, 15 Aug 2021 22:36:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWqeoMPYr3pN1b3jtt4bo1lqfv/l+yufdr64ytqXINik2LHaBnOWPHVWmFz6G6Vs5cTcNLmg==
X-Received: by 2002:a5d:6e12:: with SMTP id h18mr16382285wrz.236.1629092195052; 
 Sun, 15 Aug 2021 22:36:35 -0700 (PDT)
Received: from redhat.com ([2.55.8.239])
 by smtp.gmail.com with ESMTPSA id i8sm7239480wrv.70.2021.08.15.22.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 22:36:33 -0700 (PDT)
Date: Mon, 16 Aug 2021 01:36:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v3] vhost-vdpa: Do not send empty IOTLB update batches
Message-ID: <20210816013610-mutt-send-email-mst@kernel.org>
References: <20210812140933.226288-1-eperezma@redhat.com>
 <CACGkMEsqs28TAFb6ZnXM5XQwFmjqzj2LkR1fQZXVhs=13AGKsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsqs28TAFb6ZnXM5XQwFmjqzj2LkR1fQZXVhs=13AGKsQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Eli Cohen <elic@nvidia.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 10:51:57AM +0800, Jason Wang wrote:
> On Thu, Aug 12, 2021 at 10:09 PM Eugenio Pérez <eperezma@redhat.com> wrote:
> >
> > With the introduction of the batch hinting, meaningless batches can be
> > created with no IOTLB updates if the memory region was skipped by
> > vhost_vdpa_listener_skipped_section. This is the case of host notifiers
> > memory regions, device un/realize, and others. This causes the vdpa
> > device to receive dma mapping settings with no changes, a possibly
> > expensive operation for nothing.
> >
> > To avoid that, VHOST_IOTLB_BATCH_BEGIN hint is delayed until we have a
> > meaningful (not skipped section) mapping or unmapping operation, and
> > VHOST_IOTLB_BATCH_END is not written unless at least one of _UPDATE /
> > _INVALIDATE has been issued.
> 
> Acked-by: Jason Wang <jasowang@redhat.com>


Oops. You missed by pull request by a hairwidth.
> >
> > v3:
> >   * Use a bool instead of a counter avoiding potential number wrapping
> >   * Fix bad check on _commit
> >   * Move VHOST_BACKEND_F_IOTLB_BATCH check to
> >     vhost_vdpa_iotlb_batch_begin_once
> >
> > v2 (from RFC):
> >   * Rename misleading name
> >   * Abstract start batching function for listener_add/del
> >
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/vhost-vdpa.h |  1 +
> >  hw/virtio/vhost-vdpa.c         | 35 ++++++++++++++++++++++------------
> >  2 files changed, 24 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> > index e98e327f12..6b9288fef8 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -23,6 +23,7 @@ typedef struct vhost_vdpa {
> >      int device_fd;
> >      int index;
> >      uint32_t msg_type;
> > +    bool iotlb_batch_begin_sent;
> >      MemoryListener listener;
> >      struct vhost_dev *dev;
> >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 6ce94a1f4d..93b7db61d1 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -89,19 +89,13 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
> >      return ret;
> >  }
> >
> > -static void vhost_vdpa_listener_begin(MemoryListener *listener)
> > +static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
> >  {
> > -    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
> > -    struct vhost_dev *dev = v->dev;
> > -    struct vhost_msg_v2 msg = {};
> >      int fd = v->device_fd;
> > -
> > -    if (!(dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH))) {
> > -        return;
> > -    }
> > -
> > -    msg.type = v->msg_type;
> > -    msg.iotlb.type = VHOST_IOTLB_BATCH_BEGIN;
> > +    struct vhost_msg_v2 msg = {
> > +        .type = v->msg_type,
> > +        .iotlb.type = VHOST_IOTLB_BATCH_BEGIN,
> > +    };
> >
> >      if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
> >          error_report("failed to write, fd=%d, errno=%d (%s)",
> > @@ -109,6 +103,16 @@ static void vhost_vdpa_listener_begin(MemoryListener *listener)
> >      }
> >  }
> >
> > +static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v)
> > +{
> > +    if (v->dev->backend_cap & (0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH) &&
> > +        !v->iotlb_batch_begin_sent) {
> > +        vhost_vdpa_listener_begin_batch(v);
> > +    }
> > +
> > +    v->iotlb_batch_begin_sent = true;
> > +}
> > +
> >  static void vhost_vdpa_listener_commit(MemoryListener *listener)
> >  {
> >      struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
> > @@ -120,6 +124,10 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
> >          return;
> >      }
> >
> > +    if (!v->iotlb_batch_begin_sent) {
> > +        return;
> > +    }
> > +
> >      msg.type = v->msg_type;
> >      msg.iotlb.type = VHOST_IOTLB_BATCH_END;
> >
> > @@ -127,6 +135,8 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
> >          error_report("failed to write, fd=%d, errno=%d (%s)",
> >                       fd, errno, strerror(errno));
> >      }
> > +
> > +    v->iotlb_batch_begin_sent = false;
> >  }
> >
> >  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > @@ -170,6 +180,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> >
> >      llsize = int128_sub(llend, int128_make64(iova));
> >
> > +    vhost_vdpa_iotlb_batch_begin_once(v);
> >      ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> >                               vaddr, section->readonly);
> >      if (ret) {
> > @@ -221,6 +232,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
> >
> >      llsize = int128_sub(llend, int128_make64(iova));
> >
> > +    vhost_vdpa_iotlb_batch_begin_once(v);
> >      ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> >      if (ret) {
> >          error_report("vhost_vdpa dma unmap error!");
> > @@ -234,7 +246,6 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
> >   * depends on the addnop().
> >   */
> >  static const MemoryListener vhost_vdpa_memory_listener = {
> > -    .begin = vhost_vdpa_listener_begin,
> >      .commit = vhost_vdpa_listener_commit,
> >      .region_add = vhost_vdpa_listener_region_add,
> >      .region_del = vhost_vdpa_listener_region_del,
> > --
> > 2.27.0
> >


