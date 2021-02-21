Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6CE320A81
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 14:19:40 +0100 (CET)
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDoeA-0003ce-Gi
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 08:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1lDoae-0002Dq-Mv
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 08:16:05 -0500
Received: from m12-17.163.com ([220.181.12.17]:40420)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1lDoaV-0002IL-9C
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 08:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=y9y7q
 ceyOLFNRGKx/9DKLOUHL1sYnPZYeZK/llcHXcU=; b=X+gxdXjE71Gh6+rYVkS8r
 kcP7/yGldzZse3aZwIYfrDLV29pzQDke5EHs4vUTbrlImkI/2kCOYWrnYAhPIs0l
 FNmBYaas7SANOuMgi7qZVwh1X9zEsf0sunzKtajaBeGg50jcOtXDqOsm8nAIDpBA
 n9ls0TNfFhf3Rwb42n1t60=
Received: from ubuntu.localdomain (unknown [183.157.98.27])
 by smtp13 (Coremail) with SMTP id EcCowAB3tIgVWTJgKkCwmA--.18015S4;
 Sun, 21 Feb 2021 20:59:02 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: pbonzini@redhat.com,
	f4bug@amsat.org,
	thuth@redhat.com,
	alxndr@bu.edu
Subject: [PATCH] configure: force enable-sanitizers together with
 enable-fuzzing
Date: Sun, 21 Feb 2021 04:59:00 -0800
Message-Id: <20210221125900.425495-1-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowAB3tIgVWTJgKkCwmA--.18015S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw4UJr45ArW7AF1rKFy5twb_yoW5ZF4xp3
 Z2gry7Kr1rJFZ5tFZ7Gw1xuFWkXFZ5AayakFZxGF4UWFsxCw4j9rnrWwn09F4UX340qFyS
 kFyDWw43Xry5taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UEhFsUUUUU=
X-Originating-IP: [183.157.98.27]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbCCg9AbV2MZ95CKAAAsq
Received-SPF: pass client-ip=220.181.12.17; envelope-from=liq3ea@163.com;
 helo=m12-17.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we execute configure with --enable-fuzzing but without
--enable-sanitizers, we will have a lot of 'undefined reference'
build error such as following:

clang-10  -o subprojects/libvhost-user/link-test subprojects/libvhost-user/link-test.p/link-test.c.o -Wl,--as-needed -Wl,--no-undefined -pie -Wl,--whole-archive -Wl,--start-group subprojects/libvhost-user/libvhost-user.a -Wl,--end-group -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m64 -fstack-protector-strong -pthread
/usr/bin/ld: subprojects/libvhost-user/link-test.p/link-test.c.o: in function `main':
/home/test/qemu/build/../subprojects/libvhost-user/link-test.c:34: undefined reference to `__sancov_lowest_stack'
/usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/link-test.c:(.text.main[main]+0x55): undefined reference to `__sancov_lowest_stack'
/usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/link-test.c:41: undefined reference to `__sanitizer_cov_trace_const_cmp4'
/usr/bin/ld: subprojects/libvhost-user/link-test.p/link-test.c.o: in function `sancov.module_ctor_8bit_counters':
link-test.c:(.text.sancov.module_ctor_8bit_counters[sancov.module_ctor_8bit_counters]+0x16): undefined reference to `__sanitizer_cov_8bit_counters_init'
/usr/bin/ld: link-test.c:(.text.sancov.module_ctor_8bit_counters[sancov.module_ctor_8bit_counters]+0x2f): undefined reference to `__sanitizer_cov_pcs_init'
/usr/bin/ld: subprojects/libvhost-user/libvhost-user.a(libvhost-user.c.o): in function `vu_gpa_to_va':
/home/test/qemu/build/../subprojects/libvhost-user/libvhost-user.c:182: undefined reference to `__sanitizer_cov_trace_const_cmp8'
/usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/libvhost-user.c:187: undefined reference to `__sanitizer_cov_trace_cmp4'
/usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/libvhost-user.c:190: undefined reference to `__sanitizer_cov_trace_cmp8'
/usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/libvhost-user.c:190: undefined reference to `__sanitizer_cov_trace_cmp8'
/usr/bin/ld: /home/test/qemu/build/../subprojects/libvhost-user/libvhost-user.c:191: undefined reference to `__sanitizer_cov_trace_cmp8'

Let's avoid this error by enforcing fuzzing and sanitizers together.

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index a34f91171d..9f00a1d887 100755
--- a/configure
+++ b/configure
@@ -6083,6 +6083,9 @@ if test "$have_mlockall" = "yes" ; then
   echo "HAVE_MLOCKALL=y" >> $config_host_mak
 fi
 if test "$fuzzing" = "yes" ; then
+  if test "$sanitizers" = "no"; then
+    error_exit "enable-fuzzing also needs enable-sanitizers"
+  fi
   # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
   # needed CFLAGS have already been provided
   if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
-- 
2.25.1



