Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D595824A1EB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 16:40:35 +0200 (CEST)
Received: from localhost ([::1]:50834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8PGU-0001fm-PF
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 10:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k8PFE-0000B3-6g
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:39:16 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48716
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k8PFC-000235-D4
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597847953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vx+3IUdSHi5sS/rEaV2CzoZ7Awo9tH5T9LtEFmi/dkQ=;
 b=dUQqVDYkHJJRw22K4oi6oCNV/ktSrU5xm5rDDoGfqwJKEAuxxGBNE6GcMLzlaM0fobuGQF
 OYTqcUZeEfCHolCwvMGqt+FfRNQoi6Ps4klwBk1sm2UmwCQtcKc23zPe5bExMVwA5zdy8O
 QNbr3II2vryExQgaD+3zvSIT9zuLwzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-_W9IcSCQP16LxvVzwVGBsA-1; Wed, 19 Aug 2020 10:39:10 -0400
X-MC-Unique: _W9IcSCQP16LxvVzwVGBsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57D271014DF9;
 Wed, 19 Aug 2020 14:39:09 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-40.ams2.redhat.com
 [10.36.113.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 069C87A427;
 Wed, 19 Aug 2020 14:38:52 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] vhost-vsock: force virtio version 1
Date: Wed, 19 Aug 2020 16:38:48 +0200
Message-Id: <20200819143851.78069-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 01:46:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Qinghua Cheng <qcheng@redhat.com>,
 Qian Cai <caiqian@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-stable@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
   - Fixed commit message in patche 1 and 2 [Cornelia]
   - Added Cornelia's R-b tags in all patches

v1: https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg04373.html

Recenlty changes in QEMU 5.1 requires to set 'disable-legacy=on'
on vhost-vsock-pci and vhost-user-vsock-pci devices:

    $ ./qemu-system-x86_64 ... -device vhost-vsock-pci,guest-cid=5
        qemu-system-x86_64: -device vhost-vsock-pci,guest-cid=5:
        device is modern-only, use disable-legacy=on

As discussed with Cornelia [1], this series force virtio version 1
to vhost-vsock-pci, vhost-user-vsock-pci, and vhost-vsock-ccw devices.

virtio-vsock was introduced after the release of VIRTIO 1.0 specifications,
so it should be 'modern-only'.
In addition Cornelia verified that forcing a legacy mode on vhost-vsock-pci
device using x86-64 host and s390x guest, so with different endianness,
produces strange behaviours.

About migration, QEMU 5.1 already requires that the source and destination
specify 'disable-legacy=on', otherwise the migration fails in this way:
    qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x2 read: 12 device: 53 cmask: ff wmask: 0 w1cmask:0
    qemu-system-x86_64: Failed to load PCIDevice:config
    qemu-system-x86_64: Failed to load virtio-vhost_vsock:virtio
    qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-vhost_vsock'
    qemu-system-x86_64: load of migration failed: Invalid argument

With this series applied there is the same requirements. Alternatively
we have to detach and re-attach the device manually.

Thanks,
Stefano

[1] https://lists.nongnu.org/archive/html/qemu-devel/2020-08/msg02515.html

Stefano Garzarella (3):
  vhost-vsock-pci: force virtio version 1
  vhost-user-vsock-pci: force virtio version 1
  vhost-vsock-ccw: force virtio version 1

 hw/s390x/vhost-vsock-ccw.c       | 2 ++
 hw/virtio/vhost-user-vsock-pci.c | 2 +-
 hw/virtio/vhost-vsock-pci.c      | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.26.2


