Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817664BF487
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:18:37 +0100 (CET)
Received: from localhost ([::1]:45214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRJc-0002Y8-0y
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMR70-0004sg-ET
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:05:34 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:3273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMR6x-0001hL-6N
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:05:34 -0500
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4K2tRs4Q6gz1FDTX;
 Tue, 22 Feb 2022 17:00:41 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 17:05:10 +0800
Received: from DESKTOP-27KDQMV.china.huawei.com (10.174.148.223) by
 dggpeml100016.china.huawei.com (7.185.36.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 17:05:10 +0800
To: <pbonzini@redhat.com>, <berrange@redhat.com>, <mst@redhat.com>
CC: <qemu-devel@nongnu.org>, <arei.gonglei@huawei.com>,
 <wangxinxin.wang@huawei.com>, "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: [PATCH v2 0/3] qemu-sem-posix: use monotonic clock instead
Date: Tue, 22 Feb 2022 17:05:03 +0800
Message-ID: <20220222090507.2028-1-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml100016.china.huawei.com (7.185.36.216)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng(Mike)" <longpeng2@huawei.com>
From:  "Longpeng(Mike)" via <qemu-devel@nongnu.org>

The qemu_sem_timedwait() uses system time as default, it would be affected by
changes to the system time. In the real scenario, the time that goes faster or
slower is a common case and the NTP service could help us to sync time
periodically.

This patchset uses monotonic clock instead of the realtime clock, this could
make sure we would not be affected by the system time anymore.

Changes v1(RFC) -> v2:
 Patch 2:
  - clean the code [Paolo]
  - use pthread_condattr_setclock when initializing qemu-cond. [Paolo]
 Patch 3:
  - new added, make the qemu-sem code neater. [Longpeng]

Longpeng (Mike) (3):
  sem-posix: remove the posix semaphore support
  sem-posix: use monotonic clock instead
  sem-posix: refactor qemu-sem with qemu-cond and qemu-mutex

 include/qemu/thread-posix.h |   9 +--
 meson.build                 |  12 ++-
 util/qemu-thread-posix.c    | 178 +++++++++++++++-----------------------------
 3 files changed, 73 insertions(+), 126 deletions(-)

-- 
1.8.3.1


