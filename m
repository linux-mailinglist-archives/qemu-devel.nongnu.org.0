Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F5C3A1A1E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:49:00 +0200 (CEST)
Received: from localhost ([::1]:56060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0Rv-00013o-6u
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QL-00075n-Os
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QH-0003VW-QB
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623253636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CL9GhpRh/pGLiXhPSoVW35MjsVFrG4/zFL5bcoO9Ac4=;
 b=ZHr0e7kGuObgeDoAZ8knenit9jtB0eSc96hnlQueDBYXQy8jIUr+gh17OBvGVGquc5nCC7
 HH8QjQSiXv+QpMhh3t/B//Zjvvi2+e6X0bjhAAw7yFqhbWCLM8Vj6cPEKa0j+snE09hIUB
 8ppKH6d+HgZG5Xm8thPnHUVJzpFEDng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-bHtZJAeAPXKb1OjjyhEimg-1; Wed, 09 Jun 2021 11:47:13 -0400
X-MC-Unique: bHtZJAeAPXKb1OjjyhEimg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99F61107ACF6;
 Wed,  9 Jun 2021 15:47:12 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6744060C04;
 Wed,  9 Jun 2021 15:47:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/7] vhost-user-blk: Implement reconnection during realize
Date: Wed,  9 Jun 2021 17:46:51 +0200
Message-Id: <20210609154658.350308-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, raphael.norwitz@nutanix.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My previous series removed the broken implementation of automatic
reconnection during .realize(). This series adds some error reporting
improvements that allow distinguishing cases where reconnecting could
help from permanent errors, and then uses it to re-implement the
automatic reconnection during .realize(), as was requested during review
of the previous series.

Kevin Wolf (7):
  vhost: Add Error parameter to vhost_dev_init()
  vhost: Distinguish errors in vhost_backend_init()
  vhost: Return 0/-errno in vhost_dev_init()
  vhost-user-blk: Add Error parameter to vhost_user_blk_start()
  vhost: Distinguish errors in vhost_dev_get_config()
  vhost-user-blk: Factor out vhost_user_blk_realize_connect()
  vhost-user-blk: Implement reconnection during realize

 include/hw/virtio/vhost-backend.h |   5 +-
 include/hw/virtio/vhost.h         |   6 +-
 backends/cryptodev-vhost.c        |   5 +-
 backends/vhost-user.c             |   4 +-
 hw/block/vhost-user-blk.c         | 100 +++++++++++++++++++-----------
 hw/display/vhost-user-gpu.c       |   6 +-
 hw/input/vhost-user-input.c       |   6 +-
 hw/net/vhost_net.c                |   8 ++-
 hw/scsi/vhost-scsi.c              |   4 +-
 hw/scsi/vhost-user-scsi.c         |   4 +-
 hw/virtio/vhost-backend.c         |   6 +-
 hw/virtio/vhost-user-fs.c         |   3 +-
 hw/virtio/vhost-user-vsock.c      |  12 ++--
 hw/virtio/vhost-user.c            |  71 +++++++++++----------
 hw/virtio/vhost-vdpa.c            |   8 ++-
 hw/virtio/vhost-vsock.c           |   3 +-
 hw/virtio/vhost.c                 |  41 +++++++-----
 17 files changed, 174 insertions(+), 118 deletions(-)

-- 
2.30.2


