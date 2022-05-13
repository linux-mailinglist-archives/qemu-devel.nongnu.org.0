Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72B85258E5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 02:11:34 +0200 (CEST)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIu6-0007jS-0x
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 20:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIpA-0007LD-Oo
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIp8-0007nC-6N
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652400385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rUyOS5lbWF5DqiEcMhdYvKM5BVBWmgaTd7NDt8TGNU=;
 b=hmGbOOoX0lPGoamxUa/PJioqIAbMv1z2MYnXzSAEpAEpufBn0Y54mgbSnToygjsNyknG4i
 axAlSKMOVznJg+PG9hr0/sT9V8HvIZxFlFWMQfUf5r/jU1O5RkVVP+CyTmkyyLHWjRjG5R
 HZvjW02y2uRyvA9tWygItuM2xI8FVOk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-QbtMM-7iMMir9kcspHhW0A-1; Thu, 12 May 2022 20:06:22 -0400
X-MC-Unique: QbtMM-7iMMir9kcspHhW0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9AC71C04B6E;
 Fri, 13 May 2022 00:06:21 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FE5015341CE;
 Fri, 13 May 2022 00:06:21 +0000 (UTC)
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
Subject: [RFC PATCH 6/9] tests: add check-venv as a dependency of check and
 check-block
Date: Thu, 12 May 2022 20:06:06 -0400
Message-Id: <20220513000609.197906-7-jsnow@redhat.com>
In-Reply-To: <20220513000609.197906-1-jsnow@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This patch is being front-loaded before iotests actually relies on the
tests/venv being created in order to preserve bisectability.

Problems I am aware of here (There are a lot, sorry):

- I am not sure the right place to express this dependency, so I did it
  in tests/Makefile.include. It seems to work. I wasn't sure how to
  express it in tests/qemu-iotests/meson.build, but I am not sure if
  that would make it work for both "check" and "check-block" anyway.

- I don't really understand why I need empty rules for Make to process
  the pre-requisite. Without the "do-nothing" recipes, the venv building
  doesn't seem to trigger at all. What I have seems to work, but I'm
  worried I broke something unseen.

- This adds avocado as a dependency of "check"/"check-block", which is
  not technically true. It was just a sin of convenience to create one
  shared "testing venv". Maybe I'll figure out a scheme to have avocado's
  dependencies be "extras" that get added in to a standard "core set".

- This patch ignore the requisite that RPM builds be able to run without
  internet access, meaning that a PyPI fetch is not permissable. I plan
  to solve this by using an environment variable (QEMU_CHECK_NO_PYPI)
  that changes the behavior of the venv setup slightly, and qemu
  specfiles can opt-in to this behavior.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/Makefile.include | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index dfb678d379f..fa7af711fe5 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -154,10 +154,17 @@ check-acceptance-deprecated-warning:
 
 check-acceptance: check-acceptance-deprecated-warning | check-avocado
 
+# Before we delegate to meson, create the python venv for block tests.
+.PHONY: check-block
+check-block: check-venv
+	@echo  # Without some rule, this doesn't run at all. Why?
+
+
 # Consolidated targets
 
 .PHONY: check check-clean get-vm-images
-check:
+check: check-venv
+	@echo # ???
 
 check-build: run-ninja
 
-- 
2.34.1


