Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48839689125
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 08:44:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNqjM-0001G2-66; Fri, 03 Feb 2023 02:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pNqjF-0001DS-Fn
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:43:27 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pNqjD-00030i-N7
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:43:25 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4P7SHz5ykbzRrPs;
 Fri,  3 Feb 2023 15:40:47 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 3 Feb 2023 15:43:03 +0800
To: <qemu-devel@nongnu.org>
CC: <berrange@redhat.com>, <quintela@redhat.com>, <dgilbert@redhat.com>,
 <yubihong@huawei.com>, <xiexiangyou@huawei.com>, <zhengchuan@huawei.com>,
 <linyilu@huawei.com>, <jiangjiacheng@huawei.com>
Subject: [RFC PATCH V2 0/2] migration: support query migration thread
 information
Date: Fri, 3 Feb 2023 15:35:17 +0800
Message-ID: <20230203073519.2969147-1-jiangjiacheng@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangjiacheng@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jiang Jiacheng <jiangjiacheng@huawei.com>
From:  Jiang Jiacheng via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We need get more migration thread information to support
migration pin, especially thread name and its pid. Add an
qmp interface to query migration threads information.

v2 of:
https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg04618.html

diff to v2:
* remove the event that report thread name
* modify the qmp interface, now it doesn't need thread name and
  return with all the migration threads information we saved

Jiang Jiacheng (2):
  migration: Introduce interface query-migrationthreads
  migration: save/delete migration thread info

 migration/meson.build  |  1 +
 migration/migration.c  |  5 ++++
 migration/multifd.c    |  5 ++++
 migration/threadinfo.c | 54 ++++++++++++++++++++++++++++++++++++++++++
 migration/threadinfo.h | 28 ++++++++++++++++++++++
 qapi/migration.json    | 29 +++++++++++++++++++++++
 6 files changed, 122 insertions(+)
 create mode 100644 migration/threadinfo.c
 create mode 100644 migration/threadinfo.h

-- 
2.33.0


