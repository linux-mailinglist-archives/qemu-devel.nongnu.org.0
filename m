Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1921F546FAE
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 00:36:28 +0200 (CEST)
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nznEx-00067z-78
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 18:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn58-0000nQ-Fw
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn55-0005Wl-Ci
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654899974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0f3qVSnmvQZOUE7GmzmLW3QsKQrZDOm39K1IEFxZUeU=;
 b=MkkhUZM9gFwtOekzGOowQou2wjMnYpkTaNhG4xZz8o3sljt5RzjYylrWoXkbYz9v7G403R
 wUsWamKalFzN8zALazcYttHD8iDXi2rWUyu8XbFwUfXX5jG/8JHo6qSv1wxM6mNvmJw2vo
 oTkqQs/bdDhc6KVV5eVOVghCycc2XuE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-RAlBHuh2MyiRwN8wHPRMuw-1; Fri, 10 Jun 2022 18:26:11 -0400
X-MC-Unique: RAlBHuh2MyiRwN8wHPRMuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24FAF85A580;
 Fri, 10 Jun 2022 22:26:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9479440E80E0;
 Fri, 10 Jun 2022 22:26:10 +0000 (UTC)
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
Subject: [RFC PATCH v2 7/7] iotests: self-bootstrap testing venv
Date: Fri, 10 Jun 2022 18:26:05 -0400
Message-Id: <20220610222605.2259132-8-jsnow@redhat.com>
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


