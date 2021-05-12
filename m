Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA537EFC6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:29:02 +0200 (CEST)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyHl-0007D1-5L
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy3L-0003JG-1E
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy3J-0006cP-HV
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M85MiHNvhi2Nrj5JT/o6dxLGmbP/3LZBliaXoC0lQAg=;
 b=A348EPB7sFIWjsmCg38sJ6yV/buKhSlgUhpXYjRU8AF3eZ4XOFCh/KwAPSKqEvhFsnm6i6
 PJec3VaWuAbOG8ojHH6+AG08zgEB0w7E7/1gkNzzMAiQSVbTafJpp1KFVpGHROtJwjzG/a
 gVNBTBDiRRzWevUo1PykPfuJ5spCEvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-gQjkaJscNEqY6EPoeh7BuQ-1; Wed, 12 May 2021 19:14:01 -0400
X-MC-Unique: gQjkaJscNEqY6EPoeh7BuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 766D7184609A;
 Wed, 12 May 2021 23:14:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BB7B62923;
 Wed, 12 May 2021 23:13:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 24/25] gitlab: add python linters to CI
Date: Wed, 12 May 2021 19:12:40 -0400
Message-Id: <20210512231241.2816122-25-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-1-jsnow@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add python3.6 to the fedora container image: we need it to run the
linters against that explicit version to make sure we don't break our
minimum version promise.

Add pipenv so that we can fetch precise versions of pip packages we need
to guarantee test reproducability.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab-ci.yml                         | 12 ++++++++++++
 tests/docker/dockerfiles/fedora.docker |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index dcb6317aace..a371c0c7163 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -779,6 +779,18 @@ check-patch:
     GIT_DEPTH: 1000
   allow_failure: true
 
+
+check-python:
+  stage: test
+  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
+  script:
+    - cd python
+    - make venv-check
+  variables:
+    GIT_DEPTH: 1000
+  needs:
+    job: amd64-fedora-container
+
 check-dco:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 915fdc1845e..6908d69ac37 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -84,6 +84,7 @@ ENV PACKAGES \
     numactl-devel \
     perl \
     perl-Test-Harness \
+    pipenv \
     pixman-devel \
     python3 \
     python3-PyYAML \
@@ -93,6 +94,7 @@ ENV PACKAGES \
     python3-pip \
     python3-sphinx \
     python3-virtualenv \
+    python3.6 \
     rdma-core-devel \
     SDL2-devel \
     snappy-devel \
-- 
2.30.2


