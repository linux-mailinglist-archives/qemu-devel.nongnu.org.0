Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516432ADB43
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:07:49 +0100 (CET)
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWBQ-0004Ck-85
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW5y-0007ER-TL
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW5r-0003UP-M8
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vYOx8opSCoTULd2EmOhrq81Pwh9FMjyL0FWLrWxUzm8=;
 b=dGEaJjN2GDuJHHbCUF2HMG83BRgMf/k+uJjwVq29gBw/vQZrNSUijcD4GEQWwvKBiO9L1s
 Zri+L3AU669S7YYufZMxuPXXWuc3W82K16CizEtMMGZKsVCbHs8bYePa3u6HAy/JRjC610
 nIkPq2X8nASyThQ97QVknAudcDeFdsU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-vqG7fPgiPjWHU6ERLu_M_g-1; Tue, 10 Nov 2020 11:02:00 -0500
X-MC-Unique: vqG7fPgiPjWHU6ERLu_M_g-1
Received: by mail-wm1-f69.google.com with SMTP id z7so1445749wme.8
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vYOx8opSCoTULd2EmOhrq81Pwh9FMjyL0FWLrWxUzm8=;
 b=U4TuMSA+9OZuleMlDvnMfKvwqVz2CMlFaImQ9WGIAXqWaLk0ZtKDcyutaCIGLmKPPS
 yrw4OEGSzPosNrnEi3+uFDkl+MQkBb7F/ZFGOpCXbwSe/iLL8fv7zpu8xwe38FvSSqVl
 VYJvjnHVQKiBqZCF9polyjcYdw8uU6Uw0HYKNVMaFC3a5B/TvpPoDzRdpXnME1oNBp7G
 M2HfGbOv8v4Nz7CCB9/h1V8AcfTyHC6rUeWSkuwK3X7cR4AwesLVb0ViSUOpnOsgOhjQ
 bGE5D/GdQ9YWlmDldDe6pH/TK+M/cNyPu1IppnlSJQatqWDn8nYH+RZuwrm8kM58eWCR
 W3zA==
X-Gm-Message-State: AOAM532A17Gg893EWUaGCJiWSc7fTJEECPNa0hxx46OxZbuy8A/ZG2oT
 dMhvzbufqZV00h5/FQJgkmtwoYtc9Wo0GvuecNDJwpcUM4KgKgFvegMVxBZGY1GBSur4RJZPq1G
 bDlMCuF8G047J6rhbYkKkphPlA9EoPe3PyzCbYF1J3jjMXjQ0u08EoX8Etmv3/ua4
X-Received: by 2002:a5d:44c1:: with SMTP id z1mr20631241wrr.375.1605024118781; 
 Tue, 10 Nov 2020 08:01:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBGAi6m68fs5TkQwd+62rxmy1rHs9d+cjHH/skbR6GrwiXsXvCg9UjRHA4kl1i8CGtvMAkHQ==
X-Received: by 2002:a5d:44c1:: with SMTP id z1mr20631198wrr.375.1605024118449; 
 Tue, 10 Nov 2020 08:01:58 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id n22sm3268876wmk.40.2020.11.10.08.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:01:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/16] gitlab-ci: Replace YAML anchors by extends
 (native_test_job)
Date: Tue, 10 Nov 2020 17:01:27 +0100
Message-Id: <20201110160140.2859904-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110160140.2859904-1-philmd@redhat.com>
References: <20201110160140.2859904-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bin.meng@windriver.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d013504593a..c8fdaecaf51 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -34,7 +34,7 @@ include:
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
 
-.native_test_job_template: &native_test_job_definition
+.native_test_job:
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -81,7 +81,7 @@ build-system-ubuntu:
       - build
 
 check-system-ubuntu:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-system-ubuntu
       artifacts: true
@@ -90,7 +90,7 @@ check-system-ubuntu:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-ubuntu:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-system-ubuntu
       artifacts: true
@@ -113,7 +113,7 @@ build-system-debian:
       - build
 
 check-system-debian:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-system-debian
       artifacts: true
@@ -122,7 +122,7 @@ check-system-debian:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-debian:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-system-debian
       artifacts: true
@@ -145,7 +145,7 @@ build-system-fedora:
       - build
 
 check-system-fedora:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-system-fedora
       artifacts: true
@@ -154,7 +154,7 @@ check-system-fedora:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-fedora:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-system-fedora
       artifacts: true
@@ -177,7 +177,7 @@ build-system-centos:
       - build
 
 check-system-centos:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-system-centos
       artifacts: true
@@ -186,7 +186,7 @@ check-system-centos:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-centos:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-system-centos
       artifacts: true
@@ -284,7 +284,7 @@ build-deprecated:
 # We split the check-tcg step as test failures are expected but we still
 # want to catch the build breaking.
 check-deprecated:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-deprecated
       artifacts: true
@@ -348,7 +348,7 @@ build-crypto-old-nettle:
       - build
 
 check-crypto-old-nettle:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-crypto-old-nettle
       artifacts: true
@@ -369,7 +369,7 @@ build-crypto-old-gcrypt:
       - build
 
 check-crypto-old-gcrypt:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-crypto-old-gcrypt
       artifacts: true
@@ -390,7 +390,7 @@ build-crypto-only-gnutls:
       - build
 
 check-crypto-only-gnutls:
-  <<: *native_test_job_definition
+  extends: .native_test_job
   needs:
     - job: build-crypto-only-gnutls
       artifacts: true
-- 
2.26.2


