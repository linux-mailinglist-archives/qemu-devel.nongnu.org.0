Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443262FB9B4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:42:58 +0100 (CET)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sDh-0000jA-Am
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l1sBR-0007mT-Db
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:40:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l1sBP-0004he-Ti
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:40:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id c124so16671475wma.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5VXdggT1FNKRM5dV8y5s3x8OYY44rAZkDFrKIoeKid0=;
 b=nR1Io+0j7dPROwCmFgK/3wTbSkkgjCCRSurVOcd9AHmabfpnBrEmGSsFvAfAZjfcmw
 1j6t3E3SOd1TeVNQR2CXeCusSCvKXq4fJCWpjIwVcCVuuQavJivkC4G0LLVxJecDwHCR
 BbVMppB4WS/h/6hFxex2xSE9T8sMMdK/w0Rn7cP3K8Sq0s44KLq+osHD65tH3QxIDqdM
 AtIZi6Gg9n67gCMb3K7m8g75ISh5rZOE8eINWQ62CDSYO7JB6Dy2lGAOV/kDPYRQ26j7
 aZI4iwkXcuRc6FNBrmHWRu0Gr8psdHSNdX3znBaT4gfvY5HYnqp5KyZOcpBb3MkcNk3M
 trlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5VXdggT1FNKRM5dV8y5s3x8OYY44rAZkDFrKIoeKid0=;
 b=irM2/r4a+7ACBqpsSVx+2VGWXhfV/mZn4NQUZD0O/b2NzTddIek9yGBgdhyD6CqfnZ
 rY0kOvqZjMmjQ4m6oZ0KYtVewmCKZ6sMSUwubLYUssRVr3MJsPuyWiTBd8Qx6ff7LOyC
 8U/XZIlFn6QclsFrYxlZvpSWJF6uJJWqpn3Iy3AuQeeD7kBiGwOsJKei6SSpMC4H6DxH
 TJhH18Io1h1CQIPNZE7sID2jaDlj4dAwWnbU6ukpwxzdJ7TA6bbrNm/CDTOqd/QgsJlK
 5TymvRDSU4AhvVSUluUXxliquC8qVf08gvaKf8Uwe+Rsy7Tt0P8zQGhHqQ/7Elv1CEoN
 +Ltg==
X-Gm-Message-State: AOAM532gRy8SOXwjwQ3OJIfTUXR956iFsfNDYW0kxRpVlFvNOK1AfQUS
 CtxQKBbMJEieIdhqxaTe8tFl9vcmRuArfQ==
X-Google-Smtp-Source: ABdhPJwV60z2/igjWlqiC+VDBT/Fy9lZbsn0Sz1r3ivTvzb1Y539NRD4byjD7zRZ1/8C5vch7db2zw==
X-Received: by 2002:a1c:1b48:: with SMTP id b69mr703269wmb.95.1611067234220;
 Tue, 19 Jan 2021 06:40:34 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a130sm4553955wmf.4.2021.01.19.06.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 06:40:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] deploy docs to qemu-project.org from GitLab CI
Date: Tue, 19 Jan 2021 15:40:32 +0100
Message-Id: <20210119144032.305380-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: berrange@redhat.com, alex.bennee@linaro.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the website is rebuilt on qemu-project.org using
a separate container (https://github.com/stefanha/qemu-docs/)
cron job hook.  We can instead reuse the GitLab's CI artifacts.

To do so, we use the same mechanism that is already in place for
qemu-web.git.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
        v1->v2: use same image and before_script as qemu-web.git

 .gitlab-ci.yml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fd0162ad29..d9afc79b30 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -6,6 +6,7 @@ stages:
   - containers-layer2
   - build
   - test
+  - update
 
 include:
   - local: '/.gitlab-ci.d/edk2.yml'
@@ -627,3 +628,26 @@ pages:
   artifacts:
     paths:
       - public
+
+deploy:
+  image: centos:8
+  stage: update
+  needs:
+    - job: pages
+      artifacts: true
+  before_script:
+    - dnf install -y openssh-clients rsync
+    - eval $(ssh-agent -s)
+    - cat "$SSH_PRIVATE_KEY_FILE" | tr -d '\r' | ssh-add -
+    - mkdir -m700 -p ~/.ssh
+    - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config'
+  script:
+    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && mkdir new-docs && rsync -az docs/ new-docs"
+    - rsync -avz --delete public/ $SSH_DEPLOY_DESTINATION:/var/www/qemu-project.org/new-docs
+    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && rm -rf old-docs && mv docs old-docs && mv new-docs docs"
+  only:
+    refs:
+      - master
+    variables:
+      - $SSH_PRIVATE_KEY_FILE
+      - $SSH_DEPLOY_DESTINATION
-- 
2.29.2


