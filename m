Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A2653475E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 02:13:14 +0200 (CEST)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu17o-0006xa-Pc
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 20:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14Y-00041k-Dn
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14V-0002m3-TJ
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653523787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8RCADafxOL9O4NGYW4u2gnWUWodYX0xwc7Wc9//3bmM=;
 b=hjZWZ5up2ukEGFXabGcUfwblXhC4ZCFYrSvpDzWQG+oyktyxasHJJUYtJDiWJLp02cCM/z
 fI3ZLkbhZWy5RtNlWqROGEpuqVspYpVgv9RpfQatvbB8efKSToM4NUpmudEN7JuJM7g0AH
 OzEjCapvHi8hcHB8mLj142LlAozEwvI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-SXi2yjN7P3uLB60dISTrDg-1; Wed, 25 May 2022 20:09:44 -0400
X-MC-Unique: SXi2yjN7P3uLB60dISTrDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 954983C10140;
 Thu, 26 May 2022 00:09:43 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D34292166B26;
 Thu, 26 May 2022 00:09:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 5/9] tests: add quiet-venv-pip macro
Date: Wed, 25 May 2022 20:09:17 -0400
Message-Id: <20220526000921.1581503-6-jsnow@redhat.com>
In-Reply-To: <20220526000921.1581503-1-jsnow@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
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

Factor out the "test venv pip" macro; rewrite the "check-venv" rule to
be a little more compact. Replace the "PIP" pseudo-command output with
"VENVPIP" to make it 1% more clear that we are talking about using pip
to install something into a venv.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/Makefile.include | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 839ffde876a..052d7f56e9a 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -104,13 +104,13 @@ else
 	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
 endif
 
+quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
+    $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $1, \
+    "VENVPIP","$1")
+
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
-	$(call quiet-command, \
-            $(PYTHON) -m venv $@, \
-            VENV, $@)
-	$(call quiet-command, \
-            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
-            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
+	$(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
+	$(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
 	$(call quiet-command, touch $@)
 
 $(TESTS_RESULTS_DIR):
-- 
2.34.1


