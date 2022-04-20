Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E225650885C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:43:44 +0200 (CEST)
Received: from localhost ([::1]:54260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9gN-0005EX-EP
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9e0-0002BP-ID
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9dy-00043l-C3
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650458473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Opt3O5zhg+NWCDjkfFDUQ0F2LnpdKGyQDG8VjNIROQ0=;
 b=BZgfPW8izf1pJ3wiilEkL4seQsQxI9aZhbWtH7J9lnNZF2Lj/ShzQbjwFipzfmY8rjq4bK
 iOv69gtn4l7OlBxb2ezrgHkNHvp4GTfYNiiVKEPeQ4nAsvOnZZANdhVQlcPEu/KPoV/ydF
 Qh91HvC/Yk5AvQMLEbMeDB1Ty8I668g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-fguGV2uEMEOiqQ8qBoelNA-1; Wed, 20 Apr 2022 08:41:11 -0400
X-MC-Unique: fguGV2uEMEOiqQ8qBoelNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7C2186B8A7;
 Wed, 20 Apr 2022 12:41:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 725372166B48;
 Wed, 20 Apr 2022 12:41:08 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 2/8] tests/qemu-iotests: Move the bash and sanitizer checks to
 meson.build
Date: Wed, 20 Apr 2022 14:40:58 +0200
Message-Id: <20220420124104.795836-3-hreitz@redhat.com>
In-Reply-To: <20220420124104.795836-1-hreitz@redhat.com>
References: <20220420124104.795836-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We want to get rid of check-block.sh in the long run, so let's move
the checks for the bash version and sanitizers from check-block.sh
into the meson.build file instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220223093840.2515281-4-thuth@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
2.35.1


