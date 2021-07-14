Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E7D3C82AA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:23:14 +0200 (CEST)
Received: from localhost ([::1]:57282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3c2r-0001PK-9y
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3bqS-0002CT-48
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3bqM-0001Ox-6Z
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626257415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vyd+6HDFGcy8sZRjZEqCf+E1DjJMv+yVb9TJMeBMPrc=;
 b=ffznTN8nSu6t6cc3J5gGlsx/N1Dkr06VbQ4dK6tnDTT/RWMtj8oiwd2tzZktVvmyTo7GsX
 /2XbiNoWJMYBpmM5kCTxvwtFyiTVRn2/ttrP0pxZ3LBiItNPphaCMJLqyBpy67ntyjghWU
 6WULLnYQ5EP6jqbdO2AP4o0/iJ1NzQg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-CY4ysTlwN9OJN0vf1YqURA-1; Wed, 14 Jul 2021 06:10:13 -0400
X-MC-Unique: CY4ysTlwN9OJN0vf1YqURA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l6-20020a05600c1d06b0290225338d8f53so596521wms.8
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 03:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vyd+6HDFGcy8sZRjZEqCf+E1DjJMv+yVb9TJMeBMPrc=;
 b=OXd2/F37AAj7IGMpepgGOkArXhooW3E4WR55FHL5bw7FcDdt04EoaDxjXiEWAIEGJw
 fUcF4Oj/Hn938TIAq/7Km7VhhXzN9jjOSc+nlUvSIyaHlund8JOv5XfBmMKeLQn+Erc0
 cVFmpyCxP3Bq0Ycy9NKQibDKdBUAISiLvQMf//h1quqftTjQX1/eTSZ4PrOhQf1+XXhQ
 AcotIa0hs3xJWPLvZyhlUbXlO2aDIt1064BWUWfduYkteJQNeEJa+YOtFm1hWjAHCgN1
 aHdSgBGrSdjTV6hQKlGFpFipPbYNut74pziagAOMCbEQQaW02JMSALUUp2PxRYeGneSl
 3AfA==
X-Gm-Message-State: AOAM532EvUUBy5tQmN7Mq7ZF4rRmyKuLrlM2CMy6tei95f3X4QCcQAgN
 FSCfNOLDpuqcuDmwa6+WHNPwq0pVFcwDAPAByvUq0u9VyfC5DHNzzmMpF34WxLBS3yap/KGQdxA
 zRRDx97OOvCkvjPyG4AZkYRpwTlVFjlYfcAhl5tn9Dn3cDIs5/USGG3qauwFmNE44
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr11906619wrp.351.1626257412329; 
 Wed, 14 Jul 2021 03:10:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcsI9+XGRFqvz8P1Exo2NiGXsdcWcI99+/OCQqNDzQ2aIK5KTcBYgiIw4VhVn0crnMqjLMqA==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr11906581wrp.351.1626257412150; 
 Wed, 14 Jul 2021 03:10:12 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id c125sm5682385wme.36.2021.07.14.03.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 03:10:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1] gitlab-ci: Extract EDK2 job rules to reusable section
Date: Wed, 14 Jul 2021 12:10:03 +0200
Message-Id: <20210714101003.3113726-1-philmd@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All jobs depending on 'docker-edk2' job must use at most all
the rules that triggers it. The simplest way to ensure that
is to always use the same rules. Extract all the rules to a
reusable section, and include this section (with the 'extends'
keyword) in both 'docker-edk2' and 'build-edk2' jobs.

The problem was introduced in commit 71920809cea ("gitlab-ci.yml:
Add jobs to build EDK2 firmware binaries"), but was revealed in
commit 1925468ddbf ("docker: EDK2 build job depends on EDK2
container") and eventually failed on CI:
https://gitlab.com/qemu-project/qemu/-/pipelines/335995843

Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
If this is a correct fix, I'll send a similar fix for the
OpenSBI jobs.
---
 .gitlab-ci.d/edk2.yml | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index ba7280605c4..aae2f7ad880 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -1,10 +1,22 @@
-docker-edk2:
- stage: containers
- rules: # Only run this job when the Dockerfile is modified
+# All jobs needing docker-edk2 must use the same rules it uses.
+.edk2_job_rules:
+ rules: # Only run this job when ...
  - changes:
+   # this file is modified
    - .gitlab-ci.d/edk2.yml
+   # or the Dockerfile is modified
    - .gitlab-ci.d/edk2/Dockerfile
+   # or roms/edk2/ is modified (submodule updated)
+   - roms/edk2/*
    when: always
+ - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
+   when: always
+ - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
+   when: always
+
+docker-edk2:
+ extends: .edk2_job_rules
+ stage: containers
  image: docker:19.03.1
  services:
  - docker:19.03.1-dind
@@ -24,16 +36,9 @@ docker-edk2:
  - docker push $IMAGE_TAG
 
 build-edk2:
+ extends: .edk2_job_rules
  stage: build
  needs: ['docker-edk2']
- rules: # Only run this job when ...
- - changes: # ... roms/edk2/ is modified (submodule updated)
-   - roms/edk2/*
-   when: always
- - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
-   when: always
- - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
-   when: always
  artifacts:
    paths: # 'artifacts.zip' will contains the following files:
    - pc-bios/edk2*bz2
-- 
2.31.1


