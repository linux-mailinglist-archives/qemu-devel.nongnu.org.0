Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6538A43C236
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 07:29:21 +0200 (CEST)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfbV2-0004kR-Hr
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 01:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfbSy-0002jH-Hn
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:27:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfbSw-0006sT-VL
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635312430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ob7HO+s04bW/k1ZAoKBdlVAzbc1RbPyfObX22rOHPy8=;
 b=Ffftc2akh2grCvE8AmkGBuGghtM+orq05NBTxlGzQ4jqVQUWAAxEaLO7Y5pxbKKQUJgyqD
 7z2xvCK1gnD5LaJdEctZXLax1s8HNLn3MqKx+xkYbKBOItaBOZfWU8iLbQgl4iWmsrE42j
 wxh0xtVks4F2wQkWluD/JiNICWH1Nr4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-ktKskA4rOiWI5sdc7zYjNA-1; Wed, 27 Oct 2021 01:27:08 -0400
X-MC-Unique: ktKskA4rOiWI5sdc7zYjNA-1
Received: by mail-wr1-f70.google.com with SMTP id
 f18-20020a5d58f2000000b001645b92c65bso268697wrd.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 22:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ob7HO+s04bW/k1ZAoKBdlVAzbc1RbPyfObX22rOHPy8=;
 b=8I/wwEq4IBxGd2B3txSVBJ4hwnLiOqDg/u6zpsvSbJiY/n2Vw0WFbj9U0graoSaG+q
 PFRJr8FPZTL976Bz1+vb6z+AkQV3AXnqnwjuu+3JzD3vEK5JofTnIMyW57/Lxejdg8sj
 33PTWeQ3OQocED53dC6mEKG39rPO6wyf5VvQRS3wdlIr2Q/DoQnE6vm7dBqypvrcM0Ap
 pF+BzATHVgNseR7BUnl0vxwQSAOI5e1KatJnm2oPtDL2DJuXb+1zHmviuNTDJ8Teifz+
 Y5NTTwdc1bK/cl3gVwQAO3M1h0aMkJHDOVE/pxUHFG1ycz1y5CqFkNIWsgEgobwrp757
 vydw==
X-Gm-Message-State: AOAM532CgW0sbFHVRoyBsc3OzyJuuzdI/+v91PR474UiEexevvhcLLqC
 56RJk9oRFTqp+pbe4flCfpbFRF0xqO+nd9NrtBPAOc13iV9EzsfO5dzSTx6KYB2/hST+R0V0fqC
 SZD0UX2vltolZR8rIJbDyqRSbdNQEUmfmSLh+jZQp8xhg51hilkZFBKKCLyfKbdV8
X-Received: by 2002:a7b:c207:: with SMTP id x7mr3397507wmi.116.1635312427404; 
 Tue, 26 Oct 2021 22:27:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgcjGd1RdVkLJe3mhQNFGAMYb/mkQq/ieercwZcisdnwnKsoyhOII96kfmdH7b2+Du6+z7IQ==
X-Received: by 2002:a7b:c207:: with SMTP id x7mr3397481wmi.116.1635312427129; 
 Tue, 26 Oct 2021 22:27:07 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l11sm5574127wrt.49.2021.10.26.22.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 22:27:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0.1 2/2] gitlab-ci: Only push docker images to registry
 from /master branch
Date: Wed, 27 Oct 2021 07:26:56 +0200
Message-Id: <20211027052656.1275436-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027052656.1275436-1-philmd@redhat.com>
References: <20211027052656.1275436-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users expect images pulled from registry.gitlab.com/qemu-project/qemu/
to be stable. QEMU repository workflow pushes merge candidates to
the /staging branch, and on success the same commit is pushed as
/master. If /staging fails, we do not want to push the built images
to the registry. Therefore limit the 'docker push' command to the
/master branch on the mainstream CI. The fork behavior is unchanged.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211026145509.1029274-1-philmd@redhat.com>
---
 .gitlab-ci.d/containers.yml | 11 ++++++++++-
 .gitlab-ci.d/edk2.yml       | 11 ++++++++++-
 .gitlab-ci.d/opensbi.yml    | 11 ++++++++++-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 33e4046e233..57928e4fb11 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -17,7 +17,16 @@
           -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
           -r $CI_REGISTRY_IMAGE
     - docker tag "qemu/$NAME" "$TAG"
-    - docker push "$TAG"
+    # On mainstream CI, we only want to push images on the master branch,
+    # so skip the other cases (tag or non-master branch).
+    - if test "$CI_PROJECT_NAMESPACE" = "qemu-project" &&
+         test -n "$CI_COMMIT_TAG"
+              -o "$CI_COMMIT_BRANCH" != "$CI_DEFAULT_BRANCH";
+      then
+        :;
+      else
+        docker push "$TAG";
+      fi
   after_script:
     - docker logout
 
diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index ba7280605c4..b165cc95214 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -21,7 +21,16 @@ docker-edk2:
  - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
                                         --tag $IMAGE_TAG .gitlab-ci.d/edk2
  - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
- - docker push $IMAGE_TAG
+ # On mainstream CI, we only want to push images on the master branch,
+ # so skip the other cases (tag or non-master branch).
+ - if test "$CI_PROJECT_NAMESPACE" = "qemu-project" &&
+      test -n "$CI_COMMIT_TAG"
+           -o "$CI_COMMIT_BRANCH" != "$CI_DEFAULT_BRANCH";
+   then
+      :;
+   else
+      docker push "$IMAGE_TAG";
+   fi
 
 build-edk2:
  stage: build
diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index f66cd1d9089..908540daaf7 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -21,7 +21,16 @@ docker-opensbi:
  - docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
                                         --tag $IMAGE_TAG .gitlab-ci.d/opensbi
  - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
- - docker push $IMAGE_TAG
+ # On mainstream CI, we only want to push images on the master branch,
+ # so skip the other cases (tag or non-master branch).
+ - if test "$CI_PROJECT_NAMESPACE" = "qemu-project" &&
+      test -n "$CI_COMMIT_TAG"
+           -o "$CI_COMMIT_BRANCH" != "$CI_DEFAULT_BRANCH";
+   then
+      :;
+   else
+      docker push "$IMAGE_TAG";
+   fi
 
 build-opensbi:
  stage: build
-- 
2.31.1


