Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3746F0D29
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 22:31:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8Ft-0002wB-3p; Thu, 27 Apr 2023 16:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps8Fr-0002uO-2I; Thu, 27 Apr 2023 16:30:15 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps8Fn-0004zn-OQ; Thu, 27 Apr 2023 16:30:14 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id E5CE660FA2;
 Thu, 27 Apr 2023 23:30:03 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b438::1:2b])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id lTP2w70Oh0U0-KpRVML39; Thu, 27 Apr 2023 23:30:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682627403; bh=knsqnnuLlTA+E6gwey9u9m+AMw1tOhZ7SzhcknyuWZI=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=NSZGAJVWdJDkJ38N2b0vOgb0S02pg3aQI04pzq6hUx6r4OsLludZYXfVn0cRx6yuC
 CbVLLl0yksfDs4fA+YmIqupcyeUSm5sJhzwS5xoh5oNSpC3KPWAWs+qMw1xZNtMnvq
 x6efcpttpZLosdwxxVlhh4MWthtX0/cckNPldGyA=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, michael.roth@amd.com, armbru@redhat.com,
 eblake@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com, lukasstraub2@web.de,
 vsementsov@yandex-team.ru
Subject: [PATCH v3 4/4] configure: add --disable-colo-proxy option
Date: Thu, 27 Apr 2023 23:29:46 +0300
Message-Id: <20230427202946.1007276-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add option to not build filter-mirror, filter-rewriter and
colo-compare when they are not needed.

There could be more agile configuration, for example add separate
options for each filter, but that may be done in future on demand. The
aim of this patch is to make possible to disable the whole COLO Proxy
subsystem.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 meson_options.txt             |  2 ++
 net/meson.build               | 14 ++++++++++----
 scripts/meson-buildoptions.sh |  3 +++
 stubs/colo-compare.c          |  7 +++++++
 stubs/meson.build             |  1 +
 5 files changed, 23 insertions(+), 4 deletions(-)
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
index 87afca3e93..4cfc850c69 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -1,13 +1,9 @@
 softmmu_ss.add(files(
   'announce.c',
   'checksum.c',
-  'colo-compare.c',
-  'colo.c',
   'dump.c',
   'eth.c',
   'filter-buffer.c',
-  'filter-mirror.c',
-  'filter-rewriter.c',
   'filter.c',
   'hub.c',
   'net-hmp-cmds.c',
@@ -19,6 +15,16 @@ softmmu_ss.add(files(
   'util.c',
 ))
 
+if get_option('replication').allowed() or \
+    get_option('colo_proxy').allowed()
+  softmmu_ss.add(files('colo-compare.c'))
+  softmmu_ss.add(files('colo.c'))
+endif
+
+if get_option('colo_proxy').allowed()
+  softmmu_ss.add(files('filter-mirror.c', 'filter-rewriter.c'))
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


