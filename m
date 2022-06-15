Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4E854C6B9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 13:01:20 +0200 (CEST)
Received: from localhost ([::1]:39634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Qlz-00034P-F5
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 07:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1QdR-0003CY-Pq
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:52:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1QdP-0001yq-C0
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655290346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VB12SowWEnpyzRh7lCxDweNPSJqPeMYKzBHyF0Drog=;
 b=TxXZ4LEfUDq3E265Z/lT68WdYYtunF/zUjY/P4MJRzAeWwZi2LmvSExgnrz/VzJZzMY/52
 rm6w0alHUwWvr8QGyup91DyxW8bAyh8PKjMpcCOahKirlY3+YXuNngp/8auszSBdMdrAP4
 n07/TdxcpcO2qFN9vaWn78IiwAEbagM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-1A1Nc-qKNjaviNS2seLMKA-1; Wed, 15 Jun 2022 06:52:23 -0400
X-MC-Unique: 1A1Nc-qKNjaviNS2seLMKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 099163C025C9;
 Wed, 15 Jun 2022 10:52:23 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47C9A18EA9;
 Wed, 15 Jun 2022 10:52:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 2/4] ui: move 'pc-bios/keymaps' to 'ui/keymaps'
Date: Wed, 15 Jun 2022 11:52:10 +0100
Message-Id: <20220615105212.780256-3-berrange@redhat.com>
In-Reply-To: <20220615105212.780256-1-berrange@redhat.com>
References: <20220615105212.780256-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

The 'keymaps' directory contents is nothing to do with the firmware
blobs. The 'pc-bios/keymaps' directory appears to have been used
previously as a convenience for getting the files installed into
a subdir of the firmware install dir, as well as to make it easier
to launch QEMU directly from the build tree. These requirements
do not need to be reflected in the source tree arrangement. The
keymaps logically belong with the UI code, and meson can install
them into the right place. For in-tree execution, we merely need
a suitable symlink from the source tree to the build tree.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 pc-bios/meson.build                 | 1 -
 softmmu/datadir.c                   | 2 +-
 {pc-bios => ui}/keymaps/ar          | 0
 {pc-bios => ui}/keymaps/bepo        | 0
 {pc-bios => ui}/keymaps/cz          | 0
 {pc-bios => ui}/keymaps/da          | 0
 {pc-bios => ui}/keymaps/de          | 0
 {pc-bios => ui}/keymaps/de-ch       | 0
 {pc-bios => ui}/keymaps/en-gb       | 0
 {pc-bios => ui}/keymaps/en-us       | 0
 {pc-bios => ui}/keymaps/es          | 0
 {pc-bios => ui}/keymaps/et          | 0
 {pc-bios => ui}/keymaps/fi          | 0
 {pc-bios => ui}/keymaps/fo          | 0
 {pc-bios => ui}/keymaps/fr          | 0
 {pc-bios => ui}/keymaps/fr-be       | 0
 {pc-bios => ui}/keymaps/fr-ca       | 0
 {pc-bios => ui}/keymaps/fr-ch       | 0
 {pc-bios => ui}/keymaps/hr          | 0
 {pc-bios => ui}/keymaps/hu          | 0
 {pc-bios => ui}/keymaps/is          | 0
 {pc-bios => ui}/keymaps/it          | 0
 {pc-bios => ui}/keymaps/ja          | 0
 {pc-bios => ui}/keymaps/lt          | 0
 {pc-bios => ui}/keymaps/lv          | 0
 {pc-bios => ui}/keymaps/meson.build | 0
 {pc-bios => ui}/keymaps/mk          | 0
 {pc-bios => ui}/keymaps/nl          | 0
 {pc-bios => ui}/keymaps/no          | 0
 {pc-bios => ui}/keymaps/pl          | 0
 {pc-bios => ui}/keymaps/pt          | 0
 {pc-bios => ui}/keymaps/pt-br       | 0
 {pc-bios => ui}/keymaps/ru          | 0
 {pc-bios => ui}/keymaps/sl          | 0
 {pc-bios => ui}/keymaps/sv          | 0
 {pc-bios => ui}/keymaps/th          | 0
 {pc-bios => ui}/keymaps/tr          | 0
 ui/meson.build                      | 1 +
 38 files changed, 2 insertions(+), 2 deletions(-)
 rename {pc-bios => ui}/keymaps/ar (100%)
 rename {pc-bios => ui}/keymaps/bepo (100%)
 rename {pc-bios => ui}/keymaps/cz (100%)
 rename {pc-bios => ui}/keymaps/da (100%)
 rename {pc-bios => ui}/keymaps/de (100%)
 rename {pc-bios => ui}/keymaps/de-ch (100%)
 rename {pc-bios => ui}/keymaps/en-gb (100%)
 rename {pc-bios => ui}/keymaps/en-us (100%)
 rename {pc-bios => ui}/keymaps/es (100%)
 rename {pc-bios => ui}/keymaps/et (100%)
 rename {pc-bios => ui}/keymaps/fi (100%)
 rename {pc-bios => ui}/keymaps/fo (100%)
 rename {pc-bios => ui}/keymaps/fr (100%)
 rename {pc-bios => ui}/keymaps/fr-be (100%)
 rename {pc-bios => ui}/keymaps/fr-ca (100%)
 rename {pc-bios => ui}/keymaps/fr-ch (100%)
 rename {pc-bios => ui}/keymaps/hr (100%)
 rename {pc-bios => ui}/keymaps/hu (100%)
 rename {pc-bios => ui}/keymaps/is (100%)
 rename {pc-bios => ui}/keymaps/it (100%)
 rename {pc-bios => ui}/keymaps/ja (100%)
 rename {pc-bios => ui}/keymaps/lt (100%)
 rename {pc-bios => ui}/keymaps/lv (100%)
 rename {pc-bios => ui}/keymaps/meson.build (100%)
 rename {pc-bios => ui}/keymaps/mk (100%)
 rename {pc-bios => ui}/keymaps/nl (100%)
 rename {pc-bios => ui}/keymaps/no (100%)
 rename {pc-bios => ui}/keymaps/pl (100%)
 rename {pc-bios => ui}/keymaps/pt (100%)
 rename {pc-bios => ui}/keymaps/pt-br (100%)
 rename {pc-bios => ui}/keymaps/ru (100%)
 rename {pc-bios => ui}/keymaps/sl (100%)
 rename {pc-bios => ui}/keymaps/sv (100%)
 rename {pc-bios => ui}/keymaps/th (100%)
 rename {pc-bios => ui}/keymaps/tr (100%)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 41ba1c0ec7..e49c0e5f56 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -97,4 +97,3 @@ foreach f : blobs
 endforeach
 
 subdir('descriptors')
