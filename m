Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D826A43E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 13:37:48 +0200 (CEST)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI9HP-0002cR-Cu
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 07:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kI9FW-0000q8-Gd
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 07:35:50 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47410
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kI9FU-0002nv-98
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 07:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600169747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4NDq7xY/p5nEHU+fj0NRxwrZ3KkfBVlXtATn0X/fuM=;
 b=bCKRmP8bvpmTR96yCs12CVabjIqjwBQQCuZIW54nyR9aO3izDAWVEeznKNmtKu8DQlE0fx
 Uxh6rSBtTjwG/HdncQPEc0wso0nCTK2smm5Oit5I/6AY8pWM+oiojtF3c7b/OpVgC9azw4
 jQ+HkGgmIB5i6LubyAchW8VdU5sCjnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-J1N9i6duM_ipMkerFHgLhA-1; Tue, 15 Sep 2020 07:35:45 -0400
X-MC-Unique: J1N9i6duM_ipMkerFHgLhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27AD210BBEC8;
 Tue, 15 Sep 2020 11:35:44 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6B327513D;
 Tue, 15 Sep 2020 11:35:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/9] migration: stop returning errno from load_snapshot()
Date: Tue, 15 Sep 2020 12:35:16 +0100
Message-Id: <20200915113523.2520317-3-berrange@redhat.com>
In-Reply-To: <20200915113523.2520317-1-berrange@redhat.com>
References: <20200915113523.2520317-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 05:35:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

None of the callers care about the errno value since there is a full
Error object populated. This gives consistency with save_snapshot()
which already just returns -1.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/savevm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 3826c437cc..711137bcbe 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2870,20 +2870,20 @@ int load_snapshot(const char *name, Error **errp)
     if (!replay_can_snapshot()) {
         error_setg(errp, "Record/replay does not allow loading snapshot "
                    "right now. Try once more later.");
-        return -EINVAL;
+        return -1;
     }
 
     if (!bdrv_all_can_snapshot(errp)) {
-        return -ENOTSUP;
+        return -1;
     }
     ret = bdrv_all_find_snapshot(name, errp);
     if (ret < 0) {
-        return ret;
+        return -1;
     }
 
     bs_vm_state = bdrv_all_find_vmstate_bs(errp);
     if (!bs_vm_state) {
-        return -ENOTSUP;
+        return -1;
     }
     aio_context = bdrv_get_aio_context(bs_vm_state);
 
@@ -2892,11 +2892,11 @@ int load_snapshot(const char *name, Error **errp)
     ret = bdrv_snapshot_find(bs_vm_state, &sn, name);
     aio_context_release(aio_context);
     if (ret < 0) {
-        return ret;
+        return -1;
     } else if (sn.vm_state_size == 0) {
         error_setg(errp, "This is a disk-only snapshot. Revert to it "
                    " offline using qemu-img");
-        return -EINVAL;
+        return -1;
     }
 
     /* Flush all IO requests so they don't interfere with the new state.  */
@@ -2911,7 +2911,6 @@ int load_snapshot(const char *name, Error **errp)
     f = qemu_fopen_bdrv(bs_vm_state, 0);
     if (!f) {
         error_setg(errp, "Could not open VM state file");
-        ret = -EINVAL;
         goto err_drain;
     }
 
@@ -2927,14 +2926,14 @@ int load_snapshot(const char *name, Error **errp)
 
     if (ret < 0) {
         error_setg(errp, "Error %d while loading VM state", ret);
-        return ret;
+        return -1;
     }
 
     return 0;
 
 err_drain:
     bdrv_drain_all_end();
-    return ret;
+    return -1;
 }
 
 void vmstate_register_ram(MemoryRegion *mr, DeviceState *dev)
-- 
2.26.2


