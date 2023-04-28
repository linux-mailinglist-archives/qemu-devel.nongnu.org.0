Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D0D6F1B0E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 17:02:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psPb0-00050k-Uu; Fri, 28 Apr 2023 11:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1psPay-0004yw-Is
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 11:01:12 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1psPat-0002Jt-TD
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 11:01:11 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8AC5A200C3;
 Fri, 28 Apr 2023 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682694066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c/dX8QU/SD4274kiEYdeDdp4IVes39fFqpuE6ds5I2c=;
 b=s7n0eVpkwru4xHN/NA9NLVBo7XrHMvjQTvAY+PWd7HN1We+jSsL5XOenGbtV9tNEV+sWY+
 nXIkd6JdQ7a39mr2ph2P9gLPLM+v+qrtrqc1B1cT8rd9Sdkt6cZx0veTAGmIsZ1XLBvLQq
 ++zcCYCkBNVHlXL6nUL5unV/XRUmpCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682694066;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c/dX8QU/SD4274kiEYdeDdp4IVes39fFqpuE6ds5I2c=;
 b=I4TDKsB8+VjqBQx2DfrtlgfFXizxeHyNohVhYCnzor93lYHug2/8JQWHZVhoGsqyIZzA3N
 dz/Uwg8hxJqDGHDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BDB7D1390E;
 Fri, 28 Apr 2023 15:01:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id I4MqIbDfS2RdUAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 28 Apr 2023 15:01:04 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3] meson: Pass -j option to sphinx
Date: Fri, 28 Apr 2023 12:01:02 -0300
Message-Id: <20230428150102.13114-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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

We cannot use the -j option from make because meson does not support
setting build time parameters for custom targets. Use nproc instead or
the equivalent sphinx option "-j auto", if that is available.

Also make sure our plugins support parallelism and report it properly
to sphinx. Particularly, implement the merge_domaindata method in
DBusDomain that is used to merge in data from other subprocesses.

before:
  $ time make man html
  ...
  [1/2] Generating docs/QEMU manual with a custom command
  [2/2] Generating docs/QEMU man pages with a custom command

  real    0m43.157s
  user    0m42.642s
  sys     0m0.576s

after:
  $ time make man html
  ...
  [1/2] Generating docs/QEMU manual with a custom command
  [2/2] Generating docs/QEMU man pages with a custom command

  real    0m25.014s
  user    0m51.288s
  sys     0m2.085s

Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 docs/meson.build           | 12 ++++++++++++
 docs/sphinx/dbusdomain.py  |  4 ++++
 docs/sphinx/fakedbusdoc.py |  5 +++++
 docs/sphinx/qmp_lexer.py   |  5 +++++
 4 files changed, 26 insertions(+)

diff --git a/docs/meson.build b/docs/meson.build
index f220800e3e..138ec6ce6f 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -10,6 +10,18 @@ if sphinx_build.found()
     SPHINX_ARGS += [ '-W', '-Dkerneldoc_werror=1' ]
   endif
 
+  sphinx_version = run_command(SPHINX_ARGS + ['--version'],
+                               check: true).stdout().split()[1]
+  if sphinx_version.version_compare('>=5.1.2')
+    SPHINX_ARGS += ['-j', 'auto']
+  else
+    nproc = find_program('nproc')
+    if nproc.found()
+      jobs = run_command(nproc, check: true).stdout()
+      SPHINX_ARGS += ['-j', jobs]
+    endif
+  endif
+
   # This is a bit awkward but works: create a trivial document and
   # try to run it with our configuration file (which enforces a
   # version requirement). This will fail if sphinx-build is too old.
diff --git a/docs/sphinx/dbusdomain.py b/docs/sphinx/dbusdomain.py
index 2ea95af623..9872fd5bf6 100644
--- a/docs/sphinx/dbusdomain.py
+++ b/docs/sphinx/dbusdomain.py
@@ -400,6 +400,10 @@ def get_objects(self) -> Iterator[Tuple[str, str, str, str, str, int]]:
         for refname, obj in self.objects.items():
             yield (refname, refname, obj.objtype, obj.docname, obj.node_id, 1)
 
+    def merge_domaindata(self, docnames, otherdata):
+        for name, obj in otherdata['objects'].items():
+            if obj.docname in docnames:
+                self.data['objects'][name] = obj
 
 def setup(app):
     app.add_domain(DBusDomain)
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


