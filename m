Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA0954517A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:01:22 +0200 (CEST)
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKb3-0005MQ-8p
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI2-0002Jh-HV
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJHy-00070S-Nr
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654785454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=91IAjRH1sPgluJC2xQcF7lVvG6dksNKUKbw4BWQEIk0=;
 b=ivdzIIgYLZXwE+2Qpovmn/0HPS9sJ7zmBeXYGLms5rcs5SLvJRsRkiT//G730eLxmLLO+b
 xAWjAxMlzM/MpS9Wg1uruveE5ItRLQ23I/udk/GyfbbdmHMoksIUDo+lkbyZdSdkRyFeJO
 Bt0BvAyMPTuddNlOJCiasurwEWTbBV8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91--tWGA3yCOKKOEMLreRVaYw-1; Thu, 09 Jun 2022 10:37:30 -0400
X-MC-Unique: -tWGA3yCOKKOEMLreRVaYw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 394FA38005C5;
 Thu,  9 Jun 2022 14:37:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E754E456CD9;
 Thu,  9 Jun 2022 14:37:29 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 0/8] virtio-blk: removal of AioContext lock
Date: Thu,  9 Jun 2022 10:37:19 -0400
Message-Id: <20220609143727.1151816-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This serie aims to free virtio-blk (and in the future all
virtio devices) from the AioContext lock.

First step is to understand which functions are running in
the main loop and which are in iothreads.
Because many functions in virtio-blk are callbacks called
in some other virtio (pci, mmio, bus and so on) callbacks,
this is not trivial.
Patches 4-5-6 aim to split at least virtio-blk API.

There are two main things to consider when comparing this serie
with the block layer API split:

- sometimes we have data that is accessed by both IO and GS
  functions, but never together. For example, when the main
  loop access some data, iothread is guaranteed to be stopped.

- taking into account the multiqueue setup:
  this work aims to allow an iothread to access multiple
  virtio queues, while assigning the same queue to only one
  iothread. Currently, we have a single iothread running,
  so if we know that the main loop is not interfering, we
  are safe. However, if we want to consider multiple iothreads
  concurrently running, we need to take additional precautions.

A good example of the above is in patch 7.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Emanuele Giuseppe Esposito (8):
  virtio_queue_aio_attach_host_notifier: remove AioContext lock
  block-backend: enable_write_cache should be atomic
  virtio_blk_process_queued_requests: always run in a bh
  virtio: categorize callbacks in GS
  virtio-blk: mark GLOBAL_STATE_CODE functions
  virtio-blk: mark IO_CODE functions
  VirtIOBlock: protect rq with its own lock
  virtio-blk: remove unnecessary AioContext lock from function already
    safe

 block/block-backend.c           |   6 +-
 hw/block/dataplane/virtio-blk.c |  32 +++++++-
 hw/block/virtio-blk.c           | 132 ++++++++++++++++++++++++--------
 hw/scsi/virtio-scsi-dataplane.c |  12 ++-
 hw/virtio/virtio-bus.c          |   5 ++
 hw/virtio/virtio-pci.c          |   2 +
 hw/virtio/virtio.c              |   8 ++
 include/hw/virtio/virtio-blk.h  |   6 +-
 8 files changed, 163 insertions(+), 40 deletions(-)

-- 
2.31.1


