Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410736FDDB2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:24:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwiq6-0003WJ-BP; Wed, 10 May 2023 08:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipk-0002fB-56
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:22:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipe-0007oh-WF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:22:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhV8PxGfIM2CiMvz/jmOrzBWe7WQGQrw+jf2GRjCHGA=;
 b=iteIX0qSecRkocoleRYrK3gk27kuGeMNB8vI/Xg5sVPb8B5Yc+nmYlv6WE8HeYMIqdduf8
 tkCwO+7QJgxDuc/sXgkGjLEaUXYD9UL2G99geoPhVmoM3l1pSUqXtFgr2magtsXYKDlKU3
 cHPMCnN2GK1z6b/afXY4JGHjBuuMwwM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-UjWJF8LQNE2icX92kcQZtw-1; Wed, 10 May 2023 08:22:05 -0400
X-MC-Unique: UjWJF8LQNE2icX92kcQZtw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B45B886463;
 Wed, 10 May 2023 12:22:04 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C85DF18EC1;
 Wed, 10 May 2023 12:22:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 28/28] block: compile out assert_bdrv_graph_readable() by
 default
Date: Wed, 10 May 2023 14:21:11 +0200
Message-Id: <20230510122111.46566-29-kwolf@redhat.com>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Stefan Hajnoczi <stefanha@redhat.com>

reader_count() is a performance bottleneck because the global
aio_context_list_lock mutex causes thread contention. Put this debugging
assertion behind a new ./configure --enable-debug-graph-lock option and
disable it by default.

The --enable-debug-graph-lock option is also enabled by the more general
--enable-debug option.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230501173443.153062-1-stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 meson_options.txt             | 2 ++
 configure                     | 1 +
 block/graph-lock.c            | 3 +++
 meson.build                   | 2 ++
 scripts/meson-buildoptions.sh | 4 ++++
 5 files changed, 12 insertions(+)

diff --git a/meson_options.txt b/meson_options.txt
index 66ca350029..d8330a1f71 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -319,6 +319,8 @@ option('rng_none', type: 'boolean', value: false,
        description: 'dummy RNG, avoid using /dev/(u)random and getrandom()')
 option('coroutine_pool', type: 'boolean', value: true,
        description: 'coroutine freelist (better performance)')
+option('debug_graph_lock', type: 'boolean', value: false,
+       description: 'graph lock debugging support')
 option('debug_mutex', type: 'boolean', value: false,
        description: 'mutex debugging support')
 option('debug_stack_usage', type: 'boolean', value: false,
diff --git a/configure b/configure
index 77c03315f8..243e2e0a0d 100755
--- a/configure
+++ b/configure
@@ -816,6 +816,7 @@ for opt do
   --enable-debug)
       # Enable debugging options that aren't excessively noisy
       debug_tcg="yes"
+      meson_option_parse --enable-debug-graph-lock ""
       meson_option_parse --enable-debug-mutex ""
       meson_option_add -Doptimization=0
       fortify_source="no"
diff --git a/block/graph-lock.c b/block/graph-lock.c
index 639526608f..377884c3a9 100644
--- a/block/graph-lock.c
+++ b/block/graph-lock.c
@@ -265,7 +265,10 @@ void bdrv_graph_rdunlock_main_loop(void)
 
 void assert_bdrv_graph_readable(void)
 {
+    /* reader_count() is slow due to aio_context_list_lock lock contention */
+#ifdef CONFIG_DEBUG_GRAPH_LOCK
     assert(qemu_in_main_thread() || reader_count());
+#endif
 }
 
 void assert_bdrv_graph_writable(void)
diff --git a/meson.build b/meson.build
index c56e0fec9e..646555420f 100644
--- a/meson.build
+++ b/meson.build
@@ -1963,6 +1963,7 @@ if get_option('debug_stack_usage') and have_coroutine_pool
   have_coroutine_pool = false
 endif
 config_host_data.set10('CONFIG_COROUTINE_POOL', have_coroutine_pool)
+config_host_data.set('CONFIG_DEBUG_GRAPH_LOCK', get_option('debug_graph_lock'))
 config_host_data.set('CONFIG_DEBUG_MUTEX', get_option('debug_mutex'))
 config_host_data.set('CONFIG_DEBUG_STACK_USAGE', get_option('debug_stack_usage'))
 config_host_data.set('CONFIG_GPROF', get_option('gprof'))
@@ -3841,6 +3842,7 @@ summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'membarrier':        have_membarrier}
+summary_info += {'debug graph lock':  get_option('debug_graph_lock')}
 summary_info += {'debug stack usage': get_option('debug_stack_usage')}
 summary_info += {'mutex debugging':   get_option('debug_mutex')}
 summary_info += {'memory allocator':  get_option('malloc')}
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 34d82dec53..2805d1c145 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -23,6 +23,8 @@ meson_options_help() {
   printf "%s\n" '                           QEMU'
   printf "%s\n" '  --enable-cfi             Control-Flow Integrity (CFI)'
   printf "%s\n" '  --enable-cfi-debug       Verbose errors in case of CFI violation'
+  printf "%s\n" '  --enable-debug-graph-lock'
+  printf "%s\n" '                           graph lock debugging support'
   printf "%s\n" '  --enable-debug-mutex     mutex debugging support'
   printf "%s\n" '  --enable-debug-stack-usage'
   printf "%s\n" '                           measure coroutine stack usage'
@@ -254,6 +256,8 @@ _meson_option_parse() {
     --datadir=*) quote_sh "-Ddatadir=$2" ;;
     --enable-dbus-display) printf "%s" -Ddbus_display=enabled ;;
     --disable-dbus-display) printf "%s" -Ddbus_display=disabled ;;
+    --enable-debug-graph-lock) printf "%s" -Ddebug_graph_lock=true ;;
+    --disable-debug-graph-lock) printf "%s" -Ddebug_graph_lock=false ;;
     --enable-debug-mutex) printf "%s" -Ddebug_mutex=true ;;
     --disable-debug-mutex) printf "%s" -Ddebug_mutex=false ;;
     --enable-debug-stack-usage) printf "%s" -Ddebug_stack_usage=true ;;
-- 
2.40.1


