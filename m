Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBCB6D509F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 20:33:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjOwu-000133-FQ; Mon, 03 Apr 2023 14:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjOws-00011m-Am
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjOwp-0000Wn-OX
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680546631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CjLb/A1nTO72rleg3tgXtfILFOYKYMPMoC5OW2A0i4g=;
 b=a08eAL8juXa8rDTZe8XcpTlhMFL+PV0YW+0FD0CnvyBo3JZSXqCA2g2SKZ3Ch8ptubVyQh
 NEg2ikX+lGnNgLwChx0ft3gyG95OLiH4JwfqR+8z2fGSFBZDn/jSKL4dfL7/92DGZZjBBL
 364AWZgG+gzBeJH1cFyRQOq3qAClTw4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-Q2KxycS7PhakuOgluqVi7g-1; Mon, 03 Apr 2023 14:30:26 -0400
X-MC-Unique: Q2KxycS7PhakuOgluqVi7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CDFC88FA4C;
 Mon,  3 Apr 2023 18:30:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16D77140EBF4;
 Mon,  3 Apr 2023 18:30:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, <qemu-block@nongnu.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, eesposit@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH 00/13] block: remove aio_disable_external() API
Date: Mon,  3 Apr 2023 14:29:51 -0400
Message-Id: <20230403183004.347205-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

The aio_disable_external() API temporarily suspends file descriptor monitoring
in the event loop. The block layer uses this to prevent new I/O requests being
submitted from the guest and elsewhere between bdrv_drained_begin() and
bdrv_drained_end().

While the block layer still needs to prevent new I/O requests in drained
sections, the aio_disable_external() API can be replaced with
.drained_begin/end/poll() callbacks that have been added to BdrvChildClass and
BlockDevOps.

This newer .bdrained_begin/end/poll() approach is attractive because it works
without specifying a specific AioContext. The block layer is moving towards
multi-queue and that means multiple AioContexts may be processing I/O
simultaneously.

The aio_disable_external() was always somewhat hacky. It suspends all file
descriptors that were registered with is_external=true, even if they have
nothing to do with the BlockDriverState graph nodes that are being drained.
It's better to solve a block layer problem in the block layer than to have an
odd event loop API solution.

That covers the motivation for this change, now on to the specifics of this
series:

While it would be nice if a single conceptual approach could be applied to all
is_external=true file descriptors, I ended up looking at callers on a
case-by-case basis. There are two general ways I migrated code away from
is_external=true:

1. Block exports are typically best off unregistering fds in .drained_begin()
   and registering them again in .drained_end(). The .drained_poll() function
   waits for in-flight requests to finish using a reference counter.

2. Emulated storage controllers like virtio-blk and virtio-scsi are a little
   simpler. They can rely on BlockBackend's request queuing during drain
   feature. Guest I/O request coroutines are suspended in a drained section and
   resume upon the end of the drained section.

The first two virtio-scsi patches were already sent as a separate series. I
included them because they are necessary in order to fully remove
aio_disable_external().

Based-on: 087bc644b7634436ca9d52fe58ba9234e2bef026 (kevin/block-next)

Stefan Hajnoczi (13):
  virtio-scsi: avoid race between unplug and transport event
  virtio-scsi: stop using aio_disable_external() during unplug
  block/export: only acquire AioContext once for
    vhost_user_server_stop()
  util/vhost-user-server: rename refcount to in_flight counter
  block/export: wait for vhost-user-blk requests when draining
  block/export: stop using is_external in vhost-user-blk server
  virtio: do not set is_external=true on host notifiers
  hw/xen: do not use aio_set_fd_handler(is_external=true) in
    xen_xenstore
  hw/xen: do not set is_external=true on evtchn fds
  block/export: rewrite vduse-blk drain code
  block/fuse: take AioContext lock around blk_exp_ref/unref()
  block/fuse: do not set is_external=true on FUSE fd
  aio: remove aio_disable_external() API

 include/block/aio.h                  |  55 -----------
 include/qemu/vhost-user-server.h     |   8 +-
 util/aio-posix.h                     |   1 -
 block.c                              |   7 --
 block/blkio.c                        |  15 +--
 block/curl.c                         |  10 +-
 block/export/fuse.c                  |  62 ++++++++++++-
 block/export/vduse-blk.c             | 132 +++++++++++++++++++--------
 block/export/vhost-user-blk-server.c |  73 +++++++++------
 block/io.c                           |   2 -
 block/io_uring.c                     |   4 +-
 block/iscsi.c                        |   3 +-
 block/linux-aio.c                    |   4 +-
 block/nfs.c                          |   5 +-
 block/nvme.c                         |   8 +-
 block/ssh.c                          |   4 +-
 block/win32-aio.c                    |   6 +-
 hw/i386/kvm/xen_xenstore.c           |   2 +-
 hw/scsi/scsi-bus.c                   |   3 +-
 hw/scsi/scsi-disk.c                  |   1 +
 hw/scsi/virtio-scsi.c                |  21 ++---
 hw/virtio/virtio.c                   |   6 +-
 hw/xen/xen-bus.c                     |   6 +-
 io/channel-command.c                 |   6 +-
 io/channel-file.c                    |   3 +-
 io/channel-socket.c                  |   3 +-
 migration/rdma.c                     |  16 ++--
 tests/unit/test-aio.c                |  27 +-----
 tests/unit/test-fdmon-epoll.c        |  73 ---------------
 util/aio-posix.c                     |  20 +---
 util/aio-win32.c                     |   8 +-
 util/async.c                         |   3 +-
 util/fdmon-epoll.c                   |  10 --
 util/fdmon-io_uring.c                |   8 +-
 util/fdmon-poll.c                    |   3 +-
 util/main-loop.c                     |   7 +-
 util/qemu-coroutine-io.c             |   7 +-
 util/vhost-user-server.c             |  38 ++++----
 tests/unit/meson.build               |   3 -
 39 files changed, 298 insertions(+), 375 deletions(-)
 delete mode 100644 tests/unit/test-fdmon-epoll.c

-- 
2.39.2


