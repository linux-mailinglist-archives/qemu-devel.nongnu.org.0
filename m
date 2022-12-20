Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D76523F5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:50:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7esU-0005Aj-5F; Tue, 20 Dec 2022 10:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7esR-00059z-Me
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:49:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7esQ-000660-5S
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671551397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fx7o2tNeA6adYj5JeDzTKm2HMmlREJGttHHQnMgaZKA=;
 b=YtI2MTg0+2ocI4zteVLoimOfihZ+TOVdSfcOlCVmLOc6UbXZPKWvF3EaQLBz+YgM2xI38e
 yHSUqh+YDuvjDsJbYlXk9q/mh19ZVywoUuhEDlM4yteMUQ4HmW9jd1QGh+QpJSlp2YAf1e
 2R/cMIEIPAbaMUTyO3P6VL596ahilvQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-sweGg5HROjysHd333Yvo-A-1; Tue, 20 Dec 2022 10:49:46 -0500
X-MC-Unique: sweGg5HROjysHd333Yvo-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4302719705D0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 15:49:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05ED0400D79E;
 Tue, 20 Dec 2022 15:49:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B209221E691D; Tue, 20 Dec 2022 16:49:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	kwolf@redhat.com,
	pbonzini@redhat.com
Subject: [PATCH v2 0/5] coroutine: Clean up includes
Date: Tue, 20 Dec 2022 16:49:39 +0100
Message-Id: <20221220154944.3611845-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

v2:
* Rebased
* PATCH 4: Rewritten [Paolo]
* PATCH 5: New

Markus Armbruster (5):
  coroutine: Clean up superfluous inclusion of qemu/coroutine.h
  coroutine: Move coroutine_fn to qemu/osdep.h, trim includes
  coroutine: Clean up superfluous inclusion of qemu/lockable.h
  coroutine: Split qemu/coroutine-core.h off qemu/coroutine.h
  coroutine: Use Coroutine typedef name instead of structure tag

 crypto/block-luks-priv.h      |   1 -
 hw/9pfs/coth.h                |   2 +-
 include/block/aio.h           |   9 +-
 include/block/aio_task.h      |   2 -
 include/block/block-common.h  |   1 -
 include/block/graph-lock.h    |   2 -
 include/block/raw-aio.h       |   1 -
 include/io/channel.h          |   2 +-
 include/monitor/hmp.h         |   1 -
 include/qemu/coroutine-core.h | 154 ++++++++++++++++++++++++++++++++++
 include/qemu/coroutine.h      | 113 ++-----------------------
 include/qemu/lockable.h       |   2 +-
 include/qemu/osdep.h          |  16 ++++
 include/qemu/progress_meter.h |   2 +-
 include/qemu/typedefs.h       |   1 -
 include/scsi/pr-manager.h     |   1 -
 nbd/nbd-internal.h            |   1 -
 block.c                       |   2 +-
 block/block-copy.c            |   2 +-
 block/io_uring.c              |   2 +-
 block/linux-aio.c             |   2 +-
 block/mirror.c                |   2 +-
 block/progress_meter.c        |   2 +
 block/vdi.c                   |   2 +-
 blockjob.c                    |   1 -
 chardev/char.c                |   2 +-
 crypto/block-luks.c           |   1 -
 hw/9pfs/codir.c               |   1 -
 hw/9pfs/cofile.c              |   1 -
 hw/9pfs/cofs.c                |   1 -
 hw/9pfs/coth.c                |   2 +-
 hw/9pfs/coxattr.c             |   1 -
 hw/block/virtio-blk.c         |   2 +-
 migration/rdma.c              |   2 +-
 nbd/client-connection.c       |   1 +
 net/colo-compare.c            |   2 +-
 qapi/qmp-dispatch.c           |   2 +-
 tests/unit/test-aio.c         |   2 +-
 tests/unit/test-coroutine.c   |   2 -
 tests/unit/test-vmstate.c     |   1 -
 ui/console.c                  |   1 +
 util/async.c                  |   4 +-
 util/qemu-coroutine-lock.c    |   1 -
 util/qemu-coroutine-sleep.c   |   1 -
 util/qemu-coroutine.c         |   1 -
 util/thread-pool.c            |   2 +-
 46 files changed, 205 insertions(+), 154 deletions(-)
 create mode 100644 include/qemu/coroutine-core.h

-- 
2.38.1


