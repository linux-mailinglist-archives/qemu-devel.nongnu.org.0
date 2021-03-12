Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730353395E3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:11:51 +0100 (CET)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmGK-0006Hv-J0
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWM-0007e8-25
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWI-0000he-Kf
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615569853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04yXZr1CYO0eJUg/Lk52VNhPIinTFA9fDfo6+CMMDrQ=;
 b=KiWs/NmfP+iajUNwP/QBpqCqko45WH1rogjrdvHfEIWsuDgcIolVYYAqVqjM+XCvylRLVJ
 XE39pPIDRxWqjItWV+f48gH/nQnjyx2CfLLQMra68vx5Hgix2EZuYvU9304RYivcPlgAmx
 LRonpYlb7ttzVNPrTecm+C9v8Xqo4kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-lcnd-Vl3OnWidcuS9HzCow-1; Fri, 12 Mar 2021 12:24:08 -0500
X-MC-Unique: lcnd-Vl3OnWidcuS9HzCow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EE98801817;
 Fri, 12 Mar 2021 17:24:07 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4230319744;
 Fri, 12 Mar 2021 17:24:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/9] gitlab-ci.yml: Merge one of the coroutine jobs with the
 tcg-disabled job
Date: Fri, 12 Mar 2021 18:23:52 +0100
Message-Id: <20210312172356.968219-6-thuth@redhat.com>
In-Reply-To: <20210312172356.968219-1-thuth@redhat.com>
References: <20210312172356.968219-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our gitlab-ci got quite slow in the past weeks, due to the immense amount
of jobs that we have, so we should try to reduce the number of jobs.
Since we already have a job that builds without TCG, we can merge
one of the "build-coroutine" jobs with it to get rid of at least one
job.

Message-Id: <20210311142211.1547864-4-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a98f5674d6..45303cafdd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -366,6 +366,8 @@ build-disabled:
 # Xen accelerator is not detected / selected. As result it build the
 # i386-softmmu and x86_64-softmmu with KVM being the single accelerator
 # available.
+# Also use a different coroutine implementation (which is only really of
+# interest to KVM users, i.e. with TCG disabled)
 build-tcg-disabled:
   <<: *native_build_job_definition
   needs:
@@ -375,7 +377,8 @@ build-tcg-disabled:
   script:
     - mkdir build
     - cd build
-    - ../configure --disable-tcg --audio-drv-list="" || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - ../configure --disable-tcg --audio-drv-list="" --with-coroutine=ucontext
+      || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - make -j"$JOBS"
     - make check-unit
     - make check-qapi-schema
@@ -569,15 +572,6 @@ build-tci:
 
 # Alternate coroutines implementations are only really of interest to KVM users
 # However we can't test against KVM on Gitlab-CI so we can only run unit tests
-build-coroutine-ucontext:
-  <<: *native_build_job_definition
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --with-coroutine=ucontext --disable-tcg
-    MAKE_CHECK_ARGS: check-unit
-
 build-coroutine-sigaltstack:
   <<: *native_build_job_definition
   needs:
-- 
2.27.0


