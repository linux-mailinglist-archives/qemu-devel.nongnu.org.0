Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0507C5258DD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 02:09:16 +0200 (CEST)
Received: from localhost ([::1]:37342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIrq-0001ic-Mu
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 20:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIp7-0007Jl-Lo
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIp5-0007mO-6D
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652400382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2bK0RIexSAs/ZjbONnlUeZVujcs8NOILosPHHmuTIw=;
 b=h6VdSUCPiWoA5sqxwKKVvmoF32aN+P4EvV/EkHnpMpOh54I2nwge3Mxkz3QSQiizJmoEab
 gXoh8fkWiq0ffaYYBl2oWCljmM05m/OPU0YCcTs5ARtyCL5aQrz45eKAeq+LgPSkgZHfh8
 7Vx7qx6+4gq8/ap6u63AYu9avbvJ02s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-aEXgc4EwNJ6TehhRqIy1UA-1; Thu, 12 May 2022 20:06:19 -0400
X-MC-Unique: aEXgc4EwNJ6TehhRqIy1UA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8DC1296A60F;
 Fri, 13 May 2022 00:06:18 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A35F15341D5;
 Fri, 13 May 2022 00:06:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH 4/9] tests: silence pip upgrade warnings during venv
 creation
Date: Thu, 12 May 2022 20:06:04 -0400
Message-Id: <20220513000609.197906-5-jsnow@redhat.com>
In-Reply-To: <20220513000609.197906-1-jsnow@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

Turn off the nag warning coaxing us to upgrade pip. It's not really that
interesting to see in CI logs, and as long as nothing is broken --
nothing is broken.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/Makefile.include | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index dbbf1ba535b..dfb678d379f 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -109,11 +109,11 @@ $(TESTS_VENV_DIR): $(TESTS_VENV_REQ) $(SRC_PATH)/python/setup.cfg
             $(PYTHON) -m venv $@, \
             VENV, $@)
 	$(call quiet-command, \
-            $(TESTS_PYTHON) -m pip -q install \
+            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
             -e "$(SRC_PATH)/python/", PIP, "$(SRC_PATH)/python/")
 	$(call quiet-command, \
-            $(TESTS_PYTHON) -m pip -q install -r $(TESTS_VENV_REQ), \
-            PIP, $(TESTS_VENV_REQ))
+            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
+            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
 	$(call quiet-command, touch $@)
 
 $(TESTS_RESULTS_DIR):
-- 
2.34.1


