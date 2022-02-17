Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477334BA71D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:29:48 +0100 (CET)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkbC-0006oo-Sq
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:29:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKkXJ-0004DA-LS
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:25:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKkXF-0003tj-7E
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645118740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LfN8wUeLePhFk27KQNDPhUHsyygUsdca2d/r/4wkG/w=;
 b=SIOTEoac+mAALUtIekP1CQBkJarK2rr4nXCb0AvSufwAaBQrlaAOsx7cV9p8BpssLmIXPt
 m9lAN/lhx2gQHQ5GmJxuB3mX5Qbx16QhD9Dc19jviqxXRAtdXiBXumaGa0b8Z+NqQkZqo3
 dBRVryzfP9DWxluzsUc6D00YB7bTgvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-PF2Mdn84Nje36QtRPtZfqw-1; Thu, 17 Feb 2022 12:25:36 -0500
X-MC-Unique: PF2Mdn84Nje36QtRPtZfqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F44118B6141;
 Thu, 17 Feb 2022 17:25:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E16F384A19;
 Thu, 17 Feb 2022 17:25:05 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, groug@kaod.org,
 sebastian.hasler@stuvus.uni-stuttgart.de
Subject: [PULL 00/12] virtiofs queue
Date: Thu, 17 Feb 2022 17:24:48 +0000
Message-Id: <20220217172500.60500-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20220217b

for you to fetch changes up to 45b04ef48dbbeb18d93c2631bf5584ac493de749:

  virtiofsd: Add basic support for FUSE_SYNCFS request (2022-02-17 17:22:26 +0000)

----------------------------------------------------------------
V3: virtiofs pull 2022-02-17

Security label improvements from Vivek
  - includes a fix for building against new kernel headers
  [V3: checkpatch style fixes]
  [V2: Fix building on old Linux]
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
 tools/virtiofsd/fuse_lowlevel.c                | 180 ++++++++--
 tools/virtiofsd/fuse_lowlevel.h                |  13 +
 tools/virtiofsd/helper.c                       |   1 +
 tools/virtiofsd/passthrough_ll.c               | 467 +++++++++++++++++++++++--
 tools/virtiofsd/passthrough_seccomp.c          |   1 +
 34 files changed, 1123 insertions(+), 132 deletions(-)
 create mode 100644 include/standard-headers/linux/virtio_gpio.h
 create mode 100644 include/standard-headers/linux/virtio_i2c.h
 create mode 100644 include/standard-headers/linux/virtio_pcidev.h
 create mode 100644 include/standard-headers/linux/virtio_scmi.h
 create mode 100644 linux-headers/asm-riscv/bitsperlong.h
 create mode 100644 linux-headers/asm-riscv/mman.h
 create mode 100644 linux-headers/asm-riscv/unistd.h


