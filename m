Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0169D680B2D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 11:46:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMRfI-0006zD-0q; Mon, 30 Jan 2023 05:45:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMReq-0006xK-Fl
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:45:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMReo-0001cK-Aa
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675075501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcFgvhRaQ60Gbtv7hsrzYZssnFeJy3XNKfz0fYCSwsA=;
 b=c3xTINrw+WH/eSZSJ6Nl+MDu82EpCwSg0B28wi+pK9eAEuA4MqZdWI/s2V+m7xpQatjmhZ
 vb3CHLryZoIoRRNeuSkjuQNCXaEB/z4zYVs0XvGEJhcjb8NIz3EBl7IbA7UnPjeXVcRN0r
 c6giq5E6sYhha4VHbo2YJB3x4UPA6V8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-Qxru__3IOvqU0nWcOieOGg-1; Mon, 30 Jan 2023 05:44:57 -0500
X-MC-Unique: Qxru__3IOvqU0nWcOieOGg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9613101A52E;
 Mon, 30 Jan 2023 10:44:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB7F1492B01;
 Mon, 30 Jan 2023 10:44:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 5/6] gitlab-ci.d/buildtest: Merge the two gprof-gcov jobs
Date: Mon, 30 Jan 2023 11:44:45 +0100
Message-Id: <20230130104446.1286773-6-thuth@redhat.com>
In-Reply-To: <20230130104446.1286773-1-thuth@redhat.com>
References: <20230130104446.1286773-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is only one job depending on the build-gprof-gcov job, so
there is no real need for keeping this separate. It likely only
has been split since the complete runtime is more than 60 minutes,
but that can be better handled with a proper timeout setting instead.
By merging the two jobs, we safe some precious CI minutes for starting
a new container for the second job each time.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 86f9c37a07..91c7467a66 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -468,26 +468,15 @@ tsan-build:
     MAKE_CHECK_ARGS: bench V=1
 
 # gprof/gcov are GCC features
-build-gprof-gcov:
+gprof-gcov:
   extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
+  timeout: 80m
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-gprof --enable-gcov
     TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
-  artifacts:
-    expire_in: 1 days
-    paths:
-      - build
-
-check-gprof-gcov:
-  extends: .native_test_job_template
-  needs:
-    - job: build-gprof-gcov
-      artifacts: true
-  variables:
-    IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
   after_script:
     - cd build
-- 
2.31.1


