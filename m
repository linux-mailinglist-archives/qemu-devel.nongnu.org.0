Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEF0433BC9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:11:33 +0200 (CEST)
Received: from localhost ([::1]:49054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcri8-0004iW-Gf
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQj-0001Qz-Ad
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQe-00080d-Ti
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntV7nxemO6jbrlF9Kwwy+ovD9pcR4W4Dbt7SkBNUns0=;
 b=Gcn4G5yWu7P7eLnnPbk4orXALaVc4TBiIipZDF+r+ehuJW/Jxy1+SYKpQXe0FGNk/Z8cgX
 +ssLGvk34jVKOsL+zoYabcyDsLvoYxUer9B4bl/ya0GTpyvqBCY31Xj71zdA72kuhvoNw1
 2Y9SGxtLACIv+4tBJPsvgJnF17RwQvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-zZe-5RxRMQSj_aDpxGmr7Q-1; Tue, 19 Oct 2021 10:49:23 -0400
X-MC-Unique: zZe-5RxRMQSj_aDpxGmr7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B60F101F001;
 Tue, 19 Oct 2021 14:49:22 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50B2A5D6D7;
 Tue, 19 Oct 2021 14:49:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/15] iotests/297: Split mypy configuration out into
 mypy.ini
Date: Tue, 19 Oct 2021 10:49:05 -0400
Message-Id: <20211019144918.3159078-3-jsnow@redhat.com>
In-Reply-To: <20211019144918.3159078-1-jsnow@redhat.com>
References: <20211019144918.3159078-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

More separation of code and configuration.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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


