Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD6A54F28C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 10:13:18 +0200 (CEST)
Received: from localhost ([::1]:42926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o276T-0005hZ-Nk
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 04:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lX-0005iR-Ps
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:39 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28828 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lV-0007CE-M7
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452297; x=1686988297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9BQbAYhTHcp9nvYnIPNZuPTdIll34iEZ3zx7wpIT7GI=;
 b=hk1ZDfPRfgXXxFE2aAhcXtR0C6vRmBu+2m7fhd52vFI/swetuDAdX79u
 GTTIYZfJvbIB4i0PUWMOrDqGyoYDoJEZofo5avC55AUNcjzJ+NXtSlwoQ
 7vzo/KXzhMb4lKRFyws9U96sUCFaUe9U9cic7Ey65YL1PmYJzVL5SlIsn
 2kDoPJjj6u1idJF+ZTCYoBx55+BQ66I7CuDHisZOH4QLH831+fxKtJafW
 Ef5Pbfg9ueQ31VHd/wDc3qDSILc1egcLf1mmXDWnoDEqVOsmhaJ6QVHAY
 z16YQHgPN6D0MMnxUq1a3lH/d6sLtRgdmWry2vuCvdVLiEdZRnm2V1JDN w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102182"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102182"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936779"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:34 -0700
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
Subject: [RFC PATCH 11/12] docs/devel: Add userspace-ebpf.rst
Date: Fri, 17 Jun 2022 15:36:29 +0800
Message-Id: <20220617073630.535914-12-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617073630.535914-1-chen.zhang@intel.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Introduce userspace ebpf basic knowledge.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 docs/devel/userspace-ebpf.rst | 106 ++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 docs/devel/userspace-ebpf.rst

diff --git a/docs/devel/userspace-ebpf.rst b/docs/devel/userspace-ebpf.rst
new file mode 100644
index 0000000000..41eb9b04d6
--- /dev/null
+++ b/docs/devel/userspace-ebpf.rst
@@ -0,0 +1,106 @@
+===========================
+Userspace eBPF support
+===========================
+
+eBPF is a revolutionary technology with origins in the Linux kernel that
+can run sandboxed programs in an operating system kernel. It is used to
+safely and efficiently extend the capabilities of the kernel without
+requiring to change kernel source code or load kernel
+modules.(from https://ebpf.io/)
+
+Recently, I worked on QEMU net filter related jobs, like netfilter/iptables
+in kernel. We noticed kernel extend the netfilter original cBPF to eBPF,
+
+It make Linux kernel have the ability to load code dynamically. Why not
+enable user space eBPF in QEMU? It can load binary eBPF program even
+when VM running. Add some hooks in QEMU as the user space eBPF load point.
+Do the things on different layers. The original idea from Jason Wang.
+
+
+That’s the advantages of kernel eBPF. Most of the functions can be
+implemented in QEMU. The Power of Programmability.
+
+    1). Safety:
+
+    Building on the foundation of seeing and understanding all system
+    calls and combining that with a packet and socket-level view of all
+    networking operations allows for revolutionary new approaches to
+    securing systems.
+
+    2). Tracing & Profiling:
+
+    The ability to attach eBPF programs to trace points as well as kernel
+    and user application probe points allows unprecedented visibility into
+    the runtime behavior of applications and the system itself.
+
+    3). Networking:
+
+    The combination of programmability and efficiency makes eBPF a natural
+    fit for all packet processing requirements of networking solutions.
+
+    4). Observability & Monitoring:
+
+    Instead of relying on static counters and gauges exposed by the
+    perating system, eBPF enables the collection & in-kernel aggregation
+    of custom metrics and generation of visibility events based on a wide
+    range of possible sources.
+
+    Qemu userspace ebpf design based on ubpf project (https://github.com/iovisor/ubpf).
+    The most mature userspace ebpf implementation. This project officially
+    support by iovisor(Like BCC and bpftrace). Qemu userspace ebpf make
+    the ubpf project as the git submodule.
+
+    Current implementation support load ebpf program and run it in
+    filter-ubpf module, developer can easy reuse the ubpf function in
+    Qemu's other modules from the function in /ebpf/ubpf.c, And it support JIT.
+    For the uBPF License is Apache License 2.0, It's OK to compatible
+    with QEMU’s GPLv2 LICENSE same as mason.
+
+    How to use it:
+    1. Write your ebpf C program. For example filter dst IP:
+
+    bpf_filter.c
+
+#include <arpa/inet.h>
+#include <stdint.h>
+
+#define ONE_ONE_ONE_ONE 0x01010101
+
+struct ipv4_header {
+    uint8_t ver_ihl;
+    uint8_t tos;
+    uint16_t total_length;
+    uint16_t id;
+    uint16_t frag;
+    uint8_t ttl;
+    uint8_t proto;
+    uint16_t csum;
+    uint32_t src;
+    uint32_t dst;
+};
+
+int is_dst_one_one_one_one(void *opaque) {
+    struct ipv4_header *ipv4_header = (struct ipv4_header*)opaque;
+
+    if (ntohl(ipv4_header->dst) == ONE_ONE_ONE_ONE) {
+        return 1;
+    }
+
+    return 0;
+}
+
+    2. Build it with clang:
+      clang -O2 -target bpf -c bpf_filter.c -o ip_dst.o
+
+    3. Load it with Qemu filter-ubpf:
+      -object filter-ubpf,netdev=hn0,id=ubpf1,queue=tx,ip-mode=on,
+       ubpf-handler=ip_dst.o
+
+    4. Boot the VM and it will filt IP dst 1.1.1.1 packet.
+
+
+TODO: Need to add more comments and test-case for ubpf, current
+      implementation not include ebpf verifier. Qemu is a userspace
+      program, not like kernel ebpf run code in kernel space, I think
+      if the someone want to hack Qemu code no need to load a malicious
+      ubpf program, he can hack Qemu code directly.
-- 
2.25.1


