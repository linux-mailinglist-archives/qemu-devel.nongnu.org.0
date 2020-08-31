Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB354257433
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 09:18:58 +0200 (CEST)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCe5h-0004h2-Uq
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 03:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kCe4B-0002gS-6v; Mon, 31 Aug 2020 03:17:23 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4719 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kCe47-0005uf-MN; Mon, 31 Aug 2020 03:17:22 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A40E3BD8577D54037B65;
 Mon, 31 Aug 2020 15:17:15 +0800 (CST)
Received: from opensource.huawei.com (10.175.100.152) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 31 Aug 2020 15:17:05 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 08/10] blockdev: Fix a memleak in drive_backup_prepare()
Date: Mon, 31 Aug 2020 09:43:13 -0400
Message-ID: <20200831134315.1221-9-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200831134315.1221-1-pannengyuan@huawei.com>
References: <20200831134315.1221-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.152]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:17:16
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, Pan Nengyuan <pannengyuan@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 euler.robot@huawei.com, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'local_err' seems forgot to propagate in error path, it'll cause
a memleak. Fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
---
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org
---
- V2: no changes in v2.
---
 blockdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/blockdev.c b/blockdev.c
index 3848a9c8ab..842ac289c1 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1801,6 +1801,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     if (set_backing_hd) {
         bdrv_set_backing_hd(target_bs, source, &local_err);
         if (local_err) {
+            error_propagate(errp, local_err);
             goto unref;
         }
     }
-- 
2.18.2


