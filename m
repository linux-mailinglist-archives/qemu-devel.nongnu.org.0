Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A10931422C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:46:50 +0100 (CET)
Received: from localhost ([::1]:57388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EMr-0001c8-J6
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l99UB-0002cn-9H
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:34:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l99U4-0002Vi-Rv
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612802031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJq1C2sR7w5F0IxKwhKqbqySl18My6VanQCSO9Mzv+g=;
 b=JE3HNcBTgxz5Q3w53Vb43lQSCidzIrXxnOU/JcL+hmqnu8goCx2ISLw1i430zmtPGCzeET
 KWG4MVT5+Sokhn+CfaHOFcgi1p2C4HIAlhBjkzJYLDyGI9cpgdaVv18K0EIz64y1y8vYUc
 3wkC5GplQlMB2cSZAFoxomMG3byV0AA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-Ht4ZKF4YOneTnJAlbJeZag-1; Mon, 08 Feb 2021 11:33:50 -0500
X-MC-Unique: Ht4ZKF4YOneTnJAlbJeZag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3283F804023;
 Mon,  8 Feb 2021 16:33:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-97.ams2.redhat.com
 [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A25519C59;
 Mon,  8 Feb 2021 16:33:47 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] gitlab: always build container images
Date: Mon,  8 Feb 2021 16:33:37 +0000
Message-Id: <20210208163339.1159514-2-berrange@redhat.com>
In-Reply-To: <20210208163339.1159514-1-berrange@redhat.com>
References: <20210208163339.1159514-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we attempt to skip building container images if the commits do
not involve changes to the dockerfiles or gitlab CI definitions.

Conceptually this makes sense, but there is a challenge in the real
world implementation of this in gitlab.

In the case of a CI pipeline triggered from a merge request, GitLab
knows the common ancestor of the merge request and the main git repo,
so it can trivially determine if any of the commits associated with
the MR change the dockerfiles.

In the case of a CI pipeline triggered from a push to a branch, it is
much more difficult. There is no concept of a common ancestor in this
case. Instead GitLab looks at the set of commits in the git push event.

On the surface this may sound reasonable, but it doesn't take into
account that a push event does not always contain the full set of
patches from a branch.

For example, consider pushing 5 commits, one of which contains a
dockerfile change. This will trigger a CI pipeline for the
containers. Now consider you do some more work on the branch and push 3
further commits, so you now have a branch of 8 commits. For the second
push GitLab will only look at the 3 most recent commits, the other 5
were already present. Thus GitLab will not realize that the branch has
dockerfile changes that need to trigger the container build.

This can cause real world problems:

 - Push 5 commits to branch "foo", including a dockerfile change

    => rebuilds the container images with content from "foo"
    => build jobs runs against containers from "foo"

 - Refresh your master branch with latest upstream master

    => rebuilds the container images with content from "master"
    => build jobs runs against containers from "master"

 - Push 3 more commits to branch "foo", with no dockerfile change

    => no container rebuild triggers
    => build jobs runs against containers from "master"

The "changes" conditional in gitlab is OK, *provided* your build
jobs are not relying on any external state from previous builds.

This is NOT the case in QEMU, because we are building container
images and these are cached. This is a scenario in which the
"changes" conditional is not usuable.

The only other way to avoid this problem would be to use the git
branch name as the container image tag, instead of always using
"latest". The downside of this approach is that the user's gitlab
registry will grow significantly until it starts to trigger
GitLab's automatic deletion policy.  Every time the user starts
a new branch they will have to trigger a rebuild of the container
images. Given this, we might as well just drop the conditional
and always build the container images. Most of the time docker
will be able to use the layer cache to avoid the most expensive
part of the rebuild process (installing all the RPMs/debs/etc)

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/containers.yml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 90fac85ce4..33e4046e23 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -20,13 +20,6 @@
     - docker push "$TAG"
   after_script:
     - docker logout
-  rules:
-    - changes:
-      - .gitlab-ci.d/containers.yml
-      - tests/docker/*
-      - tests/docker/dockerfiles/*
-    - if: '$CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
-    - if: '$CI_COMMIT_REF_NAME == "testing/next"'
 
 amd64-alpine-container:
   <<: *container_job_definition
-- 
2.29.2


