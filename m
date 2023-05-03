Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586CF6F6043
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 22:41:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puJGZ-0007gJ-Am; Wed, 03 May 2023 16:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1puJGX-0007fi-Hn
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:39:57 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1puJGV-0005sW-Ub
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:39:57 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 66928206E3;
 Wed,  3 May 2023 20:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683146394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTUxCHqiQybvi1dONKBH/ejbHi2JtFT3ch8bE8x75TE=;
 b=FzkmsQ4hU5o4+HBbO9IzufQJJOZ9thXO7weWBWlSFrpA1uTZxYiX4+C+sVcUtHW0YRlGOh
 dbSVctKt8pUZ752Yge1sYx1nFXi8pmh52rclQhi0wvcZWlIv+X6mAtoAWlL3gsa7e0TKHr
 /h1FJSd0L2RlgsbpKKEaOXv/CJ/wL3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683146394;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTUxCHqiQybvi1dONKBH/ejbHi2JtFT3ch8bE8x75TE=;
 b=yNpB4UjSU5b3kbvfMQdGsoP7S81wgQugfLpPVok4bxsBD8tOA1WbM5eb5h0xieMytZ2bKn
 ylcXxktt+KnsklCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A48613584;
 Wed,  3 May 2023 20:39:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SPVUGJjGUmRofAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 03 May 2023 20:39:52 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 1/2] meson: Pass -j option to sphinx
Date: Wed,  3 May 2023 17:39:46 -0300
Message-Id: <20230503203947.3417-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230503203947.3417-1-farosas@suse.de>
References: <20230503203947.3417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We cannot use  the -j option from make because  meson does not support
setting build time parameters for custom targets. Use nproc instead or
the equivalent sphinx option "-j  auto", if that is available (version
>=1.7.0).

Also make sure our plugins support parallelism and report it properly
to sphinx. Particularly, implement the merge_domaindata method in
DBusDomain that is used to merge in data from other subprocesses.

Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 docs/meson.build           | 12 ++++++++++++
 docs/sphinx/dbusdomain.py  |  4 ++++
 docs/sphinx/fakedbusdoc.py |  5 +++++
 docs/sphinx/qmp_lexer.py   |  5 +++++
 4 files changed, 26 insertions(+)

diff --git a/docs/meson.build b/docs/meson.build
index f220800e3e..6d0986579e 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -10,6 +10,18 @@ if sphinx_build.found()
     SPHINX_ARGS += [ '-W', '-Dkerneldoc_werror=1' ]
   endif
 
+  sphinx_version = run_command(SPHINX_ARGS + ['--version'],
+                               check: true).stdout().split()[1]
+  if sphinx_version.version_compare('>=1.7.0')
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


