Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B323FFCEE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:20:01 +0200 (CEST)
Received: from localhost ([::1]:51506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Me-0003W2-8J
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5Di-0008JR-UG
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:10:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5Dg-0002nQ-E4
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630660243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uf1EKtxMSLLT9+ipaFkbNuKk8orC2+2Fdt813fiqAUY=;
 b=bO5RevLNUuB1CRqzsePZtHd4knaF1I4QlqbkKARbY4lRp78XzWy1qOxOV8DUbnB8kjLdmm
 vPCt+EvTvOHTy84ocweJuhT2hnsqif94mdkiF0HrPu8sNu1Vbko+wLTjvYg+zS5nQgDJz+
 bWjRROBWt9Yjfds2VcFBZf0eq7mUr8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-nIDOlJLqMHeTA8qDuHtT6w-1; Fri, 03 Sep 2021 05:10:42 -0400
X-MC-Unique: nIDOlJLqMHeTA8qDuHtT6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75624801ADA;
 Fri,  3 Sep 2021 09:10:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-217.pek2.redhat.com
 [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97CC660C81;
 Fri,  3 Sep 2021 09:10:35 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 00/21] vhost-vDPA multiqueue
Date: Fri,  3 Sep 2021 17:10:10 +0800
Message-Id: <20210903091031.47303-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

Changes since V1:

- start and stop vhost devices when all queues were setup
- fix the case when driver doesn't support MQ but device support
- correctly set the batching capability to avoid a map/unmap storm
- various other tweaks

Please reivew.

Thanks

Jason Wang (21):
  vhost-vdpa: remove unused variable "acked_features"
  vhost-vdpa: correctly return err in vhost_vdpa_set_backend_cap()
  vhost_net: remove the meaningless assignment in vhost_net_start_one()
  vhost: use unsigned int for nvqs
  vhost_net: do not assume nvqs is always 2
  vhost-vdpa: remove the unnecessary check in vhost_vdpa_add()
  vhost-vdpa: don't cleanup twice in vhost_vdpa_add()
  vhost-vdpa: fix leaking of vhost_net in vhost_vdpa_add()
  vhost-vdpa: tweak the error label in vhost_vdpa_add()
  vhost-vdpa: fix the wrong assertion in vhost_vdpa_init()
  vhost-vdpa: remove the unncessary queue_index assignment
  vhost-vdpa: open device fd in net_init_vhost_vdpa()
  vhost-vdpa: classify one time request
  vhost-vdpa: prepare for the multiqueue support
  vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
  net: introduce control client
  vhost-net: control virtqueue support
  virito-net: use "qps" instead of "queues" when possible
  vhost: record the last virtqueue index for the virtio device
  virtio-net: vhost control virtqueue support
  vhost-vdpa: multiqueue support

 hw/net/vhost_net.c             |  60 ++++++++----
 hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
 hw/virtio/vhost-vdpa.c         |  58 ++++++++++--
 include/hw/virtio/vhost-vdpa.h |   1 +
 include/hw/virtio/vhost.h      |   4 +-
 include/hw/virtio/virtio-net.h |   5 +-
 include/net/net.h              |   5 +
 include/net/vhost_net.h        |   7 +-
 net/net.c                      |  24 ++++-
 net/tap.c                      |   1 +
 net/vhost-user.c               |   1 +
 net/vhost-vdpa.c               | 157 ++++++++++++++++++++++++-------
 12 files changed, 342 insertions(+), 146 deletions(-)

-- 
2.25.1


