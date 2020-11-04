Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256922A70CF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 23:50:38 +0100 (CET)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaRbx-0001MU-5L
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 17:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaRY4-00058m-J6
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 17:46:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaRY2-0006wU-TP
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 17:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604529990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m7pizr2OhXI85zkuQe5QkflRj9AoLh16xj+zmAhsSGc=;
 b=KJSJpaN+IqMH6+P3qK8wyFo7jfHKc2a4Saq08zDxEiAsHRpqAGe6RwfiDDHvqhv8BATBPx
 pSxsuCSWHFYGoqa+8jvSRvEtPDSkPP33WKwyvbUivExtM6qIF3N9WG1OXSfGtKHhHpaUKw
 h08/IVv975iqcjDUuWXyC4ryMtXSDw4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-YVN5ibCGOyqDZT5xi3NKSw-1; Wed, 04 Nov 2020 17:46:29 -0500
X-MC-Unique: YVN5ibCGOyqDZT5xi3NKSw-1
Received: by mail-wm1-f71.google.com with SMTP id e15so1089761wme.4
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 14:46:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m7pizr2OhXI85zkuQe5QkflRj9AoLh16xj+zmAhsSGc=;
 b=fSRZzw6cBehKBy9ojODKFgf3aS5KKwGyrTWENtLGEmEev1b9dx6zs397C6371At7qE
 Sd8Z7aDicXzckaXB1TlNQiWnVSDts8J/X5jx9bwyEwS7mtvY77cwEJ0hQ5FTn06Uz+2Q
 8fUYqFfEvVBnmAA7MV39AigHs/I6hnqi5Ph6ievnexgEamWDXXVcPntrlO8Wp37/Q1/P
 Pt6Bma8r7KMr65tWGobKAiGKqJpLJ0iEis+3pFEt9J7i7Ek7hiDoPxHKS4oKIxaAAjow
 bKaIzTy6fP9V/GGQpzWly2KZc9nhWzSJ50uk7StgiJeVf+WsePWGYIKJo2FZLnJ/BEx2
 skSw==
X-Gm-Message-State: AOAM533YHyo16URc+G7hfIpj8OgAAbCM4dPR90yH31f9q31NW+ThTGcW
 +hYJupwObKuwDioMmuNmVKBq/eGhjfQzjVrFFOHlsgRhHM0Qt7RpzD+3KQ0mzmssShPv7krCWAr
 fR9IKTgrLzbJ8g8w=
X-Received: by 2002:a1c:9c51:: with SMTP id f78mr7329942wme.189.1604529987520; 
 Wed, 04 Nov 2020 14:46:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJbxgUHHAUD3PaxivQLKXRHgwEyVxxcmXheuOiqXe/78F5oZR4xlUFLjX2wflvN0CnCzHG0Q==
X-Received: by 2002:a1c:9c51:: with SMTP id f78mr7329931wme.189.1604529987325; 
 Wed, 04 Nov 2020 14:46:27 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id h4sm2177593wrq.3.2020.11.04.14.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 14:46:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/9] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
Date: Wed,  4 Nov 2020 23:45:54 +0100
Message-Id: <20201104224558.3384595-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104224558.3384595-1-philmd@redhat.com>
References: <20201104224558.3384595-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5c64e477c9d..0b77a90dd73 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -48,7 +48,7 @@ include:
     - find . -type f -exec touch {} +
     - make $MAKE_CHECK_ARGS
 
-.acceptance_test_job:
+.integration_test_job:
   extends: .native_test_job
   cache:
     key: "${CI_JOB_NAME}-cache"
@@ -95,8 +95,8 @@ check-system-ubuntu:
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
 
-acceptance-system-ubuntu:
-  extends: .acceptance_test_job
+integration-system-ubuntu:
+  extends: .integration_test_job
   needs:
     - job: build-system-ubuntu
       artifacts: true
@@ -125,8 +125,8 @@ check-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
-acceptance-system-debian:
-  extends: .acceptance_test_job
+integration-system-debian:
+  extends: .integration_test_job
   needs:
     - job: build-system-debian
       artifacts: true
@@ -156,8 +156,8 @@ check-system-fedora:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
-acceptance-system-fedora:
-  extends: .acceptance_test_job
+integration-system-fedora:
+  extends: .integration_test_job
   needs:
     - job: build-system-fedora
       artifacts: true
@@ -187,8 +187,8 @@ check-system-centos:
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


