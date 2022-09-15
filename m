Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8965B974D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 11:19:58 +0200 (CEST)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYl2K-0004Lo-3G
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 05:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oYkmr-0001hN-6P
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 05:03:57 -0400
Received: from mga12.intel.com ([192.55.52.136]:34512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oYkmo-0000mA-MT
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 05:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663232634; x=1694768634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eUpbFKFeS120f9OJFxxL+dbkPS31yNi6VcawZMtgSd0=;
 b=SMxfT8eadEW/EPNo1LJdESFWATRqilPJAN7knvU5dkDZFJwXl3MbGhTS
 qWkU6u95BdohiBIMRczuShQzosRmMEr/HbGmRwCBRjSjGaJhnPUL+8eyd
 cvD0OgOPEDZi5fMu4zciDsZfg/T3UiuvGGbiQZOk3l2t2rxfBcgFFE3RE
 JfTmKINzLrR4IiVqZoZK4LsLwCUi/X0Lhl/KuznFo1FvyBxbzg0kv+/Yr
 0ggZXCJsgdA2RZy/SrBBGG27gttgIRzPe+KI/4kWEYyFCT8Nn/nhH+yuy
 IxdVxazPXWE1kjKjorE0acNpyD9FjSxHV8IJ//y2LzYLaG8GAXeLjFKF9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="278388299"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; d="scan'208";a="278388299"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 02:03:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; d="scan'208";a="619619417"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 02:03:39 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] Update linux headers to v6.0-rc4 and fix the clang
 build error
Date: Thu, 15 Sep 2022 17:10:33 +0800
Message-Id: <20220915091035.3897-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=chenyi.qiang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

After updating linux headers to v6.0-rc, clang build on x86 target would
generate warnings related to -Wgnu-variable-sized-type-not-at-end.

Simply turn off this warning in this patch set.

---

Change logs
v2 -> v3
- A minor modification in commit message. (Cornelia Huck)
- v2: https://lore.kernel.org/qemu-devel/20220909035758.17434-1-chenyi.qiang@intel.com/

v1 -> v2:
- Change the patch order. (Peter Maydell)
- Expand the commit message in patch 1. (Peter Maydell)
- v1: https://lore.kernel.org/qemu-devel/20220908080749.32211-1-chenyi.qiang@intel.com/

---

Chenyi Qiang (2):
  configure: Add -Wno-gnu-variable-sized-type-not-at-end
  Update linux headers to v6.0-rc4

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


