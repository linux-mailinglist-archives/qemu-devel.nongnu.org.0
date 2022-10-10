Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B815FA7DB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 00:52:21 +0200 (CEST)
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi1dD-0001oI-U4
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 18:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1I7-0005vI-C8
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:24672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1I3-0005CM-7V
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665441027; x=1696977027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N4oN/BU47B6lOfEmpE4C3qKrhsgMUOFba1gHfTLJYqw=;
 b=EB2UwUESnd9rEX4d5oFDQfrRgOAHRZ3MzUqGJw1GmO3W9SdUrZq+u3pq
 4UNBf3zNex3K49fuphNjnpRHRFV2hoI9qFtLcF+QAke031ckgJdVgoqHm
 pKzF6A8QwxIQl01iGB36+uVftRr12B/F7z9PR7up0VAokMyBE0BwwO/TH
 ApXJ/s+SVX/SBkYW6ggsLWmKeKp7QN5C1qEdoeTwyVtkU/mynJSQeZLeZ
 r2SFtYUqEtDlpoYQV1gQU7+T1yTNaU2yWNnTDPGA8quMXyECBMIB4+v0f
 6hDFtYdimPrUHNIhNWyhCw0NkcICZMXasplzp1oyIgGN+y3fKhCqCZ1PA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291661235"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="291661235"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="628456956"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="628456956"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost) ([10.212.104.4])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:18 -0700
From: ira.weiny@intel.com
To: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
Subject: [RFC PATCH 0/6] QEMU CXL Provide mock CXL events and irq support
Date: Mon, 10 Oct 2022 15:29:38 -0700
Message-Id: <20221010222944.3923556-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=ira.weiny@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Oct 2022 18:44:32 -0400
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

From: Ira Weiny <ira.weiny@intel.com>

CXL Event records inform the OS of various CXL device events.  Thus far CXL
memory devices are emulated and therefore don't naturally have events which
will occur.

Add mock events and a HMP trigger mechanism to facilitate guest OS testing of
event support.

This support requires a follow on version of the event patch set.  The RFC was
submitted and discussed here:

	https://lore.kernel.org/linux-cxl/20220813053243.757363-1-ira.weiny@intel.com/

I'll post the lore link to the new version shortly.

Instructions for running this test.

Add qmp option to qemu:

	<host> $ qemu-system-x86_64 ... -qmp unix:/tmp/run_qemu_qmp_0,server,nowait ...

	OR

	<host> $ run_qemu.sh ... --qmp ...

Enable tracing of events within the guest:

	<guest> $ echo "" > /sys/kernel/tracing/trace
	<guest> $ echo 1 > /sys/kernel/tracing/events/cxl/enable
	<guest> $ echo 1 > /sys/kernel/tracing/tracing_on

Trigger event generation and interrupts in the host:

	<host> $ echo "cxl_event_inject cxl-devX" | qmp-shell -H /tmp/run_qemu_qmp_0

	Where X == one of the memory devices; cxl-dev0 should work.

View events on the guest:

	<guest> $ cat /sys/kernel/tracing/trace


Ira Weiny (6):
  qemu/bswap: Add const_le64()
  qemu/uuid: Add UUID static initializer
  hw/cxl/cxl-events: Add CXL mock events
  hw/cxl/mailbox: Wire up get/clear event mailbox commands
  hw/cxl/cxl-events: Add event interrupt support
  hw/cxl/mailbox: Wire up Get/Set Event Interrupt policy

 hmp-commands.hx             |  14 ++
 hw/cxl/cxl-device-utils.c   |   1 +
 hw/cxl/cxl-events.c         | 330 ++++++++++++++++++++++++++++++++++++
 hw/cxl/cxl-host-stubs.c     |   5 +
 hw/cxl/cxl-mailbox-utils.c  | 224 +++++++++++++++++++++---
 hw/cxl/meson.build          |   1 +
 hw/mem/cxl_type3.c          |   7 +-
 include/hw/cxl/cxl_device.h |  22 +++
 include/hw/cxl/cxl_events.h | 194 +++++++++++++++++++++
 include/qemu/bswap.h        |  10 ++
 include/qemu/uuid.h         |  12 ++
 include/sysemu/sysemu.h     |   3 +
 12 files changed, 802 insertions(+), 21 deletions(-)
 create mode 100644 hw/cxl/cxl-events.c
 create mode 100644 include/hw/cxl/cxl_events.h


base-commit: 6f7f81898e4437ea544ee4ca24bef7ec543b1f06
-- 
2.37.2


