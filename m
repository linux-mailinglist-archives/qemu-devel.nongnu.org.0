Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E4C4DE2D5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:50:40 +0100 (CET)
Received: from localhost ([::1]:57146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJYV-0002Q7-6u
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:50:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLQ-0002X3-Hp
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLK-0005Yg-Aj
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sr2yL2ScHLiwNKfeNb0bCWVWw0mci9k85N8h6FJzlr4=;
 b=hqVGzbGgWjNVHaG/vXSJRfGiwtuDEcKK2yi0qeiAwTcxL2a74WjG/Lx4CSg3Qe2QxQPUYc
 UDMWbzQhSKdPRkUMWUbYOMP2q2fWp/3h2hwGWkFWWsSqUeFXc4bWiVycw6Kzm32hu6SrRl
 oIFCPW+k64R3xiXddDV4GpP6mnrpw2A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-qUzQ2dg9MoqazUEojYUmbA-1; Fri, 18 Mar 2022 16:37:00 -0400
X-MC-Unique: qUzQ2dg9MoqazUEojYUmbA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2017A1044564;
 Fri, 18 Mar 2022 20:37:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2F0D4292CE;
 Fri, 18 Mar 2022 20:36:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/15] iotests: remove qemu_io_pipe_and_status()
Date: Fri, 18 Mar 2022 16:36:53 -0400
Message-Id: <20220318203655.676907-14-jsnow@redhat.com>
In-Reply-To: <20220318203655.676907-1-jsnow@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I know we just added it, sorry. This is done in favor of qemu_io() which
*also* returns the console output and status, but with more robust error
handling on failure.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py           |  3 ---
 tests/qemu-iotests/tests/image-fleecing | 12 +++---------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 58ea766568..e8f38e7ad3 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -365,9 +365,6 @@ def qemu_io(*args: str, check: bool = True, combine_stdio: bool = True
     return qemu_tool(*qemu_io_wrap_args(args),
                      check=check, combine_stdio=combine_stdio)
 
-def qemu_io_pipe_and_status(*args):
-    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))
-
 def qemu_io_log(*args: str) -> subprocess.CompletedProcess[str]:
     result = qemu_io(*args, check=False)
     log(result.stdout, filters=[filter_testfiles, filter_qemu_io])
diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index b7e5076104..07a4ea7bc4 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -23,8 +23,7 @@
 # Creator/Owner: John Snow <jsnow@redhat.com>
 
 import iotests
-from iotests import log, qemu_img, qemu_io, qemu_io_silent, \
-    qemu_io_pipe_and_status
+from iotests import log, qemu_img, qemu_io, qemu_io_silent
 
 iotests.script_initialize(
     supported_fmts=['qcow2'],
@@ -185,10 +184,7 @@ def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
         for p in patterns + zeroes:
             cmd = 'read -P%s %s %s' % p
             log(cmd)
-            out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
-                                               nbd_uri)
-            if ret != 0:
-                print(out)
+            qemu_io('-r', '-f', 'raw', '-c', cmd, nbd_uri)
 
     log('')
     log('--- Testing COW ---')
@@ -228,9 +224,7 @@ def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
             args += [target_img_path]
         else:
             args += ['-f', 'raw', nbd_uri]
-        out, ret = qemu_io_pipe_and_status(*args)
-        if ret != 0:
-            print(out)
+        qemu_io(*args)
 
     log('')
     log('--- Cleanup ---')
-- 
2.34.1


