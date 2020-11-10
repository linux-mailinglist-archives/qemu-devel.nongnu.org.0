Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A762ADB44
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:07:56 +0100 (CET)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWBX-0004VU-Ey
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6B-0007Ti-R2
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW67-0003YR-UN
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCg/Jp10x6FMCYbkbPlwKfxc7sA25cTtliYxbXc5o8o=;
 b=MS7ZQ9CYXwKiQb9xSua0EyR0yrL1URSGdIV+rILBxllm/Gz3eqHewCC5UYO+XDq205jQN0
 TpOdOumTaImxCXycPKZCphmEiYKj4heLYO8CmVutXs6sJMV2p2WCe9z1pluHDC9Re1CkQR
 NR14DERkvD2tb8/GDAJHD/yu00yWuNA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-Pergqc4WONWoTh3WtyVt3g-1; Tue, 10 Nov 2020 11:02:16 -0500
X-MC-Unique: Pergqc4WONWoTh3WtyVt3g-1
Received: by mail-wm1-f70.google.com with SMTP id k128so1447546wme.7
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KCg/Jp10x6FMCYbkbPlwKfxc7sA25cTtliYxbXc5o8o=;
 b=mGci7jW3vhKNlhig7Hxaof7ldHI2SFafWkWJk5OoOhlQaFPz75fvykmn3Lx8hz4I9r
 ej6B6Xu4SR6nwmijIHIFKE+4SWV1sycfbIap9V627O5ZnBKFve83vgy8Wnzpm5nwCLB/
 3eBOGencELLiyuj1Gj5OXgbZyygipKqNMAKX2AAtk/DixYl14W81qP/ny998jhpkjxJD
 dlCyQlbNdr8umY0n3Wa+4nfgSzJSW4YBhlq8Ab4JOdIiNk6jpzob1DtEtM3EmD8CITdT
 JvXcIy22TTJK7uvvTrs6nYT5M5i1MV884A3xDPJN9UqS/GmXczLPQO4SsmMrC4AOuoJS
 Yk8Q==
X-Gm-Message-State: AOAM532IHM0btefKzES5C9bgLfdHsA7fDZSQ9mSMJv01jqi9oD0Ynvgg
 q5gdWX5qugoyWHLM/6vgBhtazLunlx0gY0ani7lJhtbOm1WH20/bIwThl5NSo3aQQ1juA2OyCRn
 d8inp69qXaNWEmf839/IWNk5q+S28/To50xqqWhr7W9E9AfKnW9s0ZnWdAyyOAdPm
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr18234190wrt.150.1605024134806; 
 Tue, 10 Nov 2020 08:02:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxKcvMgxbmw+ukideljTEnIn3JT2u72lLtjGSOY8xq2UQWTYW/EwqsEjxJulBXcwEPE/R3mw==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr18234153wrt.150.1605024134511; 
 Tue, 10 Nov 2020 08:02:14 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id k81sm4821626wma.2.2020.11.10.08.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:02:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/16] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
Date: Tue, 10 Nov 2020 17:01:30 +0100
Message-Id: <20201110160140.2859904-7-philmd@redhat.com>
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

The acceptance tests aren't accepting anything,
rename them as integration tests.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a45444f884b..17520640d7d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -42,7 +42,7 @@ include:
     - find . -type f -exec touch {} +
     - make $MAKE_CHECK_ARGS
 
-.acceptance_test_job:
+.integration_test_job:
   extends: .native_test_job
   cache:
     key: "${CI_JOB_NAME}-cache"
@@ -90,8 +90,8 @@ check-system-ubuntu:
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
 
-acceptance-system-ubuntu:
-  extends: .acceptance_test_job
+integration-system-ubuntu:
+  extends: .integration_test_job
   needs:
     - job: build-system-ubuntu
       artifacts: true
@@ -121,8 +121,8 @@ check-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
-acceptance-system-debian:
-  extends: .acceptance_test_job
+integration-system-debian:
+  extends: .integration_test_job
   needs:
     - job: build-system-debian
       artifacts: true
@@ -152,8 +152,8 @@ check-system-fedora:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
-acceptance-system-fedora:
-  extends: .acceptance_test_job
+integration-system-fedora:
+  extends: .integration_test_job
   needs:
     - job: build-system-fedora
       artifacts: true
@@ -183,8 +183,8 @@ check-system-centos:
     IMAGE: centos8
     MAKE_CHECK_ARGS: check
 
-acceptance-system-centos:
-  extends: .acceptance_test_job
+integration-system-centos:
+  extends: .integration_test_job
   needs:
     - job: build-system-centos
       artifacts: true
-- 
2.26.2


