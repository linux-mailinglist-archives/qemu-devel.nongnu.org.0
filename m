Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39F24C0FEA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:14:32 +0100 (CET)
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMofH-0005RF-Vs
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:14:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMo6p-0003aI-1W
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:38:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMo6m-0006qH-2q
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645609131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CcHd9pVKdoKEPO8W6j0oOilwiCIhJpkEUTcnEJb0VKE=;
 b=NCD9aCYYG3egUAxKS0yiUYi0gKQWnC1MJJUoAXNFEKaCVhZdgjJxxTySKkVz/ID6SkWlEO
 ytcLzJhhrP1lanfajEYq+nAKat5Ci1eeDKb53UWroOxfj+3WNNBCcRVASQ2O9+QeTTc+fV
 3N733c/dVPrYnC8fs7ekasi/dOzMnL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-JyiMgKDeMLOBJmVfNewvjw-1; Wed, 23 Feb 2022 04:38:49 -0500
X-MC-Unique: JyiMgKDeMLOBJmVfNewvjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AE441091DA2;
 Wed, 23 Feb 2022 09:38:49 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E78937610F;
 Wed, 23 Feb 2022 09:38:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v3 3/4] tests/qemu-iotests: Move the bash and sanitizer checks
 to meson.build
Date: Wed, 23 Feb 2022 10:38:39 +0100
Message-Id: <20220223093840.2515281-4-thuth@redhat.com>
In-Reply-To: <20220223093840.2515281-1-thuth@redhat.com>
References: <20220223093840.2515281-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to get rid of check-block.sh in the long run, so let's move
the checks for the bash version and sanitizers from check-block.sh
into the meson.build file instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/check-block.sh           | 26 --------------------------
 tests/qemu-iotests/meson.build | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index f59496396c..5de2c1ba0b 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -18,36 +18,10 @@ skip() {
     exit 0
 }
 
-# Disable tests with any sanitizer except for specific ones
-SANITIZE_FLAGS=$( grep "CFLAGS.*-fsanitize" config-host.mak 2>/dev/null )
-ALLOWED_SANITIZE_FLAGS="safe-stack cfi-icall"
-#Remove all occurrencies of allowed Sanitize flags
-for j in ${ALLOWED_SANITIZE_FLAGS}; do
-    TMP_FLAGS=${SANITIZE_FLAGS}
-    SANITIZE_FLAGS=""
-    for i in ${TMP_FLAGS}; do
-        if ! echo ${i} | grep -q "${j}" 2>/dev/null; then
-            SANITIZE_FLAGS="${SANITIZE_FLAGS} ${i}"
-        fi
-    done
-done
-if echo ${SANITIZE_FLAGS} | grep -q "\-fsanitize" 2>/dev/null; then
-    # Have a sanitize flag that is not allowed, stop
-    skip "Sanitizers are enabled ==> Not running the qemu-iotests."
-fi
-
 if [ -z "$(find . -name 'qemu-system-*' -print)" ]; then
     skip "No qemu-system binary available ==> Not running the qemu-iotests."
 fi
 
-if ! command -v bash >/dev/null 2>&1 ; then
-    skip "bash not available ==> Not running the qemu-iotests."
-fi
-
-if LANG=C bash --version | grep -q 'GNU bash, version [123]' ; then
-    skip "bash version too old ==> Not running the qemu-iotests."
-fi
-
 cd tests/qemu-iotests
 
 # QEMU_CHECK_BLOCK_AUTO is used to disable some unstable sub-tests
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 92f09251a6..323a4acb6a 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -2,6 +2,20 @@ if not have_tools or targetos == 'windows' or get_option('gprof')
   subdir_done()
 endif
 
+foreach cflag: config_host['QEMU_CFLAGS'].split()
+  if cflag.startswith('-fsanitize') and \
+     not cflag.contains('safe-stack') and not cflag.contains('cfi-icall')
+    message('Sanitizers are enabled ==> Disabled the qemu-iotests.')
+    subdir_done()
+  endif
+endforeach
+
+bash = find_program('bash', required: false, version: '>= 4.0')
+if not bash.found()
+  message('bash >= v4.0 not available ==> Disabled the qemu-iotests.')
+  subdir_done()
+endif
+
 qemu_iotests_binaries = [qemu_img, qemu_io, qemu_nbd, qsd]
 qemu_iotests_env = {'PYTHON': python.full_path()}
 qemu_iotests_formats = {
-- 
2.27.0


