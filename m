Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF894C715A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:10:26 +0100 (CET)
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOibR-0000ub-P9
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:10:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schaub@mit.edu>)
 id 1nOiQl-0003Sx-E6; Mon, 28 Feb 2022 10:59:23 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:47872
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schaub@mit.edu>)
 id 1nOiQj-0002CD-GC; Mon, 28 Feb 2022 10:59:22 -0500
Received: from [10.31.51.144] (dhcp-10-31-51-144.dyn.mit.edu [10.31.51.144])
 (authenticated bits=0) (User authenticated as schaub@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21SFxI39023720
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Feb 2022 10:59:19 -0500
Message-ID: <a8bdb3e7-a877-070c-3ef5-6d14086a7f9b@mit.edu>
Date: Mon, 28 Feb 2022 10:59:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
To: qemu-devel@nongnu.org
Content-Language: en-US
From: Simeon Schaub <schaub@mit.edu>
Subject: [PATCH] allow disabling tests
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=18.9.28.11; envelope-from=schaub@mit.edu;
 helo=outgoing.mit.edu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From b6ec17a85a8fb2431545f9c5093dbce9a090b522 Mon Sep 17 00:00:00 2001
From: Simeon David Schaub <schaub@mit.edu>
Date: Mon, 28 Feb 2022 10:51:04 -0500
Subject: [PATCH] allow disabling tests

Adds an option to avoid running tests as part of the build process. I
ran `make update-buildoptions` to update the meson options, but this
seemed to also change the `qga-vss` option. I assume this isn't intended
to happen, any ideas what's going on there?

Signed-off-by: Simeon David Schaub <schaub@mit.edu>
---
 meson.build                   | 4 +++-
 meson_options.txt             | 3 +++
 scripts/meson-buildoptions.sh | 5 ++++-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 8df40bfac4..8b5935447a 100644
--- a/meson.build
+++ b/meson.build
@@ -3308,7 +3308,9 @@ subdir('scripts')
 subdir('tools')
 subdir('pc-bios')
 subdir('docs')
-subdir('tests')
+if get_option('tests')
+  subdir('tests')
+endif
 if gtk.found()
   subdir('po')
 endif
diff --git a/meson_options.txt b/meson_options.txt
index 52b11cead4..6527a5a368 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -270,3 +270,6 @@ option('profiler', type: 'boolean', value: false,
        description: 'profiler support')
 option('slirp_smbd', type : 'feature', value : 'auto',
        description: 'use smbd (at path --smbd=*) in slirp networking')
+
+option('tests', type : 'boolean', value : true,
+       description: 'run QEMU tests as part of the build process')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 9ee684ef03..9271324c6a 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -20,7 +20,6 @@ meson_options_help() {
   printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to
use [system] (choices:'
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
   printf "%s\n" '  --enable-profiler        profiler support'
-  printf "%s\n" '  --enable-qga-vss         build QGA VSS support'
   printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using
/dev/(u)random and'
   printf "%s\n" '                           getrandom()'
@@ -28,6 +27,7 @@ meson_options_help() {
   printf "%s\n" '                           (choices:
auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-strip           Strip targets on install'
   printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode
interpreter (slow)'
+  printf "%s\n" '  --disable-tests          run QEMU tests as part of
the build process'
   printf "%s\n" '  --enable-trace-backends=CHOICE'
   printf "%s\n" '                           Set available tracing
backends [log] (choices:'
   printf "%s\n" '
dtrace/ftrace/log/nop/simple/syslog/ust)'
@@ -97,6 +97,7 @@ meson_options_help() {
   printf "%s\n" '  parallels       parallels image format support'
   printf "%s\n" '  qcow1           qcow1 image format support'
   printf "%s\n" '  qed             qed image format support'
+  printf "%s\n" '  qga-vss         build QGA VSS support (broken with
MinGW)'
   printf "%s\n" '  rbd             Ceph block device driver'
   printf "%s\n" '  replication     replication support'
   printf "%s\n" '  sdl             SDL user interface'
@@ -322,6 +323,8 @@ _meson_option_parse() {
     --disable-tcg) printf "%s" -Dtcg=disabled ;;
     --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=true ;;
     --disable-tcg-interpreter) printf "%s" -Dtcg_interpreter=false ;;
+    --enable-tests) printf "%s" -Dtests=true ;;
+    --disable-tests) printf "%s" -Dtests=false ;;
     --enable-tools) printf "%s" -Dtools=enabled ;;
     --disable-tools) printf "%s" -Dtools=disabled ;;
     --enable-tpm) printf "%s" -Dtpm=enabled ;;
-- 
2.35.1

