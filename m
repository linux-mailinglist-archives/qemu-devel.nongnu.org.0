Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890B4AE315
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 22:37:40 +0100 (CET)
Received: from localhost ([::1]:48830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHYB9-0006ia-9O
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 16:37:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nHXPi-0002UX-Kh
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:48:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nHXPf-00045P-09
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644353314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UyS9Gs6WPZZOHV221cJY/4Uav285rJZ0tbUZRNxSYng=;
 b=E0rdR6/fEbWPPBjG1/lG0JeuvxoXgc2lV3NUa/9YLPKpT8q+ojI7ZPL8Ja5W6pWM/WfgOu
 cqrQiKpPSm/LrffAjILZkUiPgPca+F0By6V1ASEUmzxh42NkEpMuTOCcNQk0ZfLkEhN0+/
 VRUqbvZ37dYO5F2Uo4kxwCRDFCiUmGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-gw5kmyC8MTGNoh_HXuiTCA-1; Tue, 08 Feb 2022 15:48:33 -0500
X-MC-Unique: gw5kmyC8MTGNoh_HXuiTCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 791DC83DEAA
 for <qemu-devel@nongnu.org>; Tue,  8 Feb 2022 20:48:32 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.18.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1784A100EB3D;
 Tue,  8 Feb 2022 20:48:24 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id AC8ED22045A; Tue,  8 Feb 2022 15:48:23 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v6 00/10] virtiofsd: Add support for file security context at
 file creation
Date: Tue,  8 Feb 2022 15:48:03 -0500
Message-Id: <20220208204813.682906-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: mszeredi@redhat.com, berrange@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is V6 of the patches. I posted V5 here.

https://listman.redhat.com/archives/virtio-fs/2022-February/msg00012.html

This patch series basically allows client to send a security context 
(which is expected to be xattr security.selinux and its content) to
virtiofsd and it will set that security context on file during creation
based on various settings. Hence, this patch series basically allows
supporting SELinux with virtiofs.

There are primarily 3 modes.

- If no security context enabled, then it continues to create files without
  security context.

- If security context is enabled and but security.selinux has not been
  remapped, then it uses /proc/thread-self/attr/fscreate knob to set
  security context and then create the file. This will make sure that
  newly created file gets the security context as set in "fscreate" and
  this is atomic w.r.t file creation.

  This is useful and host and guest SELinux policies don't conflict and
  can work with each other. In that case, guest security.selinux xattr
  is not remapped and it is passthrough as "security.selinux" xattr
  on host.

- If security context is enabled but security.selinux xattr has been
  remapped to something else, then it first creates the file and then
  uses setxattr() to set the remapped xattr with the security context.
  This is a non-atomic operation w.r.t file creation.

  This mode will be most versatile and allow host and guest to have their
  own separate SELinux xattrs and have their own separate SELinux policies.

Changes since V5:

- Added some documentation to recommend using xattr remapping to remap
  "security.selinux" to "trusted.virtiofs.security.selinux" and also 
  give CAP_SYS_ADMIN to daemon. Also put a warning to make users aware
  of trade-off involved here. ("Daniel P. Berrangé")

- Used macro endof() to determine end of fuse_init_in struct. (David
  Gilbert).

- Added a check to make sure fsecctx->size is not zero. Also added
  "return" statement at few places where it was required. (David Gilbert)

- Split patch 7 in the series. Some of the handling of setting and
  clearing fscreate knob has been moved into a separate patch. Found
  it hard to break it down further. So it helps a bit but not too
  much. (David Gilbert).

Thanks
Vivek

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

 docs/tools/virtiofsd.rst                      |  32 ++
 include/standard-headers/asm-x86/kvm_para.h   |   1 +
 include/standard-headers/drm/drm_fourcc.h     |  11 +
 include/standard-headers/linux/ethtool.h      |   1 +
 include/standard-headers/linux/fuse.h         |  60 ++-
 include/standard-headers/linux/pci_regs.h     | 142 +++---
 include/standard-headers/linux/virtio_gpio.h  |  72 +++
 include/standard-headers/linux/virtio_i2c.h   |  47 ++
 include/standard-headers/linux/virtio_iommu.h |   8 +-
 .../standard-headers/linux/virtio_pcidev.h    |  65 +++
 include/standard-headers/linux/virtio_scmi.h  |  24 +
 linux-headers/asm-generic/unistd.h            |   5 +-
 linux-headers/asm-mips/unistd_n32.h           |   2 +
 linux-headers/asm-mips/unistd_n64.h           |   2 +
 linux-headers/asm-mips/unistd_o32.h           |   2 +
 linux-headers/asm-powerpc/unistd_32.h         |   2 +
 linux-headers/asm-powerpc/unistd_64.h         |   2 +
 linux-headers/asm-riscv/bitsperlong.h         |  14 +
 linux-headers/asm-riscv/mman.h                |   1 +
 linux-headers/asm-riscv/unistd.h              |  44 ++
 linux-headers/asm-s390/unistd_32.h            |   2 +
 linux-headers/asm-s390/unistd_64.h            |   2 +
 linux-headers/asm-x86/kvm.h                   |  16 +-
 linux-headers/asm-x86/unistd_32.h             |   1 +
 linux-headers/asm-x86/unistd_64.h             |   1 +
 linux-headers/asm-x86/unistd_x32.h            |   1 +
 linux-headers/linux/kvm.h                     |  17 +
 tools/virtiofsd/fuse_common.h                 |   9 +-
 tools/virtiofsd/fuse_i.h                      |   7 +
 tools/virtiofsd/fuse_lowlevel.c               | 168 +++++--
 tools/virtiofsd/helper.c                      |   1 +
 tools/virtiofsd/passthrough_ll.c              | 414 ++++++++++++++++--
 32 files changed, 1044 insertions(+), 132 deletions(-)
 create mode 100644 include/standard-headers/linux/virtio_gpio.h
 create mode 100644 include/standard-headers/linux/virtio_i2c.h
 create mode 100644 include/standard-headers/linux/virtio_pcidev.h
 create mode 100644 include/standard-headers/linux/virtio_scmi.h
 create mode 100644 linux-headers/asm-riscv/bitsperlong.h
 create mode 100644 linux-headers/asm-riscv/mman.h
 create mode 100644 linux-headers/asm-riscv/unistd.h

-- 
2.34.1


