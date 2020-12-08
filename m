Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B747B2D23F6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 07:56:03 +0100 (CET)
Received: from localhost ([::1]:47864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmWuo-0006Ma-QM
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 01:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kmWrp-000526-CS
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 01:52:57 -0500
Received: from smtp.h3c.com ([60.191.123.50]:58149 helo=h3cspam02-ex.h3c.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kmWrl-0004rn-Mv
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 01:52:57 -0500
Received: from DAG2EX03-BASE.srv.huawei-3com.com ([10.8.0.66])
 by h3cspam02-ex.h3c.com with ESMTP id 0B86qVVn061440;
 Tue, 8 Dec 2020 14:52:31 +0800 (GMT-8)
 (envelope-from tu.guoyi@h3c.com)
Received: from localhost.localdomain (10.125.33.161) by
 DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 8 Dec 2020 14:52:33 +0800
From: Tuguoyi <tu.guoyi@h3c.com>
To: Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: [PATCH 2/2] savevm: Delete snapshots just created in case of error
Date: Tue, 8 Dec 2020 14:53:36 +0800
Message-ID: <1607410416-13563-3-git-send-email-tu.guoyi@h3c.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607410416-13563-1-git-send-email-tu.guoyi@h3c.com>
References: <1607410416-13563-1-git-send-email-tu.guoyi@h3c.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.125.33.161]
X-ClientProxiedBy: BJSMTP01-EX.srv.huawei-3com.com (10.63.20.132) To
 DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66)
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com 0B86qVVn061440
Received-SPF: pass client-ip=60.191.123.50; envelope-from=tu.guoyi@h3c.com;
 helo=h3cspam02-ex.h3c.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: tuguoyi@outlook.com, qemu-devel@nongnu.org, Tuguoyi <tu.guoyi@h3c.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_all_create_snapshot() can fails with some snapshots created,
so it's better to delete those snapshots before returns to the caller

Signed-off-by: Tuguoyi <tu.guoyi@h3c.com>
---
 migration/savevm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 601b514..4a18c9d 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2833,6 +2833,7 @@ int save_snapshot(const char *name, Error **errp)
     if (ret < 0) {
         error_setg(errp, "Error while creating snapshot on '%s'",
                    bdrv_get_device_or_node_name(bs));
+        bdrv_all_delete_snapshot(sn->name, &bs, NULL);
         goto the_end;
     }
 
-- 
2.7.4


