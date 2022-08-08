Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA6258C5E9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 11:51:22 +0200 (CEST)
Received: from localhost ([::1]:43072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKzPo-0007x8-8k
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 05:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oKzGo-0002D0-TX
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 05:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oKzGl-000287-2g
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 05:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659951714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=T2Cc6SuDtQv3kqvgQI7rAPL59HzINkK4ipPqAyE6ek8=;
 b=bzWVvZwxNvWykdeaVQmomm+i7XPZPiMtXOMGflRyor77CORMYuQty7Pxo/jQJXUMKR1OVG
 Tn7GoFCcgLVExweB4RTDT23+zfgdk9KSVsaQhSACVlWyeLtHo3hULaV1GHwxUSkwzJQdVQ
 IK0yM8+jb7fFOxTpC6Z1/x2LM+2t16Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418--sJFK3KjMAijhs1dUhH8UA-1; Mon, 08 Aug 2022 05:41:51 -0400
X-MC-Unique: -sJFK3KjMAijhs1dUhH8UA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24E9E8853B8;
 Mon,  8 Aug 2022 09:41:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBF1D1121314;
 Mon,  8 Aug 2022 09:41:48 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 0/2] virtio-blk and scsi: replace
 dataplane_{start/stopping/started}
Date: Mon,  8 Aug 2022 05:41:45 -0400
Message-Id: <20220808094147.612472-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

The way the dataplane stages at startup and stop are monitored is unnecessary
complicated. In virtio-scsi we have dataplane_started, dataplane_starting and
dataplane_stopping in VirtIOSCSI.
In virtio-blk we have dataplene_started in VirtIOBlock, and starting and stopping
in VirtIOBlockDataPlane.

Just replace all these flags with an atomic enum.

Based-on: 20220803162824.948023-1-stefanha@redhat.com

Emanuele Giuseppe Esposito (2):
  virtio-scsi: replace VirtIOBlock dataplane_{start/starting/stopped}
    with enum
  virtio-blk: replace dataplane_start/stopping/started with enum

 hw/block/dataplane/virtio-blk.c | 24 +++++++++---------------
 hw/block/virtio-blk.c           |  9 +++++----
 hw/scsi/virtio-scsi-dataplane.c | 21 +++++++++------------
 hw/scsi/virtio-scsi.c           | 10 ++++++----
 include/hw/virtio/virtio-blk.h  |  2 +-
 include/hw/virtio/virtio-scsi.h |  5 ++---
 include/hw/virtio/virtio.h      |  7 +++++++
 7 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.31.1


