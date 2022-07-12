Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F098B571697
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:08:14 +0200 (CEST)
Received: from localhost ([::1]:45594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCoO-00064h-VZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCKP-0006Ce-6o
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:37:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCK5-0000y0-Cr
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwaBP8hFBuotG5J6yd49FTMQtesqfc4olAZlluLUNm8=;
 b=gdN6XR/gbJ/cABrJWOQJENUhKC7FzwSK6N5QAXGkDXhDvBvFLgOt41x0kkopIwvkva1fqI
 B85AJZ/i2qPkwlO2YmuL1hkxOgDuim6EqdukiecNb/RswOlIsee7Epqm/EhwZF9Yfp9b0f
 bQi9XGLRLfIej9EnTB0Y+uFoWoXcoUw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-KltQUYI8M4SPWWWohmR82w-1; Tue, 12 Jul 2022 05:36:49 -0400
X-MC-Unique: KltQUYI8M4SPWWWohmR82w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6909280D212;
 Tue, 12 Jul 2022 09:36:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10E8540CF8EF;
 Tue, 12 Jul 2022 09:36:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 11/15] qemu-common: move scripts/qapi
Date: Tue, 12 Jul 2022 13:35:24 +0400
Message-Id: <20220712093528.4144184-12-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is just moving qapi-gen.py and related subdir to qemu-common, to
ease review and proceed step by step. The following patches will move
related necessary code, tests etc.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/conf.py                                  |  2 +-
 meson.build                                   | 19 ++-----------------
 MAINTAINERS                                   |  4 ++--
 subprojects/qemu-common/meson.build           |  2 ++
 subprojects/qemu-common/scripts/meson.build   |  3 +++
 .../qemu-common/scripts}/qapi-gen.py          |  0
 .../qemu-common/scripts}/qapi/.flake8         |  0
 .../qemu-common/scripts}/qapi/.isort.cfg      |  0
 .../qemu-common/scripts}/qapi/__init__.py     |  0
 .../qemu-common/scripts}/qapi/commands.py     |  0
 .../qemu-common/scripts}/qapi/common.py       |  0
 .../qemu-common/scripts}/qapi/error.py        |  0
 .../qemu-common/scripts}/qapi/events.py       |  0
 .../qemu-common/scripts}/qapi/expr.py         |  0
 .../qemu-common/scripts}/qapi/gen.py          |  0
 .../qemu-common/scripts}/qapi/introspect.py   |  0
 .../qemu-common/scripts}/qapi/main.py         |  0
 .../qemu-common/scripts/qapi/meson.build      | 16 ++++++++++++++++
 .../qemu-common/scripts}/qapi/mypy.ini        |  0
 .../qemu-common/scripts}/qapi/parser.py       |  0
 .../qemu-common/scripts}/qapi/pylintrc        |  0
 .../qemu-common/scripts}/qapi/schema.py       |  0
 .../qemu-common/scripts}/qapi/source.py       |  0
 .../qemu-common/scripts}/qapi/types.py        |  0
 .../qemu-common/scripts}/qapi/visit.py        |  0
 tests/qapi-schema/meson.build                 |  2 +-
 26 files changed, 27 insertions(+), 21 deletions(-)
 create mode 100644 subprojects/qemu-common/scripts/meson.build
 rename {scripts => subprojects/qemu-common/scripts}/qapi-gen.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/.flake8 (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/.isort.cfg (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/__init__.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/commands.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/common.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/error.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/events.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/expr.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/gen.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/introspect.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/main.py (100%)
 create mode 100644 subprojects/qemu-common/scripts/qapi/meson.build
 rename {scripts => subprojects/qemu-common/scripts}/qapi/mypy.ini (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/parser.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/pylintrc (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/schema.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/source.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/types.py (100%)
 rename {scripts => subprojects/qemu-common/scripts}/qapi/visit.py (100%)

diff --git a/docs/conf.py b/docs/conf.py
index e33cf3d38121..02dcd987b426 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -56,7 +56,7 @@
 # Our extensions are in docs/sphinx; the qapidoc extension requires
 # the QAPI modules from scripts/.
 sys.path.insert(0, os.path.join(qemu_docdir, "sphinx"))
-sys.path.insert(0, os.path.join(qemu_docdir, "../scripts"))
+sys.path.insert(0, os.path.join(qemu_docdir, "../subprojects/qemu-common/scripts"))
 
 
 # -- General configuration ------------------------------------------------
diff --git a/meson.build b/meson.build
index 254eb1263a66..97e8ab37eb08 100644
--- a/meson.build
+++ b/meson.build
@@ -1582,6 +1582,8 @@ if libbpf.found() and not cc.links('''
 endif
 
 qemu_common = subproject('qemu-common')
+qapi_gen = qemu_common.get_variable('qapi_gen')
+qapi_gen_depends = qemu_common.get_variable('qapi_gen_depends')
 qemu_common = qemu_common.get_variable('qemu_common_dep')
 
 #################
@@ -2790,23 +2792,6 @@ genh += configure_file(output: 'config-host.h', configuration: config_host_data)
 
 hxtool = find_program('scripts/hxtool')
 shaderinclude = find_program('scripts/shaderinclude.pl')
-qapi_gen = find_program('scripts/qapi-gen.py')
-qapi_gen_depends = [ meson.current_source_dir() / 'scripts/qapi/__init__.py',
-                     meson.current_source_dir() / 'scripts/qapi/commands.py',
-                     meson.current_source_dir() / 'scripts/qapi/common.py',
-                     meson.current_source_dir() / 'scripts/qapi/error.py',
-                     meson.current_source_dir() / 'scripts/qapi/events.py',
-                     meson.current_source_dir() / 'scripts/qapi/expr.py',
-                     meson.current_source_dir() / 'scripts/qapi/gen.py',
-                     meson.current_source_dir() / 'scripts/qapi/introspect.py',
-                     meson.current_source_dir() / 'scripts/qapi/parser.py',
-                     meson.current_source_dir() / 'scripts/qapi/schema.py',
-                     meson.current_source_dir() / 'scripts/qapi/source.py',
-                     meson.current_source_dir() / 'scripts/qapi/types.py',
-                     meson.current_source_dir() / 'scripts/qapi/visit.py',
-                     meson.current_source_dir() / 'scripts/qapi/common.py',
-                     meson.current_source_dir() / 'scripts/qapi-gen.py'
-]
 
 tracetool = [
   python, files('scripts/tracetool.py'),
diff --git a/MAINTAINERS b/MAINTAINERS
index 450abd025271..b45511dab550 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2847,8 +2847,8 @@ F: tests/unit/test-*-visitor.c
 F: tests/unit/test-qapi-*.c
 F: tests/unit/test-qmp-*.c
 F: tests/unit/test-visitor-serialization.c
-F: scripts/qapi-gen.py
-F: scripts/qapi/*
+F: subprojects/qemu-common/scripts/qapi-gen.py
+F: subprojects/qemu-common/scripts/qapi/*
 F: docs/sphinx/qapidoc.py
 F: docs/devel/qapi*
 T: git https://repo.or.cz/qemu/armbru.git qapi-next
diff --git a/subprojects/qemu-common/meson.build b/subprojects/qemu-common/meson.build
index 8969b08473ef..207e53991061 100644
--- a/subprojects/qemu-common/meson.build
+++ b/subprojects/qemu-common/meson.build
@@ -6,3 +6,5 @@ project('qemu-common', 'c',
 qemu_common_dep = declare_dependency(
   include_directories: include_directories('include'),
 )
+
+subdir('scripts')
diff --git a/subprojects/qemu-common/scripts/meson.build b/subprojects/qemu-common/scripts/meson.build
new file mode 100644
index 000000000000..626bed6dcdfe
--- /dev/null
+++ b/subprojects/qemu-common/scripts/meson.build
@@ -0,0 +1,3 @@
+qapi_gen = find_program('qapi-gen.py')
+
+subdir('qapi')
diff --git a/scripts/qapi-gen.py b/subprojects/qemu-common/scripts/qapi-gen.py
similarity index 100%
rename from scripts/qapi-gen.py
rename to subprojects/qemu-common/scripts/qapi-gen.py
diff --git a/scripts/qapi/.flake8 b/subprojects/qemu-common/scripts/qapi/.flake8
similarity index 100%
rename from scripts/qapi/.flake8
rename to subprojects/qemu-common/scripts/qapi/.flake8
diff --git a/scripts/qapi/.isort.cfg b/subprojects/qemu-common/scripts/qapi/.isort.cfg
similarity index 100%
rename from scripts/qapi/.isort.cfg
rename to subprojects/qemu-common/scripts/qapi/.isort.cfg
diff --git a/scripts/qapi/__init__.py b/subprojects/qemu-common/scripts/qapi/__init__.py
similarity index 100%
rename from scripts/qapi/__init__.py
rename to subprojects/qemu-common/scripts/qapi/__init__.py
diff --git a/scripts/qapi/commands.py b/subprojects/qemu-common/scripts/qapi/commands.py
similarity index 100%
rename from scripts/qapi/commands.py
rename to subprojects/qemu-common/scripts/qapi/commands.py
diff --git a/scripts/qapi/common.py b/subprojects/qemu-common/scripts/qapi/common.py
similarity index 100%
rename from scripts/qapi/common.py
rename to subprojects/qemu-common/scripts/qapi/common.py
diff --git a/scripts/qapi/error.py b/subprojects/qemu-common/scripts/qapi/error.py
similarity index 100%
rename from scripts/qapi/error.py
rename to subprojects/qemu-common/scripts/qapi/error.py
diff --git a/scripts/qapi/events.py b/subprojects/qemu-common/scripts/qapi/events.py
similarity index 100%
rename from scripts/qapi/events.py
rename to subprojects/qemu-common/scripts/qapi/events.py
diff --git a/scripts/qapi/expr.py b/subprojects/qemu-common/scripts/qapi/expr.py
similarity index 100%
rename from scripts/qapi/expr.py
rename to subprojects/qemu-common/scripts/qapi/expr.py
diff --git a/scripts/qapi/gen.py b/subprojects/qemu-common/scripts/qapi/gen.py
similarity index 100%
rename from scripts/qapi/gen.py
rename to subprojects/qemu-common/scripts/qapi/gen.py
diff --git a/scripts/qapi/introspect.py b/subprojects/qemu-common/scripts/qapi/introspect.py
similarity index 100%
rename from scripts/qapi/introspect.py
rename to subprojects/qemu-common/scripts/qapi/introspect.py
diff --git a/scripts/qapi/main.py b/subprojects/qemu-common/scripts/qapi/main.py
similarity index 100%
rename from scripts/qapi/main.py
rename to subprojects/qemu-common/scripts/qapi/main.py
diff --git a/subprojects/qemu-common/scripts/qapi/meson.build b/subprojects/qemu-common/scripts/qapi/meson.build
new file mode 100644
index 000000000000..5f73a966f344
--- /dev/null
+++ b/subprojects/qemu-common/scripts/qapi/meson.build
@@ -0,0 +1,16 @@
+qapi_gen_depends = files(
+  '__init__.py',
+  'commands.py',
+  'common.py',
+  'error.py',
+  'events.py',
+  'expr.py',
+  'gen.py',
+  'introspect.py',
+  'parser.py',
+  'schema.py',
+  'source.py',
+  'types.py',
+  'visit.py',
+  'common.py',
+)
diff --git a/scripts/qapi/mypy.ini b/subprojects/qemu-common/scripts/qapi/mypy.ini
similarity index 100%
rename from scripts/qapi/mypy.ini
rename to subprojects/qemu-common/scripts/qapi/mypy.ini
diff --git a/scripts/qapi/parser.py b/subprojects/qemu-common/scripts/qapi/parser.py
similarity index 100%
rename from scripts/qapi/parser.py
rename to subprojects/qemu-common/scripts/qapi/parser.py
diff --git a/scripts/qapi/pylintrc b/subprojects/qemu-common/scripts/qapi/pylintrc
similarity index 100%
rename from scripts/qapi/pylintrc
rename to subprojects/qemu-common/scripts/qapi/pylintrc
diff --git a/scripts/qapi/schema.py b/subprojects/qemu-common/scripts/qapi/schema.py
similarity index 100%
rename from scripts/qapi/schema.py
rename to subprojects/qemu-common/scripts/qapi/schema.py
diff --git a/scripts/qapi/source.py b/subprojects/qemu-common/scripts/qapi/source.py
similarity index 100%
rename from scripts/qapi/source.py
rename to subprojects/qemu-common/scripts/qapi/source.py
diff --git a/scripts/qapi/types.py b/subprojects/qemu-common/scripts/qapi/types.py
similarity index 100%
rename from scripts/qapi/types.py
rename to subprojects/qemu-common/scripts/qapi/types.py
diff --git a/scripts/qapi/visit.py b/subprojects/qemu-common/scripts/qapi/visit.py
similarity index 100%
rename from scripts/qapi/visit.py
rename to subprojects/qemu-common/scripts/qapi/visit.py
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index c18dd7d02f72..2c676360041e 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -1,5 +1,5 @@
 test_env = environment()
-test_env.set('PYTHONPATH', meson.project_source_root() / 'scripts')
+test_env.set('PYTHONPATH', meson.project_source_root() / 'subprojects/qemu-common/scripts')
 test_env.set('PYTHONIOENCODING', 'utf-8')
 
 schemas = [
-- 
2.37.0.rc0


