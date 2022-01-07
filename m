Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53B487851
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 14:38:33 +0100 (CET)
Received: from localhost ([::1]:33590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5pRw-0006b9-7S
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 08:38:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5pP5-0005mY-Ss
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 08:35:40 -0500
Received: from mailout01.t-online.de ([194.25.134.80]:46760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5pP2-000380-GA
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 08:35:34 -0500
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout01.t-online.de (Postfix) with SMTP id 1161B7CB5;
 Fri,  7 Jan 2022 14:35:15 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd82.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5pOk-1NTBUf0; Fri, 7 Jan 2022 14:35:14 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 4C37E200610; Fri,  7 Jan 2022 14:35:14 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] meson: reenable filemonitor-inotify compilation
Date: Fri,  7 Jan 2022 14:35:14 +0100
Message-Id: <20220107133514.7785-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641562514-0000B8A1-478E3C88/0/0 CLEAN NORMAL
X-TOI-MSGID: 4527c995-e8de-44d6-abf9-20820f43ccd5
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reenable util/filemonitor-inotify compilation. Compilation was
disabled when commit a620fbe9ac ("configure: convert compiler tests
to meson, part 5") moved CONFIG_INOTIFY1 from config-host.mak to
config-host.h.

This fixes the usb-mtp device and reenables test-util-filemonitor.

Fixes: a620fbe9ac ("configure: convert compiler tests to meson, part 5")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/800
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 tests/unit/meson.build | 2 +-
 util/meson.build       | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 90acf5b0da..64a5e7bfde 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -129,7 +129,7 @@ if have_system
     'test-vmstate': [migration, io],
     'test-yank': ['socket-helpers.c', qom, io, chardev]
   }
-  if 'CONFIG_INOTIFY1' in config_host
+  if config_host_data.get('CONFIG_INOTIFY1')
     tests += {'test-util-filemonitor': []}
   endif
 
diff --git a/util/meson.build b/util/meson.build
index 05b593055a..71543e1a85 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -83,7 +83,10 @@ if have_block
   util_ss.add(files('readline.c'))
   util_ss.add(files('throttle.c'))
   util_ss.add(files('timed-average.c'))
-  util_ss.add(when: 'CONFIG_INOTIFY1', if_true: files('filemonitor-inotify.c'),
-                                        if_false: files('filemonitor-stub.c'))
+  if config_host_data.get('CONFIG_INOTIFY1')
+    util_ss.add(files('filemonitor-inotify.c'))
+  else
+    util_ss.add(files('filemonitor-stub.c'))
+  endif
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
 endif
-- 
2.31.1


