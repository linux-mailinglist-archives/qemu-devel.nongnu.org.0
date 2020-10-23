Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93973296996
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 08:15:01 +0200 (CEST)
Received: from localhost ([::1]:42568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVqLs-000232-IS
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 02:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kVqJp-0000Bs-4j; Fri, 23 Oct 2020 02:12:53 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5204 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kVqJm-0000ux-Tf; Fri, 23 Oct 2020 02:12:52 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B23FBF6EE23FC696F94D;
 Fri, 23 Oct 2020 14:12:40 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Fri, 23 Oct 2020
 14:12:34 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH RESEND v2 4/7] elf2dmp/pdb: Plug memleak in pdb_init_from_file
Date: Fri, 23 Oct 2020 14:12:15 +0800
Message-ID: <20201023061218.2080844-5-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:12:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: lvivier@redhat.com, zhang.zhanghailiang@huawei.com,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, Li Qiang <liq3ea@gmail.com>,
 pannengyuan@huawei.com, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

Missing g_error_free in pdb_init_from_file() error path. Fix that.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 contrib/elf2dmp/pdb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/elf2dmp/pdb.c b/contrib/elf2dmp/pdb.c
index a5bd40c99d..b3a6547068 100644
--- a/contrib/elf2dmp/pdb.c
+++ b/contrib/elf2dmp/pdb.c
@@ -285,6 +285,7 @@ int pdb_init_from_file(const char *name, struct pdb_reader *reader)
     reader->gmf = g_mapped_file_new(name, TRUE, &gerr);
     if (gerr) {
         eprintf("Failed to map PDB file \'%s\'\n", name);
+        g_error_free(gerr);
         return 1;
     }
 
-- 
2.23.0


