Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FFB637D6E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 17:01:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyEdA-0002WY-O3; Thu, 24 Nov 2022 10:59:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd3-0002NO-Ko; Thu, 24 Nov 2022 10:59:09 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd1-0005IQ-5B; Thu, 24 Nov 2022 10:59:08 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2FC8541200;
 Thu, 24 Nov 2022 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received:received; s=mta-01; t=1669305540; x=
 1671119941; bh=CS0wWQj0+Vf+vurT5Wr5N2IoTjcm3AJudj1/jG0xD9M=; b=l
 0eCdNtR9/zs4HvgGhDUcOk6ee2uKsZP4238bRI1I8gbtfcHmyqzm85n183iumk7g
 s0VFBFPMGUhnQjxwgtDZV2t/sqZuldYvDVIzMwYQ11+Rz6yIQEyKLKUgOxnaN4dD
 g4r7T1E+2zw2TOIJ0UsyTwO3rDHPW25gwW5tUbhqys=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UfA3XaF4CWbN; Thu, 24 Nov 2022 18:59:00 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (T-EXCH-01.corp.yadro.com
 [172.17.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E9BAE4014D;
 Thu, 24 Nov 2022 18:58:59 +0300 (MSK)
Received: from T-EXCH-09.corp.yadro.com (172.17.11.59) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 24 Nov 2022 18:58:59 +0300
Received: from archlinux.yadro.com (10.178.113.54) by T-EXCH-09.corp.yadro.com
 (172.17.11.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 24 Nov
 2022 18:58:58 +0300
From: Dmitry Tihov <d.tihov@yadro.com>
To: <qemu-block@nongnu.org>
CC: <qemu-devel@nongnu.org>, <kbusch@kernel.org>, <its@irrelevant.dk>,
 <linux@yadro.com>, <m.malygin@yadro.com>, <a.buev@yadro.com>,
 <ddtikhov@gmail.com>
Subject: [RFC 0/5] Protection information pass-through for block devices
Date: Thu, 24 Nov 2022 18:58:16 +0300
Message-ID: <20221124155821.1501969-1-d.tihov@yadro.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.178.113.54]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-09.corp.yadro.com (172.17.11.59)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This patch set allows using End-to-End Data Protection in NVMe subsystem
with integrity capable host devices as the NVMe namespaces backend.
The patch series is based on io-uring kernel interface feature not merged
to kernel upstream yet:
https://lore.kernel.org/linux-block/20220920144618.1111138-1-a.buev@yadro.com/

The main advantage of this approach is that it allows using the
same protection information enabled disks in multiple VMs
concurrently. This may be useful in cluster setups.

Please let me know what do you think, are this kind of changes appropriate
for QEMU upstream, what should be changed, etc.

Dmitry Tihov (5):
  docs/nvme: add new feature summary
  block: add transfer of protection information
  hw/nvme: add protection information pass parameter
  hw/nvme: implement pi pass read/write/wrz commands
  hw/nvme: extend pi pass capable commands

 block/file-posix.c           | 130 ++++++++++++-
 block/io_uring.c             | 109 ++++++++++-
 docs/system/devices/nvme.rst |  15 ++
 hw/nvme/ctrl.c               | 361 ++++++++++++++++++++++++++++++++---
 hw/nvme/dif.c                | 303 +++++++++++++++++++++++++++++
 hw/nvme/dif.h                |  18 ++
 hw/nvme/ns.c                 |  59 +++++-
 hw/nvme/nvme.h               |   2 +
 hw/nvme/trace-events         |   6 +
 include/block/block-common.h |   2 +
 include/block/raw-aio.h      |   3 +-
 include/qemu/iov.h           |   6 +
 util/iov.c                   |  24 +++
 13 files changed, 992 insertions(+), 46 deletions(-)

-- 
2.38.1


