Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C966A571675
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:02:20 +0200 (CEST)
Received: from localhost ([::1]:36954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCih-0008Tk-IZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCK5-00066s-1Q
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCK0-0000gP-Ie
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RSWmqrCRifNkF/Ky3wI4xiwm7h2jr7Ylkixe4+gDIWI=;
 b=i/iES+23WB2y839vsFOW6qRN6dnX3dZ1ixhFYgiBLrfXnHmVbqHiyXolCjyy0gX/k2oG3l
 cKa3PbWUcPe2bN1bxPzKruVOAOwoFlnT1EGB6WymMQAv5WjIm9esqNBwH2NI9u0LWJ5Hov
 PyQs5ESby4vMZayFKvAvPbFfWCwbR4w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-WRcDgSgDMv-C1_krHwVs6Q-1; Tue, 12 Jul 2022 05:36:44 -0400
X-MC-Unique: WRcDgSgDMv-C1_krHwVs6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38829185A7BA;
 Tue, 12 Jul 2022 09:36:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EF81C15D40;
 Tue, 12 Jul 2022 09:36:41 +0000 (UTC)
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
Subject: [PATCH v2 10/15] qemu-common: introduce a common subproject
Date: Tue, 12 Jul 2022 13:35:23 +0400
Message-Id: <20220712093528.4144184-11-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add a new meson subproject to provide common code and scripts for QEMU
and tools. Initially, it will offer QAPI/QMP code generation and
common utilities.

libvhost-user & libvduse will make use of the subproject to avoid having
include/ links to common headers.

The other targeted user is qemu-ga, which will also be converted to a
subproject (so it can be built, moved, released etc independent from QEMU).

Other projects such as qemu-storage-daemon could be built standalone
eventually in the future.

Note that with meson subprojects are "global". Projects will share
subprojects (https://mesonbuild.com/Subprojects.html#subprojects-depending-on-other-subprojects).
We will add extra subprojects/ links to allow standalone subproject
compilation though.

This initial commit simply set the stage to build and link against it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build                                              | 9 ++++++++-
 .../qemu-common/include}/qemu/help-texts.h               | 0
 linux-user/meson.build                                   | 4 ++--
 subprojects/libvduse/meson.build                         | 2 ++
 subprojects/libvduse/subprojects/qemu-common             | 1 +
 subprojects/libvhost-user/meson.build                    | 2 ++
 subprojects/libvhost-user/subprojects/qemu-common        | 1 +
 subprojects/qemu-common/meson.build                      | 8 ++++++++
 8 files changed, 24 insertions(+), 3 deletions(-)
 rename {include => subprojects/qemu-common/include}/qemu/help-texts.h (100%)
 create mode 120000 subprojects/libvduse/subprojects/qemu-common
 create mode 120000 subprojects/libvhost-user/subprojects/qemu-common
 create mode 100644 subprojects/qemu-common/meson.build

diff --git a/meson.build b/meson.build
index bc5569ace159..254eb1263a66 100644
--- a/meson.build
+++ b/meson.build
@@ -167,6 +167,10 @@ if 'dtrace' in get_option('trace_backends')
   endif
 endif
 
+add_project_arguments('-I' + meson.current_source_dir() / 'subprojects/qemu-common/include',
+  language: ['c', 'cpp', 'objc'],
+)
+
 if get_option('iasl') == ''
   iasl = find_program('iasl', required: false)
 else
@@ -1577,6 +1581,9 @@ if libbpf.found() and not cc.links('''
   endif
 endif
 
+qemu_common = subproject('qemu-common')
+qemu_common = qemu_common.get_variable('qemu_common_dep')
+
 #################
 # config-host.h #
 #################
@@ -3052,7 +3059,7 @@ util_ss.add_all(trace_ss)
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman])
+                             dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman, qemu_common])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res,
                               dependencies: [event_loop_base])
diff --git a/include/qemu/help-texts.h b/subprojects/qemu-common/include/qemu/help-texts.h
similarity index 100%
rename from include/qemu/help-texts.h
rename to subprojects/qemu-common/include/qemu/help-texts.h
diff --git a/linux-user/meson.build b/linux-user/meson.build
index de4320af053c..fc6cdb55d657 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -7,7 +7,7 @@ linux_user_ss = ss.source_set()
 common_user_inc += include_directories('include/host/' / host_arch)
 common_user_inc += include_directories('include')
 
-linux_user_ss.add(files(
+linux_user_ss.add([files(
   'elfload.c',
   'exit.c',
   'fd-trans.c',
@@ -20,7 +20,7 @@ linux_user_ss.add(files(
   'thunk.c',
   'uaccess.c',
   'uname.c',
-))
+), qemu_common])
 linux_user_ss.add(rt)
 
 linux_user_ss.add(when: 'TARGET_HAS_BFLT', if_true: files('flatload.c'))
diff --git a/subprojects/libvduse/meson.build b/subprojects/libvduse/meson.build
index ba08f5ee1a03..841509ecb996 100644
--- a/subprojects/libvduse/meson.build
+++ b/subprojects/libvduse/meson.build
@@ -2,6 +2,8 @@ project('libvduse', 'c',
         license: 'GPL-2.0-or-later',
         default_options: ['c_std=gnu99'])
 
+qemu_common = subproject('qemu-common')
+
 libvduse = static_library('vduse',
                           files('libvduse.c'),
                           c_args: '-D_GNU_SOURCE')
diff --git a/subprojects/libvduse/subprojects/qemu-common b/subprojects/libvduse/subprojects/qemu-common
new file mode 120000
index 000000000000..4c1c87018a7a
--- /dev/null
+++ b/subprojects/libvduse/subprojects/qemu-common
@@ -0,0 +1 @@
+../../qemu-common
\ No newline at end of file
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index 39825d9404ae..73355908e072 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -5,6 +5,8 @@ project('libvhost-user', 'c',
 threads = dependency('threads')
 glib = dependency('glib-2.0')
 
+qemu_common = subproject('qemu-common')
+
 vhost_user = static_library('vhost-user',
                             files('libvhost-user.c'),
                             dependencies: threads,
diff --git a/subprojects/libvhost-user/subprojects/qemu-common b/subprojects/libvhost-user/subprojects/qemu-common
new file mode 120000
index 000000000000..4c1c87018a7a
--- /dev/null
+++ b/subprojects/libvhost-user/subprojects/qemu-common
@@ -0,0 +1 @@
+../../qemu-common
\ No newline at end of file
diff --git a/subprojects/qemu-common/meson.build b/subprojects/qemu-common/meson.build
new file mode 100644
index 000000000000..8969b08473ef
--- /dev/null
+++ b/subprojects/qemu-common/meson.build
@@ -0,0 +1,8 @@
+project('qemu-common', 'c',
+  license: 'GPL-2.0-or-later',
+  default_options: ['c_std=gnu11']
+)
+
+qemu_common_dep = declare_dependency(
+  include_directories: include_directories('include'),
+)
-- 
2.37.0.rc0


