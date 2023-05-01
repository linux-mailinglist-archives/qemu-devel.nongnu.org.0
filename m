Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBEE6F3518
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 19:36:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptXQM-0003uP-Mg; Mon, 01 May 2023 13:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptXQK-0003sX-DQ
 for qemu-devel@nongnu.org; Mon, 01 May 2023 13:34:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptXQI-0004LO-9A
 for qemu-devel@nongnu.org; Mon, 01 May 2023 13:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682962489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3rMy34jvt18p5CNsognoLBEi4Yq3ShIlYyeJm687QDg=;
 b=SODsUVWWIX9+J/mWRfufMlLsEpB0zTPjBWnvzomlxQbkoBY13dmJ/3u3uIQxzpt2P95MWA
 1rT87ebMuTM3W7NdpNZ21FNox/d+aiOD+udta2CxhUHhDIR8bfUnQSZHMPv2PTPdyBQIzT
 xJ8fXWMnW5P0j0wFl0DpgYxFFk0CR+c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-IRrCZ1jVPImFEWB5b9SXog-1; Mon, 01 May 2023 13:34:46 -0400
X-MC-Unique: IRrCZ1jVPImFEWB5b9SXog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 995C810334A4;
 Mon,  1 May 2023 17:34:45 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3EFA51E3;
 Mon,  1 May 2023 17:34:44 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] block: compile out assert_bdrv_graph_readable() by default
Date: Mon,  1 May 2023 13:34:43 -0400
Message-Id: <20230501173443.153062-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

reader_count() is a performance bottleneck because the global
aio_context_list_lock mutex causes thread contention. Put this debugging
assertion behind a new ./configure --enable-debug-graph-lock option and
disable it by default.

The --enable-debug-graph-lock option is also enabled by the more general
--enable-debug option.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 meson_options.txt             | 2 ++
 configure                     | 1 +
 meson.build                   | 2 ++
 block/graph-lock.c            | 3 +++
 scripts/meson-buildoptions.sh | 4 ++++
 5 files changed, 12 insertions(+)

diff --git a/meson_options.txt b/meson_options.txt
index 2471dd02da..0b2dd2d30d 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -311,6 +311,8 @@ option('rng_none', type: 'boolean', value: false,
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
diff --git a/meson.build b/meson.build
index c44d05a13f..d964e741e7 100644
--- a/meson.build
+++ b/meson.build
@@ -1956,6 +1956,7 @@ if get_option('debug_stack_usage') and have_coroutine_pool
   have_coroutine_pool = false
 endif
 config_host_data.set10('CONFIG_COROUTINE_POOL', have_coroutine_pool)
+config_host_data.set('CONFIG_DEBUG_GRAPH_LOCK', get_option('debug_graph_lock'))
 config_host_data.set('CONFIG_DEBUG_MUTEX', get_option('debug_mutex'))
 config_host_data.set('CONFIG_DEBUG_STACK_USAGE', get_option('debug_stack_usage'))
 config_host_data.set('CONFIG_GPROF', get_option('gprof'))
@@ -3833,6 +3834,7 @@ summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'membarrier':        have_membarrier}
+summary_info += {'debug graph lock':  get_option('debug_graph_lock')}
 summary_info += {'debug stack usage': get_option('debug_stack_usage')}
 summary_info += {'mutex debugging':   get_option('debug_mutex')}
 summary_info += {'memory allocator':  get_option('malloc')}
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
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index d4369a3ad8..d760ceb1ad 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -22,6 +22,8 @@ meson_options_help() {
   printf "%s\n" '                           QEMU'
   printf "%s\n" '  --enable-cfi             Control-Flow Integrity (CFI)'
   printf "%s\n" '  --enable-cfi-debug       Verbose errors in case of CFI violation'
+  printf "%s\n" '  --enable-debug-graph-lock'
+  printf "%s\n" '                           graph lock debugging support'
   printf "%s\n" '  --enable-debug-mutex     mutex debugging support'
   printf "%s\n" '  --enable-debug-stack-usage'
   printf "%s\n" '                           measure coroutine stack usage'
@@ -249,6 +251,8 @@ _meson_option_parse() {
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


