Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ED14753E0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:50:11 +0100 (CET)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxP33-0008Es-ON
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:50:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnw-00038k-J1
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnv-0004Io-44
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6eVpAcHH7gbu3FPie6afr3bzMUb50T3tyz6iapfMx0=;
 b=OYSUoU9S5/GZi3fMYL33oa2Ehmmh8zGmYXAx35Hle8VPOLp6UFnKx+D+KOuaJNVWnJ2abx
 6L8p2FCMOaNMk8aoGe7TuAKiouu97lrRqLMU3UhQYCc0KBapPaxlufVg8T167H5b79S2Nn
 GD/aSsbcgKYIzn8xD1tJtJNFF9NoG40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-jW9u3AHtNIu3M-G_PqyAqQ-1; Wed, 15 Dec 2021 02:34:21 -0500
X-MC-Unique: jW9u3AHtNIu3M-G_PqyAqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DFEA81CCB5;
 Wed, 15 Dec 2021 07:34:20 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71AF51092790;
 Wed, 15 Dec 2021 07:34:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/16] gitlab-ci.d/buildtest: Add jobs that run the
 device-crash-test
Date: Wed, 15 Dec 2021 08:33:56 +0100
Message-Id: <20211215073402.144286-11-thuth@redhat.com>
In-Reply-To: <20211215073402.144286-1-thuth@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device-crash-test script has been quite neglected in the past,
so that it bit-rot quite often. Let's add CI jobs that run this
script for at least some targets, so that this script does not
regress that easily anymore.

Message-Id: <20211126162724.1162049-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 71d0f407ad..7e1cb0b3c2 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -100,6 +100,17 @@ avocado-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-avocado
 
+crash-test-debian:
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-debian
+      artifacts: true
+  variables:
+    IMAGE: debian-amd64
+  script:
+    - cd build
+    - scripts/device-crash-test -q ./qemu-system-i386
+
 build-system-fedora:
   extends: .native_build_job_template
   needs:
@@ -134,6 +145,18 @@ avocado-system-fedora:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-avocado
 
+crash-test-fedora:
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-fedora
+      artifacts: true
+  variables:
+    IMAGE: fedora
+  script:
+    - cd build
+    - scripts/device-crash-test -q ./qemu-system-ppc
+    - scripts/device-crash-test -q ./qemu-system-riscv32
+
 build-system-centos:
   extends: .native_build_job_template
   needs:
-- 
2.27.0


