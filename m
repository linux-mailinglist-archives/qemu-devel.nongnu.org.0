Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF7702E94
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:42:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXv4-00021u-CE; Mon, 15 May 2023 09:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pyXun-0001y5-Ot
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:07:03 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pyXuj-0001xS-D4
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:06:59 -0400
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:750a:0:640:e46:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 5C24F6150D;
 Mon, 15 May 2023 16:06:52 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown
 [2a02:6b8:8f:4:7a31:c1ff:fef2:bf07])
 by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id f6aGDc2OcCg0-CdlatwGx; Mon, 15 May 2023 16:06:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1684156011; bh=DsBdXWMEcDWAS3M61HpqJQWWqrIHohqqu1YhQbia2b8=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=QukisJHE0hJr3a1Uydgj4ZZwHAyLCvG5/9LBcL2ilnwNu6bn6pDHtdWDfTmibFuit
 vBX/QXkv9iyiGZ2v8rcPprozRuvpeHRAOC1QDDH9ZWR+slVhKVgVVREGR9ikX6xu7z
 TzTmO29lvQjOIVvwvJBJC5qwL8a8/QKGD3xcp6Ys=
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 leobras@redhat.com, peterx@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, chen.zhang@intel.com, lukasstraub2@web.de,
 vsementsov@yandex-team.ru
Subject: [PATCH v5 1/3] configure: add --disable-colo-proxy option
Date: Mon, 15 May 2023 16:06:38 +0300
Message-Id: <20230515130640.46035-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515130640.46035-1-vsementsov@yandex-team.ru>
References: <20230515130640.46035-1-vsementsov@yandex-team.ru>
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

Add option to not build filter-rewriter and colo-compare when
they are not needed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
---
 meson_options.txt             |  2 ++
 net/meson.build               | 13 ++++++++++---
 scripts/meson-buildoptions.sh |  3 +++
 stubs/colo-compare.c          |  7 +++++++
 stubs/meson.build             |  1 +
 5 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 stubs/colo-compare.c

diff --git a/meson_options.txt b/meson_options.txt
index d8330a1f71..7db5709a00 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -291,6 +291,8 @@ option('live_block_migration', type: 'feature', value: 'auto',
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
index 2805d1c145..d845d61a0a 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -86,6 +86,7 @@ meson_options_help() {
   printf "%s\n" '  capstone        Whether and how to find the capstone library'
   printf "%s\n" '  cloop           cloop image format support'
   printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
+  printf "%s\n" '  colo-proxy      colo-proxy support'
   printf "%s\n" '  coreaudio       CoreAudio sound support'
   printf "%s\n" '  crypto-afalg    Linux AF_ALG crypto backend driver'
   printf "%s\n" '  curl            CURL block device driver'
@@ -243,6 +244,8 @@ _meson_option_parse() {
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


