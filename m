Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028F2FB572
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:45:55 +0100 (CET)
Received: from localhost ([::1]:49956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oWH-0003OZ-VU
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l1o3G-0002W6-4V
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:15:58 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l1o3E-0004Uj-IV
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:15:53 -0500
Received: by mail-ej1-x635.google.com with SMTP id g3so8316896ejb.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 02:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLpi8sYT5S+qdoGKlpO/ZiUjqCn4wOZWMaEqltjPyAE=;
 b=iZ/Bat04C+XEfeWcCchjT86fD/Rm8W6Q5VgBPnoy2MDVWXN61Yb+PGK069O5pZXLac
 8LrxarxD/JKaEkUrmj33O1kCHU/nyyOuM0Iaq5gLTYHh94JBIA+aUBttcFulW2RyZ9Hp
 AUXPl+BuIGRIkvEhutllUiHJ24UnR89SBLu06849wnJM0VueF9uI1SPb1YcOBopFXs5D
 WJbKNKUPfNjFTzHznHJKRPwwkzrwi0FDraG2OW27TRKy/eUwbIszJCy+mBddM7/mrTk/
 U9EamEJ4NmPQuJ0OlpvoVqwm79mOLSh/qM8XrvzO9yZy7meY0Z9aLwau/gJoo5xd1yH/
 DT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RLpi8sYT5S+qdoGKlpO/ZiUjqCn4wOZWMaEqltjPyAE=;
 b=IvHlLzj8a3kwkA1C1hqJLWjkOdODfLFw6Cjk3LZrW0jv4uluhELpCwPe5lfF5fOI8v
 bixMuN0Xy3cRn1RVPe9ZpYzwrsA+4tpSRh5lGgDUXsCJrHwP3vEi484ErAqbkbmu3rMk
 zMLE1B/MoPOt/EYVhl0hdPAZwBlPPyvvsuCAwRODZsU4spOrZkqTQq+FObEiLNEmqaiy
 13Y5OhGS1Qrft138x9W/G/BWTu5acx9Rl+K9aQwpHALkBb8Y0LnEQGC/5pDsIZW/2Lwe
 rCm+Oebb3Xqe2YRwftkHZf14b4DXXbgVmb8u7omVNXwg9WFSBC16dDW6B4JPxEznGCkl
 92Ow==
X-Gm-Message-State: AOAM531G5NGwI1WMflEKxGerwAydA8tW08VCVr6Cjhwmoo5al1f3ngtC
 QMR5ztWo3daWPASaJ8hWt7BbC+ZzKBlHXQ==
X-Google-Smtp-Source: ABdhPJyED7z//IPyWBydj2w1qpvJFTjvKGghLEcv+rwBfIf7b/m49Bi/nPiJ0OgIUaDVN2C+W+B4Gw==
X-Received: by 2002:a17:906:46d3:: with SMTP id
 k19mr2423358ejs.546.1611051350946; 
 Tue, 19 Jan 2021 02:15:50 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id lz27sm10502530ejb.50.2021.01.19.02.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 02:15:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH v2] deploy to qemu-project.org from GitLab CI
Date: Tue, 19 Jan 2021 11:15:49 +0100
Message-Id: <20210119101549.294716-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the website is rebuilt on qemu-project.org using
an update hook.  We can reuse instead the Jekyll output of
GitLab's CI.

To do so, a new user qemu-deploy has been created on qemu.org.
The private key is stored into a file variable SSH_PRIVATE_KEY_FILE
(be careful to include the trailing newline after "---END OPENSSH
PRIVATE KEY---"!).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5fa3041..129b2ff 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,6 +1,11 @@
 
+stages:
+  - build
+  - update
+
 pages:
   image: centos:8
+  stage: build
   cache:
     paths:
       - vendor
@@ -14,3 +19,26 @@ pages:
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
+    - - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config'
+  script:
+    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && mkdir new && rsync -az root/ new"
+    - rsync -avz --delete public/ $SSH_DEPLOY_DESTINATION:/var/www/qemu-project.org/new
+    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && rm -rf old && mv root old && mv new root"
+  only:
+    refs:
+      - master
+    variables:
+      - $SSH_PRIVATE_KEY_FILE
+      - $SSH_DEPLOY_DESTINATION
-- 
2.29.2


