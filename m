Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD36471B2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:26:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3HoH-0003j8-HJ; Thu, 08 Dec 2022 09:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3Hnu-0003b4-6c
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:23:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3Hns-0000eA-JW
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670509391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iyzkvQbTV5itapvyJgj59PnUvQiehZAVhL9ApqIfLSM=;
 b=JjLyWixsk3rJoooNpMkQhOd8ajf0zFcYger/4lEf+bwWo/e5XlZD+1FlZPoIvh6/vVt8yd
 LhxlHZbQ7XHwrBPesIDVeC/8C0LFWkcsH1X6GH/g1eJrMC44XK5GokjB3KXuVTedFbc0wQ
 aTgDtocLJAo84FSDJAZqt7rGHl0jhWI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-t6ChVkKAOa2iB_Ai7NvuSg-1; Thu, 08 Dec 2022 09:23:09 -0500
X-MC-Unique: t6ChVkKAOa2iB_Ai7NvuSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EC2786C04F
 for <qemu-devel@nongnu.org>; Thu,  8 Dec 2022 14:23:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54BAA40C2064;
 Thu,  8 Dec 2022 14:23:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 415C521E6921; Thu,  8 Dec 2022 15:23:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 0/4] coroutine: Clean up includes
Date: Thu,  8 Dec 2022 15:23:02 +0100
Message-Id: <20221208142306.2642640-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Markus Armbruster (4):
  coroutine: Clean up superfluous inclusion of qemu/coroutine.h
  coroutine: Move coroutine_fn to qemu/osdep.h, trim includes
  coroutine: Clean up superfluous inclusion of qemu/lockable.h
  coroutine: Break inclusion loop

 crypto/block-luks-priv.h      |  1 -
 include/block/aio_task.h      |  2 --
 include/block/block-common.h  |  1 -
 include/block/raw-aio.h       |  1 -
 include/monitor/hmp.h         |  1 -
 include/qemu/coroutine.h      | 21 ++++++++-------------
 include/qemu/lockable.h       |  1 -
 include/qemu/osdep.h          | 16 ++++++++++++++++
 include/qemu/progress_meter.h |  2 +-
 include/qemu/ratelimit.h      |  2 +-
 include/qemu/seqlock.h        |  2 +-
 include/scsi/pr-manager.h     |  1 -
 linux-user/fd-trans.h         |  2 +-
 nbd/nbd-internal.h            |  1 -
 backends/tpm/tpm_emulator.c   |  2 +-
 block/progress_meter.c        |  2 ++
 blockjob.c                    |  1 -
 cpus-common.c                 |  2 +-
 crypto/block-luks.c           |  1 -
 hw/9pfs/codir.c               |  1 -
 hw/9pfs/cofile.c              |  1 -
 hw/9pfs/cofs.c                |  1 -
 hw/9pfs/coxattr.c             |  1 -
 hw/hyperv/hyperv.c            |  2 +-
 hw/usb/ccid-card-emulated.c   |  2 +-
 hw/vfio/platform.c            |  2 +-
 plugins/core.c                |  2 +-
 plugins/loader.c              |  2 +-
 tests/unit/test-coroutine.c   |  2 --
 tests/unit/test-vmstate.c     |  1 -
 ui/spice-display.c            |  2 +-
 util/log.c                    |  2 +-
 util/qemu-coroutine-lock.c    |  1 -
 util/qemu-coroutine-sleep.c   |  1 -
 util/qemu-coroutine.c         |  1 -
 util/qemu-timer.c             |  2 +-
 util/rcu.c                    |  2 +-
 util/vfio-helpers.c           |  2 +-
 util/yank.c                   |  2 +-
 39 files changed, 43 insertions(+), 51 deletions(-)

-- 
2.37.3


