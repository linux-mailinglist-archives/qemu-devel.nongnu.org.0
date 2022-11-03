Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D4F61863B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:32:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqe3Q-00082q-Q7; Thu, 03 Nov 2022 13:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqe3O-00082B-88
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqe3J-000418-S6
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667496649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3m4ybHQiZIUd0nHVlaYKVYoBYgh/5HEw4j8nuKdAAGQ=;
 b=XSBUI2x+FYPIciL9qEhOROg+EsGy6FVOgbWlfs8pUL3GIMSZ+8gYYYsX1dVZ5cXowSzx+p
 f89gJpwWsIBsNf6rvd7Cal3dbflMnjy/09+z8zC/OsILn4YMPo24G0oUWT0racpvJsgvgS
 hACP65+7wW190oUPHSYlZoLokHzxv78=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-CpSFT_ENP9y4waRjcFBlwQ-1; Thu, 03 Nov 2022 13:30:46 -0400
X-MC-Unique: CpSFT_ENP9y4waRjcFBlwQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52D2C3C0F439;
 Thu,  3 Nov 2022 17:30:46 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14196492B06;
 Thu,  3 Nov 2022 17:30:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/2] gitlab: remove redundant setting of PKG_CONFIG_PATH
Date: Thu,  3 Nov 2022 13:30:43 -0400
Message-Id: <20221103173044.3969425-2-berrange@redhat.com>
In-Reply-To: <20221103173044.3969425-1-berrange@redhat.com>
References: <20221103173044.3969425-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The PKG_CONFIG_PATH variable is not defined in GitLab CI
envs and even if it was, we don't need to set it to its
existing value.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 5e8892fd49..6d709628f1 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -6,8 +6,7 @@
   script:
     - mkdir build
     - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+    - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-user --target-list-exclude="arm-softmmu cris-softmmu
           i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
           mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
@@ -32,8 +31,7 @@
   script:
     - mkdir build
     - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+    - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
@@ -44,8 +42,7 @@
   script:
     - mkdir build
     - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+    - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-system --target-list-exclude="aarch64_be-linux-user
           alpha-linux-user cris-linux-user m68k-linux-user microblazeel-linux-user
           nios2-linux-user or1k-linux-user ppc-linux-user sparc-linux-user
-- 
2.37.2


