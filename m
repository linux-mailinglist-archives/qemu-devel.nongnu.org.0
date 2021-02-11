Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78415319300
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:23:02 +0100 (CET)
Received: from localhost ([::1]:55836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHYL-00074J-Gm
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCn-0004mx-SU
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCO-0005hI-Mu
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sN8MdK64O4tSB1GA37t4E/lvX5+HIsnPJa3jb8uK+KM=;
 b=VyiPXoZIG2Z4aoiiLdCcCzs98xLqF6O7D05AL5MwIE+1g/bl+ewNIUebpJBlRRbzxyC9Er
 tiQgujX4Jzw9lUIxAl4t4KPQqXL5BjKy7LBmVKDvkPoTuevIMd4gfGZUuDoudQM8+kzBxV
 zekztFwt43PCTwSqatG/zSL1uX7Iexk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-qOnmYemBMDanx5BhJsv3tQ-1; Thu, 11 Feb 2021 14:00:18 -0500
X-MC-Unique: qOnmYemBMDanx5BhJsv3tQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF2B8180F179;
 Thu, 11 Feb 2021 19:00:06 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4806A6F99B;
 Thu, 11 Feb 2021 19:00:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/24] gitlab: add python linters to CI
Date: Thu, 11 Feb 2021 13:58:56 -0500
Message-Id: <20210211185856.3975616-25-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
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
 .gitlab-ci.yml                         | 10 ++++++++++
 tests/docker/dockerfiles/fedora.docker |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 28a83afb914..d1ae3972956 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -633,6 +633,16 @@ check-patch:
     GIT_DEPTH: 1000
   allow_failure: true
 
+
+check-python:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
+  script:
+    - cd python
+    - make venv-check
+  variables:
+    GIT_DEPTH: 1000
+
 check-dco:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 0d7602abbeb..1262b8c5e03 100644
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
2.29.2