-subdir('keymaps')
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 7457717542..32c765d228 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -62,7 +62,7 @@ char *qemu_find_file(int type, const char *name)
     case QEMU_FILE_TYPE_KEYMAP:
         user_install_dir = user_data_dir;
         rel_install_dir = "keymaps";
-        rel_build_dir = "pc-bios/keymaps";
+        rel_build_dir = "ui/keymaps";
         default_install_dir = default_data_dir;
         break;
 
diff --git a/pc-bios/keymaps/ar b/ui/keymaps/ar
similarity index 100%
rename from pc-bios/keymaps/ar
rename to ui/keymaps/ar
diff --git a/pc-bios/keymaps/bepo b/ui/keymaps/bepo
similarity index 100%
rename from pc-bios/keymaps/bepo
rename to ui/keymaps/bepo
diff --git a/pc-bios/keymaps/cz b/ui/keymaps/cz
similarity index 100%
rename from pc-bios/keymaps/cz
rename to ui/keymaps/cz
diff --git a/pc-bios/keymaps/da b/ui/keymaps/da
similarity index 100%
rename from pc-bios/keymaps/da
rename to ui/keymaps/da
diff --git a/pc-bios/keymaps/de b/ui/keymaps/de
similarity index 100%
rename from pc-bios/keymaps/de
rename to ui/keymaps/de
diff --git a/pc-bios/keymaps/de-ch b/ui/keymaps/de-ch
similarity index 100%
rename from pc-bios/keymaps/de-ch
rename to ui/keymaps/de-ch
diff --git a/pc-bios/keymaps/en-gb b/ui/keymaps/en-gb
similarity index 100%
rename from pc-bios/keymaps/en-gb
rename to ui/keymaps/en-gb
diff --git a/pc-bios/keymaps/en-us b/ui/keymaps/en-us
similarity index 100%
rename from pc-bios/keymaps/en-us
rename to ui/keymaps/en-us
diff --git a/pc-bios/keymaps/es b/ui/keymaps/es
similarity index 100%
rename from pc-bios/keymaps/es
rename to ui/keymaps/es
diff --git a/pc-bios/keymaps/et b/ui/keymaps/et
similarity index 100%
rename from pc-bios/keymaps/et
rename to ui/keymaps/et
diff --git a/pc-bios/keymaps/fi b/ui/keymaps/fi
similarity index 100%
rename from pc-bios/keymaps/fi
rename to ui/keymaps/fi
diff --git a/pc-bios/keymaps/fo b/ui/keymaps/fo
similarity index 100%
rename from pc-bios/keymaps/fo
rename to ui/keymaps/fo
diff --git a/pc-bios/keymaps/fr b/ui/keymaps/fr
similarity index 100%
rename from pc-bios/keymaps/fr
rename to ui/keymaps/fr
diff --git a/pc-bios/keymaps/fr-be b/ui/keymaps/fr-be
similarity index 100%
rename from pc-bios/keymaps/fr-be
rename to ui/keymaps/fr-be
diff --git a/pc-bios/keymaps/fr-ca b/ui/keymaps/fr-ca
similarity index 100%
rename from pc-bios/keymaps/fr-ca
rename to ui/keymaps/fr-ca
diff --git a/pc-bios/keymaps/fr-ch b/ui/keymaps/fr-ch
similarity index 100%
rename from pc-bios/keymaps/fr-ch
rename to ui/keymaps/fr-ch
diff --git a/pc-bios/keymaps/hr b/ui/keymaps/hr
similarity index 100%
rename from pc-bios/keymaps/hr
rename to ui/keymaps/hr
diff --git a/pc-bios/keymaps/hu b/ui/keymaps/hu
similarity index 100%
rename from pc-bios/keymaps/hu
rename to ui/keymaps/hu
diff --git a/pc-bios/keymaps/is b/ui/keymaps/is
similarity index 100%
rename from pc-bios/keymaps/is
rename to ui/keymaps/is
diff --git a/pc-bios/keymaps/it b/ui/keymaps/it
similarity index 100%
rename from pc-bios/keymaps/it
rename to ui/keymaps/it
diff --git a/pc-bios/keymaps/ja b/ui/keymaps/ja
similarity index 100%
rename from pc-bios/keymaps/ja
rename to ui/keymaps/ja
diff --git a/pc-bios/keymaps/lt b/ui/keymaps/lt
similarity index 100%
rename from pc-bios/keymaps/lt
rename to ui/keymaps/lt
diff --git a/pc-bios/keymaps/lv b/ui/keymaps/lv
similarity index 100%
rename from pc-bios/keymaps/lv
rename to ui/keymaps/lv
diff --git a/pc-bios/keymaps/meson.build b/ui/keymaps/meson.build
similarity index 100%
rename from pc-bios/keymaps/meson.build
rename to ui/keymaps/meson.build
diff --git a/pc-bios/keymaps/mk b/ui/keymaps/mk
similarity index 100%
rename from pc-bios/keymaps/mk
rename to ui/keymaps/mk
diff --git a/pc-bios/keymaps/nl b/ui/keymaps/nl
similarity index 100%
rename from pc-bios/keymaps/nl
rename to ui/keymaps/nl
diff --git a/pc-bios/keymaps/no b/ui/keymaps/no
similarity index 100%
rename from pc-bios/keymaps/no
rename to ui/keymaps/no
diff --git a/pc-bios/keymaps/pl b/ui/keymaps/pl
similarity index 100%
rename from pc-bios/keymaps/pl
rename to ui/keymaps/pl
diff --git a/pc-bios/keymaps/pt b/ui/keymaps/pt
similarity index 100%
rename from pc-bios/keymaps/pt
rename to ui/keymaps/pt
diff --git a/pc-bios/keymaps/pt-br b/ui/keymaps/pt-br
similarity index 100%
rename from pc-bios/keymaps/pt-br
rename to ui/keymaps/pt-br
diff --git a/pc-bios/keymaps/ru b/ui/keymaps/ru
similarity index 100%
rename from pc-bios/keymaps/ru
rename to ui/keymaps/ru
diff --git a/pc-bios/keymaps/sl b/ui/keymaps/sl
similarity index 100%
rename from pc-bios/keymaps/sl
rename to ui/keymaps/sl
diff --git a/pc-bios/keymaps/sv b/ui/keymaps/sv
similarity index 100%
rename from pc-bios/keymaps/sv
rename to ui/keymaps/sv
diff --git a/pc-bios/keymaps/th b/ui/keymaps/th
similarity index 100%
rename from pc-bios/keymaps/th
rename to ui/keymaps/th
diff --git a/pc-bios/keymaps/tr b/ui/keymaps/tr
similarity index 100%
rename from pc-bios/keymaps/tr
rename to ui/keymaps/tr
diff --git a/ui/meson.build b/ui/meson.build
index e9f48c5315..25c9a5ff8c 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -170,6 +170,7 @@ if have_system or xkbcommon.found()
 endif
 
 subdir('shader')
+subdir('keymaps')
 
 if have_system
   subdir('icons')
-- 
2.36.1


