Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532C933AE72
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:17:11 +0100 (CET)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjLa-0000br-2a
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJJ-0007Mq-Na
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:14:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJG-0007Vh-GV
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=orilAnhps7LPtSyqJLZhYl/Tyr3rcle9Kqlj9bwz4ng=;
 b=QbNnngP/nwRtGutgWFseyxbc4rhlfd0dRFTb97Ls2FmSKXuEF1kueaFEsV1I1/s3pmbnCN
 DAbeyL9K1Ro7+6w+jf0xdr8pkcQTRL/VojFlBisz4WdyU0RtD9oxm8lHSo0jW1nQ4ZgxvR
 bXyiEQRDHKziVndZinyP8k45ubOVX+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-dsQEuFaqPWuTsLopc_KoNQ-1; Mon, 15 Mar 2021 05:14:42 -0400
X-MC-Unique: dsQEuFaqPWuTsLopc_KoNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24E45100C61B;
 Mon, 15 Mar 2021 09:14:41 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-105.pek2.redhat.com
 [10.72.13.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F1C5100164C;
 Mon, 15 Mar 2021 09:14:36 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 00/20] Net patches
Date: Mon, 15 Mar 2021 17:14:13 +0800
Message-Id: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-03-14 17:47:49 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to f2e8319d456724c3d8514d943dc4607e2f08e88a:

  net: Do not fill legacy info_str for backends (2021-03-15 16:41:22 +0800)

----------------------------------------------------------------

Changes since V1:
- drop the workaound of "-nic" id and fix the merge
- add the series of query-netdev

----------------------------------------------------------------
Alexander Bulekov (4):
      rtl8139: switch to use qemu_receive_packet() for loopback
      pcnet: switch to use qemu_receive_packet() for loopback
      cadence_gem: switch to use qemu_receive_packet() for loopback
      lan9118: switch to use qemu_receive_packet() for loopback

Alexey Kirillov (5):
      qapi: net: Add query-netdev command
      tests: Add tests for query-netdev command
      net: Move NetClientState.info_str to dynamic allocations
      hmp: Use QAPI NetdevInfo in hmp_info_network
      net: Do not fill legacy info_str for backends

Bin Meng (1):
      net: Fix build error when DEBUG_NET is on

Cornelia Huck (1):
      pvrdma: wean code off pvrdma_ring.h kernel header

Jason Wang (8):
      virtio-net: calculating proper msix vectors on init
      e1000: fail early for evil descriptor
      net: introduce qemu_receive_packet()
      e1000: switch to use qemu_receive_packet() for loopback
      dp8393x: switch to use qemu_receive_packet() for loopback packet
      msf2-mac: switch to use qemu_receive_packet() for loopback
      sungem: switch to use qemu_receive_packet() for loopback
      tx_pkt: switch to use qemu_receive_packet_iov() for loopback

Paolo Bonzini (1):
      net: validate that ids are well formed

 hw/core/machine.c                                  |   1 +
 hw/net/cadence_gem.c                               |   4 +-
 hw/net/dp8393x.c                                   |   2 +-
 hw/net/e1000.c                                     |   6 +-
 hw/net/lan9118.c                                   |   2 +-
 hw/net/msf2-emac.c                                 |   2 +-
 hw/net/net_tx_pkt.c                                |   2 +-
 hw/net/pcnet.c                                     |   2 +-
 hw/net/rtl8139.c                                   |   2 +-
 hw/net/sungem.c                                    |   2 +-
 hw/net/xen_nic.c                                   |   5 +-
 hw/rdma/vmw/pvrdma.h                               |   5 +-
 hw/rdma/vmw/pvrdma_cmd.c                           |   6 +-
 hw/rdma/vmw/pvrdma_dev_ring.c                      |  41 +++--
 hw/rdma/vmw/pvrdma_dev_ring.h                      |   9 +-
 hw/rdma/vmw/pvrdma_main.c                          |   4 +-
 hw/virtio/virtio-net-pci.c                         |  10 +-
 include/net/net.h                                  |  10 +-
 include/net/queue.h                                |   8 +
 include/qapi/hmp-output-visitor.h                  |  30 ++++
 .../drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h | 114 ------------
 net/l2tpv3.c                                       |   8 +-
 net/net.c                                          | 117 +++++++++++--
 net/netmap.c                                       |   7 +
 net/queue.c                                        |  22 +++
 net/slirp.c                                        | 124 ++++++++++++-
 net/socket.c                                       |  92 +++++++---
 net/tap-win32.c                                    |  10 +-
 net/tap.c                                          | 107 ++++++++++--
 net/vde.c                                          |  25 ++-
 net/vhost-user.c                                   |  20 ++-
 net/vhost-vdpa.c                                   |  15 +-
 qapi/hmp-output-visitor.c                          | 193 +++++++++++++++++++++
 qapi/meson.build                                   |   1 +
 qapi/net.json                                      |  80 +++++++++
 scripts/update-linux-headers.sh                    |   3 +-
 tests/qtest/meson.build                            |   3 +
 tests/qtest/test-query-netdev.c                    | 120 +++++++++++++
 38 files changed, 990 insertions(+), 224 deletions(-)
 create mode 100644 include/qapi/hmp-output-visitor.h
 delete mode 100644 include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
 create mode 100644 qapi/hmp-output-visitor.c
 create mode 100644 tests/qtest/test-query-netdev.c



