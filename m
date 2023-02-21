Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3769D7FB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 02:26:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUHP5-00038y-Ot; Mon, 20 Feb 2023 20:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUHP1-00037i-5X
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 20:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUHOz-0006A5-JJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 20:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676942704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ogucinFRNATjRc0oZLavhSDtGzBtZnYQ0vhDRyNjVw=;
 b=HMO17cE5riNXjIGEkQwFDeYFIDWeBA/LXKFWRmSs0ydSTFhmFq6q36fTK26N+ZDmwkV5fW
 yfV7pkEtW+eS5s0TLOem0x6McHmnIGAmfJcKzti29LrdgXWgl+Gh5QcVAPnX0SAqyqjPb4
 pkrFuJiXWd/nwVdNy5UKJ2QN49kKJpY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-cjrj8s1sPyWo7-vXyKIKmQ-1; Mon, 20 Feb 2023 20:25:00 -0500
X-MC-Unique: cjrj8s1sPyWo7-vXyKIKmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C11885D060;
 Tue, 21 Feb 2023 01:25:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 988B22166B26;
 Tue, 21 Feb 2023 01:24:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Subject: [PATCH v3 5/6] meson: prefer 'sphinx-build' to 'sphinx-build-3'
Date: Mon, 20 Feb 2023 20:24:55 -0500
Message-Id: <20230221012456.2607692-6-jsnow@redhat.com>
In-Reply-To: <20230221012456.2607692-1-jsnow@redhat.com>
References: <20230221012456.2607692-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Once upon a time, "sphinx-build" on certain RPM platforms invoked
specifically a Python 2.x version, while "sphinx-build-3" was a distro
shim for the Python 3.x version.

These days, none of our supported platforms utilize a 2.x version, so it
should be safe to search for 'sphinx-build' prior to 'sphinx-build-3',
which will prefer pip/venv installed versions of sphinx if they're
available.

This adds an extremely convenient ability to test document building
ability in QEMU across multiple versions of Sphinx for the purposes of
compatibility testing.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/meson.build b/docs/meson.build
index 9136fed3b73..906034f9a87 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -1,5 +1,5 @@
 if get_option('sphinx_build') == ''
-  sphinx_build = find_program(['sphinx-build-3', 'sphinx-build'],
+  sphinx_build = find_program(['sphinx-build', 'sphinx-build-3'],
                               required: get_option('docs'))
 else
   sphinx_build = find_program(get_option('sphinx_build'),
-- 
2.39.0


