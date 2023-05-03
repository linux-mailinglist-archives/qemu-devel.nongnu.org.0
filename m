Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63476F6046
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 22:41:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puJGb-0007gl-30; Wed, 03 May 2023 16:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1puJGZ-0007gY-Gp
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:39:59 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1puJGX-0005sl-S7
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:39:59 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A4D2A22CC8;
 Wed,  3 May 2023 20:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683146396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urXhDKl2MolY1NPxpyuZ/N/nDOlLqUMu1hjJCx4bfJE=;
 b=IT1nfuHlRDMs4HQnirS+VnfV8yCJRmXC6qOhk2DS0zhdumK6lvjBDCfuYCiGPndLJKJPYf
 jqo78TfAisku4FHP+x5RASf2OcGlrDAEDMMBbO7tslwYpXe05GeOHutzAqprlOzXAmorNO
 31n+FlUzM6CGtrl65P69CcJ1dTnEn3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683146396;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urXhDKl2MolY1NPxpyuZ/N/nDOlLqUMu1hjJCx4bfJE=;
 b=aO5mFcSxMstd71d+RPKkMntztM0TgZ+dDBw2CetolpZbzx9lUqa0ylj9ga5BsCRlMCIQKm
 GTgM4yrM1n79cbCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D462813584;
 Wed,  3 May 2023 20:39:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oMyyJprGUmRofAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 03 May 2023 20:39:54 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 2/2] meson: Deserialize the man pages and html builds
Date: Wed,  3 May 2023 17:39:47 -0300
Message-Id: <20230503203947.3417-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230503203947.3417-1-farosas@suse.de>
References: <20230503203947.3417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

For the documentation builds (man pages & manual), we let Sphinx
decide when to rebuild and use a depfile to know when to trigger the
make target.

We currently use a trick of having the man pages custom_target take as
input the html pages custom_target object, which causes both targets
to be executed if one of the dependencies has changed. However, having
this at the custom_target level means that the two builds are
effectively serialized.

We can eliminate the dependency between the targets by adding a second
depfile for the man pages build, allowing them to be parallelized by
ninja while keeping sphinx in charge of deciding when to rebuild.

Since they can now run in parallel, separate the Sphinx cache
directory of the two builds. We need this not only for data
consistency but also because Sphinx writes builder-dependent
environment information to the cache directory (see notes under
smartquotes_excludes in sphinx docs [1]).

Note that after this patch the commands `make man` and `make html`
only build the specified target. To keep the old behavior of building
both targets, use `make man html` or `make sphinxdocs`.

1- https://www.sphinx-doc.org/en/master/usage/configuration.html

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 docs/meson.build | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index 6d0986579e..858e737431 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -42,7 +42,9 @@ if sphinx_build.found()
 endif
 
 if build_docs
-  SPHINX_ARGS += ['-Dversion=' + meson.project_version(), '-Drelease=' + get_option('pkgversion')]
+  SPHINX_ARGS += ['-Dversion=' + meson.project_version(),
+                  '-Drelease=' + get_option('pkgversion'),
+                  '-Ddepfile=@DEPFILE@', '-Ddepfile_stamp=@OUTPUT0@']
 
   man_pages = {
         'qemu-ga.8': (have_ga ? 'man8' : ''),
@@ -61,41 +63,43 @@ if build_docs
   }
 
   sphinxdocs = []
-  sphinxmans = []
 
   private_dir = meson.current_build_dir() / 'manual.p'
   output_dir = meson.current_build_dir() / 'manual'
   input_dir = meson.current_source_dir()
 
-  this_manual = custom_target('QEMU manual',
+  manual = custom_target('QEMU manual',
                 build_by_default: build_docs,
-                output: 'docs.stamp',
+                output: 'manual.stamp',
                 input: files('conf.py'),
-                depfile: 'docs.d',
-                command: [SPHINX_ARGS, '-Ddepfile=@DEPFILE@',
-                          '-Ddepfile_stamp=@OUTPUT0@',
-                          '-b', 'html', '-d', private_dir,
+                depfile: 'manual.dep',
+                command: [SPHINX_ARGS, '-b', 'html', '-d', private_dir,
                           input_dir, output_dir])
-  sphinxdocs += this_manual
+  sphinxdocs += manual
   install_subdir(output_dir, install_dir: qemu_docdir, strip_directory: true)
 
-  these_man_pages = []
-  install_dirs = []
+  man_private_dir = meson.current_build_dir() / 'man.p'
+  # man.stamp is not installed
+  these_man_pages = ['man.stamp']
+  install_dirs = [false]
+
   foreach page, section : man_pages
     these_man_pages += page
     install_dirs += section == '' ? false : get_option('mandir') / section
   endforeach
 
-  sphinxmans += custom_target('QEMU man pages',
+
+  man_pages = custom_target('QEMU man pages',
                               build_by_default: build_docs,
                               output: these_man_pages,
-                              input: this_manual,
+                              depfile: 'man.dep',
                               install: build_docs,
                               install_dir: install_dirs,
-                              command: [SPHINX_ARGS, '-b', 'man', '-d', private_dir,
+                              command: [SPHINX_ARGS, '-b', 'man', '-d', man_private_dir,
                                         input_dir, meson.current_build_dir()])
+  sphinxdocs += man_pages
 
   alias_target('sphinxdocs', sphinxdocs)
-  alias_target('html', sphinxdocs)
-  alias_target('man', sphinxmans)
+  alias_target('html', manual)
+  alias_target('man', man_pages)
 endif
-- 
2.35.3


