Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C435B58ECC8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:09:44 +0200 (CEST)
Received: from localhost ([::1]:56310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlSx-0000Ct-Sr
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLlAV-0001uI-2I
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLlAD-0007qw-RF
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660135817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FV5JOZPDoT9vhnkmPbtByhwUWEwvTo3eOwUz3nk743w=;
 b=bVyIf1zo4hx3sE/U/p7U5xwSgohx8DXhWcojnLvppjAgRPEA69bgee1tV4rI0nuoeYqJGO
 przHrrNZAjyzK4GherEuKB9qoCaXkuxIEDe4sZrSumxPX39d1soT5WWPBaiagTFBI0IKHr
 gCH/Fx7R+2XL9hSplB3Srpg+/QtOIbU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-TluCTiIrOVyF1JJVtpcV6Q-1; Wed, 10 Aug 2022 08:50:14 -0400
X-MC-Unique: TluCTiIrOVyF1JJVtpcV6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD86D3C138DF;
 Wed, 10 Aug 2022 12:49:58 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46DD640CFD21;
 Wed, 10 Aug 2022 12:49:56 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 11/16] qemu-common: introduce a common subproject
Date: Wed, 10 Aug 2022 16:48:52 +0400
Message-Id: <20220810124857.1360211-12-marcandre.lureau@redhat.com>
In-Reply-To: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
References: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 subprojects/libvduse/meson.build                         | 2 ++
 subprojects/libvduse/subprojects/qemu-common             | 1 +
 subprojects/libvhost-user/meson.build                    | 2 ++
 subprojects/libvhost-user/subprojects/qemu-common        | 1 +
 subprojects/qemu-common/meson.build                      | 8 ++++++++
 7 files changed, 22 insertions(+), 1 deletion(-)
 rename {include => subprojects/qemu-common/include}/qemu/help-texts.h (100%)
 create mode 120000 subprojects/libvduse/subprojects/qemu-common
 create mode 120000 subprojects/libvhost-user/subprojects/qemu-common
 create mode 100644 subprojects/qemu-common/meson.build

diff --git a/meson.build b/meson.build
index 294e9a8f32..a47ce88c84 100644
--- a/meson.build
+++ b/meson.build
@@ -169,6 +169,10 @@ if 'dtrace' in get_option('trace_backends')
   endif
 endif
 
+add_project_arguments('-I' + meson.current_source_dir() / 'subprojects/qemu-common/include',
+  language: ['c', 'cpp', 'objc'],
+)
+
 if get_option('iasl') == ''
   iasl = find_program('iasl', required: false)
 else
@@ -1583,6 +1587,9 @@ if libbpf.found() and not cc.links('''
   endif
 endif
 
+qemu_common = subproject('qemu-common')
+qemu_common = qemu_common.get_variable('qemu_common_dep')
+
 #################
 # config-host.h #
 #################
@@ -3057,7 +3064,7 @@ util_ss.add_all(trace_ss)
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
diff --git a/subprojects/libvduse/meson.build b/subprojects/libvduse/meson.build
index ba08f5ee1a..841509ecb9 100644
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
index 0000000000..4c1c87018a
--- /dev/null
+++ b/subprojects/libvduse/subprojects/qemu-common
@@ -0,0 +1 @@
+../../qemu-common
\ No newline at end of file
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index 39825d9404..73355908e0 100644
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
index 0000000000..4c1c87018a
--- /dev/null
+++ b/subprojects/libvhost-user/subprojects/qemu-common
@@ -0,0 +1 @@
+../../qemu-common
\ No newline at end of file
diff --git a/subprojects/qemu-common/meson.build b/subprojects/qemu-common/meson.build
new file mode 100644
index 0000000000..8969b08473
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
2.37.1


