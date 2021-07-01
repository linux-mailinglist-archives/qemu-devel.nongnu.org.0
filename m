Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E979D3B930B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 16:19:10 +0200 (CEST)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyxX3-0008J8-VR
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 10:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUG-0004nO-3e
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUB-0005tf-Cc
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625148970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5pAwucNHSfAl5Xkhnc1jfmiw5xJAyvgUISuiDZJGOs=;
 b=WWKmZgwg7iywAzcwEj6UqX/L2HLwytIweh7NpIoIyEM9XamfdnWmx9wfU/rhcTLoEAnQsI
 wwKa+8orjAdWaEVYi12h1+fsiVaqqNee/ju1js/apIXuy2n8Vtc1oxEs9FWIugebqDVSPz
 McPuMoG5g5rrRAUhQ0iHZ2kWpZW+s7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-WC1le3FlO8OjC5TGBLRObQ-1; Thu, 01 Jul 2021 10:16:09 -0400
X-MC-Unique: WC1le3FlO8OjC5TGBLRObQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BC329F92D;
 Thu,  1 Jul 2021 14:16:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-230.ams2.redhat.com
 [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E0DD60843;
 Thu,  1 Jul 2021 14:16:05 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 01/20] tests: migration-test: Still run the rest even if uffd
 missing
Date: Thu,  1 Jul 2021 15:15:26 +0100
Message-Id: <20210701141545.193571-2-dgilbert@redhat.com>
In-Reply-To: <20210701141545.193571-1-dgilbert@redhat.com>
References: <20210701141545.193571-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Currently we'll skip the whole migration-test if uffd missing.

It's a bit harsh - we can still run the rest besides postcopy!  Enable them
when we still can.

It'll happen more frequently now after kernel UFFD_USER_MODE_ONLY introduced in
commit 37cd0575b8510159, as qemu test normally requires kernel faults.  One
alternative is we disable kvm and create the uffd with UFFD_USER_MODE_ONLY for
all postcopy tests, however to be simple for now just skip postcopy tests only
by default.  If we wanna run them use "sudo" or root, they'll still work.  In
all cases, it's still better than running nothing for migration-test.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20210615175523.439830-2-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 2b028df687..d9225f58d4 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1376,10 +1376,6 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
-    if (!ufd_version_check()) {
-        return g_test_run();
-    }
-
     /*
      * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
      * is touchy due to race conditions on dirty bits (especially on PPC for
@@ -1416,8 +1412,11 @@ int main(int argc, char **argv)
 
     module_call_init(MODULE_INIT_QOM);
 
-    qtest_add_func("/migration/postcopy/unix", test_postcopy);
-    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    if (ufd_version_check()) {
+        qtest_add_func("/migration/postcopy/unix", test_postcopy);
+        qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    }
+
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix", test_precopy_unix);
     qtest_add_func("/migration/precopy/tcp", test_precopy_tcp);
-- 
2.31.1


