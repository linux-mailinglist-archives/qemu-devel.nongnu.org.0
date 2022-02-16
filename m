Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046AE4B8F50
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:40:08 +0100 (CET)
Received: from localhost ([::1]:34026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOHf-0000zI-1a
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:40:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOEP-0006co-Gg
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:36:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOEN-0007lm-32
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645033002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jgqOfFUeVmB1PP77MxOSs3Gt9K9nvIGNWlNZaWTlW5Q=;
 b=RMTrq6vVSrpZ0F3fNRVzUGooERDlyS1SaopUwDfp82o+3Fxxz2rG40IzLslJH2Y0Fte4/K
 y3k/KPx0gxAG66k1YxEcmuspPc1g7IvrY25NqYmPrBILTDDyN9xhP4Az/1w9j2LJwUlIET
 FfHfpVx13srQ/EBg5BECVaBJ4zOIGx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-GK6Fn6HXNYGksXxk-7FYxw-1; Wed, 16 Feb 2022 12:36:33 -0500
X-MC-Unique: GK6Fn6HXNYGksXxk-7FYxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8D841006AA0;
 Wed, 16 Feb 2022 17:36:32 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 571A27574C;
 Wed, 16 Feb 2022 17:36:31 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, groug@kaod.org,
 sebastian.hasler@stuvus.uni-stuttgart.de
Subject: [PULL 00/12] virtiofs queue
Date: Wed, 16 Feb 2022 17:36:13 +0000
Message-Id: <20220216173625.128109-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: virtio-fs@redhat.com, stefanha@redhat.com, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit c13b8e9973635f34f3ce4356af27a311c993729c:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20220216' into staging (2022-02-16 09:57:11 +0000)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20220216

for you to fetch changes up to 47cc3ef597b2ee926c13c9433f4f73645429e128:

  virtiofsd: Add basic support for FUSE_SYNCFS request (2022-02-16 17:29:32 +0000)

----------------------------------------------------------------
virtiofs pull 2022-02-16

Security label improvements from Vivek
  - includes a fix for building against new kernel headers
Blocking flock disable from Sebastian
SYNCFS support from Greg

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Greg Kurz (1):
      virtiofsd: Add basic support for FUSE_SYNCFS request

Sebastian Hasler (1):
      virtiofsd: Do not support blocking flock

Vivek Goyal (10):
      virtiofsd: Fix breakage due to fuse_init_in size change
      linux-headers: Update headers to v5.17-rc1
      virtiofsd: Parse extended "struct fuse_init_in"
      virtiofsd: Extend size of fuse_conn_info->capable and ->want fields
      virtiofsd, fuse_lowlevel.c: Add capability to parse security context
      virtiofsd: Move core file creation code in separate function
      virtiofsd: Add helpers to work with /proc/self/task/tid/attr/fscreate
      virtiofsd: Create new file with security context
      virtiofsd: Create new file using O_TMPFILE and set security context
      virtiofsd: Add an option to enable/disable security label

 docs/tools/virtiofsd.rst                       |  32 ++
 include/standard-headers/asm-x86/kvm_para.h    |   1 +
 include/standard-headers/drm/drm_fourcc.h      |  11 +
 include/standard-headers/linux/ethtool.h       |   1 +
 include/standard-headers/linux/fuse.h          |  60 +++-
 include/standard-headers/linux/pci_regs.h      | 142 ++++----
 include/standard-headers/linux/virtio_gpio.h   |  72 ++++
 include/standard-headers/linux/virtio_i2c.h    |  47 +++
 include/standard-headers/linux/virtio_iommu.h  |   8 +-
 include/standard-headers/linux/virtio_pcidev.h |  65 ++++
 include/standard-headers/linux/virtio_scmi.h   |  24 ++
 linux-headers/asm-generic/unistd.h             |   5 +-
 linux-headers/asm-mips/unistd_n32.h            |   2 +
 linux-headers/asm-mips/unistd_n64.h            |   2 +
 linux-headers/asm-mips/unistd_o32.h            |   2 +
 linux-headers/asm-powerpc/unistd_32.h          |   2 +
 linux-headers/asm-powerpc/unistd_64.h          |   2 +
 linux-headers/asm-riscv/bitsperlong.h          |  14 +
 linux-headers/asm-riscv/mman.h                 |   1 +
 linux-headers/asm-riscv/unistd.h               |  44 +++
 linux-headers/asm-s390/unistd_32.h             |   2 +
 linux-headers/asm-s390/unistd_64.h             |   2 +
 linux-headers/asm-x86/kvm.h                    |  16 +-
 linux-headers/asm-x86/unistd_32.h              |   1 +
 linux-headers/asm-x86/unistd_64.h              |   1 +
 linux-headers/asm-x86/unistd_x32.h             |   1 +
 linux-headers/linux/kvm.h                      |  17 +
 tools/virtiofsd/fuse_common.h                  |   9 +-
 tools/virtiofsd/fuse_i.h                       |   7 +
 tools/virtiofsd/fuse_lowlevel.c                | 179 ++++++++--
 tools/virtiofsd/fuse_lowlevel.h                |  13 +
 tools/virtiofsd/helper.c                       |   1 +
 tools/virtiofsd/passthrough_ll.c               | 467 +++++++++++++++++++++++--
 tools/virtiofsd/passthrough_seccomp.c          |   1 +
 34 files changed, 1122 insertions(+), 132 deletions(-)
 create mode 100644 include/standard-headers/linux/virtio_gpio.h
 create mode 100644 include/standard-headers/linux/virtio_i2c.h
 create mode 100644 include/standard-headers/linux/virtio_pcidev.h
 create mode 100644 include/standard-headers/linux/virtio_scmi.h
 create mode 100644 linux-headers/asm-riscv/bitsperlong.h
 create mode 100644 linux-headers/asm-riscv/mman.h
 create mode 100644 linux-headers/asm-riscv/unistd.h


