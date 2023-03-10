Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C16B3DC9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 12:31:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paawT-0006ks-Dk; Fri, 10 Mar 2023 06:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1paawR-0006kU-Tx
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:29:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1paawQ-0001jH-2i
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678447781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JTQC0vXSzwM1nbYVW3UtmiCWIgmq5UCoNrVNSQJ8giI=;
 b=TTX/Q9w956ePpNAMLOIBhbD0HazX2bZp/GPU7P8RidHBWtVOy+7qLEXf1bjGLqFoMUZFzz
 B8cwL9xDYhhZL1m5MWdN3bQOY48HU7nArseerXEFJrBFHnOR4DsoOU46cqahL8oi1xOUT8
 /beUjIVKfJ83EUZSxX6AWq2iynu4XZ0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-9dYuZ8EzOyCwuYOcvaypIw-1; Fri, 10 Mar 2023 06:29:39 -0500
X-MC-Unique: 9dYuZ8EzOyCwuYOcvaypIw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so1865421wmr.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 03:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678447778;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JTQC0vXSzwM1nbYVW3UtmiCWIgmq5UCoNrVNSQJ8giI=;
 b=0AFGsfgDhoUAPLMFJiicVjUki786Z9s95yAxvFnAEsHPHOkui1mqHXAe1rxiLYedCk
 D9oAXzgQtSLIHI+WnjOvcboLz8r4MNfNfkwvr5bDqLjM1cYJjT9sr3pW7hd7Sh+crUJ6
 mE0TfrJHFT8twW1HU3uUx2LT6LythW0Zg8MooXpYPU+RjR9xM0sGO/Y89GVYDBG02Aab
 42bqi71rzWFGYApRYLzrYSyTK6XzXQaQgXY16BTs4n+K/jBWC0+FZJg+23ygiulBNfHe
 PDplIU7KvwrjFiMvcL/PzMSbQvX0JWC31+gdb9MivjDILRMRq2Rr+PEyP//HvT9jFG8B
 wN9g==
X-Gm-Message-State: AO0yUKXu3YcsrF3uW2rCbdx9MvycYwN+gSAqa43lMe5qYHVect1s2M8W
 GhDu3fp/1aqmXs8swivmPfAyvNc43p2jkAJLc3k3V9ABbew1sIYDjXRv1rrCYLt7WA5Jrz497hp
 9Ds8dlmYmy7T6sxk=
X-Received: by 2002:adf:ea90:0:b0:2c9:d90c:56c3 with SMTP id
 s16-20020adfea90000000b002c9d90c56c3mr16645404wrm.53.1678447778777; 
 Fri, 10 Mar 2023 03:29:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+5W0Z3/5Mk4RcE4xTfzuDMmfeHMYszmwXdM0Cg+opRK8raSzzN2pceLfTTRaIUMttBnEycRw==
X-Received: by 2002:adf:ea90:0:b0:2c9:d90c:56c3 with SMTP id
 s16-20020adfea90000000b002c9d90c56c3mr16645381wrm.53.1678447778398; 
 Fri, 10 Mar 2023 03:29:38 -0800 (PST)
Received: from redhat.com ([2.52.9.88]) by smtp.gmail.com with ESMTPSA id
 e15-20020a056000120f00b002c5493a17efsm1904617wrx.25.2023.03.10.03.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 03:29:37 -0800 (PST)
Date: Fri, 10 Mar 2023 06:29:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:virtio-ccw" <qemu-s390x@nongnu.org>
Subject: Re: [PATCH] virtio: refresh vring region cache after updating a
 virtqueue size
Message-ID: <20230310062925-mutt-send-email-mst@kernel.org>
References: <20230302101447.4499-1-clopez@suse.de> <875ybajjbx.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875ybajjbx.fsf@redhat.com>
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

On Thu, Mar 09, 2023 at 11:43:46AM +0100, Cornelia Huck wrote:
> On Thu, Mar 02 2023, Carlos López <clopez@suse.de> wrote:
> 
> > When a virtqueue size is changed by the guest via
> > virtio_queue_set_num(), its region cache is not automatically updated.
> > If the size was increased, this could lead to accessing the cache out
> > of bounds. For example, in vring_get_used_event():
> >
> >     static inline uint16_t vring_get_used_event(VirtQueue *vq)
> >     {
> >         return vring_avail_ring(vq, vq->vring.num);
> >     }
> >
> >     static inline uint16_t vring_avail_ring(VirtQueue *vq, int i)
> >     {
> >         VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
> >         hwaddr pa = offsetof(VRingAvail, ring[i]);
> >
> >         if (!caches) {
> >             return 0;
> >         }
> >
> >         return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
> >     }
> >
> > vq->vring.num will be greater than caches->avail.len, which will
> > trigger a failed assertion down the call path of
> > virtio_lduw_phys_cached().
> >
> > Fix this by calling virtio_queue_update_rings() after
> > virtio_queue_set_num() if we are not already calling
> > virtio_queue_set_rings().
> 
> Don't we instead need to call virtio_init_region_cache() to update the
> caches? virtio_queue_set_rings() will calculate avail and used from
> desc, which looks wrong for modern devices.


Carlos?

> >
> > Signed-off-by: Carlos López <clopez@suse.de>
> > ---
> >  hw/s390x/virtio-ccw.c   | 1 +
> >  hw/virtio/virtio-mmio.c | 5 ++---
> >  hw/virtio/virtio-pci.c  | 1 +
> >  3 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> > index e33e5207ab..89891ac58a 100644
> > --- a/hw/s390x/virtio-ccw.c
> > +++ b/hw/s390x/virtio-ccw.c
> > @@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
> >                  return -EINVAL;
> >              }
> >              virtio_queue_set_num(vdev, index, num);
> > +            virtio_queue_update_rings(vdev, index);
> 
> Note that this is the non-legacy path.
> 
> >          } else if (virtio_queue_get_num(vdev, index) > num) {
> >              /* Fail if we don't have a big enough queue. */
> >              return -EINVAL;
> > diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> > index 23ba625eb6..c74822308f 100644
> > --- a/hw/virtio/virtio-mmio.c
> > +++ b/hw/virtio/virtio-mmio.c
> > @@ -350,10 +350,9 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
> >      case VIRTIO_MMIO_QUEUE_NUM:
> >          trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
> >          virtio_queue_set_num(vdev, vdev->queue_sel, value);
> > +        virtio_queue_update_rings(vdev, vdev->queue_sel);
> >  
> > -        if (proxy->legacy) {
> > -            virtio_queue_update_rings(vdev, vdev->queue_sel);
> > -        } else {
> > +        if (!proxy->legacy) {
> >              proxy->vqs[vdev->queue_sel].num = value;
> >          }
> >          break;
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 247325c193..a0a2f2c965 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -1554,6 +1554,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
> >          proxy->vqs[vdev->queue_sel].num = val;
> >          virtio_queue_set_num(vdev, vdev->queue_sel,
> >                               proxy->vqs[vdev->queue_sel].num);
> > +        virtio_queue_update_rings(vdev, vdev->queue_sel);
> >          break;
> >      case VIRTIO_PCI_COMMON_Q_MSIX:
> >          vector = virtio_queue_vector(vdev, vdev->queue_sel);


