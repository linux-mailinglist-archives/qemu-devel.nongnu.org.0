Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F57694199
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:44:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVMz-0003Vg-6l; Mon, 13 Feb 2023 04:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMu-0003V0-Mp
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:28 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMo-0002Wd-HM
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281402; x=1707817402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3JLKYI/TmroIpzJpWyf/1+s7LOWq05BHBDSvbGiL0SI=;
 b=hRrNHTwjYgz1sqZfn8Ck2BQj6SM/jCXUgt0DfoAymDB+UzP27FjG4lKY
 1d+gsicXhSrlsj8mBvQxWXYE2EFfXvf0fEbjS529J3o+IYUsWr4uT1rGT
 5eodZmQBsw/RyW7JJuBQbIPGW8ghYgVIWsoyv6DDyig4vqjQ5HGyw3HP+
 U/Afnx4ZYIR7irxA8yB/nG1zn4bWF56eL0qY1Po17KB4aasWiC7I0tVP5
 S3S4x/vYt9Lz/y7SVpbkX83+JHoEV2wPZYtCuUHhfbYOSB3NSGkB756BM
 5N5t6JJQEmXiSFnbY3eoxWYUTi0rkE0SKgV1EmfsVVr5bGKEOHtwcwPCh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486376"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486376"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759812"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759812"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:18 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 05/52] hw/core/machine: Rename machine-smp.c to machine-topo.c
Date: Mon, 13 Feb 2023 17:49:48 +0800
Message-Id: <20230213095035.158240-6-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Zhao Liu <zhao1.liu@intel.com>

Hybrid topology support will also be added to this file.

In order to maintain the semantic consistency of the file name and
content, the file name is changed to "machine-topo.c".

This file will handle all cpu topology related things, thus also change
the file description comment.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS                               | 2 +-
 hw/core/{machine-smp.c => machine-topo.c} | 2 +-
 hw/core/meson.build                       | 2 +-
 tests/unit/meson.build                    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename hw/core/{machine-smp.c => machine-topo.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71c1bc24371b..58794885ced3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1733,7 +1733,7 @@ F: cpu.c
 F: hw/core/cpu.c
 F: hw/core/machine-qmp-cmds.c
 F: hw/core/machine.c
-F: hw/core/machine-smp.c
+F: hw/core/machine-topo.c
 F: hw/core/null-machine.c
 F: hw/core/numa.c
 F: hw/cpu/cluster.c
diff --git a/hw/core/machine-smp.c b/hw/core/machine-topo.c
similarity index 99%
rename from hw/core/machine-smp.c
rename to hw/core/machine-topo.c
index 3fd9e641efde..8066d2c46bef 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-topo.c
@@ -1,5 +1,5 @@
 /*
- * QEMU Machine core (related to -smp parsing)
+ * QEMU Machine core (related to CPU topology)
  *
  * Copyright (c) 2021 Huawei Technologies Co., Ltd
  *
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 7a4d02b6c050..71d523dc6826 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -23,7 +23,7 @@ else
 endif
 
 common_ss.add(files('cpu-common.c'))
-common_ss.add(files('machine-smp.c'))
+common_ss.add(files('machine-topo.c'))
 softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
 softmmu_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
 softmmu_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index a9df2843e92e..1720a769f1a2 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -46,7 +46,7 @@ tests = {
   'test-uuid': [],
   'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
   'test-qapi-util': [],
-  'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
+  'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-topo.c'],
   'test-interval-tree': [],
 }
 
-- 
2.34.1


