Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB76F1EEC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:52:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psU6X-0000td-My; Fri, 28 Apr 2023 15:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6R-0000q9-SF
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:49:59 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6L-00015c-Hl
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:49:57 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 6C0095F72E;
 Fri, 28 Apr 2023 22:49:44 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b432::1:18])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id TnPWb50Oca60-J3krjAnj; Fri, 28 Apr 2023 22:49:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682711383; bh=8NHg9RXaVsIiMmtC99+h6Vul0Yh4wasX4o8Ki5eqWdQ=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=OI9EUvk2SRj3MPdQWdkkB3hsgJm2ksFsqwQN4KprABChjKvBxWmxnDCGzV0z4dZM4
 rxLG+glbdN0VyYObEJ4CAoC/cUZi9B/iEbo0GeZbdWSyJ+ZiyTlUDqyw9ZYvm4bNQD
 9wP3g/Z/bCo/nLaKUK87DxkfXqto6n+kGgm3JNRI=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: lukasstraub2@web.de, quintela@redhat.com, chen.zhang@intel.com,
 vsementsov@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 04/10] configure: add --disable-colo-proxy option
Date: Fri, 28 Apr 2023 22:49:22 +0300
Message-Id: <20230428194928.1426370-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add option to not build filter-mirror, filter-rewriter and
colo-compare when they are not needed.

There could be more agile configuration, for example add separate
options for each filter, but that may be done in future on demand. The
aim of this patch is to make possible to disable the whole COLO Proxy
subsystem.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 meson_options.txt             |  2 ++
 net/meson.build               | 13 ++++++++++---
 scripts/meson-buildoptions.sh |  3 +++
 stubs/colo-compare.c          |  7 +++++++
 stubs/meson.build             |  1 +
 5 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 stubs/colo-compare.c

diff --git a/meson_options.txt b/meson_options.txt
index 2471dd02da..b59e7ae342 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -289,6 +289,8 @@ option('live_block_migration', type: 'feature', value: 'auto',
        description: 'block migration in the main migration stream')
 option('replication', type: 'feature', value: 'auto',
        description: 'replication support')
+option('colo_proxy', type: 'feature', value: 'auto',
+       description: 'colo-proxy support')
 option('bochs', type: 'feature', value: 'auto',
        description: 'bochs image format support')
 option('cloop', type: 'feature', value: 'auto',
diff --git a/net/meson.build b/net/meson.build
index 87afca3e93..6f4ecde57f 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -1,13 +1,10 @@
 softmmu_ss.add(files(
   'announce.c',
   'checksum.c',
-  'colo-compare.c',
-  'colo.c',
   'dump.c',
   'eth.c',
   'filter-buffer.c',
   'filter-mirror.c',
-  'filter-rewriter.c',
   'filter.c',
   'hub.c',
   'net-hmp-cmds.c',
@@ -19,6 +16,16 @@ softmmu_ss.add(files(
   'util.c',
 ))
 
+if get_option('replication').allowed() or \
+    get_option('colo_proxy').allowed()
+  softmmu_ss.add(files('colo-compare.c'))
+  softmmu_ss.add(files('colo.c'))
+endif
+
+if get_option('colo_proxy').allowed()
+  softmmu_ss.add(files('filter-rewriter.c'))
+endif
+
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
 
 if have_l2tpv3
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index d4369a3ad8..036047ce6f 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -83,6 +83,7 @@ meson_options_help() {
   printf "%s\n" '  capstone        Whether and how to find the capstone library'
   printf "%s\n" '  cloop           cloop image format support'
   printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
+  printf "%s\n" '  colo-proxy      colo-proxy support'
   printf "%s\n" '  coreaudio       CoreAudio sound support'
   printf "%s\n" '  crypto-afalg    Linux AF_ALG crypto backend driver'
   printf "%s\n" '  curl            CURL block device driver'
@@ -236,6 +237,8 @@ _meson_option_parse() {
     --disable-cloop) printf "%s" -Dcloop=disabled ;;
     --enable-cocoa) printf "%s" -Dcocoa=enabled ;;
     --disable-cocoa) printf "%s" -Dcocoa=disabled ;;
+    --enable-colo-proxy) printf "%s" -Dcolo_proxy=enabled ;;
+    --disable-colo-proxy) printf "%s" -Dcolo_proxy=disabled ;;
     --enable-coreaudio) printf "%s" -Dcoreaudio=enabled ;;
     --disable-coreaudio) printf "%s" -Dcoreaudio=disabled ;;
     --enable-coroutine-pool) printf "%s" -Dcoroutine_pool=true ;;
diff --git a/stubs/colo-compare.c b/stubs/colo-compare.c
new file mode 100644
index 0000000000..ec726665be
--- /dev/null
+++ b/stubs/colo-compare.c
@@ -0,0 +1,7 @@
+#include "qemu/osdep.h"
+#include "qemu/notify.h"
+#include "net/colo-compare.h"
+
+void colo_compare_cleanup(void)
+{
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index 8412cad15f..a56645e2f7 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -46,6 +46,7 @@ stub_ss.add(files('target-monitor-defs.c'))
 stub_ss.add(files('trace-control.c'))
 stub_ss.add(files('uuid.c'))
 stub_ss.add(files('colo.c'))
+stub_ss.add(files('colo-compare.c'))
 stub_ss.add(files('vmstate.c'))
 stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
-- 
2.34.1


