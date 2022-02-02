Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418464A798B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 21:34:04 +0100 (CET)
Received: from localhost ([::1]:42224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFMKJ-0007wN-5p
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 15:34:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nFLU9-0004XF-0t
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:40:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nFLU1-00045a-5X
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643830800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rud894fgEPbsJSAWuYgVkQzhLrwjuf4zm11nRklcvP8=;
 b=Af8b460qV4nNuAvGXa53AxvPXG3VFpf67XdidosGa22lFa81W4DmsOoXDWwo0M5LRSS/AX
 SaMdfzDmXZLaYiEznHkic4obMxBzFY7GTCzOPQL2sPxAM2+T/NLBh1sMbV7m5U9iTXO48Q
 RubqGEoDk0iiKVnU1VSMhWFH/+nGH1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-Pu2ttWSSMaqlN13fNsjR8Q-1; Wed, 02 Feb 2022 14:39:59 -0500
X-MC-Unique: Pu2ttWSSMaqlN13fNsjR8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44599192AB6D
 for <qemu-devel@nongnu.org>; Wed,  2 Feb 2022 19:39:58 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A0A65F707;
 Wed,  2 Feb 2022 19:39:42 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id B9D4522053F; Wed,  2 Feb 2022 14:39:41 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v5 0/9] virtiofsd: Add support for file security context at
 file creation
Date: Wed,  2 Feb 2022 14:39:26 -0500
Message-Id: <20220202193935.268777-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mszeredi@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is V5 of the patches. I posted V4 here.

https://listman.redhat.com/archives/virtio-fs/2022-January/msg00041.html

These will allow us to support SELinux with virtiofs. This will send
SELinux context at file creation to server and server can set it on
file.

Changes since V4
----------------
- Parse only known current size of fuse_init_in. This will make sure
  that future extension does not break existing code upon header
  update. (David Gilbert)

- Changed order of one of the patch. It is first patch in series. This
  will help fix the breakage before header update patch and code remains
  git bisectable. (David Gilbert)

- Changed %lx to %llx at one place. (David Gilbert).

Thanks
Vivek
 
Vivek Goyal (9):
  virtiofsd: Fix breakage due to fuse_init_in size change
  linux-headers: Update headers to v5.17-rc1
  virtiofsd: Parse extended "struct fuse_init_in"
  virtiofsd: Extend size of fuse_conn_info->capable and ->want fields
  virtiofsd, fuse_lowlevel.c: Add capability to parse security context
  virtiofsd: Move core file creation code in separate function
  virtiofsd: Create new file with fscreate set
  virtiofsd: Create new file using O_TMPFILE and set security context
  virtiofsd: Add an option to enable/disable security label

 docs/tools/virtiofsd.rst                      |   7 +
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
 tools/virtiofsd/fuse_lowlevel.c               | 162 +++++--
 tools/virtiofsd/helper.c                      |   1 +
 tools/virtiofsd/passthrough_ll.c              | 414 ++++++++++++++++--
 32 files changed, 1013 insertions(+), 132 deletions(-)
 create mode 100644 include/standard-headers/linux/virtio_gpio.h
 create mode 100644 include/standard-headers/linux/virtio_i2c.h
 create mode 100644 include/standard-headers/linux/virtio_pcidev.h
 create mode 100644 include/standard-headers/linux/virtio_scmi.h
 create mode 100644 linux-headers/asm-riscv/bitsperlong.h
 create mode 100644 linux-headers/asm-riscv/mman.h
 create mode 100644 linux-headers/asm-riscv/unistd.h

-- 
2.34.1


