Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28361519225
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:07:29 +0200 (CEST)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1c8-0005YC-6U
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlzG8-0005Lm-MT
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:36:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlzG7-0000wJ-8D
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651610189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6h5GsZkPLCCfgX9fnXCTovFW1svaqTOHU+d1wxfuZdU=;
 b=drug9REcHzmNPDqFKVmydZPXZerwM9MO7d0V+vH8onUS7f6xyCxohwNOIjSAS4+Pf3ujYE
 m8cvfFsgGXiYMsk9VJtDBfoTbUofMTldwgQpS6Hf4zE8AqAki4A0ocGTjHHRElw/YsLPjc
 LvjBY3yDeuPq6oxQzxtJ7ApfPgi2kgg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-ligGoWazO6O1iGRFFgypcQ-1; Tue, 03 May 2022 16:36:26 -0400
X-MC-Unique: ligGoWazO6O1iGRFFgypcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C87A238C5C42;
 Tue,  3 May 2022 20:36:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EF5715391EA;
 Tue,  3 May 2022 20:36:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] gitlab-ci: Switch the 'check-patch' & 'check-dco' jobs to
 use python-container
Date: Tue,  3 May 2022 22:36:21 +0200
Message-Id: <20220503203621.243153-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'check-patch' and 'check-dco' jobs only need Python and git for
checking the patches, so it's not really necessary to use a container
here that has all the other build dependencies installed. By installing
"git" in the python container, we can use this light-weight container
for these jobs instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Mark as RFC since I'm not sure whether we want to have "git" in
 the python container or not?

 .gitlab-ci.d/static_checks.yml         | 8 ++++----
 tests/docker/dockerfiles/python.docker | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 5e955540d3..0e080bd0a0 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -1,8 +1,8 @@
 check-patch:
   stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
+  image: $CI_REGISTRY_IMAGE/qemu/python:latest
   needs:
-    job: amd64-centos8-container
+    job: python-container
   script:
     - .gitlab-ci.d/check-patch.py
   variables:
@@ -15,9 +15,9 @@ check-patch:
 
 check-dco:
   stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
+  image: $CI_REGISTRY_IMAGE/qemu/python:latest
   needs:
-    job: amd64-centos8-container
+    job: python-container
   script: .gitlab-ci.d/check-dco.py
   variables:
     GIT_DEPTH: 1000
diff --git a/tests/docker/dockerfiles/python.docker b/tests/docker/dockerfiles/python.docker
index 56d88417df..b2fb3a306d 100644
--- a/tests/docker/dockerfiles/python.docker
+++ b/tests/docker/dockerfiles/python.docker
@@ -6,6 +6,7 @@ MAINTAINER John Snow <jsnow@redhat.com>
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
     gcc \
+    git \
     make \
     pipenv \
     python3 \
-- 
2.27.0


