Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB186E8552
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 00:55:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppGgG-0003IN-LM; Wed, 19 Apr 2023 18:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppGgC-0003Gk-46; Wed, 19 Apr 2023 18:53:36 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppGg8-0000Wn-CJ; Wed, 19 Apr 2023 18:53:35 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id DDC0560730;
 Thu, 20 Apr 2023 01:53:10 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:b583::1:16])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (smtpcorp/Yandex) with ESMTPSA id YqmhHB1OqSw0-o2pVyVbY; 
 Thu, 20 Apr 2023 01:53:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681944790; bh=oqisxFBeF9FaJ15anyP33//Lgz7jyDHpwXuXFg8+nwA=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=pPqMxRlWsaoT/MzjtTxQXOilFOGfIpaB0ZDgZ6zPFA5rS2cMojoYr5GEHsyTxSpFZ
 4SSdPE4tm2itaeykmBRw8jivpwTqC1vMlCvbUoRVBmgBODMELZmkBtli2JQ4OWxnfl
 3TVAdqgVTRagYRnaLG6+mikqffAxwyn138+Ywf30=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, michael.roth@amd.com, armbru@redhat.com,
 eblake@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v2 4/4] configure: add --disable-colo-filters option
Date: Thu, 20 Apr 2023 01:52:32 +0300
Message-Id: <20230419225232.508121-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419225232.508121-1-vsementsov@yandex-team.ru>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

Add option to not build COLO Proxy subsystem if it is not needed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 meson.build                   |  1 +
 meson_options.txt             |  2 ++
 net/meson.build               | 11 ++++++++---
 scripts/meson-buildoptions.sh |  3 +++
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index c44d05a13f..5b2fdfbd3a 100644
--- a/meson.build
+++ b/meson.build
@@ -1962,6 +1962,7 @@ config_host_data.set('CONFIG_GPROF', get_option('gprof'))
 config_host_data.set('CONFIG_LIVE_BLOCK_MIGRATION', get_option('live_block_migration').allowed())
 config_host_data.set('CONFIG_QOM_CAST_DEBUG', get_option('qom_cast_debug'))
 config_host_data.set('CONFIG_REPLICATION', get_option('replication').allowed())
+config_host_data.set('CONFIG_COLO_FILTERS', get_option('colo_filters').allowed())
 
 # has_header
 config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
diff --git a/meson_options.txt b/meson_options.txt
index fc9447d267..ffe81317cb 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -289,6 +289,8 @@ option('live_block_migration', type: 'feature', value: 'auto',
        description: 'block migration in the main migration stream')
 option('replication', type: 'feature', value: 'auto',
        description: 'replication support')
+option('colo_filters', type: 'feature', value: 'auto',
+       description: 'colo_filters support')
 option('bochs', type: 'feature', value: 'auto',
        description: 'bochs image format support')
 option('cloop', type: 'feature', value: 'auto',
diff --git a/net/meson.build b/net/meson.build
index 38d50b8c96..7e54744aea 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -1,12 +1,9 @@
 softmmu_ss.add(files(
   'announce.c',
   'checksum.c',
-  'colo.c',
   'dump.c',
   'eth.c',
   'filter-buffer.c',
-  'filter-mirror.c',
-  'filter-rewriter.c',
   'filter.c',
   'hub.c',
   'net-hmp-cmds.c',
@@ -22,6 +19,14 @@ if get_option('replication').allowed()
   softmmu_ss.add(files('colo-compare.c'))
 endif
 
+if get_option('replication').allowed() or get_option('colo_filters').allowed()
+  softmmu_ss.add(files('colo.c'))
+endif
+
+if get_option('colo_filters').allowed()
+  softmmu_ss.add(files('filter-mirror.c', 'filter-rewriter.c'))
+endif
+
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
 
 if have_l2tpv3
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 009fab1515..cf9d23369f 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -83,6 +83,7 @@ meson_options_help() {
   printf "%s\n" '  capstone        Whether and how to find the capstone library'
   printf "%s\n" '  cloop           cloop image format support'
   printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
+  printf "%s\n" '  colo-filters    colo_filters support'
   printf "%s\n" '  coreaudio       CoreAudio sound support'
   printf "%s\n" '  crypto-afalg    Linux AF_ALG crypto backend driver'
   printf "%s\n" '  curl            CURL block device driver'
@@ -236,6 +237,8 @@ _meson_option_parse() {
     --disable-cloop) printf "%s" -Dcloop=disabled ;;
     --enable-cocoa) printf "%s" -Dcocoa=enabled ;;
     --disable-cocoa) printf "%s" -Dcocoa=disabled ;;
+    --enable-colo-filters) printf "%s" -Dcolo_filters=enabled ;;
+    --disable-colo-filters) printf "%s" -Dcolo_filters=disabled ;;
     --enable-coreaudio) printf "%s" -Dcoreaudio=enabled ;;
     --disable-coreaudio) printf "%s" -Dcoreaudio=disabled ;;
     --enable-coroutine-pool) printf "%s" -Dcoroutine_pool=true ;;
-- 
2.34.1


