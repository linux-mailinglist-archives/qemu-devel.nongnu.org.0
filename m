Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883FB65D2D6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 13:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD307-0002xC-R8; Wed, 04 Jan 2023 07:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD304-0002vL-UT
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:36:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD303-0007Ww-Da
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:36:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672835766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=X7y5sUGGxinE2WW0BKcpyvR085Ki8/Qf7rwKm9OrcRA=;
 b=aWs8FdKncAn6/opq8pA9e0Pmf6QP8mY390sTC7TjxbdCm/RaFfRE3bpro4EPivubRdFDYc
 wjR/AUFF38/oeqPa4haz2nX78zJYs3S+mKi4wmdrMGiSBT0eJ6223UG3zT5p62KfznIJzr
 xgTgRMFR0paCrKo7nK7QHOdC9QX0dgY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-l9qcwJJzOmKCRugD_W9_Hg-1; Wed, 04 Jan 2023 07:36:03 -0500
X-MC-Unique: l9qcwJJzOmKCRugD_W9_Hg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECB4F1C00414;
 Wed,  4 Jan 2023 12:36:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AF64492B06;
 Wed,  4 Jan 2023 12:36:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] .gitlab-ci.d/windows: Work-around timeout and OpenGL problems
 of the MSYS2 jobs
Date: Wed,  4 Jan 2023 13:35:59 +0100
Message-Id: <20230104123559.277586-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

The windows jobs (especially the 32-bit job) recently started to
hit the timeout limit. Bump it a little bit to ease the situation
(80 minutes is quite long already - OTOH, these jobs do not have to
wait for a job from the container stage to finish, so this should
still be OK).

Additionally, some update on the container side recently enabled
OpenGL in these jobs - but the corresponding code fails to compile.
Thus disable OpenGL here for the time being until someone figured
out the proper fix in the shader code for this.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Now that the timeout and OpenGL problems are gone, the 64-bit is
 working fine for me again. However, I'm still seeing random issues
 with the 32-bit job ... not sure whether it's a problem on the
 QEMU side or whether the builders are currently instable, since
 the issues do not reproduce reliably...

 .gitlab-ci.d/windows.yml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 9b5c4bcd8a..22f794e537 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -10,7 +10,7 @@
       - ${CI_PROJECT_DIR}/msys64/var/cache
   needs: []
   stage: build
-  timeout: 70m
+  timeout: 80m
   before_script:
   - If ( !(Test-Path -Path msys64\var\cache ) ) {
       mkdir msys64\var\cache
@@ -71,7 +71,7 @@ msys2-64bit:
   # for the msys2 64-bit job, due to the build could not complete within
   # the project timeout.
   - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
-      --without-default-devices'
+      --without-default-devices --disable-opengl'
   - ..\msys64\usr\bin\bash -lc 'make'
   # qTests don't run successfully with "--without-default-devices",
   # so let's exclude the qtests from CI for now.
@@ -113,6 +113,7 @@ msys2-32bit:
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - mkdir output
   - cd output
-  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu'
+  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu
+        --disable-opengl'
   - ..\msys64\usr\bin\bash -lc 'make'
   - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
-- 
2.31.1


