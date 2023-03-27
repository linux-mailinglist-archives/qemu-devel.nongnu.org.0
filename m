Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E036CA4F4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:57:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmO7-00070a-S1; Mon, 27 Mar 2023 08:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pgmO4-00070J-K7
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:55:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pgmO2-00010s-5Z
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679921744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADsJEH7OZjFH3jx0VY8y8j0YlllWKWQn9UaL5ZuDTes=;
 b=Wailoi2IcyIKLVy6EgV6BoHuyGV/gKMlM2Ps37sPRaAXeOjXBf4QaHgtBXQ8rG5f3tiDn1
 sBU6fOgnD/QtxjYTIDTPwwNXD9YAIcafANYdWCPuTK84fNYBziXePRSgSHNTrOl96GH/r1
 4ifYsBZJs9j9Tu27FSfWejpP4clzqh0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-wmSONA2EOnCjzsSAsGQ44g-1; Mon, 27 Mar 2023 08:55:41 -0400
X-MC-Unique: wmSONA2EOnCjzsSAsGQ44g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2D861C09501;
 Mon, 27 Mar 2023 12:55:40 +0000 (UTC)
Received: from localhost (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 866AF202701E;
 Mon, 27 Mar 2023 12:55:40 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Carlos =?utf-8?Q?L=C3=B3pez?= <clopez@suse.de>, qemu-devel@nongnu.org
Cc: Carlos =?utf-8?Q?L=C3=B3pez?= <clopez@suse.de>, "Michael S. Tsirkin"
 <mst@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 "open list:virtio-ccw" <qemu-s390x@nongnu.org>
Subject: Re: [PATCH v2] virtio: refresh vring region cache after updating a
 virtqueue size
In-Reply-To: <20230317002749.27379-1-clopez@suse.de>
Organization: Red Hat GmbH
References: <20230317002749.27379-1-clopez@suse.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 27 Mar 2023 14:55:38 +0200
Message-ID: <87zg7yqrp1.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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

On Fri, Mar 17 2023, Carlos L=C3=B3pez <clopez@suse.de> wrote:

> When a virtqueue size is changed by the guest via
> virtio_queue_set_num(), its region cache is not automatically updated.
> If the size was increased, this could lead to accessing the cache out
> of bounds. For example, in vring_get_used_event():
>
>     static inline uint16_t vring_get_used_event(VirtQueue *vq)
>     {
>         return vring_avail_ring(vq, vq->vring.num);
>     }
>
>     static inline uint16_t vring_avail_ring(VirtQueue *vq, int i)
>     {
>         VRingMemoryRegionCaches *caches =3D vring_get_region_caches(vq);
>         hwaddr pa =3D offsetof(VRingAvail, ring[i]);
>
>         if (!caches) {
>             return 0;
>         }
>
>         return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
>     }
>
> vq->vring.num will be greater than caches->avail.len, which will
> trigger a failed assertion down the call path of
> virtio_lduw_phys_cached().
>
> Fix this by calling virtio_init_region_cache() after
> virtio_queue_set_num() if we are not already calling
> virtio_queue_set_rings(). In the legacy path this is already done by
> virtio_queue_update_rings().
>
> Signed-off-by: Carlos L=C3=B3pez <clopez@suse.de>
> ---
> v2: use virtio_init_region_cache() instead of
> virtio_queue_update_rings() in the path for modern devices.
>
>  hw/s390x/virtio-ccw.c      | 1 +
>  hw/virtio/virtio-mmio.c    | 1 +
>  hw/virtio/virtio-pci.c     | 1 +
>  hw/virtio/virtio.c         | 2 +-
>  include/hw/virtio/virtio.h | 1 +
>  5 files changed, 5 insertions(+), 1 deletion(-)
>

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

We can always do any ccw reshuffling on top.


