Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A425F8CF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 12:50:04 +0200 (CEST)
Received: from localhost ([::1]:36908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFEip-0001Y3-9N
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 06:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kFEi4-0000tb-Kp
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 06:49:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kFEi2-0005Z3-SD
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 06:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599475753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ae7f6irsUFFWK5PL1/2523vA7Al9YZKubyW3h/Rgyg4=;
 b=VbkCjnXDlB4RkTPlFy3Hr1RbBSjaWYzDxS3j5X98Y26JKjuOrCez0GS7SpA3wXZyVdkzNa
 p62QsAVzaBxc/UC0L/lHxW0rbnK5TTX0ysL7ajoaAoHdpsgqALsa0j6++TDsLuyXvQGusV
 w1DNHEWnDjxROH8kOkhN+hrdJGl1z9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-Bni8OlWyNf-l21AyQvp2_w-1; Mon, 07 Sep 2020 06:49:11 -0400
X-MC-Unique: Bni8OlWyNf-l21AyQvp2_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 636AC1074660;
 Mon,  7 Sep 2020 10:49:10 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-108.pek2.redhat.com [10.72.12.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3A010013C4;
 Mon,  7 Sep 2020 10:49:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] Vhost-vDPA: batch IOTLB updating
Date: Mon,  7 Sep 2020 18:49:00 +0800
Message-Id: <20200907104903.31551-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 05:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: elic@nvidia.com, Jason Wang <jasowang@redhat.com>, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all:

This series introduces batch IOTLB updating support for vhost-vDPA.

Smoking test was done through vDPA simulator. Please reivew.

Thanks

Jason Wang (3):
  linux headers: sync to 5.9-rc4
  vhost: switch to use IOTLB v2 format
  vhost-vdpa: batch updating IOTLB mappings

 hw/virtio/vhost-backend.c                     |  86 +++++++++--
 hw/virtio/vhost-vdpa.c                        |  66 +++++++++
 hw/virtio/vhost.c                             |  10 ++
 include/hw/virtio/vhost-backend.h             |   2 +
 include/hw/virtio/vhost-vdpa.h                |   1 +
 include/hw/virtio/vhost.h                     |   1 +
 include/standard-headers/drm/drm_fourcc.h     | 140 ++++++++++++++++++
 include/standard-headers/linux/ethtool.h      |  87 +++++++++++
 .../linux/input-event-codes.h                 |   3 +-
 include/standard-headers/linux/vhost_types.h  |  11 ++
 include/standard-headers/linux/virtio_9p.h    |   4 +-
 include/standard-headers/linux/virtio_blk.h   |  26 ++--
 .../standard-headers/linux/virtio_config.h    |   8 +-
 .../standard-headers/linux/virtio_console.h   |   8 +-
 include/standard-headers/linux/virtio_net.h   |   6 +-
 include/standard-headers/linux/virtio_scsi.h  |  20 +--
 linux-headers/asm-generic/unistd.h            |   6 +-
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/kvm.h               |   5 +
 linux-headers/asm-powerpc/unistd_32.h         |   1 +
 linux-headers/asm-powerpc/unistd_64.h         |   1 +
 linux-headers/asm-s390/kvm.h                  |   7 +-
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/asm-x86/unistd_32.h             |   1 +
 linux-headers/asm-x86/unistd_64.h             |   1 +
 linux-headers/asm-x86/unistd_x32.h            |   1 +
 linux-headers/linux/kvm.h                     |   4 +
 linux-headers/linux/vfio.h                    |   2 +-
 linux-headers/linux/vhost.h                   |   2 +
 32 files changed, 458 insertions(+), 57 deletions(-)

-- 
2.20.1


