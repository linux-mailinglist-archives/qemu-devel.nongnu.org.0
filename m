Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6102448EB4A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:09:48 +0100 (CET)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NH1-0007Vs-7T
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0m-0003K8-DM
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:53:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0k-0000Op-Pl
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMlqghHYUP4YhwTi8hsyxob4KH0JvCtGp488RsCVU9g=;
 b=S127vJ+CfuLmkKzmK9RVxOgxQGi2ADOCi49HanWuuXsqVIceAiJxzUkeMI011feHiuNdcl
 hkTW4UGAjl41TejZW8IC4nYhm7gUq6kekGAdZmyiEeiG3QzyRvobNSVGypeMWQ2vyv/7+W
 1CQWLhgBhDdI4hnuL3l9LXY/NbkvakA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-sde32uDmNbSukS20dVrfaQ-1; Fri, 14 Jan 2022 08:52:53 -0500
X-MC-Unique: sde32uDmNbSukS20dVrfaQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19C961054F90;
 Fri, 14 Jan 2022 13:52:52 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A3E5105B20E;
 Fri, 14 Jan 2022 13:52:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/16] iotests/testrunner.py: refactor test_field_width
Date: Fri, 14 Jan 2022 14:52:26 +0100
Message-Id: <20220114135226.185407-17-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

A lot of Optional[] types doesn't make code beautiful.
test_field_width defaults to 8, but that is never used in the code.

More over, if we want some default behavior for single call of
test_run(), it should just print the whole test name, not limiting or
expanding its width, so 8 is bad default.

So, just drop the default as unused for now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211210201450.101576-1-vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 0feaa396d0..15788f919e 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -174,19 +174,17 @@ def __enter__(self) -> 'TestRunner':
     def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
         self._stack.close()
 
-    def test_print_one_line(self, test: str, starttime: str,
+    def test_print_one_line(self, test: str,
+                            test_field_width: int,
+                            starttime: str,
                             endtime: Optional[str] = None, status: str = '...',
                             lasttime: Optional[float] = None,
                             thistime: Optional[float] = None,
                             description: str = '',
-                            test_field_width: Optional[int] = None,
                             end: str = '\n') -> None:
         """ Print short test info before/after test run """
         test = os.path.basename(test)
 
-        if test_field_width is None:
-            test_field_width = 8
-
         if self.makecheck and status != '...':
             if status and status != 'pass':
                 status = f' [{status}]'
@@ -328,7 +326,7 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
                               casenotrun=casenotrun)
 
     def run_test(self, test: str,
-                 test_field_width: Optional[int] = None,
+                 test_field_width: int,
                  mp: bool = False) -> TestResult:
         """
         Run one test and print short status
@@ -347,20 +345,21 @@ def run_test(self, test: str,
 
         if not self.makecheck:
             self.test_print_one_line(test=test,
+                                     test_field_width=test_field_width,
                                      status = 'started' if mp else '...',
                                      starttime=start,
                                      lasttime=last_el,
-                                     end = '\n' if mp else '\r',
-                                     test_field_width=test_field_width)
+                                     end = '\n' if mp else '\r')
 
         res = self.do_run_test(test, mp)
 
         end = datetime.datetime.now().strftime('%H:%M:%S')
-        self.test_print_one_line(test=test, status=res.status,
+        self.test_print_one_line(test=test,
+                                 test_field_width=test_field_width,
+                                 status=res.status,
                                  starttime=start, endtime=end,
                                  lasttime=last_el, thistime=res.elapsed,
-                                 description=res.description,
-                                 test_field_width=test_field_width)
+                                 description=res.description)
 
         if res.casenotrun:
             print(res.casenotrun)
-- 
2.31.1


