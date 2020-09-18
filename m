Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AAE26F758
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 09:49:30 +0200 (CEST)
Received: from localhost ([::1]:51960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJB97-0001oI-8B
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 03:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kJB7F-0000Eu-G7
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 03:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kJB7D-0008Nc-En
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 03:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600415250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sMNMOfTdcNI/qR0ZGSSFbtfufPIOLqC1b3YYA4dXFeI=;
 b=RjlH14OesEkE0osb+aif5ao6W2mMz/7BEMtUV0a7ybMLBkcrM1eQB9fbk2kSoB9F3lEiCn
 0WOMusSUPqoYts2cy9n5qAn9kGXukMY2L0QOtzMAMLTNMP23NpA9fBK/G2gF1AvYK1tPB0
 LdkAGY/lufe5iA10+znNbXTiXe8ArFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-es1F3mPfNWSMkKLhi6Ki5Q-1; Fri, 18 Sep 2020 03:47:27 -0400
X-MC-Unique: es1F3mPfNWSMkKLhi6Ki5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 861746408E;
 Fri, 18 Sep 2020 07:47:25 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-92.ams2.redhat.com
 [10.36.113.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E7EB3782;
 Fri, 18 Sep 2020 07:47:11 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 0/4] vhost-vsock: force virtio version 1
Date: Fri, 18 Sep 2020 09:47:06 +0200
Message-Id: <20200918074710.27810-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 01:32:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
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
 qemu-stable@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Qian Cai <caiqian@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:
   - Added patch 1 (v2: [1]) since it is a prerequisite for other patches
   - Patch 1:
     - added virtio_legacy_check_disabled() helper
     - moved warning where error was returned [Cornelia]
   - Patches 2 & 4:
     - forced virtio version 1 only with new machine types
     - removed Cornelia's R-b since I changed these patches

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
 hw/virtio/vhost-user-vsock-pci.c |  2 +-
 hw/virtio/vhost-vsock-pci.c      | 10 +++++++++-
 hw/virtio/virtio-pci.c           | 14 ++++++++++++--
 hw/virtio/virtio.c               |  7 +++++++
 8 files changed, 56 insertions(+), 7 deletions(-)

-- 
2.26.2


