Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BC5380E8E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:04:14 +0200 (CEST)
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbET-00056w-Ap
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawZ-0005Or-NE
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawW-0005pF-8k
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ge8Au1iXfFAEYzz9TEQv5M5xHVUbAVOsxZVf60mjwM=;
 b=Xr6yHl8reqHivEDGLllHMPi/miLUsoukvuSOLt2vVD3gaBXKKlpmFjsZ7FydTDY55m02oG
 zSC4u/qpxumKgR9ApLh/J/963NrN6d0o1brwpAV3yOaJVYZbBzkLvDAB0YWYW0ZooNnqin
 N6tUvY/+2iTVOPkWlEHzGP8shx3N/8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-IXZwF6__MT6I3gURNom_Uw-1; Fri, 14 May 2021 12:45:30 -0400
X-MC-Unique: IXZwF6__MT6I3gURNom_Uw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A1C510074A7;
 Fri, 14 May 2021 16:45:29 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA95077F11;
 Fri, 14 May 2021 16:45:28 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/19] qemu-iotests: allow passing unittest.main arguments to
 the test scripts
Date: Fri, 14 May 2021 18:45:01 +0200
Message-Id: <20210514164514.1057680-7-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Python test scripts that use unittest consist of multiple tests.
unittest.main allows selecting which tests to run, but currently this
is not possible because the iotests wrapper ignores sys.argv.

unittest.main command line options also allow the user to pick the
desired options for verbosity, failfast mode, etc.  While "-d" is
currently translated to "-v", it also enables extra debug output,
and other options are not available at all.

These command line options only work if the unittest.main testRunner
argument is a type, rather than a TestRunner instance.  Therefore, pass
the class name and "verbosity" argument to unittest.main, and adjust for
the different default warnings between TextTestRunner and unittest.main.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210323181928.311862-3-pbonzini@redhat.com>
Message-Id: <20210503110110.476887-3-pbonzini@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 55a017577f..5ead94229f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1308,12 +1308,16 @@ def __init__(self, stream: Optional[TextIO] = None,
                          resultclass=resultclass,
                          **kwargs)
 
-def execute_unittest(debug=False):
+def execute_unittest(argv: List[str], debug: bool = False) -> None:
     """Executes unittests within the calling module."""
 
-    verbosity = 2 if debug else 1
-    runner = ReproducibleTestRunner(verbosity=verbosity)
-    unittest.main(testRunner=runner)
+    # Some tests have warnings, especially ResourceWarnings for unclosed
+    # files and sockets.  Ignore them for now to ensure reproducibility of
+    # the test output.
+    unittest.main(argv=argv,
+                  testRunner=ReproducibleTestRunner,
+                  verbosity=2 if debug else 1,
+                  warnings=None if sys.warnoptions else 'ignore')
 
 def execute_setup_common(supported_fmts: Sequence[str] = (),
                          supported_platforms: Sequence[str] = (),
@@ -1350,7 +1354,7 @@ def execute_test(*args, test_function=None, **kwargs):
 
     debug = execute_setup_common(*args, **kwargs)
     if not test_function:
-        execute_unittest(debug)
+        execute_unittest(sys.argv, debug)
     else:
         test_function()
 
-- 
2.31.1


