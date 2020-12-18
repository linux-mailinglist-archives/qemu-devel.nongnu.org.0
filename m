Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2713E2DE1CC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:10:48 +0100 (CET)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDep-00051P-6S
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDDG-00041K-Lp
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDDB-0004kF-VF
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tocaSQbstAXKuFcibAp7Zwy0Hn14WnnWxqXmFAUBUsw=;
 b=ADN0VEuo/KLqdGQkDBZ7FIVICBsyeJ7zmZE4LAbGHwVFFTMKuQcCy0BuDILzjgZx5CChZm
 k1yTydLXKmg/DSfKeuMxNt6/2R7cNo830b4A5Adh/rgh7P83zG5/Rw3krny1pp0asevJXS
 34frAiZHRNr2H6YwJvLKuDoU7kpuMno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-jRqGPGQiNDShhbphy_My3Q-1; Fri, 18 Dec 2020 05:42:11 -0500
X-MC-Unique: jRqGPGQiNDShhbphy_My3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1194C107ACE3;
 Fri, 18 Dec 2020 10:42:10 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9D7660C15;
 Fri, 18 Dec 2020 10:42:04 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 15/15] migration: Don't allow migration if vm is in POSTMIGRATE
Date: Fri, 18 Dec 2020 10:41:17 +0000
Message-Id: <20201218104117.199096-16-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tuguoyi <tu.guoyi@h3c.com>

The following steps will cause qemu assertion failure:
- pause vm by executing 'virsh suspend'
- create external snapshot of memory and disk using 'virsh snapshot-create-as'
- doing the above operation again will cause qemu crash

The backtrace looks like:
    at /build/qemu-5.0/migration/savevm.c:1401
    at /build/qemu-5.0/migration/savevm.c:1453

When the first migration completes, bs->open_flags will set BDRV_O_INACTIVE
flag by bdrv_inactivate_all(), and during the second migration the
bdrv_inactivate_recurse assert that the bs->open_flags is already
BDRV_O_INACTIVE enabled which cause crash.

As Vladimir suggested, this patch makes migrate_prepare check the state of vm and
return error if it is in RUN_STATE_POSTMIGRATE state.

Signed-off-by: Tuguoyi <tu.guoyi@h3c.com>
Message-Id: <6b704294ad2e405781c38fb38d68c744@h3c.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reported-by: Li Zhang <li.zhang@cloud.ionos.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index e0dbde4091..f5d4a52c95 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2102,6 +2102,12 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
         return false;
     }
 
+    if (runstate_check(RUN_STATE_POSTMIGRATE)) {
+        error_setg(errp, "Can't migrate the vm that was paused due to "
+                   "previous migration");
+        return false;
+    }
+
     if (migration_is_blocked(errp)) {
         return false;
     }
-- 
2.29.2


