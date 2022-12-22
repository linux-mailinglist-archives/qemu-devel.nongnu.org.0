Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F8653B42
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 05:26:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8D8n-0007pi-Tj; Wed, 21 Dec 2022 23:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8g-0007nr-UT
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:04 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8e-00015K-Ko
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671683100; x=1703219100;
 h=date:from:subject:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=0cTOW4aQbeJrB4PyXJK/ul38tT7E9EdZZ3sSJioccjo=;
 b=bvQ1J+Nu+CfeLW0WCmkKTOXjBXcYroUpi//I+R98PUWvqRxzC5Xv6yf3
 7FntlJdK3JW+ki33PU5iQy/mH7hIGeSLDeb3N4fWqitohRLoX1Fd2fq/2
 5iMLarZ/lVeMO4LuKr0L+qwRDI+Pdm7VBe3cPPN21MGUA8kh7txfUPfDb
 KOlovjLXAFgjMta31w+Ci1VVCEThyma7NzgILLZv5EcKFniJ4UMV5S32Z
 Vd3/xAI3xv3i1QBDTwAfqc+FZkYY0lbRYre7b3g1/L095P3bUaduKWN24
 BzU1j56An/DgxgpU31dG6y1TzDodNBVLHwFttdYb1t9/racI1G2bCgvto Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321957574"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="321957574"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="601733184"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="601733184"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.20.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:54 -0800
Date: Wed, 21 Dec 2022 20:24:53 -0800
From: Ira Weiny <ira.weiny@intel.com>
Subject: [PATCH v2 0/8] QEMU CXL Provide mock CXL events and irq support
Message-Id: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/bo2MC/yWNUQqDMAxAryL9XsRW3ei+do/hR+3SGejqaJ1Tp
 HdfdBAC70HyNpEwEiZxLTYRcaZEY2BQp0LYwYQnAj2YhaqUkjxA0YBdPOCMYUqwe5AS5AUcurZ2
 utfGKsH3vUkIfTTBDvwhfLxn+Y7oaDmC9455oDSNcT36s9ztP1VJ3ko3TVlrVbftGY50+UUK643
 ChL6040t0OecfP/HoncUAAAA=
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>
X-Mailer: b4 0.11.0-dev-141d4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671683093; l=3489;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=0cTOW4aQbeJrB4PyXJK/ul38tT7E9EdZZ3sSJioccjo=;
 b=1iRz1qeQGo9GloWC0yIpbjh4y2y4jyPd9Ox7Gf1UGq1483JNGfW47IV4SQ+4UDjm1zZC6vDhfsoV
 hbiqM4ikBZYW18Ot680pZjecuOH0CngXJlJfFOAXthrzxrOW9mll
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=134.134.136.65; envelope-from=ira.weiny@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

CXL Event records inform the OS of various CXL device events.  Thus far CXL
memory devices are emulated and therefore don't naturally generate events.

Add an event infrastructure and mock event injection.  Previous versions
included a bulk insertion of lots of events.  However, this series focuses on
providing the ability to inject individual events through QMP.  Only the
General Media Event is included in this series as an example.  Other events can
be added pretty easily once the infrastructure is acceptable.

In addition, this version updates the code to be in line with the
specification based on discussions around the kernel patches.

This series is based on Jonathan's CXL branch here:
https://gitlab.com/jic23/qemu/-/tree/cxl-2022-11-17

Kernel code found here:
https://lore.kernel.org/all/20221212070627.1372402-1-ira.weiny@intel.com/

Previous RFC (V1) version:
https://lore.kernel.org/linux-cxl/20221010222944.3923556-1-ira.weiny@intel.com/

Instructions:

Add qmp option to qemu:

	<host> $ qemu-system-x86_64 ... -qmp unix:/tmp/run_qemu_qmp_0,server,nowait ...

	OR

	<host> $ run_qemu.sh ... --qmp ...

Enable tracing of events within the guest:

	<guest> $ echo "" > /sys/kernel/tracing/trace
	<guest> $ echo 1 > /sys/kernel/tracing/events/cxl/enable
	<guest> $ echo 1 > /sys/kernel/tracing/tracing_on

	OPTIONAL: set up ndctl to monitor for events (events will show up as
		  they are injected)

	<guest> $ <path to ndctl>/cxl monitor

Trigger event generation and interrupts in the host:

	<host> $ qmpcmd="${qemusrcdir}/build/scripts/qmp/qmp-shell /tmp/run_qemu_qmp_0"

	<host> $ echo "cxl-inject-gen-media-event path=cxl-dev0 log=0 flags=1 \
			physaddr=1000 descriptor=127 type=3 transactiontype=192 \
			channel=3 rank=-1 device=5 componentid='Iras mem'" | $qmpcmd

	<Repeat for more events with different values>

View events on the guest:

	<guest> $ cat /sys/kernel/tracing/trace

To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: qemu-devel@nongnu.org
Cc: linux-cxl@vger.kernel.org
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Ira Weiny (8):
      qemu/bswap: Add const_le64()
      qemu/uuid: Add UUID static initializer
      hw/cxl/mailbox: Use new UUID network order define for cel_uuid
      hw/cxl/events: Add event status register
      hw/cxl/events: Wire up get/clear event mailbox commands
      hw/cxl/events: Add event interrupt support
      bswap: Add the ability to store to an unaligned 24 bit field
      hw/cxl/events: Add in inject general media event

 hw/cxl/cxl-device-utils.c   |  54 ++++++++--
 hw/cxl/cxl-events.c         | 252 ++++++++++++++++++++++++++++++++++++++++++++
 hw/cxl/cxl-mailbox-utils.c  | 160 ++++++++++++++++++++++------
 hw/cxl/meson.build          |   1 +
 hw/mem/cxl_type3.c          |  96 ++++++++++++++++-
 hw/mem/cxl_type3_stubs.c    |   8 ++
 include/hw/cxl/cxl_device.h |  56 +++++++++-
 include/hw/cxl/cxl_events.h | 126 ++++++++++++++++++++++
 include/qemu/bswap.h        |  40 +++++++
 include/qemu/uuid.h         |  12 +++
 qapi/cxl.json               |  25 +++++
 11 files changed, 785 insertions(+), 45 deletions(-)
---
base-commit: 1b4133103d20fc3fea05c7ceca4a242468a5179d
change-id: 20221221-ira-cxl-events-2022-11-17-fef53f9b9ac2

Best regards,
-- 
Ira Weiny <ira.weiny@intel.com>

