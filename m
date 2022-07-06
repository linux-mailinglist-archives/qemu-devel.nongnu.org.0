Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94687568D4F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 17:39:49 +0200 (CEST)
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9780-0006vW-B0
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 11:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o976k-0006D4-F8
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 11:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o976g-0001Gv-Je
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 11:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657121905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=irsgICfGfnBJTBbH3pVxgPFUQCdEbVeAm8lB7OJBJXE=;
 b=VXM5jxIV6umLVqeZksUS8FhSsxlNFsOr0n6+2QNk6yxMctpQ7KvNGHOJAIcUAI3xugwVag
 3wUENf/eT7XtgeHpp3FaIQvusTfQ4AOW0BPoBT4MaICfBnw41ZFB1g6ZybkLEB2YKAiCPF
 bmK9je/2KTBLRdgjriVOCNDZRiA5ywg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167--Q0UXZjLNRuLt9o5_ouKcA-1; Wed, 06 Jul 2022 11:38:22 -0400
X-MC-Unique: -Q0UXZjLNRuLt9o5_ouKcA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94AD22999B20;
 Wed,  6 Jul 2022 15:38:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5950A140EBE3;
 Wed,  6 Jul 2022 15:38:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] configure: Restrict TCG to emulation
Date: Wed,  6 Jul 2022 17:38:16 +0200
Message-Id: <20220706153816.768143-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

If we don't need to emulate any target, we certainly don't need TCG.

This should also help to compile again with
 ".../configure --enable-tools --disable-system --disable-user"
on systems that do not have a TCG backend.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[thuth: Re-arranged the code, remove check-softfloat from buildtest.yml]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure                  | 20 ++++++++++++++------
 .gitlab-ci.d/buildtest.yml |  2 +-
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 76728b31f7..61bd807a47 100755
--- a/configure
+++ b/configure
@@ -329,7 +329,7 @@ fi
 fdt="auto"
 
 # 2. Automatically enable/disable other options
-tcg="enabled"
+tcg="auto"
 cfi="false"
 
 # parse CC options second
@@ -1409,11 +1409,6 @@ EOF
   fi
 fi
 
-if test "$tcg" = "enabled"; then
-    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
-    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
-fi
-
 if test -z "${target_list+xxx}" ; then
     default_targets=yes
     for target in $default_target_list; do
@@ -1444,6 +1439,19 @@ case " $target_list " in
   ;;
 esac
 
+if test "$tcg" = "auto"; then
+  if test -z "$target_list"; then
+    tcg="disabled"
+  else
+    tcg="enabled"
+  fi
+fi
+
+if test "$tcg" = "enabled"; then
+    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
+    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
+fi
+
 feature_not_found() {
   feature=$1
   remedy=$2
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 8a4353ef93..1931b77b49 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -599,7 +599,7 @@ build-tools-and-docs-debian:
     optional: true
   variables:
     IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
+    MAKE_CHECK_ARGS: check-unit ctags TAGS cscope
     CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
     QEMU_JOB_PUBLISH: 1
   artifacts:
-- 
2.31.1


