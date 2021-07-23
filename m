Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5470B3D3935
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 13:13:05 +0200 (CEST)
Received: from localhost ([::1]:50850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6t72-0006vk-B3
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 07:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6t2b-0000Gj-51
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6t2Y-00019l-0X
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627038505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgVf1UaIIsKpWFBNlJub9Vl0Re2X6ZB97rXqZyhYWzE=;
 b=UdOGmKpLEkDePHb32l8o5dO4bl8CMfvWX6pf/CqkonHpzbVNvgcj6d5tXUFHQvlLL57ZOk
 DHY00lHAehYYMJV/nTT9pu7vXEMOygTm6+Eo1Tq0t6q0vqLgqsKgHE6FT17j5AgYM9riPY
 fI7o+VWWrOivgYL548xT4Jjgf7jHqr8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-sX_Bghu6MWyrvkl6xN5DSQ-1; Fri, 23 Jul 2021 07:08:22 -0400
X-MC-Unique: sX_Bghu6MWyrvkl6xN5DSQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o25-20020a05600c5119b0290218757e2783so663658wms.7
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 04:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MgVf1UaIIsKpWFBNlJub9Vl0Re2X6ZB97rXqZyhYWzE=;
 b=UgEtsYT+vz6tV/XO8Z7wjpcvqZk2hLQOg0Njot1MFeOOdQKoCGLS16SQ4+9NAeGpFO
 NqcrAC5kltUui2WSZ7AZUxlm01X+S00aUvQlGO2R7jWm6WGamW2/YizJ1gfSIc+sOlwm
 KDYMUbYXR2y69bUMt/0XJwx+j5FWtMiWQejf2f0YfOKiC1EymBgo7y7eAuc2BSGb+4Ga
 yFu5XTuSlBmiBg5nzEE5umfkwuRc3x5tfoKIfYAFROo2gnf613ZEUWf5P2LwonfRPFDi
 jBExf3vBlCkUorBP/jn8u6kpK95P2SIH6DYhgzOOFqBFfN7nGK1hnrOfbTd7rb/NxH1n
 6tYA==
X-Gm-Message-State: AOAM533Zz7XosiOVL2SAWDmcHk6+T05ikI7jL/kR2fz2Dgp15sLmYP2v
 FjXmSQd7RxbehQ8fXR96lL7Cu+JeqvbQLDgEoYhUS8epai4YOMHgh4TtDTkK8gOeBI+WLzhzeNR
 4g0Tx0GLG+6cjgUJYgsNqApZ4jduJp67N4gKuAaz8n3+yBCTyDTOp/IeiWfHSp61M
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr3073089wmh.48.1627038500990; 
 Fri, 23 Jul 2021 04:08:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTeCidQNnCLQKQpmyQxSYsy+smZFue4QXZlkNqt7Ushhzmbf5mLwkaAy1HjJXHA5ceypXOzg==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr3073053wmh.48.1627038500683; 
 Fri, 23 Jul 2021 04:08:20 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 d5sm542167wre.77.2021.07.23.04.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 04:08:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v3 4/4] gitlab-ci: Extract OpenSBI job rules and fix
 'when:' condition
Date: Fri, 23 Jul 2021 13:08:00 +0200
Message-Id: <20210723110800.855648-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723110800.855648-1-philmd@redhat.com>
References: <20210723110800.855648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First, all jobs depending on 'docker-opensbi' job must use at most
all the rules that triggers it. The simplest way to ensure that is
to always use the same rules. Extract all the rules to a reusable
section, and include this section (with the 'extends' keyword) in
both 'docker-opensbi' and 'build-opensbi' jobs.

Second, jobs depending on another should not use the 'when: always'
condition, because if a dependency failed we should not keep running
jobs depending on it. The correct condition is 'when: on_success'.

The problems were introduced in commit c6fc0fc1a71 ("gitlab-ci.yml:
Add jobs to build OpenSBI firmware binaries"), but were revealed in
commit 91e9c47e50a ("docker: OpenSBI build job depends on OpenSBI
container").

This fix is similar to the one used with the EDK2 firmware job in
commit ac0595cf6b3 ("gitlab-ci: Extract EDK2 job rules to reusable
section").

Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/opensbi.yml | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index f66cd1d9089..5e0a2477c5d 100644
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
-   when: always
+   when: on_success
+ - changes: # or roms/opensbi/ is modified (submodule updated)
+   - roms/opensbi/*
+   when: on_success
+ - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
+   when: on_success
+ - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
+   when: on_success
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


