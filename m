Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAE14E573C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:16:36 +0100 (CET)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4b5-0006SN-2G
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:16:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nX4Ye-0004xP-29
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:14:04 -0400
Received: from mta01.hs-regensburg.de ([194.95.104.11]:56548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nX4Yb-0001sf-IA
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:14:03 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4KNw1f2yKszy8x;
 Wed, 23 Mar 2022 18:13:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta01-20211122; t=1648055638;
 bh=U3w4YF0J3dvc5FiRY3oR2/+oKUHSaqB0waogch7JaBU=;
 h=From:To:CC:Subject:Date:From;
 b=iT/EjSILm7+kT5E802lBANb7F3uhIik22CfaZaQHvbvd0cRD9+o5AWr8oN13z0puh
 6ugx/g5FMKFFF8OaAGlcd9T6ZApxme5KvALiMKOtChUDOPHm4/Ji6MaxV7xGkN5/w8
 4qakbX52KvlQvl/nE5QI7ADEWZlJDw4p7XdnMBtNftbB9aBQbWI3W7GL6LdSZkQ4Tv
 zjMB8gKf+uDT9+SY1Cv1Kz7LvWrZkylZ7m9Utmq5aModbUieaCEy9IqlfS12SU7tyj
 sYy2iUYrwsQKFoWFeYiPDs8GsBYsXPw6sL/DYKXbzu8tObeQFmvlU5eJ4AAhSflUok
 vWhsQe1bXu6rA==
Received: from atlantis.hs-regensburg.de (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 23 Mar 2022 18:13:58 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] hw/riscv: virt: Warn the user if -bios is provided when using
 KVM
Date: Wed, 23 Mar 2022 18:13:46 +0100
Message-ID: <20220323171346.792572-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
Received-SPF: pass client-ip=194.95.104.11;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta01.hs-regensburg.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: apatel@ventanamicro.com, Peter Maydell <peter.maydell@linaro.org>,
 anup@brainfault.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, stefan.huber@oth-regensburg.de,
 alistair23@gmail.com, jiangyifei@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -bios option is silently ignored if used in combination with -enable-kvm.
The reason is that the machine starts in S-Mode, and the bios typically runs in
M-Mode.

Warn the user that the bios won't be loaded.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hw/riscv/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4496a15346..a4d13114ee 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1312,6 +1312,9 @@ static void virt_machine_init(MachineState *machine)
      * when KVM is enabled.
      */
     if (kvm_enabled()) {
+        if (machine->firmware && strcmp(machine->firmware, "none"))
+            warn_report("BIOS is not supported in combination with KVM. "
+                        "Ignoring BIOS.");
         g_free(machine->firmware);
         machine->firmware = g_strdup("none");
     }
-- 
2.32.0


