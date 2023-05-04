Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5506F77AB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 23:02:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pug4R-0000Lw-2d; Thu, 04 May 2023 17:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pug4P-0000LX-51
 for qemu-devel@nongnu.org; Thu, 04 May 2023 17:00:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pug4G-0007ut-5r
 for qemu-devel@nongnu.org; Thu, 04 May 2023 17:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683234046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/tE35rOAAC2vyhAwuF/fixTME5fKR02RCLevjKZzkLM=;
 b=N8mohIMJWpdXWbC/dh7o9EA4up4B6E+0MyFGx2cKa6sSPYJaBg2W0esjDYWTchXdm8qX7+
 CtzTXruZb9t7Co48PcVSp7S/TGxf/G8hkKdvGsiahyltVB5hpWl97+5wcEnK760kekYDkB
 WYWKsqwfHnmgb5U+XWdBTQpoMRmcY9A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-M4XYXSG0PgOjzbjEbNZBbw-1; Thu, 04 May 2023 17:00:43 -0400
X-MC-Unique: M4XYXSG0PgOjzbjEbNZBbw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B7253C0DDAA;
 Thu,  4 May 2023 21:00:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 472A510DF8;
 Thu,  4 May 2023 21:00:37 +0000 (UTC)
Date: Thu, 4 May 2023 23:00:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 16/20] virtio: make it possible to detach host
 notifier from any thread
Message-ID: <ZFQc89cFJuoGF+qI@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-17-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172716.1033562-17-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> virtio_queue_aio_detach_host_notifier() does two things:
> 1. It removes the fd handler from the event loop.
> 2. It processes the virtqueue one last time.
> 
> The first step can be peformed by any thread and without taking the
> AioContext lock.
> 
> The second step may need the AioContext lock (depending on the device
> implementation) and runs in the thread where request processing takes
> place. virtio-blk and virtio-scsi therefore call
> virtio_queue_aio_detach_host_notifier() from a BH that is scheduled in
> AioContext
> 
> Scheduling a BH is undesirable for .drained_begin() functions. The next
> patch will introduce a .drained_begin() function that needs to call
> virtio_queue_aio_detach_host_notifier().

Why is it undesirable? In my mental model, .drained_begin() is still
free to start as many asynchronous things as it likes. The only
important thing to take care of is that .drained_poll() returns true as
long as the BH (or other asynchronous operation) is still pending.

Of course, your way of doing things still seems to result in simpler
code because you don't have to deal with a BH at all if you only really
want the first part and not the second.

> Move the virtqueue processing out to the callers of
> virtio_queue_aio_detach_host_notifier() so that the function can be
> called from any thread. This is in preparation for the next patch.

Did you forget to remove it in virtio_queue_aio_detach_host_notifier()?
If it's unchanged, I don't think the AioContext requirement is lifted.

> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c | 2 ++
>  hw/scsi/virtio-scsi-dataplane.c | 9 +++++++++
>  2 files changed, 11 insertions(+)
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> index b28d81737e..bd7cc6e76b 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -286,8 +286,10 @@ static void virtio_blk_data_plane_stop_bh(void *opaque)
>  
>      for (i = 0; i < s->conf->num_queues; i++) {
>          VirtQueue *vq = virtio_get_queue(s->vdev, i);
> +        EventNotifier *host_notifier = virtio_queue_get_host_notifier(vq);
>  
>          virtio_queue_aio_detach_host_notifier(vq, s->ctx);
> +        virtio_queue_host_notifier_read(host_notifier);
>      }
>  }

The existing code in virtio_queue_aio_detach_host_notifier() has a
comment before the read:

    /* Test and clear notifier before after disabling event,
     * in case poll callback didn't have time to run. */

Do we want to keep it around in the new places? (And also fix the
"before after", I suppose, or replace it with a similar, but better
comment that explains why we're reading here.)

Kevin


