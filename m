Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0E570DE8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 01:07:52 +0200 (CEST)
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB2VL-000075-Uk
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 19:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB2Ps-0000nh-AJ
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB2Pp-00025Q-PD
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657580529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=STX+HDAQ+qzf8HD6UcpV60/VFSD4Vcst0FqCUJoq2SM=;
 b=NSQzWUkS7VM90vdVqGiwbaTJL4ubtqq9dhn36+z3LSM1l88ezMuCslWGtER+nfbUe0VlvO
 UyjprTGPUhlw98l1YF01C2wCefin2bz6zVLkT7OJNhUh1E6VUag7whT3r3HTVDUAw+0XRi
 RYYvep0F2VykQn6JzjRSW0N1Bm71dQk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-UMq_Ehh4OBeTiTFKT6Zt5A-1; Mon, 11 Jul 2022 19:01:59 -0400
X-MC-Unique: UMq_Ehh4OBeTiTFKT6Zt5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B813D804184;
 Mon, 11 Jul 2022 23:01:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20B172166B26;
 Mon, 11 Jul 2022 23:01:58 +0000 (UTC)
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
Subject: [RFC PATCH v3 3/7] tests: Remove spurious pip warnings on Ubuntu20.04
Date: Mon, 11 Jul 2022 19:01:51 -0400
Message-Id: <20220711230155.953788-4-jsnow@redhat.com>
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


