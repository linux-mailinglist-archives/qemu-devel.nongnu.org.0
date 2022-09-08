Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA55B165E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 10:08:30 +0200 (CEST)
Received: from localhost ([::1]:39806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWCaL-0005VS-2s
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 04:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oWCTd-000136-MW
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:01:33 -0400
Received: from mga01.intel.com ([192.55.52.88]:31664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oWCTb-0005Ap-9D
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662624091; x=1694160091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NHAikLzJjUoAYFy+vcxMfykzIjhsDzHiCIaM23r5SNI=;
 b=KpZcznFEztyZ0ATtD24UhMmvkPrOibEsPLtix0lZizFAGUkW8FIHd4AS
 wlGPwU24yk8LjGjqKycrClCokpHEk81Us9lSl2K5qrPhu7kYsKVrQ/JVi
 7WFYbLBz2llrndFXH8pP5Ojpl8QrkSyZ4EbVNHP68NoNuHOm1OUFv+Nh4
 YnkDSjeRmKjXp26uoWWVUEHRydcbxmjrsTDVX8TNpLpMXM1vjLEvrAfB/
 n9+nyMr1dzGsZq9/YcumYFn7vF+Pd7qrQzcBQZ8kSzgMmWMuQzqWS7CEj
 3exZs5ZVZSp1Su2hoMLW2wAFwyQ8kZSnDwdzfCcNf3F7AkcFlVbZg3cEW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="323295050"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="323295050"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 01:01:21 -0700
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="565846698"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 01:01:19 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Update linux headers to v6.0-rc4 and fix the clang build
 error
Date: Thu,  8 Sep 2022 16:07:47 +0800
Message-Id: <20220908080749.32211-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=192.55.52.88;
 envelope-from=chenyi.qiang@intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

After updating linux headers to v6.0-rc, clang build on x86 target would
generate warnings related to -Wgnu-variable-sized-type-not-at-end.

Simply turn off this warning in this patch set. If not suitable to turn it
off, any comments or suggestions are welcome.

Chenyi Qiang (2):
  Update linux headers to v6.0-rc4
  configure: Add -Wno-gnu-variable-sized-type-not-at-end

 configure                                     |   1 +
 include/standard-headers/asm-x86/bootparam.h  |   7 +-
 include/standard-headers/drm/drm_fourcc.h     |  73 +++++++-
 include/standard-headers/linux/ethtool.h      |  29 +--
 include/standard-headers/linux/input.h        |  12 +-
 include/standard-headers/linux/pci_regs.h     |  30 ++-
 include/standard-headers/linux/vhost_types.h  |  17 +-
 include/standard-headers/linux/virtio_9p.h    |   2 +-
 .../standard-headers/linux/virtio_config.h    |   7 +-
 include/standard-headers/linux/virtio_ids.h   |  14 +-
 include/standard-headers/linux/virtio_net.h   |  34 +++-
 include/standard-headers/linux/virtio_pci.h   |   2 +
 include/standard-headers/linux/virtio_ring.h  |  16 +-
 linux-headers/asm-arm64/kvm.h                 |  33 +++-
 linux-headers/asm-generic/unistd.h            |   4 +-
 linux-headers/asm-riscv/kvm.h                 |  22 +++
 linux-headers/asm-riscv/unistd.h              |   3 +-
 linux-headers/asm-s390/kvm.h                  |   1 +
 linux-headers/asm-x86/kvm.h                   |  33 ++--
 linux-headers/asm-x86/mman.h                  |  14 --
 linux-headers/linux/kvm.h                     | 172 +++++++++++++++++-
 linux-headers/linux/userfaultfd.h             |  10 +-
 linux-headers/linux/vduse.h                   |  47 +++++
 linux-headers/linux/vfio.h                    |   4 +-
 linux-headers/linux/vfio_zdev.h               |   7 +
 linux-headers/linux/vhost.h                   |  35 +++-
 26 files changed, 539 insertions(+), 90 deletions(-)

-- 
2.17.1


