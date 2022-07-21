Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A42D57D209
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:54:26 +0200 (CEST)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZRR-0002N3-CS
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEZH6-0001kq-6F
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:43:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEZH3-0000WN-JB
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:43:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ei9QIwSZQMwZJESBZeqnfzBpveknvR3zgdSHoSahorI=;
 b=FmdmB+euJQX8+z3mDKEKRZO9BKPmUErGCypok50besSXioCPwhywrt5Oz4+j3Br9Vn+gsZ
 RwOUpzQJijasB+VcgcXCO8bp7c9FLETKhUGDuJaNPmqps4S9SGGpDnX+QbEgkAvafFuLZD
 /knmCOwgQaQQ0SkqgeKygUvMn0U8QBE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-jYaNykRUMJ6H5boW9xQObQ-1; Thu, 21 Jul 2022 12:43:36 -0400
X-MC-Unique: jYaNykRUMJ6H5boW9xQObQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0138F29DD98C;
 Thu, 21 Jul 2022 16:43:36 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30D6F40E80E0;
 Thu, 21 Jul 2022 16:43:33 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 0/6] Control VQ is the way net devices use to send changes to
 the device state, like
Date: Thu, 21 Jul 2022 18:43:25 +0200
Message-Id: <20220721164331.3328625-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

=0D
QEMU needs to intercept this queue so it can track these changes and is abl=
e to=0D
migrate the device. It can do it from 1576dbb5bbc4 ("vdpa: Add x-svq to=0D
NetdevVhostVDPAOptions"). However, to enable x-svq implies to shadow all Vi=
rtIO=0D
device's virtqueues, which will damage performance.=0D
=0D
This series adds address space isolation, so the device and the guest=0D
communicate directly with them (passthrough) and CVQ communication is split=
 in=0D
two: The guest communicates with QEMU and QEMU forwards the commands to the=
=0D
device.=0D
=0D
This series is based on [1], although each one of them adds a feature on=0D
isolation and could be merged individually once conflicts are solved.=0D
=0D
Comments are welcome. Thanks!=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03101.html=
=0D
=0D
Eugenio P=C3=A9rez (6):=0D
  linux-headers: Update kernel headers to v5.19-rc1=0D
  vdpa: Use v->shadow_vqs_enabled in vhost_vdpa_svqs_start=0D
  vdpa: Allocate SVQ unconditionally=0D
  vdpa: Add asid parameter to vhost_vdpa_dma_map/unmap=0D
  vdpa: Store x-svq parameter in VhostVDPAState=0D
  vdpa: Always start CVQ in SVQ mode=0D
=0D
 include/hw/virtio/vhost-vdpa.h               |   8 +-=0D
 include/net/vhost-vdpa.h                     |   1 +=0D
 include/standard-headers/asm-x86/bootparam.h |   1 +=0D
 include/standard-headers/drm/drm_fourcc.h    |  69 ++++++++=0D
 include/standard-headers/linux/ethtool.h     |   1 +=0D
 include/standard-headers/linux/input.h       |   1 +=0D
 include/standard-headers/linux/pci_regs.h    |   1 +=0D
 include/standard-headers/linux/vhost_types.h |  11 +-=0D
 include/standard-headers/linux/virtio_ids.h  |  14 +-=0D
 linux-headers/asm-arm64/kvm.h                |  27 +++=0D
 linux-headers/asm-generic/unistd.h           |   4 +-=0D
 linux-headers/asm-riscv/kvm.h                |  20 +++=0D
 linux-headers/asm-riscv/unistd.h             |   3 +-=0D
 linux-headers/asm-x86/kvm.h                  |  11 +-=0D
 linux-headers/asm-x86/mman.h                 |  14 --=0D
 linux-headers/linux/kvm.h                    |  54 +++++-=0D
 linux-headers/linux/userfaultfd.h            |  10 +-=0D
 linux-headers/linux/vfio.h                   |   4 +-=0D
 linux-headers/linux/vhost.h                  |  26 ++-=0D
 hw/net/vhost_net.c                           |   4 +=0D
 hw/virtio/vhost-vdpa.c                       |  64 +++----=0D
 net/vhost-vdpa.c                             | 166 ++++++++++++++++++-=0D
 hw/virtio/trace-events                       |   4 +-=0D
 23 files changed, 434 insertions(+), 84 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D


