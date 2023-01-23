Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F796678726
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 21:05:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK33W-0003pP-Ed; Mon, 23 Jan 2023 15:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK33M-0003lX-9I
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:04:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK33J-0005iV-9z
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674504261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oDvrvmmPmhQf2Z20WpAM8rLIF1zHTn+7cdO7Xkoedqo=;
 b=JI71K5tM7v9+dKP9P+P8A7d1kuRsANF5e31RAhsNYl682zgV/VaCZSPte3AolioeAEtQAr
 lbRt7qKkQ59mRIOm9H0y2vY1rrTYOvHsGy7cjMlm+nV2DlzKe9nTGOu9IohUjAtFA56hOl
 KItwjcEds++xb20BgdIWAuL5JMR8lM8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-KLbw46Q4OVWzw8rv2mS5jw-1; Mon, 23 Jan 2023 15:04:19 -0500
X-MC-Unique: KLbw46Q4OVWzw8rv2mS5jw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BF10811E6E;
 Mon, 23 Jan 2023 20:04:19 +0000 (UTC)
Received: from localhost (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B615840FF72F;
 Mon, 23 Jan 2023 20:04:18 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 0/3] Block patches
Date: Mon, 23 Jan 2023 15:04:14 -0500
Message-Id: <20230123200417.169053-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

The following changes since commit 00b1faea41d283e931256aa78aa975a369ec3ae6:

  Merge tag 'pull-target-arm-20230123' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-01-23 13:40:28 +0000)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 4f01a9bb0461e8c11ee0c94d90a504cb7d580a85:

  block/blkio: Fix inclusion of required headers (2023-01-23 15:02:07 -0500)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Chao Gao (1):
  util/aio: Defer disabling poll mode as long as possible

Peter Krempa (1):
  block/blkio: Fix inclusion of required headers

Stefan Hajnoczi (1):
  virtio-blk: simplify virtio_blk_dma_restart_cb()

 include/hw/virtio/virtio-blk.h  |  2 --
 block/blkio.c                   |  2 ++
 hw/block/dataplane/virtio-blk.c | 17 +++++-------
 hw/block/virtio-blk.c           | 46 ++++++++++++++-------------------
 util/aio-posix.c                | 21 ++++++++++-----
 5 files changed, 43 insertions(+), 45 deletions(-)

-- 
2.39.0


