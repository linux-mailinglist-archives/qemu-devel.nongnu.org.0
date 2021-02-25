Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED342325A26
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 00:24:33 +0100 (CET)
Received: from localhost ([::1]:47906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFPzl-00082P-0L
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 18:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lFPww-0005oe-IN
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:21:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lFPws-00069q-GY
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614295293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITXnPJVdGwPJU5JxuQ9KJnJO4aISbH9Ig3FGOjkrTUM=;
 b=iX8q5Q69AWipDocP0wq0NOlbKkLj8CobeJco54ky5mOb/o4pD/GDCyQuPE0AtNtgrLW9CV
 esJG9YYBOjiQ7EkRYbeYKLAm1JidfOrjwW5MwhOU+iC1lvVnLkzMae85Ab3lsD5PC3qKXD
 IK9ICbqTW4fh2uBWpgE4mJQE5CYpYQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-MEwBffcJMTeaoJaIUvv9sw-1; Thu, 25 Feb 2021 18:21:31 -0500
X-MC-Unique: MEwBffcJMTeaoJaIUvv9sw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77BDC801F9A;
 Thu, 25 Feb 2021 23:21:30 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F16D75D6D7;
 Thu, 25 Feb 2021 23:21:28 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] Acceptance Tests: restore downloading of VM images
Date: Thu, 25 Feb 2021 18:21:21 -0500
Message-Id: <20210225232122.1254879-2-crosa@redhat.com>
In-Reply-To: <20210225232122.1254879-1-crosa@redhat.com>
References: <20210225232122.1254879-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "get-vm-images" target defined in tests/Makefile.include is a
prerequisite for "check-acceptance", so that those files get
downloaded before the Avocado job even starts.

It looks like on c401c058a1c a TARGETS variable was introduced with a
different content than it was previously coming from the main
Makefile.  From that point on, the "get-vm-images" succeed without
doing anything because there was no matching architecture to download.

This restores the download of images (that match targets to be built)
before the job starts, eliminating downloads and their associated
failures during the tests.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/Makefile.include | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index d34254fb29..dbd53a9de6 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -109,7 +109,8 @@ $(TESTS_RESULTS_DIR):
 
 check-venv: $(TESTS_VENV_DIR)
 
-FEDORA_31_ARCHES_CANDIDATES=$(patsubst ppc64,ppc64le,$(TARGETS))
+FEDORA_31_ARCHES_TARGETS=$(patsubst %-softmmu,%, $(filter %-softmmu,$(TARGETS)))
+FEDORA_31_ARCHES_CANDIDATES=$(patsubst ppc64,ppc64le,$(FEDORA_31_ARCHES_TARGETS))
 FEDORA_31_ARCHES := x86_64 aarch64 ppc64le s390x
 FEDORA_31_DOWNLOAD=$(filter $(FEDORA_31_ARCHES),$(FEDORA_31_ARCHES_CANDIDATES))
 
-- 
2.25.4


