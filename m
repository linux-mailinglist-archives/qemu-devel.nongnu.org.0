Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75153476478
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:22:09 +0100 (CET)
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbix-0000Sx-Gr
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:22:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXC-0004pz-2K
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXA-0006hk-EW
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQqNKvryU+dJMa6A0Hz4jFSJltndRPH1C4vnZxOdfo8=;
 b=LInW10t+TbYwcAQvKusX8/gI8pAFlxtR7GIbcr7CmjKlL1Ep018ghij3aPKYOHaYZkRFWV
 WFhWAt8ig0yiYkSxGq2IghW7Fy4TP+qdzQ21pz92YKMDvW6QcMILSdGmSLvk0NAnyWFR1Z
 t/chPQVv00HlavG3M4Q95R6PacuMvX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558--faJZUggP7uGRNKgRjFzdA-1; Wed, 15 Dec 2021 16:09:54 -0500
X-MC-Unique: -faJZUggP7uGRNKgRjFzdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9B62835E28;
 Wed, 15 Dec 2021 21:09:53 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A0D147396;
 Wed, 15 Dec 2021 21:09:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 13/24] GitLab CI: Add pipenv and tox tests
Date: Wed, 15 Dec 2021 16:06:23 -0500
Message-Id: <20211215210634.3779791-14-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FIXME: For testing purposes, this patch is still using my personal
GitLab URLs, which will have to be changed before this is pushed to
production.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab-ci.d/test.yml | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/.gitlab-ci.d/test.yml b/.gitlab-ci.d/test.yml
index 35fa105..19e0c37 100644
--- a/.gitlab-ci.d/test.yml
+++ b/.gitlab-ci.d/test.yml
@@ -13,3 +13,46 @@ check-dco:
     - if: '$CI_PROJECT_NAMESPACE == "jsnow" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
       when: never
     - when: on_success
+
+.python_test:
+  stage: test
+  image: $CI_REGISTRY_IMAGE/python:latest
+  variables:
+    GIT_DEPTH: 1
+  needs:
+    job: python-container
+
+check-python-pipenv:
+  extends: .python_test
+  script:
+    - make check-pipenv
+
+check-python-36:
+  extends: .python_test
+  script:
+    - QEMU_TOX_EXTRA_ARGS="-e py36" make check-tox
+  allow_failure: true
+
+check-python-37:
+  extends: .python_test
+  script:
+    - QEMU_TOX_EXTRA_ARGS="-e py37" make check-tox
+  allow_failure: true
+
+check-python-38:
+  extends: .python_test
+  script:
+    - QEMU_TOX_EXTRA_ARGS="-e py38" make check-tox
+  allow_failure: true
+
+check-python-39:
+  extends: .python_test
+  script:
+    - QEMU_TOX_EXTRA_ARGS="-e py39" make check-tox
+  allow_failure: true
+
+check-python-310:
+  extends: .python_test
+  script:
+    - QEMU_TOX_EXTRA_ARGS="-e py310" make check-tox
+  allow_failure: true
-- 
2.31.1


