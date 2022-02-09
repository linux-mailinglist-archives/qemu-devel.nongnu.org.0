Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9CA4AEF87
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:51:16 +0100 (CET)
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHkZ8-0000NL-K3
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:51:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk34-0005au-2m
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:18:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk32-0006j2-4X
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644401883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45CKTxNpbcccU9Qcy41eDGcxJ9VlwlJ0FFfx5HI8Q80=;
 b=QP4cnDM/A/9XsyI1K/BhyLNiePLHlAD+NtEID3q35KaryEqDOeSB8lvuWqnQD7/GYca0na
 U7bjA6lfkrB3K/bTRZ+gXjIAr4OtiAMoCIcG1MLJd1ZuDegFCKaQx/B46x1j/A8Np2XIkY
 wzE12nTy370t7fJu/ICHvoQA+6iFdNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-VfilNWwhPu2qcwA8CrxXhA-1; Wed, 09 Feb 2022 05:16:08 -0500
X-MC-Unique: VfilNWwhPu2qcwA8CrxXhA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7896874996;
 Wed,  9 Feb 2022 10:16:04 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A2662856C;
 Wed,  9 Feb 2022 10:16:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 5/8] tests/qemu-iotests/meson.build: Call the 'check'
 script directly
Date: Wed,  9 Feb 2022 11:15:27 +0100
Message-Id: <20220209101530.3442837-6-thuth@redhat.com>
In-Reply-To: <20220209101530.3442837-1-thuth@redhat.com>
References: <20220209101530.3442837-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can get a nicer progress indication if we add the iotests
individually via the 'check' script instead of going through
the check-block.sh wrapper.

For this, we have to add some of the sanity checks that have
originally been done in the tests/check-block.sh script (whether
"bash" is available or whether CFLAGS contain -fsanitize switches)
to the meson.build file now, and add the environment variables
that have been set up by the tests/check-block.sh script before.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/meson.build | 44 +++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index e1832c90e0..a9eade902f 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -1,9 +1,28 @@
-if not have_tools or targetos == 'windows'
+if not have_tools or targetos == 'windows' or \
+   config_host.has_key('CONFIG_GPROF')
   subdir_done()
 endif
 
+bash = find_program('bash', required: false, version: '>= 4.0')
+if not bash.found()
+  message('bash >= v4.0 not available ==> Disabled the qemu-iotests.')
+  subdir_done()
+endif
+
+foreach cflag: config_host['QEMU_CFLAGS'].split()
+  if cflag.startswith('-fsanitize') and \
+     not cflag.contains('safe-stack') and not cflag.contains('cfi-icall')
+    message('Sanitizers are enabled ==> Disabled the qemu-iotests.')
+    subdir_done()
+  endif
+endforeach
+
 qemu_iotests_binaries = [qemu_img, qemu_io, qemu_nbd, qsd]
-qemu_iotests_env = {'PYTHON': python.full_path()}
+qemu_iotests_env = {
+  'PYTHON': python.full_path(),
+  'PYTHONUTF8': '1',
+  'QEMU_CHECK_BLOCK_AUTO': '1'
+}
 qemu_iotests_formats = {
   'qcow2': 'quick',
   'raw': 'slow',
@@ -18,16 +37,25 @@ foreach k, v : emulators
   endif
 endforeach
 
+check_script = find_program(meson.current_build_dir() / 'check')
+iotests = run_command(python, [check_script.full_path(), '-g', 'auto', '-n'],
+                      check: true).stdout().strip().replace('tests/', '').split('\n')
+
 foreach format, speed: qemu_iotests_formats
   if speed == 'quick'
     suites = 'block'
   else
     suites = ['block-' + speed, speed]
   endif
-  test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
-       depends: qemu_iotests_binaries, env: qemu_iotests_env,
-       protocol: 'tap',
-       suite: suites,
-       timeout: 0,
-       is_parallel: false)
+  foreach tst: iotests
+    test('iotest-' + format + '-' + tst,
+         python, args: [check_script.full_path(), '-tap', '-' + format, tst],
+         depends: qemu_iotests_binaries,
+         env: qemu_iotests_env + \
+              { 'TEST_DIR':
+                meson.current_build_dir() / 'scratch' / format + '-' + tst },
+         protocol: 'tap',
+         suite: suites,
+         timeout: 0)
+  endforeach
 endforeach
-- 
2.27.0


