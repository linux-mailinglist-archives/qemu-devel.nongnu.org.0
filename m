Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA642D3F3B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:55:00 +0100 (CET)
Received: from localhost ([::1]:40574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwBX-0002WO-EM
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:54:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw6B-0005O5-Pv
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw67-0007Qo-LP
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607507362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4AGHjiiyoWfPHvOu9gnxCxhCUV2+mC0SyPHzVmqzWg=;
 b=KBLW9LdVK5qfgSjB28WLKTREArU2gMYISpmb8a7dQRWop9zViwD0kLI+jd+bM9Qkr6tq+Z
 olvzl5noblTL0ABelMxrCETxMUy5UFPtKLJvFh/V71XR36Mk4lIeXaWfYHUmpW7a8AaLq7
 TEkmvXryd+wLAgeJW+hRTK30oqDqO6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-VXgldB8aObWViV5b4Au6xA-1; Wed, 09 Dec 2020 04:49:20 -0500
X-MC-Unique: VXgldB8aObWViV5b4Au6xA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74777107ACE3;
 Wed,  9 Dec 2020 09:49:19 +0000 (UTC)
Received: from thuth.com (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6793B5C234;
 Wed,  9 Dec 2020 09:49:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/13] gitlab-ci: Move coroutine tests across to gitlab
Date: Wed,  9 Dec 2020 10:48:55 +0100
Message-Id: <20201209094856.17788-13-thuth@redhat.com>
In-Reply-To: <20201209094856.17788-1-thuth@redhat.com>
References: <20201209094856.17788-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Similarly to commit 8cdb2cef3f1, move the coroutine tests to GitLab.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201108204535.2319870-13-philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
[thuth: Replaced Travis by Gitlab-CI in comment]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 16 ++++++++++++++++
 .travis.yml    | 14 --------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7381c7858d..873ed19fcf 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -413,6 +413,22 @@ build-tci:
     - QTEST_QEMU_BINARY="./qemu-system-x86_64" ./tests/qtest/pxe-test
     - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
 
+# Alternate coroutines implementations are only really of interest to KVM users
+# However we can't test against KVM on Gitlab-CI so we can only run unit tests
+build-coroutine-ucontext:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --with-coroutine=ucontext --disable-tcg
+    MAKE_CHECK_ARGS: check-unit
+
+build-coroutine-sigaltstack:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
+    MAKE_CHECK_ARGS: check-unit
+
 # Most jobs test latest gcrypt or nettle builds
 #
 # These jobs test old gcrypt and nettle from RHEL7
diff --git a/.travis.yml b/.travis.yml
index 12828f351c..d01714a5ae 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -148,20 +148,6 @@ jobs:
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
 
-    # Alternate coroutines implementations are only really of interest to KVM users
-    # However we can't test against KVM on Travis so we can only run unit tests
-    - name: "check-unit coroutine=ucontext"
-      env:
-        - CONFIG="--with-coroutine=ucontext --disable-tcg"
-        - TEST_CMD="make check-unit -j${JOBS} V=1"
-
-
-    - name: "check-unit coroutine=sigaltstack"
-      env:
-        - CONFIG="--with-coroutine=sigaltstack --disable-tcg"
-        - TEST_CMD="make check-unit -j${JOBS} V=1"
-
-
     # Check we can build docs and tools (out of tree)
     - name: "tools and docs (bionic)"
       dist: bionic
-- 
2.18.4


