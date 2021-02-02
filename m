Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27DA30B60A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:48:58 +0100 (CET)
Received: from localhost ([::1]:33466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mgU-0000ck-31
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lichun@ruijie.com.cn>)
 id 1l6mfR-00006a-8P
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:47:53 -0500
Received: from [240e:678:8c0:5::c0a8:3a62] (port=31012
 helo=FZEX3.ruijie.com.cn)
 by eggs.gnu.org with esmtps (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lichun@ruijie.com.cn>)
 id 1l6mfN-0001A0-1J
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:47:51 -0500
Received: from centos.localdomain (172.20.101.108) by FZEX3.ruijie.com.cn
 (192.168.58.89) with Microsoft SMTP Server id 14.3.123.3; Tue, 2 Feb 2021
 11:41:55 +0800
From: lichun <lichun@ruijie.com.cn>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH] savevm: check for incoming-state in savevm
Date: Tue, 2 Feb 2021 19:41:47 +0800
Message-ID: <1612266107-76091-1-git-send-email-lichun@ruijie.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.20.101.108]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 240e:678:8c0:5::c0a8:3a62
 (failed)
Received-SPF: permerror client-ip=240e:678:8c0:5::c0a8:3a62;
 envelope-from=lichun@ruijie.com.cn; helo=FZEX3.ruijie.com.cn
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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
Cc: lichun <lichun@ruijie.com.cn>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Running #qemu-system-i386 test.img -monitor stdio -incoming tcp:0.0.0.0:1234
        (qemu) savevm
we get:

before the patch:
    bdrv_co_pwritev: Assertion `!(bs->open_flags & 0x0800)' failed.
    Aborted
after:
    Error: Guest is waiting for an incoming migration

Signed-off-by: lichun <lichun@ruijie.com.cn>
---
 migration/savevm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 4f3b69e..84e76e4 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1522,6 +1522,11 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
         return -EINVAL;
     }
 
+    if (runstate_check(RUN_STATE_INMIGRATE)) {
+        error_setg(errp, "Guest is waiting for an incoming migration");
+        return -EINVAL;
+    }
+
     if (migrate_use_block()) {
         error_setg(errp, "Block migration and snapshots are incompatible");
         return -EINVAL;
-- 
1.8.3.1


