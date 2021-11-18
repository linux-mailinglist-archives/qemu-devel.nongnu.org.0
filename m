Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222C4455610
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 08:49:59 +0100 (CET)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mncBB-00061W-WD
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 02:49:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mnc8V-0002nb-U6
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 02:47:11 -0500
Received: from [2a00:1450:4864:20::52b] (port=38471
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mnc8Q-0005vj-DC
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 02:47:08 -0500
Received: by mail-ed1-x52b.google.com with SMTP id x6so11319227edr.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 23:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7UVO6nmtqghMNegvr+9gfU0IIXPheSUBG4vh7TGbeF4=;
 b=A+X93NeNbDUtLg0dCjgftLG/ncLNc7r0TND0kP4QOLxcO3j9lUCvikjVLSW205AqoD
 Mq9szAsDNzr6S+yat9za+5r8vynu4jeWP+8A+6XJf2c+VzlN2e965Z+LIwUpTGRgXYGD
 RF2b8b8Wt9kM05hRxYfnviP8D961RMIKodizrE/X+y/90FfXq721jqDRyJSdFG+C0NGq
 jkptjD7IhOgQZREIisxnIUm5jOza37TUg+FxtunGBPFLBLsvAEk4dBwj7Cu71xDhgqm2
 eicdDu68XAvIIm9rdcEdvVEQ5rJO1qGeBYOgg4DfKCGwv4QCvgp/v+sX+w2xNZWzsYHb
 p/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7UVO6nmtqghMNegvr+9gfU0IIXPheSUBG4vh7TGbeF4=;
 b=OvUkrQ9d3f+easD6gNR5oe49Y9hhIpg2biYPgYLNYojOeG15tGKEbeapQoa29XT3Ke
 rq9HiGo4iyuFuS6BN333LhaImh33f0lVi4Ti2jooz6fB56AE8ugCpGF3hCsJGdj7/swa
 6QE7BEQBUorOWRAqFGfNz3u0xhuuUstLYrK0JJIFaa3r3ox3mWWRpMCmqVkJwm94eRZA
 x6w3ULxtFXEb/mapDj5gQVhVGqaxGaPEX2d3B0ptZhKLoYxSz+AahaszEb7NgORG7kx+
 jxUs+UrSaKJpRkO1ICc62j9f2M4jxqf5OWmRh2gsDQv2dv+iZtgZLHHGVMk22mbTjMZ1
 A36A==
X-Gm-Message-State: AOAM533q7Pi8dODCM/yEiFbnJVBu2IvRUXFb0nYSOb6TVFDyE2Y8NTGb
 8BYR7zFgtApCsxbJEBd0BercvHqokVE=
X-Google-Smtp-Source: ABdhPJwRax7FqMAEbxumbOwEOuBZ4iE7gpPoWxukwD7MQr6pJOq3ccWlmvSYGwGENao2X2h29PGDNg==
X-Received: by 2002:a05:6402:3488:: with SMTP id
 v8mr8124540edc.398.1637221624191; 
 Wed, 17 Nov 2021 23:47:04 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 z7sm1148876edj.51.2021.11.17.23.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 23:47:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] remove deployment phase from CI
Date: Thu, 18 Nov 2021 08:47:01 +0100
Message-Id: <20211118074702.216951-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
not need anymore the rsync step to the QEMU project's shell server.
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


