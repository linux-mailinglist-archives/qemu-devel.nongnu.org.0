Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD315146AB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 12:22:18 +0200 (CEST)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkNlR-00053x-8U
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 06:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nkNXk-00086J-4r
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:08:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46180 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nkNXh-000318-3Y
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:08:07 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9vhuGtiZicDAA--.14518S19; 
 Fri, 29 Apr 2022 18:07:50 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/43] target/loongarch: Add target build suport
Date: Fri, 29 Apr 2022 18:07:03 +0800
Message-Id: <20220429100729.1572481-18-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9vhuGtiZicDAA--.14518S19
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw43AF43Xw1kWFWUGw18Grg_yoW8Xr4fpr
 W7C34FgF48XF9rJ3s3Ga4FqFZ3Gw18Cr17Xa9xKr4fCrsxt3y8Zr95KrWDWF42q3W0kFyf
 uFn3C345WF4UJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/loongarch/meson.build | 19 +++++++++++++++++++
 target/meson.build           |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 target/loongarch/meson.build

diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
new file mode 100644
index 0000000000..bcb076e55f
--- /dev/null
+++ b/target/loongarch/meson.build
@@ -0,0 +1,19 @@
+gen = decodetree.process('insns.decode')
+
+loongarch_ss = ss.source_set()
+loongarch_ss.add(files(
+  'cpu.c',
+  'disas.c',
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
index 2f6940255e..a53a60486f 100644
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
2.31.1


