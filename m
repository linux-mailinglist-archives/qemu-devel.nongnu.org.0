Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8622ADB6D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:18:12 +0100 (CET)
Received: from localhost ([::1]:54840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWLT-0007B9-4N
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6y-0000W7-Dw
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6s-0003nV-47
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Gs9IF00Du8aEeDHlm1Ec1fK2Ob5qp/Xm/IaNfl33W8=;
 b=hqUkelJkaupYm27uHzIruWAQz0GoXnfltbj9c+1GU8gG+hp3y1VRFnTLqrU2jZ+yFHr3d6
 Rm00Oj5LVy38o29axP3bM1b3v08+a/sypizcaMUW9SzHmVWBNi+3VEsrheme+IHBGgOksu
 VMY0xc0eok9YPGEh4++afsOUZiLcgmE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-GEwTiUGnNnmho9CmqKrFmg-1; Tue, 10 Nov 2020 11:03:03 -0500
X-MC-Unique: GEwTiUGnNnmho9CmqKrFmg-1
Received: by mail-wm1-f69.google.com with SMTP id u123so870897wmu.5
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Gs9IF00Du8aEeDHlm1Ec1fK2Ob5qp/Xm/IaNfl33W8=;
 b=kdsUuxOQSZyKE1hJxlPq8HnuRZzxoWJ0pelrBmM2QtJwcoMnAtifgIRLy7MDF1olWy
 Qol3zJYWpN0yxi6jOv+jpv/O5Uq8rlbDMMrtGYk0VGQR/0l8mkAxebpL5iBgygl93aQ4
 U9+3KY5aTiF8XUqbklfoE4s/skREBO9XaBanDaIbofIXUbPWZl6nDOQEH4qZDOx4Gvac
 zWGnKigXsJ7oX8MWT3bJ6T3zH2G30hpE/QeJh/r6hspYv+5vQqm0REiZjUdyIF7zUZ6H
 bNrChQodjrMzexRATSogZiZ6KMJkw+LmV2aYhUdUjUFLPB9B5GnI+AjOF8D21kU2GMy0
 YwgQ==
X-Gm-Message-State: AOAM533CxcXZvixvNrX/XdcA4aEVaDAWNOq6JyJplY795je2aSmVVuex
 k0+NVcYdeBWoOOTjMmKqadVt2TpnATYjacAhncnVWvfrTfwDe1mJVt0WoSmBHSu6bAduqJUHA3U
 knlcu4uI6g5OJSz5Hxa5vBykr860zSeF/3fNvJ/+0eIHyaUNhHkkO2L0omJmxHoj9
X-Received: by 2002:a1c:df89:: with SMTP id w131mr378917wmg.164.1605024182389; 
 Tue, 10 Nov 2020 08:03:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyt5cPnFJ0uaoNFRrQyGzJoGXyX/2knCIdgTivp7VzA69TV51bU4mYA7upX9l4XtHNaW6uvEA==
X-Received: by 2002:a1c:df89:: with SMTP id w131mr378868wmg.164.1605024182084; 
 Tue, 10 Nov 2020 08:03:02 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id q16sm17772568wrn.13.2020.11.10.08.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:03:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 15/16] gitlab-ci: Volunteer to maintain Debian based and
 hobbyist jobs
Date: Tue, 10 Nov 2020 17:01:39 +0100
Message-Id: <20201110160140.2859904-16-philmd@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Volunteer to maintain these jobs in my free time:

 - debian10
 - armhf
 - m68k
 - mips*
 - powerpc (32-bit)
 - sh4
 - sparc64
 - tricore
 - xtensa

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/containers.yml  | 24 ++++++++++++++++++++++++
 .gitlab-ci.d/crossbuilds.yml | 14 ++++++++++++++
 .gitlab-ci.yml               |  4 ++++
 3 files changed, 42 insertions(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index e2f59a4524f..7e62346ffc5 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -49,6 +49,8 @@ amd64-centos8-container:
 amd64-debian10-container:
   extends: .container_job
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian10
 
 amd64-debian11-container:
@@ -126,6 +128,8 @@ armhf-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian-armhf-cross
 
 hppa-debian-cross-container:
@@ -142,6 +146,8 @@ m68k-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian-m68k-cross
 
 mips64-debian-cross-container:
@@ -149,6 +155,8 @@ mips64-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian-mips64-cross
 
 mips64el-debian-cross-container:
@@ -156,6 +164,8 @@ mips64el-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian-mips64el-cross
 
 mips-debian-cross-container:
@@ -163,6 +173,8 @@ mips-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian-mips-cross
 
 mipsel-debian-cross-container:
@@ -170,6 +182,8 @@ mipsel-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian-mipsel-cross
 
 powerpc-debian-cross-container:
@@ -177,6 +191,8 @@ powerpc-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian-powerpc-cross
 
 ppc64-debian-cross-container:
@@ -212,6 +228,8 @@ sh4-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian-sh4-cross
 
 sparc64-debian-cross-container:
@@ -219,6 +237,8 @@ sparc64-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian-sparc64-cross
 
 tricore-debian-cross-container:
@@ -226,11 +246,15 @@ tricore-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian-tricore-cross
 
 xtensa-debian-cross-container:
   extends: .container_job
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     NAME: debian-xtensa-cross
 
 cris-fedora-cross-container:
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 56e362ee421..f87bdf4fa0f 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -45,6 +45,8 @@ cross-armel-user:
 cross-armhf-system:
   extends: .cross_system_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     IMAGE: debian-armhf-cross
 
 cross-armhf-user:
@@ -69,31 +71,43 @@ cross-arm64-user:
 cross-mips-system:
   extends: .cross_system_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     IMAGE: debian-mips-cross
 
 cross-mips-user:
   extends: .cross_user_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     IMAGE: debian-mips-cross
 
 cross-mipsel-system:
   extends: .cross_system_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     IMAGE: debian-mipsel-cross
 
 cross-mipsel-user:
   extends: .cross_user_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     IMAGE: debian-mipsel-cross
 
 cross-mips64el-system:
   extends: .cross_system_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     IMAGE: debian-mips64el-cross
 
 cross-mips64el-user:
   extends: .cross_user_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     IMAGE: debian-mips64el-cross
 
 cross-ppc64el-system:
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4df45214620..6cf4c19c604 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -121,6 +121,8 @@ integration-system-ubuntu:
 build-system-debian:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     IMAGE: debian-amd64
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
@@ -137,6 +139,8 @@ check-system-debian:
     - job: build-system-debian
       artifacts: true
   variables:
+    JOB_MAINTAINER_NAME: "Philippe Mathieu-Daudé"
+    JOB_MAINTAINER_EMAIL: f4bug@amsat.org
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
-- 
2.26.2


