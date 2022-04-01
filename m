Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA3B4EED0B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 14:22:33 +0200 (CEST)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naGIT-0003li-3D
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 08:22:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1naGF1-0001SA-EA
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 08:18:59 -0400
Received: from [2001:638:a01:1096::11] (port=47040 helo=mta01.hs-regensburg.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1naGEx-0004Bv-Rb
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 08:18:58 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4KVK2z73Wyzxv8;
 Fri,  1 Apr 2022 14:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta01-20211122; t=1648815532;
 bh=uj6sb8sE/VEzUILarEBcOtM/kB86r7UJgJxuzUPwl2Y=;
 h=From:To:CC:Subject:Date:From;
 b=huCwoM6WITj0jDrqoO5/kJfK7IgNQIywlQKIMOLlYj51JaYGKXI35vMubiFewsLfX
 VfoxXyHj0P6CbffpoXyIVkATF3eliOhcVDVn6YB//ELxkqKK9a98fRdBG9mhzLwzo7
 1XnjjS8XdhZi+bgUeHJ85BGiXJi2eXczK5Eqpw/wTamNlu/Llev++91YhFmPQbCAE/
 pCkM3sK4bIeP6mLaS4qzDOvOYDOnkEvJBS8/vuuY4ckr7/w40h58gpz6kn+gjOZlqt
 9A2u0oAJoB0oiARFAX64ieN7KPhXw2/cIw7M/CLP85a2yvDWUwnj3AaZzibtF2aEem
 lKEvAR8jX3+uA==
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Apr 2022 14:18:51 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <qemu-devel@nongnu.org>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Alistair Francis <alistair23@gmail.com>
Subject: [PATCH v3] hw/riscv: virt: Exit if the user provided -bios in
 combination with KVM
Date: Fri, 1 Apr 2022 14:18:42 +0200
Message-ID: <20220401121842.2791796-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:638:a01:1096::11
 (failed)
Received-SPF: pass client-ip=2001:638:a01:1096::11;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta01.hs-regensburg.de
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Anup Patel <anup@brainfault.org>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 Jiangyifei <jiangyifei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -bios option is silently ignored if used in combination with -enable-kvm.
The reason is that the machine starts in S-Mode, and the bios typically runs in
M-Mode.

Better exit in that case to not confuse the user.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hw/riscv/virt.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index da50cbed43..09609c96e8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1308,12 +1308,18 @@ static void virt_machine_init(MachineState *machine)
 
     /*
      * Only direct boot kernel is currently supported for KVM VM,
-     * so the "-bios" parameter is ignored and treated like "-bios none"
-     * when KVM is enabled.
+     * so the "-bios" parameter is not supported when KVM is enabled.
      */
     if (kvm_enabled()) {
-        g_free(machine->firmware);
-        machine->firmware = g_strdup("none");
+        if (machine->firmware) {
+            if (strcmp(machine->firmware, "none")) {
+                error_report("Machine mode firmware is not supported in "
+                             "combination with KVM.");
+                exit(1);
+            }
+        } else {
+            machine->firmware = g_strdup("none");
+        }
     }
 
     if (riscv_is_32bit(&s->soc[0])) {
-- 
2.32.0


