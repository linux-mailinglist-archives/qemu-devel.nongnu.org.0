Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309086BA8C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 12:49:06 +0200 (CEST)
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnhUf-0005yc-8s
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 06:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59931)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hnhUO-0005WF-B1
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 06:48:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hnhUM-0001My-AA
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 06:48:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55340)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>)
 id 1hnhUI-0001Hr-UW; Wed, 17 Jul 2019 06:48:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1F34A3092651;
 Wed, 17 Jul 2019 10:48:40 +0000 (UTC)
Received: from redhat.com (ovpn-120-247.rdu2.redhat.com [10.10.120.247])
 by smtp.corp.redhat.com (Postfix) with SMTP id CA6EC611DC;
 Wed, 17 Jul 2019 10:48:29 +0000 (UTC)
Date: Wed, 17 Jul 2019 06:48:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190717063902-mutt-send-email-mst@kernel.org>
References: <20190717103550.24657-1-david@redhat.com>
 <20190717103550.24657-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717103550.24657-4-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 17 Jul 2019 10:48:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.1 v2 3/3] virtio-balloon: reset pbp
 on device resets
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 17, 2019 at 12:35:50PM +0200, David Hildenbrand wrote:
> When a guest reboots (ordinary reboots, but also via kexec), it will
> happily reuse any system memory, including previously inflated memory.
> 
> We could have tracking data for a pbp (PartiallyBalloonedPage). It could
> happen that a new inflation request from the guest will result in a
> discard of such a pbp, although the guest is (again) reusing some
> memory.
> 
> We should reset the pbp on any device resets.
> 
> Fixes: ed48c59875b6 ("virtio-balloon: Safely handle BALLOON_PAGE_SIZE <
>                      host page size")
> Cc: qemu-stable@nongnu.org #v4.0.0
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Can't something else remove a ramblock besides a reset?


> ---
>  hw/virtio/virtio-balloon.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 84d01bceb3..9de3c030bf 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -847,6 +847,7 @@ static void virtio_balloon_device_reset(VirtIODevice *vdev)
>      if (virtio_balloon_free_page_support(s)) {
>          virtio_balloon_free_page_stop(s);
>      }
> +    virtio_balloon_reset_pbp(s);
>  
>      if (s->stats_vq_elem != NULL) {
>          virtqueue_unpop(s->svq, s->stats_vq_elem, 0);
> -- 
> 2.21.0

