Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954D54F250
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 09:59:20 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o26sx-0005KB-65
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 03:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lA-00056z-Hi
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:17 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28788 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26l5-000732-Md
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452271; x=1686988271;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tzeS0hO1JnM03aicZR+7mz3VOHwOk704VZ/FWiaj9jQ=;
 b=glnrHpQ6bdBC1q71JxbijTd11dqI4dL6fQS7oCFPbtdmscSKa5Kw/VnV
 bzhL0lkBqvsFGZgMONXAyahe17+macUuksTPhUQk9mfqaEli88b5KUgaH
 Z6Jh1SHO2HIJ1J9WUlwrAZsx+52xwFUeCc6DQbs9pc9rz/QRXqeqkUVAM
 O7lwXWkeIdwNBNNtpisLD99kJaoowl7lq/MI//8ieb1uRH8+mvJmuWe0R
 VtgJxYi0KoFNF4L3WKlDhs4WiidXL+p8VC6LMfc3W77Z7m70tYYcZl9QN
 5rrNgN6KcwZLE/jXRGaAdtPYUO6kIRYpySC08YV6sFGP7uX4SvowNXCDZ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102094"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102094"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:03 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936606"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:01 -0700
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
Subject: [RFC PATCH 00/12] Introduce QEMU userspace ebpf support
Date: Fri, 17 Jun 2022 15:36:18 +0800
Message-Id: <20220617073630.535914-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
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

Hi All,

    The goal of this series is to bring the power of ebpf to QEMU.
It makes QEMU have the ability to extend the capabilities without
requiring changing source code. Just need to load the eBPF binary
file even at VM runtime. And already have some userspace ebpf
implementation like: Intel DPDK eBPF, windows eBPF, etc..
The original idea suggested by Jason Wang.

    eBPF is a revolutionary technology with origins in the Linux kernel
that can run sandboxed programs in an operating system kernel. It is
used to safely and efficiently extend the capabilities of the kernel
without requiring to change kernel source code or load kernel
modules.(from https://ebpf.io/)

    KVM already got benefits from it, but QEMU did not. Hence we want
to bring the power of eBPF to QEMU. It can load binary eBPF program
even when VM running. At the same time, add some hooks in QEMU as
the user space eBPF load point. Do the things on different layers.

   That’s the advantages of kernel eBPF. Most of the functions can be
implemented in QEMU. This series just a start of the Power of Programmability.

    1). Safety:

    Building on the foundation of seeing and understanding all system
    calls and combining that with a packet and socket-level view of all
    networking operations allows for revolutionary new approaches to
    securing systems.

    2). Tracing & Profiling:

    The ability to attach eBPF programs to trace points as well as kernel
    and user application probe points allows unprecedented visibility into
    the runtime behavior of applications and the system itself.

    3). Networking:

    The combination of programmability and efficiency makes eBPF a natural
    fit for all packet processing requirements of networking solutions.

    4). Observability & Monitoring:

    Instead of relying on static counters and gauges exposed by the
    perating system, eBPF enables the collection & in-kernel aggregation
    of custom metrics and generation of visibility events based on a wide
    range of possible sources.

    QEMU userspace ebpf design based on ubpf project (https://github.com/iovisor/ubpf).
The most mature userspace ebpf implementation. This project officially
support by iovisor(Like BCC and bpftrace). This project includes an eBPF
assembler, disassembler, interpreter (for all platforms), and JIT compiler
(for x86-64 and Arm64 targets). Qemu userspace ebpf make the ubpf project
as the git submodule.

    Current implementation support load ebpf program and run it in
net/filter-ubpf module, this filter can support any user defined rules
to hanle network packet. At the same time, it's easy for other developers
to use the ubpf infrastructue in QEMU's other modules from the function
in /ebpf/ubpf.c, and it support JIT.

    For the uBPF License is Apache License 2.0, It's OK to compatible
with QEMU’s GPLv2 LICENSE same as mason.

    TODO: Need to add more comments and test-case for ubpf, current
implementation not include ebpf verifier. But I think maybe it's not
a big problem, current ebpf load/unload API exposed by QMP command.
Qemu is a userspace program, if someone want to hack QEMU, no need to
load a malicious ubpf program, it can hack QEMU code or crash QEMU on
host directly(different from kernel ebpf needs strict inspection, but
yes, it still need basic check).

Any comments are welcome.

Thanks
Chen


Zhang Chen (12):
  configure: Add iovisor/ubpf project as a submodule for QEMU
  meson: Add ubpf build config and misc
  ebpf/uBPF: Introduce userspace ebpf data structure
  ebpf/uBPF: Introduce ubpf initialize functions
  ebpf/uBPF: Add qemu_prepare_ubpf to load ebpf binary
  ebpf/uBPF: Add qemu_ubpf_run_once excute real ebpf program
  net/filter: Introduce filter-ubpf module
  qapi: Add FilterUbpfProperties and qemu-options
  softmmu/vl.c: Add filter-ubpf for netdev as other netfilters
  net/filter-ubpf.c: run the ubpf program to handle network packet
  docs/devel: Add userspace-ebpf.rst
  test/qtest: Add ubpf basic test case

 .gitmodules                         |   3 +
 configure                           |  20 +++
 docs/devel/userspace-ebpf.rst       | 106 ++++++++++++++
 ebpf/meson.build                    |   1 +
 ebpf/ubpf-stub.c                    |  35 +++++
 ebpf/ubpf.c                         | 217 ++++++++++++++++++++++++++++
 ebpf/ubpf.h                         |  44 ++++++
 meson.build                         |  47 ++++++
 meson_options.txt                   |   3 +
 net/filter-ubpf.c                   | 185 ++++++++++++++++++++++++
 net/meson.build                     |   1 +
 qapi/qom.json                       |  18 +++
 qemu-options.hx                     |   6 +
 scripts/coverity-scan/COMPONENTS.md |   3 +
 scripts/meson-buildoptions.sh       |   5 +
 softmmu/vl.c                        |   3 +-
 tests/qtest/demo_ubpf.o             | Bin 0 -> 544 bytes
 tests/qtest/integer_5.mem           | Bin 0 -> 4 bytes
 tests/qtest/meson.build             |   3 +-
 tests/qtest/ubpf-test.c             |  64 ++++++++
 ubpf                                |   1 +
 21 files changed, 763 insertions(+), 2 deletions(-)
 create mode 100644 docs/devel/userspace-ebpf.rst
 create mode 100644 ebpf/ubpf-stub.c
 create mode 100644 ebpf/ubpf.c
 create mode 100644 ebpf/ubpf.h
 create mode 100644 net/filter-ubpf.c
 create mode 100644 tests/qtest/demo_ubpf.o
 create mode 100644 tests/qtest/integer_5.mem
 create mode 100644 tests/qtest/ubpf-test.c
 create mode 160000 ubpf

-- 
2.25.1


