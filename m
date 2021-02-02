Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B830C6C9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:02:53 +0100 (CET)
Received: from localhost ([::1]:38072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6z4h-0006El-1t
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yYR-0005fQ-34
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yYO-0000Lb-L2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612283364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSrh8DpqUPbw6Eh5CY3/TMs7gvPWCQ4tRhHELYHGwMc=;
 b=PgaX5gOrAxj5B/5IuS6j1v+yoIPdqFB42XLxlVHUPk+QttPlPq4qZCtNeKVe+B6XD60Bo1
 C0KuL8DEsXaMVOCYENzonM9SXf/I/U2L9orQZY8NBBZT2dd0oxtFWwsh73hoavq/byk+qA
 1Q2UZ7wKhQTihKiw+RA5QT1HEoQ1IKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-T4NlXKHcMVePJ0trkKR_kA-1; Tue, 02 Feb 2021 11:29:09 -0500
X-MC-Unique: T4NlXKHcMVePJ0trkKR_kA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF7BE107ACE4;
 Tue,  2 Feb 2021 16:29:07 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 520865D749;
 Tue,  2 Feb 2021 16:29:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 06/10] iotests: check: return 1 on failure
Date: Tue,  2 Feb 2021 17:28:30 +0100
Message-Id: <20210202162834.269789-7-kwolf@redhat.com>
In-Reply-To: <20210202162834.269789-1-kwolf@redhat.com>
References: <20210202162834.269789-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We should indicate failure by exit code, not only output.

Reported-by: Peter Maydell
Fixes: f203080bbd9f9e5b31041b1f2afcd6040c5aaec5
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210201085041.3079-1-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 4 +++-
 tests/qemu-iotests/check         | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 24b3fba115..25754e9a09 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -318,7 +318,7 @@ class TestRunner(ContextManager['TestRunner']):
 
         return res
 
-    def run_tests(self, tests: List[str]) -> None:
+    def run_tests(self, tests: List[str]) -> bool:
         n_run = 0
         failed = []
         notrun = []
@@ -363,5 +363,7 @@ class TestRunner(ContextManager['TestRunner']):
         if failed:
             print('Failures:', ' '.join(failed))
             print(f'Failed {len(failed)} of {n_run} iotests')
+            return False
         else:
             print(f'Passed all {n_run} iotests')
+            return True
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 5190dee82e..d1c87ceaf1 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -140,4 +140,7 @@ if __name__ == '__main__':
     else:
         with TestRunner(env, makecheck=args.makecheck,
                         color=args.color) as tr:
-            tr.run_tests([os.path.join(env.source_iotests, t) for t in tests])
+            paths = [os.path.join(env.source_iotests, t) for t in tests]
+            ok = tr.run_tests(paths)
+            if not ok:
+                sys.exit(1)
-- 
2.29.2


