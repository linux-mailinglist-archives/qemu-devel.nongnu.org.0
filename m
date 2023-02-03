Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD34689997
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 14:21:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNvyC-0002yS-3o; Fri, 03 Feb 2023 08:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNvwo-0002VF-CM
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:17:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNvwi-0005kw-LR
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675430259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DSSp0dAPBhCx9F9F0U6cd9l0za3uqJocdHPKrcWZnH8=;
 b=i7vgvIGan7lFKrWchwO4c1CqFjouXZWcjnZTxMJWrLVi7ZMbM/H7aNGgK6NX+gUzwp4nnr
 gGVvQZggRASO9tUFGx2Lahtquw+b862HbvP05MH5yQYgWbbcvbmDHd6/i2TI2kcXzxZZuz
 42vWytWoJZZ4dDTuRtngCTMc6E4/6/Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-XDNvTDK2OqCu7TSCcOLX2w-1; Fri, 03 Feb 2023 08:17:36 -0500
X-MC-Unique: XDNvTDK2OqCu7TSCcOLX2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55452811E9C;
 Fri,  3 Feb 2023 13:17:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87D332026D37;
 Fri,  3 Feb 2023 13:17:33 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v5 0/4] AioContext removal: LinuxAioState and ThreadPool
Date: Fri,  3 Feb 2023 08:17:27 -0500
Message-Id: <20230203131731.851116-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

Just remove some AioContext lock in LinuxAioState and ThreadPool.
Not related to anything specific, so I decided to send it as
a separate patch.

These patches are taken from Paolo's old draft series.

---
v5:
* apply Stefan comments, add patch 4 to remove ThreadPool * param
  from thread_pool_submit*
* document that functions run in current IOThread

v4:
* add missing aio_context removal, and fix typo

v3:
* remove qemu_coroutine_enter_if_inactive

v2:
* assertion in thread_pool
* remove useless BlockDriverState * param in patch 1 and 2
* io_uring cleaned too


Emanuele Giuseppe Esposito (4):
  linux-aio: use LinuxAioState from the running thread
  io_uring: use LuringState from the running thread
  thread-pool: use ThreadPool from the running thread
  thread-pool: avoid passing the pool parameter every time

 include/block/aio.h               |  8 ------
 include/block/raw-aio.h           | 33 ++++++++++++++++-------
 include/block/thread-pool.h       | 15 ++++++-----
 include/sysemu/block-backend-io.h |  6 +++++
 backends/tpm/tpm_backend.c        |  4 +--
 block/file-posix.c                | 45 ++++++++++++-------------------
 block/file-win32.c                |  4 +--
 block/io_uring.c                  | 23 ++++++++++------
 block/linux-aio.c                 | 29 +++++++++++---------
 block/qcow2-threads.c             |  3 +--
 hw/9pfs/coth.c                    |  3 +--
 hw/ppc/spapr_nvdimm.c             |  6 ++---
 hw/virtio/virtio-pmem.c           |  3 +--
 scsi/pr-manager.c                 |  3 +--
 scsi/qemu-pr-helper.c             |  3 +--
 tests/unit/test-thread-pool.c     | 12 ++++-----
 util/thread-pool.c                | 25 +++++++++--------
 17 files changed, 113 insertions(+), 112 deletions(-)

-- 
2.39.1


