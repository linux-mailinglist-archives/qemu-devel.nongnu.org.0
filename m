Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336102ADB62
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:13:00 +0100 (CET)
Received: from localhost ([::1]:44630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWGQ-0002dD-TJ
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6T-00081K-79
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6R-0003dv-Cm
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ybWArdyMsKMTQbibxl2olpKdjku6BQuwFQ33YJqLDk=;
 b=LB/bjoNTTVALC0vOkQZWUcy9w7wTtZQLOmQG3Mbsl6j0PzlCn0dxstACXvabxV6pym0pWA
 g78I7mfyNNCLB0/OvFnWBpQJ4vdEWI34qYo4jBtSmCZSRHggrcDRSh/VWsgQ1cfC/MfNoG
 ZpNexc2FsSh0bmmxEVfKPh7JuCVhhyY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-kH77NCKyOpaK1qrPhypkQg-1; Tue, 10 Nov 2020 11:02:37 -0500
X-MC-Unique: kH77NCKyOpaK1qrPhypkQg-1
Received: by mail-wr1-f70.google.com with SMTP id f4so2824017wru.21
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ybWArdyMsKMTQbibxl2olpKdjku6BQuwFQ33YJqLDk=;
 b=LFe7fbaNXNXRH8iMqkd0F6A6goSLvU/ZhowE1MDHrDkGj71ZyBhWPyqZR7VZCiS5sK
 OIYd7lXgOPH0kmX/Dy/LI7gxBUSeVctAQekU3HNIW+cqCsjDzAWAuFV4PePWd5Exm8RM
 ZE9L/He5JArTn65Q8Wz0jDDctAojK/35u4OIIWKnHbFpOrYwZGW211a6S1+wnqC8eqD0
 jzSWorQ5tDrPNdVi8k4DObj3cQPa37MsA7D3v/FQ+diBLFImPT7xWT5Tt5+H3BzpCsHi
 riI9FIETuJlWf8CwO8C32u5DmFD2i9yj9mk87VjVDPhYhBx1L7lwnRgjjPdtXmfedOBJ
 8qcA==
X-Gm-Message-State: AOAM5339pLqSkZQzlG8AA481ZcZar1SqlU5eWg4Jc2n+NDpysG6Mbap8
 ZUp2922mRFTZGQATEFzB8ufpUjDa/C1/9FwVX17fFX8J3MuI9krBKrVG25gY0vLsGovizeila9b
 UBUKQ57ltcHAmhIHJaULGQ869rGGB3RAqPSYnNAPP6ecIh94ki6yscm6SO/UCU8XL
X-Received: by 2002:a1c:3c8a:: with SMTP id j132mr365863wma.75.1605024155500; 
 Tue, 10 Nov 2020 08:02:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwynBm4ZUBzYH7MV5lnPTS1nw7H1XYIDvG5dOgpXublOvCug34dZnBhCVVrC8ZZkbrvL6DRzg==
X-Received: by 2002:a1c:3c8a:: with SMTP id j132mr365809wma.75.1605024155166; 
 Tue, 10 Nov 2020 08:02:35 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t4sm3446598wmb.20.2020.11.10.08.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:02:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/16] gitlab-ci: Introduce the CI "job maintainer" concept
Date: Tue, 10 Nov 2020 17:01:34 +0100
Message-Id: <20201110160140.2859904-11-philmd@redhat.com>
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

When a job fails, someone has to take care of it. As we can
not wait indefinitively of volunteers good will, introduce the
concept of "job maintainers". A job maintainer is reponsible
of keeping it working, or contact the developers having broken
it to fix it.

When a job is added, it must have a maintainer. A job without
maintainer is not run automatically. It can however be run
manually from the WebUI.

To declare a maintainer, it is as easy as defining the
JOB_MAINTAINER_NAME / JOB_MAINTAINER_EMAIL environment variables.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Ideally the runner will notify the maintainer by mail that
a job fails. But we are not quite there yet.

It would be nice if someone document this properly.
---
 .gitlab-ci.d/containers.yml  | 4 ++++
 .gitlab-ci.d/crossbuilds.yml | 6 ++++++
 .gitlab-ci.yml               | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 7e664878cab..bd2a05008d1 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -21,6 +21,10 @@
   after_script:
     - docker logout
   rules:
+    # Skip unmaintained jobs
+    - if: $JOB_MAINTAINER_NAME == null || $JOB_MAINTAINER_EMAIL == null
+      when: manual
+      allow_failure: true
     - changes:
       - .gitlab-ci.d/containers.yml
       - tests/docker/*
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 701550f028c..aecdb2a38f1 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,6 +1,12 @@
 .cross_common_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  rules:
+    # Skip unmaintained jobs
+    - if: $JOB_MAINTAINER_NAME == null || $JOB_MAINTAINER_EMAIL == null
+      when: manual
+      allow_failure: true
+    - when: always
 
 .cross_system_build_job:
   extends: .cross_common_job
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2e631d4f160..ded4f0bdd18 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -19,6 +19,12 @@ include:
 
 .native_common_job:
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  rules:
+    # Skip unmaintained jobs
+    - if: $JOB_MAINTAINER_NAME == null || $JOB_MAINTAINER_EMAIL == null
+      when: manual
+      allow_failure: true
+    - when: always
 
 .native_build_job:
   extends: .native_common_job
-- 
2.26.2


