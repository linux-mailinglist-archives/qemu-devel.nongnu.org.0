Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EE657B37D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:09:23 +0200 (CEST)
Received: from localhost ([::1]:50382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5hq-0000ah-Gc
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5c2-0007vz-VT
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:03:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5c0-0001Fh-32
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658307799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UqwFcMHYmGoHWM5dRV1Ls6RivYviUp4WDp79dEri0zA=;
 b=DMo/a+rY/oCp1map+befnIf0ZEfMJu7mmgfC08zAEyFQmPX4jaEO2IWkreTrN+IrnNkCwr
 XS3kL66Yp1MtYTunweX77Kj1TNWfgCpa40nyIWXiniDlQFasa9c8RGbCC1/g2dFHqlu7If
 qgbdb+gnqX/F90GtjdTmeYYV3i7SFrE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-coikhpcrP6y45_9qfWMqeg-1; Wed, 20 Jul 2022 05:03:18 -0400
X-MC-Unique: coikhpcrP6y45_9qfWMqeg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9A1E1C16B40;
 Wed, 20 Jul 2022 09:03:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-110.pek2.redhat.com
 [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3F49492C3B;
 Wed, 20 Jul 2022 09:03:15 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 00/25] Net patches
Date: Wed, 20 Jul 2022 17:02:48 +0800
Message-Id: <20220720090313.55169-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit d48125de38f48a61d6423ef6a01156d6dff9ee2c:

  Merge tag 'kraxel-20220719-pull-request' of https://gitlab.com/kraxel/qemu into staging (2022-07-19 17:40:36 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 8bdab83b34efb0b598be4e5b98e4f466ca5f2f80:

  net/colo.c: fix segmentation fault when packet is not parsed correctly (2022-07-20 16:58:08 +0800)

----------------------------------------------------------------

Changes since V1:
- Fix build erros of vhost-vdpa when virtio-net is not set

----------------------------------------------------------------
Eugenio Pérez (21):
      vhost: move descriptor translation to vhost_svq_vring_write_descs
      virtio-net: Expose MAC_TABLE_ENTRIES
      virtio-net: Expose ctrl virtqueue logic
      vdpa: Avoid compiler to squash reads to used idx
      vhost: Reorder vhost_svq_kick
      vhost: Move vhost_svq_kick call to vhost_svq_add
      vhost: Check for queue full at vhost_svq_add
      vhost: Decouple vhost_svq_add from VirtQueueElement
      vhost: Add SVQDescState
      vhost: Track number of descs in SVQDescState
      vhost: add vhost_svq_push_elem
      vhost: Expose vhost_svq_add
      vhost: add vhost_svq_poll
      vhost: Add svq avail_handler callback
      vdpa: Export vhost_vdpa_dma_map and unmap calls
      vhost-net-vdpa: add stubs for when no virtio-net device is present
      vdpa: manual forward CVQ buffers
      vdpa: Buffer CVQ support on shadow virtqueue
      vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs
      vdpa: Add device migration blocker
      vdpa: Add x-svq to NetdevVhostVDPAOptions

Zhang Chen (4):
      softmmu/runstate.c: add RunStateTransition support form COLO to PRELAUNCH
      net/colo: Fix a "double free" crash to clear the conn_list
      net/colo.c: No need to track conn_list for filter-rewriter
      net/colo.c: fix segmentation fault when packet is not parsed correctly

 hw/net/virtio-net.c                |  85 +++++----
 hw/virtio/vhost-shadow-virtqueue.c | 210 +++++++++++++++-------
 hw/virtio/vhost-shadow-virtqueue.h |  52 +++++-
 hw/virtio/vhost-vdpa.c             |  26 ++-
 include/hw/virtio/vhost-vdpa.h     |   8 +
 include/hw/virtio/virtio-net.h     |   7 +
 net/colo-compare.c                 |   2 +-
 net/colo.c                         |  11 +-
 net/filter-rewriter.c              |   2 +-
 net/meson.build                    |   3 +-
 net/trace-events                   |   1 +
 net/vhost-vdpa-stub.c              |  21 +++
 net/vhost-vdpa.c                   | 357 +++++++++++++++++++++++++++++++++++--
 qapi/net.json                      |   9 +-
 softmmu/runstate.c                 |   1 +
 15 files changed, 671 insertions(+), 124 deletions(-)
 create mode 100644 net/vhost-vdpa-stub.c



