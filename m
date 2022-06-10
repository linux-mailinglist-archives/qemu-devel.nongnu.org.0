Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12328546FA9
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 00:32:37 +0200 (CEST)
Received: from localhost ([::1]:39024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nznBE-0008KR-5t
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 18:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn56-0000j0-Ke
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn52-0005Ua-Sa
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654899972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=STX+HDAQ+qzf8HD6UcpV60/VFSD4Vcst0FqCUJoq2SM=;
 b=e6mUD+Y++7gzBJDoLZRmK9qMf9uhRAPxU+fTaQ0zN9BmN+StQb0PPQMZ4aBjVDwl0trmX7
 lxgeSGPuAjceZMhc6RD3EABYPiAzyJeBfSyhYH7+H7Gk4sAw2x9b2Mf8k7sHaYhDAZtn4p
 JhI2PohErddzeOECu2xB5X2Fg5Ypw9o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-UBwKrirDOg-rXPfnkBtupw-1; Fri, 10 Jun 2022 18:26:09 -0400
X-MC-Unique: UBwKrirDOg-rXPfnkBtupw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE5FC85A582;
 Fri, 10 Jun 2022 22:26:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B6CF40D2962;
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
Subject: [RFC PATCH v2 3/7] tests: Remove spurious pip warnings on Ubuntu20.04
Date: Fri, 10 Jun 2022 18:26:01 -0400
Message-Id: <20220610222605.2259132-4-jsnow@redhat.com>
In-Reply-To: <20220610222605.2259132-1-jsnow@redhat.com>
References: <20220610222605.2259132-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

The version of pip ("20.0.2") that ships with Ubuntu 20.04 has a bug
where it will try to attempt building a wheel even if the "wheel" python
package that enables it to do so is not installed. Even though pip
continues gracefully from source, The result is a lot of irrelevant
failure output.

Upstream pip 20.0.2 does not have this problem, and pip 20.1 introduces
a new info message that informs a user that wheel building is being skipped.

On this version, the output can be silenced by passing --no-binary to
coax pip into skipping that step to begin with. Note, this error does
not seem to show up for the "qemu" package because we install that
package in editable mode. (I think, but did not test, that installing an
empty package in editable mode caused more problems than it fixed.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/mkvenv.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/mkvenv.py b/tests/mkvenv.py
index 0667106d6aa..78f8d0382e0 100644
--- a/tests/mkvenv.py
+++ b/tests/mkvenv.py
@@ -144,7 +144,8 @@ def make_qemu_venv(
     with enter_venv(venv_path):
         if do_initialize:
             install("-e", str(pysrc_path), offline=offline)
-            install(str(test_src_path), offline=offline)
+            install("--no-binary", "qemu.dummy-tests",
+                    str(test_src_path), offline=offline)
             venv_path.touch()
 
         for option in options:
-- 
2.34.3


