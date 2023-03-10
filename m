Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C23C6B4C0B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 17:06:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pafEC-0002x8-KO; Fri, 10 Mar 2023 11:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafE4-0002rc-LQ
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:04:13 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafE1-0006eB-OO
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:04:12 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pafDp-00H4ad-2e; Fri, 10 Mar 2023 16:03:57 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org
Subject: [PATCH 29/45] target/riscv: Add zvknh cpu properties
Date: Fri, 10 Mar 2023 16:03:30 +0000
Message-Id: <20230310160346.1193597-30-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
References: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
---
 target/riscv/cpu.c | 11 ++++++++++-
 target/riscv/cpu.h |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cd87eec919..3ffbdd53cc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -111,6 +111,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zvfhmin, true, PRIV_VERSION_1_12_0, ext_zvfhmin),
     ISA_EXT_DATA_ENTRY(zvkb, true, PRIV_VERSION_1_12_0, ext_zvkb),
     ISA_EXT_DATA_ENTRY(zvkned, true, PRIV_VERSION_1_12_0, ext_zvkned),
+    ISA_EXT_DATA_ENTRY(zvknha, true, PRIV_VERSION_1_12_0, ext_zvknha),
+    ISA_EXT_DATA_ENTRY(zvknhb, true, PRIV_VERSION_1_12_0, ext_zvknhb),
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
@@ -1217,7 +1219,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     * In principle zve*x would also suffice here, were they supported
     * in qemu
     */
-    if ((cpu->cfg.ext_zvkb || cpu->cfg.ext_zvkned) &&
+    if ((cpu->cfg.ext_zvkb || cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha) &&
         !(cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f ||
             cpu->cfg.ext_zve64d || cpu->cfg.ext_v)) {
         error_setg(
@@ -1225,6 +1227,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvknhb &&
+        !(cpu->cfg.ext_zve64f || cpu->cfg.ext_zve64d || cpu->cfg.ext_v)) {
+            error_setg(errp,
+                       "Zvknhb extension requires V or Zve64{f,d} extensions");
+            return;
+    }
+
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.pmu_num) {
         if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4f3b97e0f1..5d101fc405 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -472,6 +472,8 @@ struct RISCVCPUConfig {
     bool ext_zve64d;
     bool ext_zvkb;
     bool ext_zvkned;
+    bool ext_zvknha;
+    bool ext_zvknhb;
     bool ext_zmmul;
     bool ext_zvfh;
     bool ext_zvfhmin;
-- 
2.39.2


