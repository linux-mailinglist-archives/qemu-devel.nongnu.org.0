Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FC53AC72C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:14:19 +0200 (CEST)
Received: from localhost ([::1]:43840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAZu-0000yE-2O
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1luAWv-0006gU-Ro
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:11:13 -0400
Received: from zamok.crans.org ([2a0c:700:2:0:ec4:7aff:fe59:a1ad]:58778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1luAWs-0000Uz-AJ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:11:13 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 82B14E0175; Fri, 18 Jun 2021 11:11:07 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: "open list : All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/2] docs/devel: tvg-plugins: add execlog plugin description
Date: Fri, 18 Jun 2021 11:11:01 +0200
Message-Id: <20210618091101.2802534-3-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618091101.2802534-1-erdnaxe@crans.org>
References: <20210618091101.2802534-1-erdnaxe@crans.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a0c:700:2:0:ec4:7aff:fe59:a1ad;
 envelope-from=erdnaxe@crans.org; helo=zamok.crans.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds description of the execlog TCG plugin with an example.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
---
 docs/devel/tcg-plugins.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 18c6581d85..02818a3327 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -319,3 +319,25 @@ the user to see what hardware is accessed how often. It has a number of options:
       off:0000001c, 1, 2
       off:00000020, 1, 2
       ...
+
+- contrib/plugins/execlog.c
+
+The execlog tool traces executed instructions with memory access. It can be used
+for debugging and security analysis purposes.
+The plugin takes no argument::
+
+  qemu-system-arm $(QEMU_ARGS) \
+    -plugin ./contrib/plugins/libexeclog.so -d plugin
+
+which will output an execution trace following this structure::
+
+  # vCPU, vAddr, opcode, disassembly[, load/store, memory addr, device]...
+  0, 0xa12, 0xf8012400, "movs r4, #0"
+  0, 0xa14, 0xf87f42b4, "cmp r4, r6"
+  0, 0xa16, 0xd206, "bhs #0xa26"
+  0, 0xa18, 0xfff94803, "ldr r0, [pc, #0xc]", load, 0x00010a28, RAM
+  0, 0xa1a, 0xf989f000, "bl #0xd30"
+  0, 0xd30, 0xfff9b510, "push {r4, lr}", store, 0x20003ee0, RAM, store, 0x20003ee4, RAM
+  0, 0xd32, 0xf9893014, "adds r0, #0x14"
+  0, 0xd34, 0xf9c8f000, "bl #0x10c8"
+  0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
-- 
2.25.1


