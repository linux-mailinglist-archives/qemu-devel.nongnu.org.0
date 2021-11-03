Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5F2443E3C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:16:43 +0100 (CET)
Received: from localhost ([::1]:49990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBRp-0003x2-Vf
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miBQG-0003AP-Ou
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:15:04 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miBQE-0002Vw-Pa
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:15:04 -0400
Received: by mail-ed1-x532.google.com with SMTP id g14so6284938edz.2
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NcAuy8Ag5a5hAQBWW1iJrx04g8N5jIuPPMqpi85EUO4=;
 b=NKwFOr5umsnZs+WtM5LpFyc4tG3YybrXwjrgdwNIWCR7Pjtr5YZ1PZPpQwpU8v+unq
 D9ApmoFf//GW6quOHx0UF4x9exJrVmsE7oVJIok/4X7iOvRGbBMuNHteaH5uHRvBZYn9
 iKVIuJNZQWC4OE1wGRe+ui4tQXW5XkZw6wcELu3yaSTxXkebfBDvo8AsDcZE6JHa8qA2
 KMy3tuSpzQ789aa5VpiKCE0MB6lGBa3V3R//s3kSP+b5q9Ph89QidaAYtYK6Gbpe8j8P
 D2EhVqNzvP7BIfFCjBgM5/LJbFGZ07D2n2ZK/xWUGfVM930HAZKwXmN0kVVRY2Avyhdp
 OKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NcAuy8Ag5a5hAQBWW1iJrx04g8N5jIuPPMqpi85EUO4=;
 b=ckoYQO7XjUeM/zoDNoIvC/puRNzfyKNM3NFphmRTUJ6NIXCmeFWv+dJ2XRCMiVNkS+
 lbPRn1NqktU6CIRf//NlLw4wMrQyFcVuTLAZ8qEG8DYYolOIb6lVv53ATS84iPlTUCf/
 8xmPvnKG13gzRXQh4GqmikJELYXMGiM1I7SofSNyA5SDCzUYs1+gvZzESLXgb630p1uw
 Bof6Py68wx8EQqtRHMlrin2adY9tIHABaAkcNkCuqIlz1R7N/x1jn+xRiT7KDKduCA2B
 iIyT3AcEkFeV/OEgTM0aB5ryarvNrXWRaeQEhS1A/X1jb0QZFTrOrVcPqwMBgcIKyvO/
 DHJA==
X-Gm-Message-State: AOAM5302uq4lSWLVWdtQ1kn/+X/CN0ipRgwxn2aMMd11YbRLChWcQiNe
 HQ/iZhVZ9bWzJqT5Z5We23i1mFsnUJk=
X-Google-Smtp-Source: ABdhPJyFMploFUMaIdOoolWIPEeWOkhTILzfukl9WklbSzJBsXInGS6CUEg+A3kPf7ozli3ihSrcNQ==
X-Received: by 2002:a50:ed92:: with SMTP id h18mr23002704edr.381.1635927301373; 
 Wed, 03 Nov 2021 01:15:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f7sm839596edl.33.2021.11.03.01.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:15:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] remove deployment phase from CI
Date: Wed,  3 Nov 2021 09:14:59 +0100
Message-Id: <20211103081459.369912-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu.org is now served via a reverse proxy from qemu-project.gitlab.io; it does
not need anymore the rsync step to the QEMU project\s shell server.
Remove it from the CI.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.yml | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 129b2ff..dde0ef3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,6 @@
 
 stages:
   - build
-  - update
 
 pages:
   image: centos:8
@@ -19,26 +18,3 @@ pages:
   artifacts:
     paths:
      - public
-
-deploy:
-  image: centos:8
-  stage: update
-  needs:
-    - job: pages
-      artifacts: true
-  before_script:
-    - dnf install -y openssh-clients rsync
-    - eval $(ssh-agent -s)
-    - cat "$SSH_PRIVATE_KEY_FILE" | tr -d '\r' | ssh-add -
-    - mkdir -m700 -p ~/.ssh
-    - - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config'
-  script:
-    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && mkdir new && rsync -az root/ new"
-    - rsync -avz --delete public/ $SSH_DEPLOY_DESTINATION:/var/www/qemu-project.org/new
-    - ssh $SSH_DEPLOY_DESTINATION "cd /var/www/qemu-project.org && rm -rf old && mv root old && mv new root"
-  only:
-    refs:
-      - master
-    variables:
-      - $SSH_PRIVATE_KEY_FILE
-      - $SSH_DEPLOY_DESTINATION
-- 
2.33.1


