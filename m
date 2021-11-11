Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049C144D5A3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:14:06 +0100 (CET)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml81t-00007A-4b
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:14:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml7uk-0004f2-IV
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml7uh-0001fX-Th
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636628798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oaSi240uVvSKO2XAISG82gGvTH8Rbyra0Zvf9cVvIxE=;
 b=AVuXg4aWTCplPNu24xxbBmoAO3rMytycS/aZbq/BJrlhY0omgZN+NappvKqZQ+uIZvOThx
 W8/7KC8pGfqbdjTWS/BOTRlp3nXjYDInxIDNzXcFECDNx0Fd1gwHa2PCsQYqw+ifvRuDsb
 22tsn/G9EI1VWHi8sswDn6pSzdHaP4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-zRk2tNfxNyy9bYsqwR9pbQ-1; Thu, 11 Nov 2021 06:06:35 -0500
X-MC-Unique: zRk2tNfxNyy9bYsqwR9pbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04A4D802E66;
 Thu, 11 Nov 2021 11:06:34 +0000 (UTC)
Received: from avogadro.lan (unknown [10.39.194.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66EC91048128;
 Thu, 11 Nov 2021 11:06:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] Update linux-headers + NOIRQ support for KVM gdbstub
Date: Thu, 11 Nov 2021 12:05:59 +0100
Message-Id: <20211111110604.207376-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cohuck@redhat.com, mst@redhat.com, alex.bennee@linaro.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first two patches update linux-headers to 5.16-rc1.  This require
a small change to virtio-gpu as well.

The remaining three patches are a rework of Maxim's patch to support
KVM_GUESTDBG_BLOCKIRQ, adjusted to not break compilation on non-x86
architectures.

Maxim Levitsky (3):
  gdbstub: reject unsupported flags in handle_set_qemu_sstep
  gdbstub, kvm: let KVM report supported singlestep flags
  kvm: add support for KVM_GUESTDBG_BLOCKIRQ

Paolo Bonzini (2):
  virtio-gpu: do not byteswap padding
  linux-headers: update to 5.16-rc1

 accel/kvm/kvm-all.c                           |  29 +++++
 gdbstub.c                                     |  81 ++++++++----
 include/hw/virtio/virtio-gpu-bswap.h          |   1 -
 include/standard-headers/drm/drm_fourcc.h     | 121 +++++++++++++++++-
 include/standard-headers/linux/ethtool.h      |  31 +++++
 include/standard-headers/linux/fuse.h         |  10 +-
 include/standard-headers/linux/pci_regs.h     |   6 +
 include/standard-headers/linux/virtio_gpu.h   |  18 ++-
 include/standard-headers/linux/virtio_ids.h   |  24 ++++
 include/standard-headers/linux/virtio_vsock.h |   3 +-
 include/sysemu/kvm.h                          |  15 +++
 linux-headers/asm-arm64/unistd.h              |   1 +
 linux-headers/asm-generic/unistd.h            |  22 +++-
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/unistd_32.h         |   1 +
 linux-headers/asm-powerpc/unistd_64.h         |   1 +
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/asm-x86/kvm.h                   |   5 +
 linux-headers/asm-x86/unistd_32.h             |   3 +
 linux-headers/asm-x86/unistd_64.h             |   3 +
 linux-headers/asm-x86/unistd_x32.h            |   3 +
 linux-headers/linux/kvm.h                     |  40 +++++-
 25 files changed, 375 insertions(+), 48 deletions(-)

-- 
2.33.1


