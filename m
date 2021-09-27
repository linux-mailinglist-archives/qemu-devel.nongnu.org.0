Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A784194F5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:21:12 +0200 (CEST)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqZD-0006Pp-2W
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLc-0003Nx-3K
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLT-0003lT-Ko
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjPpMnc58DLxC5DY4u0Ib6Ur9fvVvDsCHwZCAzUfZVo=;
 b=ZDGSylOKsCqwawX5vcTCcy8OnSJ2DDO8B83F62aJ3j9d9aI1T2d0XFdqMbKa+y/GUs7NEx
 GAHyU6WZK58rvqEjZnO5AAYKXz6tEO9cCF3WK5o6nhS1p1XvJiGW/8HB5uRtTk7ycGGHEs
 cExSgwIAnnBYGr7saBMR/VrQ45EaFuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-w4nLbBXIMCawUnJ1G2RjNQ-1; Mon, 27 Sep 2021 09:06:54 -0400
X-MC-Unique: w4nLbBXIMCawUnJ1G2RjNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94FCA5074F;
 Mon, 27 Sep 2021 13:06:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6894260C13;
 Mon, 27 Sep 2021 13:06:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D0DCE1135221; Mon, 27 Sep 2021 15:06:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 25/25] tests/qapi-schema: Make test-qapi.py -u work when
 files are absent
Date: Mon, 27 Sep 2021 15:06:47 +0200
Message-Id: <20210927130647.1271533-26-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
References: <20210927130647.1271533-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test-qapi.py -u updates the expected files.  Since it fails when they
are absent, users have to create them manually before they can use
test-qapi.py to fill in the contents, say for a new test.  Silly.
Improve -u to create them.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210922125619.670673-3-armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 tests/qapi-schema/test-qapi.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index 2e384f5efd..c717a7a90b 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -132,6 +132,17 @@ def test_frontend(fname):
             print('    section=%s\n%s' % (section.name, section.text))
 
 
+def open_test_result(dir_name, file_name, update):
+    mode = 'r+' if update else 'r'
+    try:
+        fp = open(os.path.join(dir_name, file_name), mode)
+    except FileNotFoundError:
+        if not update:
+            raise
+        fp = open(os.path.join(dir_name, file_name), 'w+')
+    return fp
+
+
 def test_and_diff(test_name, dir_name, update):
     sys.stdout = StringIO()
     try:
@@ -148,10 +159,9 @@ def test_and_diff(test_name, dir_name, update):
         sys.stdout.close()
         sys.stdout = sys.__stdout__
 
-    mode = 'r+' if update else 'r'
     try:
-        outfp = open(os.path.join(dir_name, test_name + '.out'), mode)
-        errfp = open(os.path.join(dir_name, test_name + '.err'), mode)
+        outfp = open_test_result(dir_name, test_name + '.out', update)
+        errfp = open_test_result(dir_name, test_name + '.err', update)
         expected_out = outfp.readlines()
         expected_err = errfp.readlines()
     except OSError as err:
-- 
2.31.1


