Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EB840C5DB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 15:03:29 +0200 (CEST)
Received: from localhost ([::1]:41414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQUZT-0007Gt-Qa
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 09:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQURq-0001BI-JY
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQURn-0008LH-U5
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631710529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TyQQsY+7H76DVQ6N1XLFvPr/q1wSv2kCaBLI6XJUL1o=;
 b=Ql/ICe8spSoL3pU4ti0f9AfyAjksRpirEcNE97Lk4F6/RPpHUI+Q8Q3G9nYGyo2U+E8pBw
 8U3WSUsrP3I85+qlNmncr30pq5mkmq7w06lP7H443uVxT/WFraznu4ytiT6oo0e1eV5OtJ
 /PdbZWiDicPlvZ3DN6bG3jKR+mXFDWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-N071O6RRMEeM0oMUIEuuQw-1; Wed, 15 Sep 2021 08:55:26 -0400
X-MC-Unique: N071O6RRMEeM0oMUIEuuQw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1679802C89;
 Wed, 15 Sep 2021 12:55:25 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 016D260C82;
 Wed, 15 Sep 2021 12:55:16 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] gitlab: fix passing of TEST_TARGETS env to cirrus
Date: Wed, 15 Sep 2021 13:54:52 +0100
Message-Id: <20210915125452.1704899-3-berrange@redhat.com>
In-Reply-To: <20210915125452.1704899-1-berrange@redhat.com>
References: <20210915125452.1704899-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A typo meant the substitution would not work, and the placeholder in the
target file didn't even exist.

The result was that tests were never run on the FreeBSD and macOS jobs,
only a basic build.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/cirrus.yml       | 2 +-
 .gitlab-ci.d/cirrus/build.yml | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 675db69622..e7b25e7427 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -35,7 +35,7 @@
           -e "s|[@]PIP3@|$PIP3|g"
           -e "s|[@]PYPI_PKGS@|$PYPI_PKGS|g"
           -e "s|[@]CONFIGURE_ARGS@|$CONFIGURE_ARGS|g"
-          -e "s|[@]TEST_TARGETSS@|$TEST_TARGETSS|g"
+          -e "s|[@]TEST_TARGETS@|$TEST_TARGETS|g"
       <.gitlab-ci.d/cirrus/build.yml >.gitlab-ci.d/cirrus/$NAME.yml
     - cat .gitlab-ci.d/cirrus/$NAME.yml
     - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
index 857bdc5536..c555f5d36e 100644
--- a/.gitlab-ci.d/cirrus/build.yml
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -13,6 +13,7 @@ env:
   PYTHON: "@PYTHON@"
   MAKE: "@MAKE@"
   CONFIGURE_ARGS: "@CONFIGURE_ARGS@"
+  TEST_TARGETS: "@TEST_TARGETS@"
 
 build_task:
   install_script:
-- 
2.31.1


