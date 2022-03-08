Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FE54D0DAF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 02:49:05 +0100 (CET)
Received: from localhost ([::1]:48536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nROyG-00038u-5g
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 20:49:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROtx-00006v-Ty
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROtv-0006MK-O4
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646703874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTzuB/q6HgdeHF6ugqZXRcCJCGcPey0yBryK8lI9kec=;
 b=WCtObU7SOMbrAFRbRTCnGkgn8yM2QVk0WG/3B7k/Xjworah9TH24E+XJVABCrv3K9upEsH
 GrPc5YshuGoowb+EvPeNuPu3E2dQFXALMgAryxaco63Tflke2pQM30Ux/kBCzmC31cd7nd
 KtREPmIyjUgG8oMYZS2p/lhqDZD851s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-XMNCkenYO-6jVyUd2u5F_Q-1; Mon, 07 Mar 2022 20:44:32 -0500
X-MC-Unique: XMNCkenYO-6jVyUd2u5F_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0B552F35;
 Tue,  8 Mar 2022 01:44:31 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25DD55E480;
 Tue,  8 Mar 2022 01:44:31 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] tests/qemu-iotests: add QEMU_IOTESTS_REGEN=1 to update
 reference file
Date: Mon,  7 Mar 2022 19:44:10 -0600
Message-Id: <20220308014419.3056549-7-eblake@redhat.com>
In-Reply-To: <20220308014419.3056549-1-eblake@redhat.com>
References: <20220308014419.3056549-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

When developing an I/O test it is typical to add some logic to the
test script, run it to view the output diff, and then apply the
output diff to the reference file. This can be drastically simplified
by letting the test runner update the reference file in place.

By setting 'QEMU_IOTESTS_REGEN=1', the test runner will report the
failure and show the diff, but at the same time update the reference
file. So next time the I/O test is run it will succeed.

Continuing to display the diff when updating the reference gives the
developer a chance to review what was changed.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220304193610.3293146-7-berrange@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 41083ff9c6f7..5c207225b140 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -25,6 +25,7 @@
 import contextlib
 import json
 import termios
+import shutil
 import sys
 from multiprocessing import Pool
 from contextlib import contextmanager
@@ -322,6 +323,11 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:

         diff = file_diff(str(f_reference), str(f_bad))
         if diff:
+            if os.environ.get("QEMU_IOTESTS_REGEN", None) is not None:
+                shutil.copyfile(str(f_bad), str(f_reference))
+                print("########################################")
+                print("#####    REFERENCE FILE UPDATED    #####")
+                print("########################################")
             return TestResult(status='fail', elapsed=elapsed,
                               description=f'output mismatch (see {f_bad})',
                               diff=diff, casenotrun=casenotrun)
-- 
2.35.1


