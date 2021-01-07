Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277962ED58D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:27:59 +0100 (CET)
Received: from localhost ([::1]:59028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZ4n-0007kn-T7
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxYua-0003fd-UZ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:17:24 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxYuY-000397-Hq
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:17:23 -0500
Received: by mail-ej1-x62c.google.com with SMTP id b9so10832325ejy.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b0NzCmyBB4ZteNydjUa+TJSUSusQu1YP9R+RUai7m7k=;
 b=RBDNoqwaG9hjLGxd+YVUPwXikFUmZhrnF+J9Yg2OD96xTixvQ71102Dr/A1l3US7ZC
 Iz8bubIwX9SdCakrKpzFor24PnZsSHhv/5J/EZTF9Lr5ITGKgCeJc7FbhsqlBJyX4mFn
 LeF/sCfymJ1QwcbyYBCQuGa7cKYJPBmH2N5DxSJnt/mfQBZTOkNcUIEuxFESpKvjkRVH
 So43qWkrIWqHh6BmnhzoxfSbmQl0DYrD2PfC0dewUg9hW/5lCRpamiHThxbDELlKFmsr
 JLJ6vroj7xhTGhwuYLQ40y5RRo9+K0tQWcPB6R4+w2fpvdd7NKxmdUrhHMNf2Gs7RMBX
 zO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=b0NzCmyBB4ZteNydjUa+TJSUSusQu1YP9R+RUai7m7k=;
 b=KZA6rxamvL+ZzvpSIIcTiabNg/cwrEx/ONx9ofZza6L4lsWk99UwsZCwnYfI+JTIIO
 5P9MdoxULyWq9T9DL9BlB3jqyeNGBYeTjKeMcyB2DApZMv4x/MOneC/qrTlCck3H2+M2
 Pjf3WNE0ErOiH9DosLVDWsS1GOypIJgf5gVJbrYUDm8NhkcD+aNQX7F9k+muzSPkCVb5
 oCS+eGxcr1a1IVUdJ6qn9UHhdJ1mgGy0s8y6TjYzSbJz8XCb1tlgIer5sagk1f+sACr2
 V+MJ+/eAzPDtpjHiaM9rccCo7tAJMEwsYCKCiHv4pAUJYuwZ6mMWnE24v9HP5k0cHkRv
 SlyA==
X-Gm-Message-State: AOAM533l0oScHErJPbz/2Lg/82xtB2Zh1u5WyxTa3wFtNx3DyjtbeJaG
 CVaSsBoXT0hZ/6CqU9wp98k50uzCGrdXsA==
X-Google-Smtp-Source: ABdhPJwz10141S8ht/KfPxqXY/3Gya/xe5MqLmjaZCXKVkZqw++u/SmmgwRJE0ylX3RJcZ3XoADqmQ==
X-Received: by 2002:a17:907:a8a:: with SMTP id
 by10mr6871437ejc.423.1610039840839; 
 Thu, 07 Jan 2021 09:17:20 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v18sm2658985ejw.18.2021.01.07.09.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 09:17:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] ci: ensure that all jobs use a shallow clone
Date: Thu,  7 Jan 2021 18:17:19 +0100
Message-Id: <20210107171719.477856-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are still using quite a bit of bandwidth to run CI jobs, even though
GitLab has switched to gitlab.com to fetch the sources.  This is in
part because we are handling submodules ourselves and therefore those
do not use shallow clones.

Observe GitLab's GIT_DEPTH environment variable in
scripts/git-submodule.sh so that CI systems can use a shallow clone
for submodules.  Set a depth of 3 for all CI systems, for both the main
repository (using whatever native configuration mechanism is there)
and the submodules.

Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
        Completely untested, just to propose the idea.

 .cirrus.yml              | 1 +
 .gitlab-ci.yml           | 3 +++
 .shippable.yml           | 2 ++
 .travis.yml              | 2 ++
 scripts/git-submodule.sh | 2 +-
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 6f2a958472..47c2467d04 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,5 +1,6 @@
 env:
-  CIRRUS_CLONE_DEPTH: 1
+  CIRRUS_CLONE_DEPTH: 3
+  GIT_DEPTH: 3
 
 freebsd_12_task:
   freebsd_instance:
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 01c9e46410..ff19a9c313 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -7,6 +7,9 @@ stages:
   - build
   - test
 
+variables:
+  GIT_DEPTH: 3
+
 include:
   - local: '/.gitlab-ci.d/edk2.yml'
   - local: '/.gitlab-ci.d/opensbi.yml'
diff --git a/.shippable.yml b/.shippable.yml
index 14350e6de8..f2d59b478e 100644
--- a/.shippable.yml
+++ b/.shippable.yml
@@ -1,9 +1,11 @@
 language: c
+depth: 3
 git:
    submodules: false
 env:
   global:
     - LC_ALL=C
+    - GIT_DEPTH=3
   matrix:
     - IMAGE=debian-amd64
       TARGET_LIST=x86_64-softmmu,x86_64-linux-user
diff --git a/.travis.yml b/.travis.yml
index f2a101936c..f2a785a42b 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -80,9 +80,11 @@ env:
     - CCACHE_SLOPPINESS="include_file_ctime,include_file_mtime"
     - CCACHE_MAXSIZE=1G
     - G_MESSAGES_DEBUG=error
+    - GIT_DEPTH=3
 
 
 git:
+  depth: 3
   # we want to do this ourselves
   submodules: false
 
diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
index 65ed877aef..2886087a12 100755
--- a/scripts/git-submodule.sh
+++ b/scripts/git-submodule.sh
@@ -75,7 +75,7 @@ update)
         exit 0
     fi
 
-    $GIT submodule update --init $modules 1>/dev/null
+    $GIT submodule update ${GIT_DEPTH:+--depth "$GIT_DEPTH"} --init $modules 1>/dev/null
     test $? -ne 0 && error "failed to update modules"
 
     $GIT submodule status $modules > "${substat}"
-- 
2.29.2


