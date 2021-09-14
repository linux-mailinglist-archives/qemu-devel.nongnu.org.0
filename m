Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821EA40AEBE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:17:31 +0200 (CEST)
Received: from localhost ([::1]:34904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8JW-0001sA-HJ
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mQ84A-0006Es-TL
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57972 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mQ848-000867-7U
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:38 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxheXvnEBhNJ0GAA--.21668S21; 
 Tue, 14 Sep 2021 21:01:22 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/21] target/loongarch: Add target build suport
Date: Tue, 14 Sep 2021 21:00:29 +0800
Message-Id: <1631624431-30658-20-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxheXvnEBhNJ0GAA--.21668S21
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4xXr4fZw1rury5trWkJFb_yoW8ZFyDpr
 47Aw15KFW8ZF93J3s3Ja4FqFZ5Jw1DGw47XanxKrWfCrZxJayUXwn5KFZ8GF17X3W0kFyS
 gFn3C34rGF4UJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add build loongarch-linux-user target support.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                  |  2 +-
 target/loongarch/meson.build | 18 ++++++++++++++++++
 target/meson.build           |  1 +
 3 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 target/loongarch/meson.build

diff --git a/meson.build b/meson.build
index 45bd486..5c80fed 100644
--- a/meson.build
+++ b/meson.build
@@ -57,7 +57,7 @@ python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
 supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
-  'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+  'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64', 'loongarch64']
 
 cpu = host_machine.cpu_family()
 targetos = host_machine.system()
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
new file mode 100644
index 0000000..31f9e9f
--- /dev/null
+++ b/target/loongarch/meson.build
@@ -0,0 +1,18 @@
+gen = decodetree.process('insns.decode')
+
+loongarch_ss = ss.source_set()
+loongarch_ss.add(files(
+  'cpu.c',
+))
+loongarch_tcg_ss = ss.source_set()
+loongarch_tcg_ss.add(gen)
+loongarch_tcg_ss.add(files(
+  'fpu_helper.c',
+  'op_helper.c',
+  'translate.c',
+))
+loongarch_tcg_ss.add(zlib)
+
+loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
+
+target_arch += {'loongarch': loongarch_ss}
diff --git a/target/meson.build b/target/meson.build
index 2f69402..a53a604 100644
--- a/target/meson.build
+++ b/target/meson.build
@@ -5,6 +5,7 @@ subdir('cris')
 subdir('hexagon')
 subdir('hppa')
 subdir('i386')
+subdir('loongarch')
 subdir('m68k')
 subdir('microblaze')
 subdir('mips')
-- 
1.8.3.1


