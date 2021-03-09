Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F6332806
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:04:26 +0100 (CET)
Received: from localhost ([::1]:37818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcyH-0003Nv-JC
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lJcv6-00022C-GS
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lJcux-0002Vr-Nc
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615298456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lRSZJ/maeiJmkeNvsDGTyIviU9GdSCtrtTPwWDiBY1Y=;
 b=XXP9FwEtU06gqVfdobT0NBIgsqv3vxqCKaPl6rIwNPe5wbZerzHHMxPj1u6HVWxOjaEyJA
 aa51Exq2d1C52d/B07dwJ2gj70EilXaCXzqOywiUFhUukAYL1ocoV3N8eD36tMNbfTygZg
 sRF157jqhJHXq0AFyjLCp1Y9KTn8uG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-4kxIOUU7MUOpL4YyPIoviA-1; Tue, 09 Mar 2021 09:00:55 -0500
X-MC-Unique: 4kxIOUU7MUOpL4YyPIoviA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0063A800D62;
 Tue,  9 Mar 2021 14:00:54 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-126.rdu2.redhat.com [10.10.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7A7C5C260;
 Tue,  9 Mar 2021 14:00:46 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 691AE22054F; Tue,  9 Mar 2021 09:00:46 -0500 (EST)
Date: Tue, 9 Mar 2021 09:00:46 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 4/4] virtiofsd: Release vu_dispatch_lock when stopping
 queue
Message-ID: <20210309140046.GA77194@redhat.com>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-5-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210308123141.26444-5-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 01:31:41PM +0100, Greg Kurz wrote:
> QEMU can stop a virtqueue by sending a VHOST_USER_GET_VRING_BASE request
> to virtiofsd. As with all other vhost-user protocol messages, the thread
> that runs the main event loop in virtiofsd takes the vu_dispatch lock in
> write mode. This ensures that no other thread can access virtqueues or
> memory tables at the same time.
> 
> In the case of VHOST_USER_GET_VRING_BASE, the main thread basically
> notifies the queue thread that it should terminate and waits for its
> termination:
> 
> main()
>  virtio_loop()
>   vu_dispatch_wrlock()
>   vu_dispatch()
>    vu_process_message()
>     vu_get_vring_base_exec()
>      fv_queue_cleanup_thread()
>       pthread_join()
> 
> Unfortunately, the queue thread ends up calling virtio_send_msg()
> at some point, which itself needs to grab the lock:
> 
> fv_queue_thread()
>  g_list_foreach()
>   fv_queue_worker()
>    fuse_session_process_buf_int()
>     do_release()
>      lo_release()
>       fuse_reply_err()
>        send_reply()
>         send_reply_iov()
>          fuse_send_reply_iov_nofree()
>           fuse_send_msg()
>            virtio_send_msg()
>             vu_dispatch_rdlock() <-- Deadlock !
> 
> Simply have the main thread to release the lock before going to
> sleep and take it back afterwards. A very similar patch was already
> sent by Vivek Goyal sometime back:
> 
> https://listman.redhat.com/archives/virtio-fs/2021-January/msg00073.html
> 
> The only difference here is that this done in fv_queue_set_started()
> because fv_queue_cleanup_thread() can also be called from virtio_loop()
> without the lock being held.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Looks good to me.

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Vivek
> ---
>  tools/virtiofsd/fuse_virtio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 523ee64fb7ae..3e13997406bf 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -792,7 +792,13 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
>              assert(0);
>          }
>      } else {
> +        /*
> +         * Temporarily drop write-lock taken in virtio_loop() so that
> +         * the queue thread doesn't block in virtio_send_msg().
> +         */
> +        vu_dispatch_unlock(vud);
>          fv_queue_cleanup_thread(vud, qidx);
> +        vu_dispatch_wrlock(vud);
>      }
>  }
>  
> -- 
> 2.26.2
> 


