Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F43CFFC0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 18:49:49 +0200 (CEST)
Received: from localhost ([::1]:54584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5swF-0006je-P2
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 12:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5sv9-0005b5-Kw
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 12:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5sv6-0007vn-NW
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 12:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626799716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ifKFT5mDN0/2fYNVh88LtazBrq4yCqRHZAlJRSofaMU=;
 b=doreDywVp2Nw+vHiGPQxlFJ8UuNgJsiDUx6WinoIWoqylGsOqGQ8++PlzETrOWRNA4cxzm
 Oe+X4a5M+f/etNWzNp6fLdqvqAQR37m3P6QwaqBkuOst2/pjPHhme0fw7O6gqbrPaEP/eK
 1+L1lvI/gFWoxtugf2IfHxoB3INHHGk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-rJ53iaQ2O9i7C5zD_FBqIw-1; Tue, 20 Jul 2021 12:48:32 -0400
X-MC-Unique: rJ53iaQ2O9i7C5zD_FBqIw-1
Received: by mail-wr1-f71.google.com with SMTP id
 t8-20020a05600001c8b029013e2027cf9aso10441349wrx.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 09:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ifKFT5mDN0/2fYNVh88LtazBrq4yCqRHZAlJRSofaMU=;
 b=ju2jDuCRYdLnf2WSysPnHO2CQafs8ejDQcVEKxtgcIFivtCxvQkst7Y+78bx/mxYhi
 zEJwKlszlHVdHjmsjFldbnWm2UHfHUVGNcsIPkvAp/qxNBr/Rzt1FUa2dsTbm4SERo1M
 uLzzzv37Sjs1IEY5JTLkkv2Seu51KlrU4hjnMhDLuQz41Oc+baWF8qgcPkpg5gY3RMXJ
 hZZ9nkOe23X89o0MZTx3K1L/Y6+LdEmXl2/CSqwTD5s7ZGhqIoU2IGyPqBDpeqHfKOxq
 PRR2pcNno/vPYHW92dkWY8AOBF66nvGRAGXkFSYZH0oeUQTNNw1TbUNpA8HR4XccsadO
 KEtQ==
X-Gm-Message-State: AOAM531S8P4P1VmmIZKyI6EPbNVuIyV8ZLOjNq5jaK2jjVvzwEDC1YD8
 HJQlWG2IRc4oFXskHfrrFBaXJvoznoWmSrUepnqFTLhnwRxXQnYbJL0yCeKfZQnUkEAf4Gsfjy3
 L217gHBgRjKZLTCdXdZ3gZpVlC02d4nfioToZDv5yYWR+X6OfWszr0ot2hnn11OT7
X-Received: by 2002:adf:ec86:: with SMTP id z6mr37001204wrn.320.1626799711548; 
 Tue, 20 Jul 2021 09:48:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz77g+tE7Hm3caqHqgUN1ZHWYpA/WOMHsnGiji1qOHo8YDg4gZgIbYTZ1rOcu5cQFwHaI/oew==
X-Received: by 2002:adf:ec86:: with SMTP id z6mr37001179wrn.320.1626799711358; 
 Tue, 20 Jul 2021 09:48:31 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 z4sm10290174wrv.40.2021.07.20.09.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 09:48:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1] gitlab-ci: Extract OpenSBI job rules to reusable
 section
Date: Tue, 20 Jul 2021 18:48:29 +0200
Message-Id: <20210720164829.3949558-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All jobs depending on 'docker-opensbi' job must use at most all
the rules that triggers it. The simplest way to ensure that
is to always use the same rules. Extract all the rules to a
reusable section, and include this section (with the 'extends'
keyword) in both 'docker-opensbi' and 'build-opensbi' jobs.

The problem was introduced in commit c6fc0fc1a71 ("gitlab-ci.yml:
Add jobs to build OpenSBI firmware binaries"), but was revealed in
commit 91e9c47e50a ("docker: OpenSBI build job depends on OpenSBI
container").

This fix is similar to the one used with the EDK2 firmware job in
commit ac0595cf6b3 ("gitlab-ci: Extract EDK2 job rules to reusable
section").

Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Latent bug on CI, safe for 6.1.
---
 .gitlab-ci.d/opensbi.yml | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index f66cd1d9089..d8a0456679e 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -1,10 +1,23 @@
-docker-opensbi:
- stage: containers
- rules: # Only run this job when the Dockerfile is modified
+# All jobs needing docker-opensbi must use the same rules it uses.
+.opensbi_job_rules:
+ rules: # Only run this job when ...
  - changes:
+   # this file is modified
    - .gitlab-ci.d/opensbi.yml
+   # or the Dockerfile is modified
    - .gitlab-ci.d/opensbi/Dockerfile
    when: always
+ - changes: # or roms/opensbi/ is modified (submodule updated)
+   - roms/opensbi/*
+   when: always
+ - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
+   when: always
+ - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
+   when: always
+
+docker-opensbi:
+ extends: .opensbi_job_rules
+ stage: containers
  image: docker:19.03.1
  services:
  - docker:19.03.1-dind
@@ -24,16 +37,9 @@ docker-opensbi:
  - docker push $IMAGE_TAG
 
 build-opensbi:
+ extends: .opensbi_job_rules
  stage: build
  needs: ['docker-opensbi']
- rules: # Only run this job when ...
- - changes: # ... roms/opensbi/ is modified (submodule updated)
-   - roms/opensbi/*
-   when: always
- - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
-   when: always
- - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
-   when: always
  artifacts:
    paths: # 'artifacts.zip' will contains the following files:
    - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
-- 
2.31.1


