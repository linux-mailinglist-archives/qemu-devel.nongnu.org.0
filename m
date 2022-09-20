Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906B95BED62
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:12:14 +0200 (CEST)
Received: from localhost ([::1]:45938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaifF-0007ri-MU
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oaeWt-0000m6-OZ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:47:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oaeWp-00012o-MC
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663685234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uyAGmWrpdSn1x3zCsfbb6mR7nHJnMctn20u9vqfsYvQ=;
 b=NBLrTpcm+mrQJmfovTkNCIllD7WPEijOCWLUPkz1YA32cVK33UUdeXCJ+9d9aDyFoFujit
 K/2+O93bII3c18uFnAf1XA7fTNJYUDMc7JQfl9VSjSEHcUIe9XaqrXb5bph+jiwvtF57df
 m+6Z3PtfNOdH6bWP/Uy3ZLZgM6sqZsM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-LN3W7xNaMGea3e2NQE8phg-1; Tue, 20 Sep 2022 10:47:13 -0400
X-MC-Unique: LN3W7xNaMGea3e2NQE8phg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71EE2862FDF;
 Tue, 20 Sep 2022 14:47:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2607140C206B;
 Tue, 20 Sep 2022 14:47:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E89F321E6900; Tue, 20 Sep 2022 16:47:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  eblake@redhat.com,  eduardo@habkost.net,
 berrange@redhat.com,  pbonzini@redhat.com,  mst@redhat.com,
 rvkagan@yandex-team.ru,  yc-core@yandex-team.ru
Subject: Re: [PATCH] virtio: add VIRTQUEUE_ERROR QAPI event
References: <20220919194805.195952-1-vsementsov@yandex-team.ru>
Date: Tue, 20 Sep 2022 16:47:09 +0200
In-Reply-To: <20220919194805.195952-1-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 19 Sep 2022 22:48:05 +0300")
Message-ID: <87czbqw1aq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> For now we only log the vhost device error, when virtqueue is actually
> stopped. Let's add a QAPI event, which makes possible:
>
>  - collect statistics of such errors
>  - make immediate actions: take coredums or do some other debugging

Core dumps, I presume.

Is QMP the right tool for the job?  Or could a trace point do?

> The event could be reused for some other virtqueue problems (not only
> for vhost devices) in future. For this it gets a generic name and
> structure.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  hw/virtio/vhost.c | 12 +++++++++---
>  qapi/qdev.json    | 25 +++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index f758f177bb..caa81f2ace 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -15,6 +15,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-events-qdev.h"
>  #include "hw/virtio/vhost.h"
>  #include "qemu/atomic.h"
>  #include "qemu/range.h"

Only tangentially related to this patch, but here goes anyway:

   /* enabled until disconnected backend stabilizes */
   #define _VHOST_DEBUG 1

This is from 2016.  Has it stabilized?

   #ifdef _VHOST_DEBUG
   #define VHOST_OPS_DEBUG(retval, fmt, ...) \
       do { \
           error_report(fmt ": %s (%d)", ## __VA_ARGS__, \
                        strerror(-retval), -retval); \

error_report() is for errors the user can do something about, not for
debug messages.

       } while (0)
   #else
   #define VHOST_OPS_DEBUG(retval, fmt, ...) \
       do { } while (0)
   #endif

> @@ -1287,11 +1288,16 @@ static void vhost_virtqueue_error_notifier(EventNotifier *n)
>      struct vhost_virtqueue *vq = container_of(n, struct vhost_virtqueue,
>                                                error_notifier);
>      struct vhost_dev *dev = vq->dev;
> -    int index = vq - dev->vqs;
>  
>      if (event_notifier_test_and_clear(n) && dev->vdev) {
> -        VHOST_OPS_DEBUG(-EINVAL,  "vhost vring error in virtqueue %d",
> -                        dev->vq_index + index);
> +        int ind = vq - dev->vqs + dev->vq_index;
> +        DeviceState *ds = &dev->vdev->parent_obj;
> +
> +        VHOST_OPS_DEBUG(-EINVAL,  "vhost vring error in virtqueue %d", ind);
> +        qapi_event_send_virtqueue_error(!!ds->id, ds->id, ds->canonical_path,
> +                                        ind, VIRTQUEUE_ERROR_VHOST_VRING_ERR,
> +                                        "vhost reported failure through vring "
> +                                        "error fd");

Do we still need VHOST_OPS_DEBUG() here?

>      }
>  }
>  
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 2708fb4e99..b7c2669c2c 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -158,3 +158,28 @@
>  ##
>  { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @VirtqueueError:
> +#
> +# Since: 7.2
> +##
> +{ 'enum': 'VirtqueueError',
> +  'data': [ 'vhost-vring-err' ] }
> +
> +##
> +# @VIRTQUEUE_ERROR:
> +#
> +# Emitted when a device virtqueue fails in runtime.
> +#
> +# @device: the device's ID if it has one
> +# @path: the device's QOM path
> +# @virtqueue: virtqueue index
> +# @error: error identifier
> +# @description: human readable description
> +#
> +# Since: 7.2
> +##
> +{ 'event': 'VIRTQUEUE_ERROR',
> + 'data': { '*device': 'str', 'path': 'str', 'virtqueue': 'int',
> +            'error': 'VirtqueueError', 'description': 'str'} }

Can the guest trigger the event?

If yes, it needs to be rate-limited.


