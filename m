Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D884530A1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:29:40 +0100 (CET)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmweh-00018A-Ex
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:29:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmwdU-0000Sh-RP
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:28:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmwdS-0008O3-Bg
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637062101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+PJQfT9tvcCYTPThPACEX8tFEfD07sON/R8IiER/dHc=;
 b=XXdgKdG2VRmyCl8BogoQHf1Ls6HgvNVKdgvQvz/czsANw9AnR6ksG8muVKW777tmP4dFQw
 6MycViDt5vKVtVQg4SE4XOmMrXJP1lupBDQw9soVUDlJkvvXIh1PF5ZOuPGXcvatb7kilT
 bk7WhNesa4IRN2yeknX6h8G+c0WF4/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-51-cQsTcMNmPSaJZlsMIiEnLw-1; Tue, 16 Nov 2021 06:28:18 -0500
X-MC-Unique: cQsTcMNmPSaJZlsMIiEnLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6656715721;
 Tue, 16 Nov 2021 11:28:17 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 343E1ADCD;
 Tue, 16 Nov 2021 11:27:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab: skip cirrus jobs on master and stable branches
Date: Tue, 16 Nov 2021 11:27:57 +0000
Message-Id: <20211116112757.1909176-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On the primary QEMU repository we want the CI jobs to run on the staging
branch as a gating CI test.

Cirrus CI has very limited job concurrency, so if there are too many
jobs triggered they'll queue up and hit the GitLab CI job timeout before
they complete on Cirrus.

If we let Cirrus jobs run again on the master branch immediately after
merging from staging, that just increases the chances jobs will get
queued and subsequently timeout.

The same applies for merges to the stable branches.

User forks meanwhile should be allowed to run Cirrus CI jobs freely.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/cirrus.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index e7b25e7427..cc2f2e8906 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -40,6 +40,9 @@
     - cat .gitlab-ci.d/cirrus/$NAME.yml
     - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
   rules:
+    # Allow on 'staging' branch and 'stable-X.Y-staging' branches only
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH !~ /staging/'
+      when: never
     - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
 
 x64-freebsd-12-build:
-- 
2.31.1


