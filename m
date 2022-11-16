Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F387D62C02F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:55:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIrG-0007SR-Nn; Wed, 16 Nov 2022 08:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrF-0007Pa-0v
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrD-0002i3-Dz
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bcsBfkFQTOaSun9OssVce9HAwmVumgtFtTRlkmmTu1s=;
 b=LyDazC9wV8xMoKS4GyGB0ua9Zcg89Z9pXryEvXrGmqmAOrYZR+hD1zcvXQcKRSRvOX/t1o
 yA4TM4xgC2h8PeTVxQxN6fiaXYIDDBcSklvdia7aHF4Z8aMlT0EPnNnjLJeERmrwUdtJiG
 4+6jUoDs9nbe2y/NFDpoSlHLIFyb+y4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-xLfI43RZOa2Fi8KGAgWrGw-1; Wed, 16 Nov 2022 08:53:35 -0500
X-MC-Unique: xLfI43RZOa2Fi8KGAgWrGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E880B1C09B6B;
 Wed, 16 Nov 2022 13:53:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B96A40C6EC3;
 Wed, 16 Nov 2022 13:53:34 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 0/6] Protect the block layer with a rwlock: part 2
Date: Wed, 16 Nov 2022 08:53:25 -0500
Message-Id: <20221116135331.3052923-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

Please read "Protect the block layer with a rwlock: part 1" for an additional
introduction and aim of this series.

This second part aims to add the graph rdlock to the BlockDriver functions
that already run in coroutine context and are classified as IO.
Such functions will recursively traverse the BlockDriverState graph, therefore
they need to be protected with the rdlock.

Based-on: <20221116134850.3051419-1-eesposit@redhat.com>

Thank you,
Emanuele

Emanuele Giuseppe Esposito (6):
  block: assert that bdrv_co_create is always called with graph rdlock
    taken
  block: assert that BlockDriver->bdrv_co_{amend/create} are called with
    graph rdlock taken
  block: assert that BlockDriver->bdrv_co_copy_range_{from/to} is always
    called with graph rdlock taken
  block/dirty-bitmap: assert that BlockDriver->bdrv_co_*_dirty_bitmap
    are always called with graph rdlock taken
  block/io: assert that BlockDriver->bdrv_co_*_snapshot_* are always
    called with graph rdlock taken
  block: assert that BlockDriver->bdrv_co_delete_file is always called
    with graph rdlock taken

 block.c                          |  2 ++
 block/amend.c                    |  1 +
 block/block-backend.c            |  2 ++
 block/create.c                   |  1 +
 block/dirty-bitmap.c             |  2 ++
 block/io.c                       |  7 +++++++
 include/block/block_int-common.h | 14 +++++++++++++-
 qemu-img.c                       |  4 +++-
 8 files changed, 31 insertions(+), 2 deletions(-)

-- 
2.31.1


