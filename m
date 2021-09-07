Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067BC4025F3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:08:11 +0200 (CEST)
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNX5O-0001aU-23
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNX14-00028s-EZ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:03:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mNX0z-0004cc-Ky
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631005415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JUHMNhyLTQdID+80M4TVp5jFV8D1UjEq2n5Ee713nQ8=;
 b=AWJ6UQ2cZzGNhDKWSwWGNTgzQV7s1flTvpXvj6cveDGJen+wgraYocVC7J//Li7YhjgkVQ
 8TOc8q39jGM7BkgxLCQ53HPwqnnBpZQPSAWZ7YP123emFoOXzLoZeps9LIdEE+fAtHtupI
 RVJHzrJ8OBLSZZEoKInE1TenYLLLWWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-VW1RK50fOHK72yDXtdKJSg-1; Tue, 07 Sep 2021 05:03:32 -0400
X-MC-Unique: VW1RK50fOHK72yDXtdKJSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AED5107ACCA;
 Tue,  7 Sep 2021 09:03:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-183.pek2.redhat.com
 [10.72.12.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79C0D5C1CF;
 Tue,  7 Sep 2021 09:03:24 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V3 00/10] vhost-vDPA multiqueue
Date: Tue,  7 Sep 2021 17:03:12 +0800
Message-Id: <20210907090322.1756-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eperezma@redhat.com, elic@nvidia.com, gdawar@xilinx.com,
 lingshan.zhu@intel.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All:

This patch implements the multiqueue support for vhost-vDPA. The most
important requirement si the control virtqueue support. The virtio-net
and vhost-net core are tweak to support control virtqueue as if what
data queue pairs are done: a dedicated vhost_net device which is
coupled with the NetClientState is intrdouced so most of the existing
vhost codes could be reused with minor changes. This means the control
virtqueue will bypass the Qemu. With the control virtqueue, vhost-vDPA
are extend to support creating and destroying multiqueue queue pairs
plus the control virtqueue.

For the future, if we want to support live migration, we can either do
shadow cvq on top or introduce new interfaces for reporting device
states.

Tests are done via the vp_vdpa driver in L1 guest.

Changes since V2:

- rebase to qemu master
- use "queue_pairs" instead of "qps"
- typo fixes

Changes since V1:

- start and stop vhost devices when all queues were setup
- fix the case when driver doesn't support MQ but device support
- correctly set the batching capability to avoid a map/unmap storm
- various other tweaks

Jason Wang (10):
  vhost-vdpa: open device fd in net_init_vhost_vdpa()
  vhost-vdpa: classify one time request
  vhost-vdpa: prepare for the multiqueue support
  vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
  net: introduce control client
  vhost-net: control virtqueue support
  virtio-net: use "queue_pairs" instead of "queues" when possible
  vhost: record the last virtqueue index for the virtio device
  virtio-net: vhost control virtqueue support
  vhost-vdpa: multiqueue support

 hw/net/vhost_net.c             |  55 ++++++++---
 hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
 hw/virtio/vhost-vdpa.c         |  56 +++++++++--
 include/hw/virtio/vhost-vdpa.h |   1 +
 include/hw/virtio/vhost.h      |   2 +
 include/hw/virtio/virtio-net.h |   5 +-
 include/net/net.h              |   5 +
 include/net/vhost_net.h        |   6 +-
 net/net.c                      |  24 ++++-
 net/vhost-vdpa.c               | 127 ++++++++++++++++++++++---
 10 files changed, 328 insertions(+), 118 deletions(-)

-- 
2.25.1


