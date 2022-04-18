Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1651505F39
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 23:18:45 +0200 (CEST)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngYlg-0004Bm-Tf
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 17:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYiY-0001J8-KQ
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYiV-0004qn-I7
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650316522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPmM9pzLDB1r2AULXuNtxAQZmc6602/wRTStxNuvDIw=;
 b=EK2Mw8YxEikyBhkpNZssVHQQbuGTU3uMHgwUKWOw18cWItvfHMRI1BEFZHLutjJbd5tIwv
 uIapxIMgNxNtNUWR2JsZN+uetSUHwfsVUazl4D5578v2fUQaMLS8oURTcSCNMzmuYlrjGA
 kSRJNVRmv4pH6UsrS8qaA+zbeez7LuI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-2OOQF3TnOOacb6j1daV-nQ-1; Mon, 18 Apr 2022 17:15:18 -0400
X-MC-Unique: 2OOQF3TnOOacb6j1daV-nQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DCFD299E76B;
 Mon, 18 Apr 2022 21:15:18 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1A70215CDCA;
 Mon, 18 Apr 2022 21:15:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/12] iotests/image-fleecing: switch to qemu_io()
Date: Mon, 18 Apr 2022 17:15:01 -0400
Message-Id: <20220418211504.943969-10-jsnow@redhat.com>
In-Reply-To: <20220418211504.943969-1-jsnow@redhat.com>
References: <20220418211504.943969-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test expects failure ... but only sometimes. When? Why?

It's for reads of a region not defined by a bitmap. Adjust the test to
be more explicit about what it expects to fail and why.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing | 28 +++++++++++++++++--------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index b7e50761044..ac749702f8e 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -22,9 +22,10 @@
 #
 # Creator/Owner: John Snow <jsnow@redhat.com>
 
+from subprocess import CalledProcessError
+
 import iotests
-from iotests import log, qemu_img, qemu_io, qemu_io_silent, \
-    qemu_io_pipe_and_status
+from iotests import log, qemu_img, qemu_io, qemu_io_silent
 
 iotests.script_initialize(
     supported_fmts=['qcow2'],
@@ -185,10 +186,14 @@ def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
         for p in patterns + zeroes:
             cmd = 'read -P%s %s %s' % p
             log(cmd)
-            out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
-                                               nbd_uri)
-            if ret != 0:
-                print(out)
+
+            try:
+                qemu_io('-r', '-f', 'raw', '-c', cmd, nbd_uri)
+            except CalledProcessError as exc:
+                if bitmap and p in zeroes:
+                    log(exc.stdout)
+                else:
+                    raise
 
     log('')
     log('--- Testing COW ---')
@@ -228,9 +233,14 @@ def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
             args += [target_img_path]
         else:
             args += ['-f', 'raw', nbd_uri]
-        out, ret = qemu_io_pipe_and_status(*args)
-        if ret != 0:
-            print(out)
+
+        try:
+            qemu_io(*args)
+        except CalledProcessError as exc:
+            if bitmap and p in zeroes:
+                log(exc.stdout)
+            else:
+                raise
 
     log('')
     log('--- Cleanup ---')
-- 
2.34.1


