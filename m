Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5AB32E33B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 08:54:58 +0100 (CET)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI5IW-0002m6-O9
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 02:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lI5Gu-00028Q-PM
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 02:53:16 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lI5Gs-0007nd-9N
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 02:53:16 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DsKfm29DFzMdld;
 Fri,  5 Mar 2021 15:50:56 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Fri, 5 Mar 2021 15:52:57 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: David Edmondson <dme@dme.org>, Juan Quintela <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Andrey Gruzdev
 <andrey.gruzdev@virtuozzo.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Alexey Romko
 <nevilad@yahoo.com>, "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/3] Some modifications about ram_save_host_page()
Date: Fri, 5 Mar 2021 15:50:32 +0800
Message-ID: <20210305075035.1852-1-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=jiangkunkun@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series include patches as below:
Patch 1:
- modified the comment ram_save_host_page() to make them match each other

Patch 2:
- reduce unnecessary rate limitting in ram_save_host_page()

Patch 3:
- optimized ram_save_host_page() by using migration_bitmap_find_dirty() to find
dirty pages

History:

v2 -> v3:
- Reduce unnecessary rate limitting if nothing is sent in the current iteration [David Edmondson]
- Invert the body of the loop in ram_save_host_page() [David Edmondson]

v1 -> v2:
- Modify ram_save_host_page() comment [David Edmondson]
- Remove 'goto' [David Edmondson]


Kunkun Jiang (3):
  migration/ram: Modify the code comment of ram_save_host_page()
  migration/ram: Reduce unnecessary rate limiting
  migration/ram: Optimize ram_save_host_page()

 migration/ram.c | 54 ++++++++++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

-- 
2.23.0


