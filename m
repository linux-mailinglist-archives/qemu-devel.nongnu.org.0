Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6304E6E2653
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:59:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKt9-0005v9-9S; Fri, 14 Apr 2023 10:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pnKt6-0005u7-HU
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pnKt5-0001iZ-4n
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681484334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=grTVzAluaVkwrO7QXvyzHZ/daRWWGLEpkQVnIpo6k94=;
 b=W+pPuIumqE7GMf13YvFl1qzEUQyAIf3Ielmslib9qm816sTUrEFE4/gIuRi0L2fkkkWQj+
 XETt2L/os4+Z/6Mwe/VLAlCWYp4AzqytHNNjyLKsVPuM7ASVtvRkGuYJTVu+kt4aKw/tT9
 mE8aOH7qTVfJP+tkt8XcPNZiofAp7NA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-47D6MkmIPPi-D-ylQ5WQYQ-1; Fri, 14 Apr 2023 10:58:52 -0400
X-MC-Unique: 47D6MkmIPPi-D-ylQ5WQYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5903280C8C8;
 Fri, 14 Apr 2023 14:58:52 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FEE0BC88;
 Fri, 14 Apr 2023 14:58:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Eldon Stegall <eldon-qemu@eldondev.com>, Camilla Conte <cconte@redhat.com>
Subject: [PATCH 2/2] scripts/device-crash-test: Add a parameter to run with
 TCG only
Date: Fri, 14 Apr 2023 16:58:45 +0200
Message-Id: <20230414145845.456145-3-thuth@redhat.com>
In-Reply-To: <20230414145845.456145-1-thuth@redhat.com>
References: <20230414145845.456145-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We're currently facing the problem that the device-crash-test script
runs twice as long in the CI when a runner supports KVM - which sometimes
results in a timeout of the CI job. To get a more deterministic runtime
here, add an option to the script that allows to run it with TCG only.

Reported-by: Eldon Stegall <eldon-qemu@eldondev.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 2 +-
 scripts/device-crash-test  | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 333eea9dd3..bb3650a51c 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -103,7 +103,7 @@ crash-test-debian:
   script:
     - cd build
     - make NINJA=":" check-venv
-    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
+    - tests/venv/bin/python3 scripts/device-crash-test -q --tcg-only ./qemu-system-i386
 
 build-system-fedora:
   extends:
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 73bcb98693..b74d887331 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -397,7 +397,7 @@ def binariesToTest(args, testcase):
 
 
 def accelsToTest(args, testcase):
-    if getBinaryInfo(args, testcase['binary']).kvm_available:
+    if getBinaryInfo(args, testcase['binary']).kvm_available and not args.tcg_only:
         yield 'kvm'
     yield 'tcg'
 
@@ -510,6 +510,8 @@ def main():
                         help="Full mode: test cases that are expected to fail")
     parser.add_argument('--strict', action='store_true', dest='strict',
                         help="Treat all warnings as fatal")
+    parser.add_argument('--tcg-only', action='store_true', dest='tcg_only',
+                        help="Only test with TCG accelerator")
     parser.add_argument('qemu', nargs='*', metavar='QEMU',
                         help='QEMU binary to run')
     args = parser.parse_args()
-- 
2.31.1


