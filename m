Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADEB6CA56B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:19:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmkJ-0005zY-BQ; Mon, 27 Mar 2023 09:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pgmkD-0005z5-69
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:18:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pgmkB-0005Lh-Aw
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679923118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+vmB/Nixa/TLYuBmbhbDZvNHLLMoiQzXaLoGDz8G4MU=;
 b=i1XzjJzvAOKrjOScOou/VPmqk+DuZVdYhgcWXdMwlotVhyaUZPpaQHJzL71HN2Z7KP+1lB
 WVkvIdcY1LFvbarsHLAQkYev88TvVE7QR2vUUymTX+QlpcLTmhUEIb094cdCPhYwtxNs5i
 tBG+fcNLgQq/UW9hPVJSMEQdKROTlV8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-2xdyXa0xNJeqgzbdALS6rw-1; Mon, 27 Mar 2023 09:18:35 -0400
X-MC-Unique: 2xdyXa0xNJeqgzbdALS6rw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26C6F85530D;
 Mon, 27 Mar 2023 13:18:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59162492B0A;
 Mon, 27 Mar 2023 13:18:34 +0000 (UTC)
Date: Mon, 27 Mar 2023 15:18:33 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: hreitz@redhat.com, eesposit@redhat.com, ldoktor@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH for-8.0] block/export: Fix graph locking in
 blk_get_geometry() call
Message-ID: <ZCGXqY5B1GGqvabS@redhat.com>
References: <20230327113959.60071-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230327113959.60071-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 27.03.2023 um 13:39 hat Kevin Wolf geschrieben:
> blk_get_geometry() eventually calls bdrv_nb_sectors(), which is a
> co_wrapper_mixed_bdrv_rdlock. This means that when it is called from
> coroutine context, it already assume to have the graph locked.
> 
> However, virtio_blk_sect_range_ok() in block/export/virtio-blk-handler.c
> (used by vhost-user-blk and VDUSE exports) runs in a coroutine, but
> doesn't take the graph lock - blk_*() functions are generally expected
> to do that internally. This causes an assertion failure when accessing
> an export for the first time if it runs in an iothread.
> 
> This is an example of the crash:
> 
> $ ./storage-daemon/qemu-storage-daemon --object iothread,id=th0 --blockdev file,filename=/home/kwolf/images/hd.img,node-name=disk --export vhost-user-blk,addr.type=unix,addr.path=/tmp/vhost.sock,node-name=disk,id=exp0,iothread=th0
> qemu-storage-daemon: ../block/graph-lock.c:268: void assert_bdrv_graph_readable(void): Assertion `qemu_in_main_thread() || reader_count()' failed.
> 
> (gdb) bt

Oops, git helpfully removed the "comments"...

  (gdb) bt
  #0  0x00007ffff6eafe5c in __pthread_kill_implementation () from /lib64/libc.so.6
  #1  0x00007ffff6e5fa76 in raise () from /lib64/libc.so.6
  #2  0x00007ffff6e497fc in abort () from /lib64/libc.so.6
  #3  0x00007ffff6e4971b in __assert_fail_base.cold () from /lib64/libc.so.6
  #4  0x00007ffff6e58656 in __assert_fail () from /lib64/libc.so.6
  #5  0x00005555556337a3 in assert_bdrv_graph_readable () at ../block/graph-lock.c:268
  #6  0x00005555555fd5a2 in bdrv_co_nb_sectors (bs=0x5555564c5ef0) at ../block.c:5847
  #7  0x00005555555ee949 in bdrv_nb_sectors (bs=0x5555564c5ef0) at block/block-gen.c:256
  #8  0x00005555555fd6b9 in bdrv_get_geometry (bs=0x5555564c5ef0, nb_sectors_ptr=0x7fffef7fedd0) at ../block.c:5884
  #9  0x000055555562ad6d in blk_get_geometry (blk=0x5555564cb200, nb_sectors_ptr=0x7fffef7fedd0) at ../block/block-backend.c:1624
  #10 0x00005555555ddb74 in virtio_blk_sect_range_ok (blk=0x5555564cb200, block_size=512, sector=0, size=512) at ../block/export/virtio-blk-handler.c:44
  #11 0x00005555555dd80d in virtio_blk_process_req (handler=0x5555564cbb98, in_iov=0x7fffe8003830, out_iov=0x7fffe8003860, in_num=1, out_num=0) at ../block/export/virtio-blk-handler.c:189
  #12 0x00005555555dd546 in vu_blk_virtio_process_req (opaque=0x7fffe8003800) at ../block/export/vhost-user-blk-server.c:66
  #13 0x00005555557bf4a1 in coroutine_trampoline (i0=-402635264, i1=32767) at ../util/coroutine-ucontext.c:177
  #14 0x00007ffff6e75c20 in ?? () from /lib64/libc.so.6
  #15 0x00007fffefffa870 in ?? ()
  #16 0x0000000000000000 in ?? ()

I'm adding this back while applying (but with indentation this time so
that git doesn't interpret it as comments).

Kevin

> Fix this by creating a new blk_co_get_geometry() that takes the lock,
> and changing blk_get_geometry() to be a co_wrapper_mixed around it.
> 
> To make the resulting code cleaner, virtio-blk-handler.c can directly
> call the coroutine version now (though that wouldn't be necessary for
> fixing the bug, taking the lock in blk_co_get_geometry() is what fixes
> it).
> 
> Fixes: 8ab8140a04cf771d63e9754d6ba6c1e676bfe507
> Reported-by: Lukáš Doktor <ldoktor@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>


