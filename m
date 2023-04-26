Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165AF6EF819
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:05:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhci-0002Th-QS; Wed, 26 Apr 2023 12:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1prhce-0002Gl-D4
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:04:00 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1prhcZ-0002Ez-89
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:03:59 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 366551FDD6;
 Wed, 26 Apr 2023 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682525031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DxMOxgyFGtE233vaWIx51FxcNa+Kasr4wnVV+1Vj0Vw=;
 b=FL/pjhSQTsSs8qmCA3ZrTCmNMMwQBnCcoIrf/nZiUsmM5eHR8agsdwT3njZSDGHWAg1cV2
 V01cOOG7MzD2LyG8OxtD6XydyOxcOBleveWHXsBJmr20bXrNzJ88zoGKPzSDpnLUr3bdbw
 eJmVMLl052qqdLX1SdZEh1ETk4oxsug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682525031;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DxMOxgyFGtE233vaWIx51FxcNa+Kasr4wnVV+1Vj0Vw=;
 b=F8Agsg8siX3MNrai4JGH+usNsklbTLzzGGOsLs722Vf0wMIB/6O6D2s6TC4wdnXXyqOMyR
 t4F+ryPmv8e5SOBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95F91138F0;
 Wed, 26 Apr 2023 16:03:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id F0kUFmVLSWSwGQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 16:03:49 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] meson: Pass -j option to sphinx
Date: Wed, 26 Apr 2023 13:03:46 -0300
Message-Id: <20230426160347.8860-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Save a bit of build time by passing the number of jobs option to
sphinx.

To avoid warnings from sphinx, alter our plugins to inform whether
they support parallelism. The two plugins touched are quite simple and
I don't see anything that would indicate they do not support being
called in parallel, so return True for both reads and writes.

before:
 $ time make -j16 man html
 ...
 [1/2] Generating docs/QEMU manual with a custom command
 [2/2] Generating docs/QEMU man pages with a custom command

 real    0m49.770s
 user    0m49.425s
 sys     0m0.716s

after:
 $ time make -j16 man html
 ...
 [1/2] Generating docs/QEMU manual with a custom command (wrapped by meson because command contains newlines)
 [2/2] Generating docs/QEMU man pages with a custom command (wrapped by meson because command contains newlines)
 real    0m30.153s
 user    1m5.945s
 sys     0m2.440s

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 docs/meson.build           | 12 ++++++++++++
 docs/sphinx/fakedbusdoc.py |  5 +++++
 docs/sphinx/qmp_lexer.py   |  5 +++++
 3 files changed, 22 insertions(+)

diff --git a/docs/meson.build b/docs/meson.build
index f220800e3e..9e4bed6fa0 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -10,6 +10,18 @@ if sphinx_build.found()
     SPHINX_ARGS += [ '-W', '-Dkerneldoc_werror=1' ]
   endif
 
+  sphinx_version = run_command(SPHINX_ARGS + ['--version'],
+                               check: false).stdout().split()[1]
+  if sphinx_version.version_compare('>=5.1.2')
+    SPHINX_ARGS += ['-j', 'auto']
+  else
+    nproc = find_program('nproc')
+    if nproc.found()
+      jobs = run_command(nproc, check:false).stdout()
+      SPHINX_ARGS += ['-j', jobs]
+    endif
+  endif
+
   # This is a bit awkward but works: create a trivial document and
   # try to run it with our configuration file (which enforces a
   # version requirement). This will fail if sphinx-build is too old.
diff --git a/docs/sphinx/fakedbusdoc.py b/docs/sphinx/fakedbusdoc.py
index d2c5079046..2d2e6ef640 100644
--- a/docs/sphinx/fakedbusdoc.py
+++ b/docs/sphinx/fakedbusdoc.py
@@ -23,3 +23,8 @@ def run(self):
 def setup(app: Sphinx) -> Dict[str, Any]:
     """Register a fake dbus-doc directive with Sphinx"""
     app.add_directive("dbus-doc", FakeDBusDocDirective)
+
+    return dict(
+        parallel_read_safe = True,
+        parallel_write_safe = True
+    )
diff --git a/docs/sphinx/qmp_lexer.py b/docs/sphinx/qmp_lexer.py
index f7e4c0e198..a59de8a079 100644
--- a/docs/sphinx/qmp_lexer.py
+++ b/docs/sphinx/qmp_lexer.py
@@ -41,3 +41,8 @@ def setup(sphinx):
         sphinx.add_lexer('QMP', QMPExampleLexer)
     except errors.VersionRequirementError:
         sphinx.add_lexer('QMP', QMPExampleLexer())
+
+    return dict(
+        parallel_read_safe = True,
+        parallel_write_safe = True
+    )
-- 
2.35.3


