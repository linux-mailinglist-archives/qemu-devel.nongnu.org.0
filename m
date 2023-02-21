Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9656A69E96B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 22:24:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUa6t-0007Gy-Fd; Tue, 21 Feb 2023 16:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pUa6r-0007Fm-2N
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 16:23:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pUa5s-0001Lm-W6
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 16:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677014545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z0UkK/576sXz1l+yPDIH7hr7k5XbztYf2Xn6yi7waek=;
 b=ii3ZMDM3MvV48EAOASe5qw/zr2qr15H7HTw3cZX8HLZXqzIQ/OEJ/ej8G2fkUrQMSDxJLd
 OYkODc5eHPCHm0HQukfZXIFeC6guaDF5xDq/oks75GEitXUXYeAN1MU/6cx8Smo9EmPbs5
 dZJ57iD1v5wQf+HP4q4d+nvTt6Ke7tk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-Txj_mPnAMSSQnNR3MTaEOA-1; Tue, 21 Feb 2023 16:22:22 -0500
X-MC-Unique: Txj_mPnAMSSQnNR3MTaEOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12C4C101A52E;
 Tue, 21 Feb 2023 21:22:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3686C440DF;
 Tue, 21 Feb 2023 21:22:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Fam Zheng <fam@euphon.net>,
 <qemu-block@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v3 0/3] virtio-scsi: fix SCSIDevice hot unplug with IOThread
Date: Tue, 21 Feb 2023 16:22:15 -0500
Message-Id: <20230221212218.1378734-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

v3:
- Fix s/see/sees/ typo in Patch 2 commit description [Eric]
- Add call stack to Patch 3 commit description to make it clear how blk_drain()
  is invoked [Kevin]

Unplugging SCSIDevices when virtio-scsi is using an IOThread suffers from race
conditions:
- scsi_device_purge_requests() is called from the IOThread in TMF emulation.
  This is unsafe, it should only be called from the BQL.
- SCSIRequest->aiocb is not protected by a lock, so there are races between the
  main loop thread and the IOThread when scsi_device_purge_requests() runs in
  the main loop thread.
- DMAAIOCB->acb is not protected by a lock, so there are races in the DMA
  helpers code when cancelling a request from the main loop thread.

These fixes solve assertion failures during SCSIDevice hot unplug in
virtio-scsi with IOThread. Expanding the use of the AioContext lock isn't great
since we're in the midst of trying to remove it. However, I think this solution
is appropriate so that stable trees or distros can backport the fix without
depending on QEMU multi-queue block layer refactoring.

Special thanks to Qing Wang, who helped me iterate these patches because I
couldn't reproduce the assertion failures myself.

Stefan Hajnoczi (3):
  scsi: protect req->aiocb with AioContext lock
  dma-helpers: prevent dma_blk_cb() vs dma_aio_cancel() race
  virtio-scsi: reset SCSI devices from main loop thread

 include/hw/virtio/virtio-scsi.h |  11 ++-
 hw/scsi/scsi-disk.c             |  23 +++--
 hw/scsi/scsi-generic.c          |  11 ++-
 hw/scsi/virtio-scsi.c           | 169 +++++++++++++++++++++++++-------
 softmmu/dma-helpers.c           |  12 ++-
 5 files changed, 171 insertions(+), 55 deletions(-)

-- 
2.39.1


