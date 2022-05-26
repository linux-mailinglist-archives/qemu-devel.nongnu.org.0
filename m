Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628CC534764
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 02:17:00 +0200 (CEST)
Received: from localhost ([::1]:48576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu1BT-00045J-GM
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 20:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14V-0003wp-KX
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14U-0002kc-53
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653523785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpKyKyy1++CYoyet0S+CmrLnGlSAzJs39FlCCySxBEY=;
 b=VUHImtYVGBPupY2F1jq0Ik7TP0N+LwItoOFmuW8v0QrDVvvfS4Ro7W7RJ1lWAdAMAMrdSm
 soV1bn9XuBOhHIyriKx3SWXlIrtrQ6CpDgcUoXEl7FPHF/plw/e6cSU0X31D1t0lp1MP7L
 5olE85GdQDpJMQ1KWjxacqL2CndeKhI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-Hx4uENh8ONKSytMbo1YWjw-1; Wed, 25 May 2022 20:09:40 -0400
X-MC-Unique: Hx4uENh8ONKSytMbo1YWjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84286185A7A4;
 Thu, 26 May 2022 00:09:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6CB22166B26;
 Thu, 26 May 2022 00:09:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 4/9] tests: silence pip upgrade warnings during venv creation
Date: Wed, 25 May 2022 20:09:16 -0400
Message-Id: <20220526000921.1581503-5-jsnow@redhat.com>
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

Turn off the nag warning coaxing us to upgrade pip. It's not really that
interesting to see in CI logs, and as long as nothing is broken --
nothing is broken.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/Makefile.include | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index f68adda0650..839ffde876a 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -109,8 +109,8 @@ $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
             $(PYTHON) -m venv $@, \
             VENV, $@)
 	$(call quiet-command, \
-            $(TESTS_PYTHON) -m pip -q install -r $(TESTS_VENV_REQ), \
-            PIP, $(TESTS_VENV_REQ))
+            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
+            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
 	$(call quiet-command, touch $@)
 
 $(TESTS_RESULTS_DIR):
-- 
2.34.1


