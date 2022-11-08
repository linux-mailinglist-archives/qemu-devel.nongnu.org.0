Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF09621E71
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 22:20:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osW0U-0004rq-Af; Tue, 08 Nov 2022 16:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0S-0004qy-EK
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:19:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osW0R-0008I2-0x
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667942377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mad1LZqYcttHXlX/zgysjfs0GFkzokKmldXMVjisyX4=;
 b=HrNPyUCx87sXnDC+hOhFf6pZOgJW4FrD1/PCVilt4IhqY4urYTQpcq4EwXmn78DuDzo85Z
 f2bEdgKDjgx6Vq6AaqFt0pxk1FxvJ+Zft3kKV0Tis40zRotD2++Zhh8IlBQjHWGaUqmjt5
 LGtlC2EDzDO02YOOO25X1KJ3dsLaGrU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-0TviNnLwPdW1rtjDfaQOdA-1; Tue, 08 Nov 2022 16:19:33 -0500
X-MC-Unique: 0TviNnLwPdW1rtjDfaQOdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 914833C0E201;
 Tue,  8 Nov 2022 21:19:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E223140EBF3;
 Tue,  8 Nov 2022 21:19:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 0/8] virtio-blk: remove AioContext lock
Date: Tue,  8 Nov 2022 16:19:22 -0500
Message-Id: <20221108211930.876142-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

This is a continuation of Emanuele Esposito's work to remove the AioContext
lock in virtio-blk. In the past it was necessary to acquire the AioContext lock
in order to do I/O. Paolo Bonzini and Emanuele have removed the need for the
AioContext in the core block layer code, with a few exceptions like blk_drain()
and blk_set_aio_context().

This patch series annotates virtio-blk functions with
IO_CODE()/GLOBAL_STATE_CODE() so it's clear in which context they are called.
It also removes unnecessary AioContext locks.

The end result is that virtio-blk rarely takes the AioContext lock. Future
patch series will add support for multiple IOThreads so that true multi-queue
can be achieved, but right now virtio-blk still has unprotected shared state
like s->rq so that needs to wait for another day.

Based-on: <20221102182337.252202-1-stefanha@redhat.com>

Emanuele Giuseppe Esposito (6):
  virtio_queue_aio_attach_host_notifier: remove AioContext lock
  block-backend: enable_write_cache should be atomic
  virtio: categorize callbacks in GS
  virtio-blk: mark GLOBAL_STATE_CODE functions
  virtio-blk: mark IO_CODE functions
  virtio-blk: remove unnecessary AioContext lock from function already
    safe

Stefan Hajnoczi (2):
  virtio-blk: don't acquire AioContext in virtio_blk_handle_vq()
  virtio-blk: minimize virtio_blk_reset() AioContext lock region

 include/block/aio-wait.h        |  4 +-
 block/block-backend.c           |  6 +--
 hw/block/dataplane/virtio-blk.c | 18 +++++--
 hw/block/virtio-blk.c           | 92 ++++++++++++++++++++++++---------
 hw/scsi/virtio-scsi-dataplane.c | 10 ++--
 hw/virtio/virtio-bus.c          |  5 ++
 hw/virtio/virtio-pci.c          |  2 +
 hw/virtio/virtio.c              |  8 +++
 util/aio-wait.c                 |  2 +-
 9 files changed, 106 insertions(+), 41 deletions(-)

-- 
2.38.1


