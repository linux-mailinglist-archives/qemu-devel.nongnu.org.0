Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECC5546FAB
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 00:34:47 +0200 (CEST)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nznDK-0003mP-TN
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 18:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn56-0000iw-Km
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn53-0005V7-BI
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654899972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1ysuS0Y51qktc7HoHw3hcZsl4RHIYhU/hRbczMkewY=;
 b=cDzeJlOF3q+rNGE/ArgVx4/vjJIRqDtl3WwaUBr4USzaBY1CrGi6voKZlxTkFu52npKpZT
 I4FEnJf8qRkH+4+kz/Vy3S72L6M33hABa1VrNKY0MMP1/nktkz/5iAZ6HGDKAOjVZsVYII
 7V/Fq4sUSGs74eoJLpj8lTXHTbBf8bE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-hkm3Ha4-P-W2aa3ILua4Dg-1; Fri, 10 Jun 2022 18:26:09 -0400
X-MC-Unique: hkm3Ha4-P-W2aa3ILua4Dg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59288811E75;
 Fri, 10 Jun 2022 22:26:09 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBEAE40E80E0;
 Fri, 10 Jun 2022 22:26:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH v2 4/7] tests/vm: add venv pre-requisites to VM building
 recipes
Date: Fri, 10 Jun 2022 18:26:02 -0400
Message-Id: <20220610222605.2259132-5-jsnow@redhat.com>
In-Reply-To: <20220610222605.2259132-1-jsnow@redhat.com>
References: <20220610222605.2259132-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Ubuntu needs "python3-venv" in order to create virtual environments, and
NetBSD needs "py37-pip" in order to do the same.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/vm/netbsd      | 1 +
 tests/vm/ubuntu.i386 | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 45aa9a7fda7..53fe508e487 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -31,6 +31,7 @@ class NetBSDVM(basevm.BaseVM):
         "pkgconf",
         "xz",
         "python37",
+        "py37-pip",
         "ninja-build",
 
         # gnu tools
diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index 47681b6f87d..40fd5ec86da 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -16,9 +16,12 @@ import basevm
 import ubuntuvm
 
 DEFAULT_CONFIG = {
-    'install_cmds' : "apt-get update,"\
-                     "apt-get build-dep -y qemu,"\
-                     "apt-get install -y libfdt-dev language-pack-en ninja-build",
+    'install_cmds' : (
+        "apt-get update,"
+        "apt-get build-dep -y qemu,"
+        "apt-get install -y libfdt-dev language-pack-en ninja-build,"
+        "apt-get install -y python3-venv"
+    ),
 }
 
 class UbuntuX86VM(ubuntuvm.UbuntuVM):
-- 
2.34.3


