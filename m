Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1AB2723E0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 14:27:43 +0200 (CEST)
Received: from localhost ([::1]:40946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKKv0-0005a4-3k
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 08:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kKKst-000450-BM
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 08:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kKKsr-0008Ke-8m
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 08:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600691126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0fvhbzkZBlah2ukn27UuxBi4t3g/ZUc8XC+naQ5iTZY=;
 b=e4zwur7r0CYWey0NODg7/rOi9YZ+r3FD0CPes8vXLpHUXBc2/Mq7rNr6pJJ9X/Z5lei/D0
 NFy1e44y6+nIWvZrJ49FaVZpLeSzVI66pZLrUO92DefvcJxDXYxFsKmp6xRqjRNJb1gzW5
 qLP0O+UzVvz/1zWtKHnlBIkyymV8MlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-DPSIcjk6MTOpBXI3a1A37A-1; Mon, 21 Sep 2020 08:25:23 -0400
X-MC-Unique: DPSIcjk6MTOpBXI3a1A37A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C789118BA289;
 Mon, 21 Sep 2020 12:25:21 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-150.ams2.redhat.com
 [10.36.113.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C95E6198B;
 Mon, 21 Sep 2020 12:25:06 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 0/4] vhost-vsock: force virtio version 1
Date: Mon, 21 Sep 2020 14:25:02 +0200
Message-Id: <20200921122506.82515-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:44:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Qinghua Cheng <qcheng@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Qian Cai <caiqian@redhat.com>, qemu-stable@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v5:
   - Patch 2: added a phrase about transitional device in the commit
     message [Cornelia]
   - All patches reviewed by Cornelia

v4: https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg07353.html
v3: https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg06549.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg04437.html
v1: https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg04373.html

Recently changes in QEMU 5.1 requires to set 'disable-legacy=on'
on vhost-vsock-pci and vhost-user-vsock-pci devices:

    $ ./qemu-system-x86_64 ... -device vhost-vsock-pci,guest-cid=5
        qemu-system-x86_64: -device vhost-vsock-pci,guest-cid=5:
        device is modern-only, use disable-legacy=on

As discussed with Cornelia [2], this series forces virtio version 1
to vhost-vsock-pci, vhost-user-vsock-pci, and vhost-vsock-ccw devices.

virtio-vsock was introduced after the release of VIRTIO 1.0 specifications,
so it should be 'modern-only'.
In addition Cornelia verified that forcing a legacy mode on vhost-vsock-pci
device using x86-64 host and s390x guest, so with different endianness,
produces strange behaviours.

This series should be merged in stable branch since it fixes migration issues
with QEMU 5.1:
- we skip legacy support check in the old machine types (< 5.1)
- we force virtio version 1 for vhost-vsock-pci and vhost-vsock-ccw devices
  only in the new machine types (>= 5.1). vhost-user-vsock-pci was introduced
  in 5.1 and doesn't support migration, so we forced virtio version 1 in any
  case,

Thanks,
Stefano

[1] https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg05312.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg02515.html

Stefano Garzarella (4):
  virtio: skip legacy support check on machine types less than 5.1
  vhost-vsock-pci: force virtio version 1
  vhost-user-vsock-pci: force virtio version 1
  vhost-vsock-ccw: force virtio version 1

 include/hw/virtio/virtio.h       |  2 ++
 hw/core/machine.c                |  1 +
 hw/s390x/vhost-vsock-ccw.c       | 12 ++++++++++++
 hw/s390x/virtio-ccw.c            | 15 ++++++++++++---
 hw/virtio/vhost-user-vsock-pci.c |  4 +++-
 hw/virtio/vhost-vsock-pci.c      | 10 +++++++++-
 hw/virtio/virtio-pci.c           | 14 ++++++++++++--
 hw/virtio/virtio.c               |  7 +++++++
 8 files changed, 58 insertions(+), 7 deletions(-)

-- 
2.26.2


