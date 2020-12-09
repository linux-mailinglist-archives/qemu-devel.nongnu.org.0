Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638ED2D3F50
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:58:21 +0100 (CET)
Received: from localhost ([::1]:50766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwEm-0006mK-EE
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw69-0005NU-Qd
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw67-0007Qg-1E
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607507361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nLGCmnPiwzTOGxMpIv3CrD+KsQctZ3kDi1bwndaDXFk=;
 b=TbdIQxTf489ysDqp57sYvJVuy8EL64poqRpsTwYy/t7Oet1mw4g1zNCRdPKFTnuloxFssZ
 wnf/1XuTAUUp8MC2GVRxb87HsVJwgmUFmFXD6CIt8AkPYH4NhUuQcl4cjh2JItos1UE7yq
 AmDiXOl9R/cKCWMjuWLbZtfwKsmJmRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-LErt0xMVMIGptFkwAZ61Ow-1; Wed, 09 Dec 2020 04:49:19 -0500
X-MC-Unique: LErt0xMVMIGptFkwAZ61Ow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E0EB802ED7;
 Wed,  9 Dec 2020 09:49:18 +0000 (UTC)
Received: from thuth.com (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 007305C234;
 Wed,  9 Dec 2020 09:49:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/13] gitlab-ci: Move user-static test across to gitlab
Date: Wed,  9 Dec 2020 10:48:54 +0100
Message-Id: <20201209094856.17788-12-thuth@redhat.com>
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

Similarly to commit 8cdb2cef3f1, move the user-static test to GitLab.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201108204535.2319870-11-philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 7 +++++++
 .travis.yml    | 5 -----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8f72a2630d..7381c7858d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -304,6 +304,13 @@ build-user:
     CONFIGURE_ARGS: --disable-tools --disable-system
     MAKE_CHECK_ARGS: check-tcg
 
+build-user-static:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --disable-tools --disable-system --static
+    MAKE_CHECK_ARGS: check-tcg
+
 # Only build the softmmu targets we have check-tcg tests for
 build-some-softmmu:
   <<: *native_build_job_definition
diff --git a/.travis.yml b/.travis.yml
index 1f80bdb624..12828f351c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -119,11 +119,6 @@ after_script:
 
 jobs:
   include:
-    - name: "GCC static (user)"
-      env:
-        - CONFIG="--disable-system --static"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-
     # Just build tools and run minimal unit and softfloat checks
     - name: "GCC check-unit and check-softfloat"
       env:
-- 
2.18.4


