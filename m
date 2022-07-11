Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC28570DF9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 01:10:57 +0200 (CEST)
Received: from localhost ([::1]:40550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB2YK-0003AT-2a
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 19:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB2Pq-0000iz-He
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:02:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB2Pn-00023P-O8
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657580525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0f3qVSnmvQZOUE7GmzmLW3QsKQrZDOm39K1IEFxZUeU=;
 b=UqFzoiJ/LbO061pAO1HrIOHAk+47mrQ48Ep7Rpvyln+d8HitfMuDPOb4fLXxRZtiwuGG+E
 8NrG6wquxHXZg4LiRMQ8e51rH+zFnbTTo964vSIjUBUMJ5gNOZTn3UulbQ9wath447Vh9Z
 CB/gEKZIavyADmnXW8GL3gBt4UcQ63U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-yZ0K2dzuMmeNC_bwA1Vw9Q-1; Mon, 11 Jul 2022 19:02:01 -0400
X-MC-Unique: yZ0K2dzuMmeNC_bwA1Vw9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76DC91C06EC7;
 Mon, 11 Jul 2022 23:02:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE80D2166B26;
 Mon, 11 Jul 2022 23:02:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH v3 7/7] iotests: self-bootstrap testing venv
Date: Mon, 11 Jul 2022 19:01:55 -0400
Message-Id: <20220711230155.953788-8-jsnow@redhat.com>
In-Reply-To: <20220711230155.953788-1-jsnow@redhat.com>
References: <20220711230155.953788-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

When iotests are invoked manually from
e.g. $build/tests/qemu-iotests/check, it is not necessarily guaranteed
that we'll have run 'check-venv' yet.

With this patch, teach testenv.py how to create its own environment.

Note: this self-bootstrapping is fairly rudimentary and will miss
certain triggers to refresh the venv. It will miss when new dependencies
are added to either python/setup.cfg or tests/setup.cfg. It can be
coaxed into updating by running 'make check', 'make check-block', 'make
check-venv', etc.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/testenv.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 29404ac94be..e985eaf3e97 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -112,10 +112,10 @@ def init_directories(self) -> None:
         """
         venv_path = Path(self.build_root, 'tests/venv/')
         if not venv_path.exists():
-            raise FileNotFoundError(
-                f"Virtual environment \"{venv_path!s}\" isn't found."
-                " (Maybe you need to run 'make check-venv'"
-                " from the build dir?)"
+            mkvenv = Path(self.source_iotests, '../mkvenv.py')
+            subprocess.run(
+                (sys.executable, str(mkvenv), str(venv_path)),
+                check=True,
             )
         self.virtual_env: str = str(venv_path)
 
-- 
2.34.3


