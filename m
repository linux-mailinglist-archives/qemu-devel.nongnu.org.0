Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFA354F2A3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 10:17:42 +0200 (CEST)
Received: from localhost ([::1]:47148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o27Ai-00009w-It
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 04:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26la-0005qN-UT
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:43 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28828 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lY-0007CE-N5
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452300; x=1686988300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ORE+TXo+6a7hc6uGzt4dLpzWhvEAhI8+MLcS8zWXwFA=;
 b=YOvsPuWIDgADVCVOyZR4lGPw7KRVv5Y5mLzsH5+Yj2XdUCN6TcoPcbyH
 /MJlE0xxobqlvXsSYAmAHU/UMae+I2uAFAhFdDK/pyDcT4iMEogCZQKM4
 c2Lj5OUldZP4xZlao6QDQJuWAMM9msDAanyOeeDGglHCwA7Q/BKutcnWe
 Kzo7IOr4gybzQabmSfDfNPNwN88LU51VYdUWeZh7vWy3bcGJqAlO8y/li
 qlALwathExJ166mHyaMWADgVzFiltcuqJuHBWQ6dwxkMYvtGM812q1EmC
 2/3zIKhoFtMZvuIdyyzgwMMCGxkFJjS3GvG4g4SniLIFfimuv0Z3a47B4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102192"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102192"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936783"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:37 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Zhang Chen <chen.zhang@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
Subject: [RFC PATCH 12/12] test/qtest: Add ubpf basic test case
Date: Fri, 17 Jun 2022 15:36:30 +0800
Message-Id: <20220617073630.535914-13-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617073630.535914-1-chen.zhang@intel.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

TODO: This test case does not work. Need add ubpf.h header in qtest
compile "-I ../ubpf/vm -I ../ubpf/vm/inc".
I'm not sure if we need it in qtest. Because normal tests/qtest
not including external module test case like fdt. Or we just
need a qtest case for filter-ubpf module.
This test will load pre-compiled ebpf binary and run it in QEMU.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 tests/qtest/demo_ubpf.o   | Bin 0 -> 544 bytes
 tests/qtest/integer_5.mem | Bin 0 -> 4 bytes
 tests/qtest/meson.build   |   3 +-
 tests/qtest/ubpf-test.c   |  64 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/demo_ubpf.o
 create mode 100644 tests/qtest/integer_5.mem
 create mode 100644 tests/qtest/ubpf-test.c

diff --git a/tests/qtest/demo_ubpf.o b/tests/qtest/demo_ubpf.o
new file mode 100644
index 0000000000000000000000000000000000000000..960a411c224348548db42d9ae2716ae3ef4ea249
GIT binary patch
literal 544
zcmb<-^>JfjWMqH=MuzVU2p&w7f#Csy$>0EHJ20>URVE5RB+`KtNZ(Wl7bhtPlwo1`
z_#a&XJ5WG~fe9`w0b}Wvq*jzLBo(B^7Zl~EGw9{yl;y@Jrlb@VXQnfh0>yPpQj1IU
zk{R@hONvSolYn$(E{LWM&;lC6jK!!0P%$esIrOjt@j;jkO`QXj5BDdO&w-{66uitn
o|MP)V1G3ZtWDbzc0_CIIZv+%agepQ)1eEE4qz|MHW<Shb0E~Jd)c^nh

literal 0
HcmV?d00001

diff --git a/tests/qtest/integer_5.mem b/tests/qtest/integer_5.mem
new file mode 100644
index 0000000000000000000000000000000000000000..a786e127004dd9e94e88fda7742d248237ad8885
GIT binary patch
literal 4
LcmZQ&U|;|M02lxU

literal 0
HcmV?d00001

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 31287a9173..9cc629e22b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -94,7 +94,8 @@ qtests_i386 = \
    'migration-test',
    'test-x86-cpuid-compat',
    'numa-test',
-   'test-filter-redirector'
+   'test-filter-redirector',
+   'ubpf-test'
   ]
 
 if dbus_display
diff --git a/tests/qtest/ubpf-test.c b/tests/qtest/ubpf-test.c
new file mode 100644
index 0000000000..6e70a99320
--- /dev/null
+++ b/tests/qtest/ubpf-test.c
@@ -0,0 +1,64 @@
+/*
+ * QEMU Userspace eBPF test case
+ *
+ * Copyright(C) 2022 Intel Corporation.
+ *
+ * Author:
+ *  Zhang Chen <chen.zhang@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "ebpf/ubpf.h"
+
+/*
+ * Demo userspace ebpf program
+ * The test binary use clang to build this source code:
+ * demo_ubpf.c
+ *
+ * #include <stdint.h>
+ *
+ * static uint32_t double_it(uint32_t a)
+ * {
+ *      return (a * 2);
+ * }
+ *
+ * uint32_t bpf_prog(int32_t *arg) {
+ *       uint32_t result = 0;
+ *       result = double_it(*arg);
+ *
+ *       return result;
+ * }
+ *
+ * Build the userspace ebpf program binary file:
+ * clang -O2 -target bpf -c demo_ubpf.c -o demo_ubpf.o
+ *
+ * The external terget source:
+ * printf "%b" '\x05\x00\x00\x00' > integer_5.mem
+ *
+ */
+
+int main(int argc, char **argc)
+{
+    UbpfState u_ebpf;
+    char program_path[] = "demo_ubpf.o";
+    /* uBPF can read target from internal source or external source*/
+    char target_path[] = "integer_5.mem";
+
+    qemu_ubpf_init_jit(&u_ebpf, true);
+
+    g_assert_cmpuint(qemu_ubpf_prepare(&u_ebpf, program_path), ==, 0);
+
+    g_assert_true(qemu_ubpf_read_target(&u_ebpf, target_path));
+
+    g_assert_cmpuint(qemu_run_ubpf_once(&u_ebpf, u_ebpf.target,
+		     u_ebpf.target_len), ==, 10);
+
+    ubpf_destroy(u_ebpf.vm);
+
+    return 0;
+}
-- 
2.25.1


