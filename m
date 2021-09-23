Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86EE415494
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:21:18 +0200 (CEST)
Received: from localhost ([::1]:60608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTCUH-0000W9-PN
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPq-0001ez-FO
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPk-0000vG-PL
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632356195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qciHK1mWa+3ySCh7W+i8z1zYj9PFBUTXrSscYS25leY=;
 b=HD6cKgXHcZ5lWyvEoCy8TZoI0hwGHXq9i+MamgVekJ9++/qWcDXO04hZW6s7fTqwwfZHVg
 yDMDtNLHwKa7a4oELAd7rVr431JKS9C2o/nsf3P8eafu0AF42jiprAgkXJpzT/Br0N8NFG
 SQxwt1N6xxsNeZlHwYNLrAsGIOEyrl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-gkOi6lD2M86mcfTsnetU9Q-1; Wed, 22 Sep 2021 20:16:33 -0400
X-MC-Unique: gkOi6lD2M86mcfTsnetU9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF9D8362FA;
 Thu, 23 Sep 2021 00:16:32 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F7F910023AB;
 Thu, 23 Sep 2021 00:16:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] iotests/linters: check mypy files all at once
Date: Wed, 22 Sep 2021 20:16:22 -0400
Message-Id: <20210923001625.3996451-4-jsnow@redhat.com>
In-Reply-To: <20210923001625.3996451-1-jsnow@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can circumvent the '__main__' redefinition problem by passing
--scripts-are-modules. Take mypy out of the loop per-filename and check
everything in one go: it's quite a bit faster.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/297 | 44 +++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 467b712280e..91ec34d9521 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -74,32 +74,28 @@ def run_linters():
     print('=== mypy ===')
     sys.stdout.flush()
 
-    # We have to call mypy separately for each file.  Otherwise, it
-    # will interpret all given files as belonging together (i.e., they
-    # may not both define the same classes, etc.; most notably, they
-    # must not both define the __main__ module).
     env['MYPYPATH'] = env['PYTHONPATH']
-    for filename in files:
-        p = subprocess.run(('mypy',
-                            '--warn-unused-configs',
-                            '--disallow-subclassing-any',
-                            '--disallow-any-generics',
-                            '--disallow-incomplete-defs',
-                            '--disallow-untyped-decorators',
-                            '--no-implicit-optional',
-                            '--warn-redundant-casts',
-                            '--warn-unused-ignores',
-                            '--no-implicit-reexport',
-                            '--namespace-packages',
-                            filename),
-                           env=env,
-                           check=False,
-                           stdout=subprocess.PIPE,
-                           stderr=subprocess.STDOUT,
-                           universal_newlines=True)
+    p = subprocess.run(('mypy',
+                        '--warn-unused-configs',
+                        '--disallow-subclassing-any',
+                        '--disallow-any-generics',
+                        '--disallow-incomplete-defs',
+                        '--disallow-untyped-decorators',
+                        '--no-implicit-optional',
+                        '--warn-redundant-casts',
+                        '--warn-unused-ignores',
+                        '--no-implicit-reexport',
+                        '--namespace-packages',
+                        '--scripts-are-modules',
+                        *files),
+                       env=env,
+                       check=False,
+                       stdout=subprocess.PIPE,
+                       stderr=subprocess.STDOUT,
+                       universal_newlines=True)
 
-        if p.returncode != 0:
-            print(p.stdout)
+    if p.returncode != 0:
+        print(p.stdout)
 
 
 for linter in ('pylint-3', 'mypy'):
-- 
2.31.1


