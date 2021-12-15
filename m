Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B86476474
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:20:41 +0100 (CET)
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbhW-0006eu-B4
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:20:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbWH-00048m-Gn
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:09:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbWG-0006cv-1T
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:09:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bD+Iw+cQM3uHkNIkanehEK2ltYup32z/f+o2t1hFQGI=;
 b=UWIbLIxpFzXa5WzytFVaylLxftb9U5BOkJNKFiwkKD7BoCM1lA3fONB3PEUzsqQU04E1X1
 N+dRIzmcCvG1Ybj630yIziVam9vdYGpU5QT+1e+taIpotLcokCqJIpT09UWKhUmzRZVM55
 23wBzhbL4ewAWXthcrGosf4vVhR9Ktw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-yRJO-f-_PMSnzIYx0CrAQg-1; Wed, 15 Dec 2021 16:08:56 -0500
X-MC-Unique: yRJO-f-_PMSnzIYx0CrAQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD67A1054F92;
 Wed, 15 Dec 2021 21:08:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA9B35BE35;
 Wed, 15 Dec 2021 21:08:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 11/24] Add package build step to GitLab CI
Date: Wed, 15 Dec 2021 16:06:21 -0500
Message-Id: <20211215210634.3779791-12-jsnow@redhat.com>
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

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab-ci.d/build.yml | 13 +++++++++++++
 .gitlab-ci.d/index.yml |  2 ++
 2 files changed, 15 insertions(+)
 create mode 100644 .gitlab-ci.d/build.yml

diff --git a/.gitlab-ci.d/build.yml b/.gitlab-ci.d/build.yml
new file mode 100644
index 0000000..6a68408
--- /dev/null
+++ b/.gitlab-ci.d/build.yml
@@ -0,0 +1,13 @@
+build-package:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/python:latest
+  needs:
+    job: python-container
+  script:
+    - python3 -m build
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG-$CI_COMMIT_SHORT_SHA"
+    paths:
+      - dist/*
+  variables:
+    GIT_DEPTH: 1
diff --git a/.gitlab-ci.d/index.yml b/.gitlab-ci.d/index.yml
index 5ef8fcf..cf61dec 100644
--- a/.gitlab-ci.d/index.yml
+++ b/.gitlab-ci.d/index.yml
@@ -3,6 +3,8 @@
 
 stages:
   - containers
+  - build
 
 include:
   - local: '/.gitlab-ci.d/containers.yml'
+  - local: '/.gitlab-ci.d/build.yml'
-- 
2.31.1


