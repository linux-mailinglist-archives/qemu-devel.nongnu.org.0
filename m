Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF324218FE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:08:18 +0200 (CEST)
Received: from localhost ([::1]:33472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVC5-0003ky-So
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9H-0008QP-Et
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9F-0007Jz-71
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9svPZTEZXeprp0K3ghNiPLY2v5vyIdmsQFVVqUATgI=;
 b=USMpLfPfhvGLjMRsWJoE8wcqOsirk8wDr7vCJLWh1JBF6H0m+sUGC7ALUIuDGLgf7QqsBN
 43ZmlNVEyPk2ZZqGgL1Z0e93tBsQryavZrOkyFms1M3XTPa496qO5JWqU4nqBkmJi16A1Y
 xxoAmh2++Vf5RJp4x3oCdIrubjBvSsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-Be6MVSPUOG-1zWpGZmLG8Q-1; Mon, 04 Oct 2021 17:05:19 -0400
X-MC-Unique: Be6MVSPUOG-1zWpGZmLG8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F23C1808304;
 Mon,  4 Oct 2021 21:05:18 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 831A419C59;
 Mon,  4 Oct 2021 21:05:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/13] iotests/297: Split mypy configuration out into mypy.ini
Date: Mon,  4 Oct 2021 17:04:52 -0400
Message-Id: <20211004210503.1455391-3-jsnow@redhat.com>
In-Reply-To: <20211004210503.1455391-1-jsnow@redhat.com>
References: <20211004210503.1455391-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

More separation of code and configuration.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297      | 14 +-------------
 tests/qemu-iotests/mypy.ini | 12 ++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)
 create mode 100644 tests/qemu-iotests/mypy.ini

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index bc3a0ceb2aa..b8101e6024a 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -73,19 +73,7 @@ def run_linters():
     sys.stdout.flush()
 
     env['MYPYPATH'] = env['PYTHONPATH']
-    p = subprocess.run(('mypy',
-                        '--warn-unused-configs',
-                        '--disallow-subclassing-any',
-                        '--disallow-any-generics',
-                        '--disallow-incomplete-defs',
-                        '--disallow-untyped-decorators',
-                        '--no-implicit-optional',
-                        '--warn-redundant-casts',
-                        '--warn-unused-ignores',
-                        '--no-implicit-reexport',
-                        '--namespace-packages',
-                        '--scripts-are-modules',
-                        *files),
+    p = subprocess.run(('mypy', *files),
                        env=env,
                        check=False,
                        stdout=subprocess.PIPE,
diff --git a/tests/qemu-iotests/mypy.ini b/tests/qemu-iotests/mypy.ini
new file mode 100644
index 00000000000..4c0339f5589
--- /dev/null
+++ b/tests/qemu-iotests/mypy.ini
@@ -0,0 +1,12 @@
+[mypy]
+disallow_any_generics = True
+disallow_incomplete_defs = True
+disallow_subclassing_any = True
+disallow_untyped_decorators = True
+implicit_reexport = False
+namespace_packages = True
+no_implicit_optional = True
+scripts_are_modules = True
+warn_redundant_casts = True
+warn_unused_configs = True
+warn_unused_ignores = True
-- 
2.31.1


