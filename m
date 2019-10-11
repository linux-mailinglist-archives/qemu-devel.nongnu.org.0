Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC1D3A18
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 09:35:39 +0200 (CEST)
Received: from localhost ([::1]:46584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIpSb-0003Kk-Vu
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 03:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiaoyao.li@intel.com>) id 1iIpQq-0002KR-Is
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:33:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xiaoyao.li@intel.com>) id 1iIpQo-00085N-Le
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:33:47 -0400
Received: from mga04.intel.com ([192.55.52.120]:5470)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xiaoyao.li@intel.com>)
 id 1iIpQo-00080g-EC
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 03:33:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 00:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; d="scan'208";a="184683958"
Received: from lxy-clx-4s.sh.intel.com ([10.239.43.57])
 by orsmga007.jf.intel.com with ESMTP; 11 Oct 2019 00:33:38 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH] target/i386: Remove MPX support on Snowridge CPU model
Date: Fri, 11 Oct 2019 15:18:44 +0800
Message-Id: <20191011071844.108924-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.120
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MPX support is being phased out by Intel. Following other CPU models
like Skylake, Icelake and Cascadelake, do not enable it by default.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
I'm not sure is there anyone already use Snowridge CPU model and whether to
add it in pc_compat_4_1, since Snowridge has not been released yet.

---
 hw/i386/pc.c      | 4 +++-
 target/i386/cpu.c | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index bcda50efcc23..97eb7ac32588 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -105,7 +105,9 @@ struct hpet_fw_config hpet_cfg = {.count = UINT8_MAX};
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
-GlobalProperty pc_compat_4_1[] = {};
+GlobalProperty pc_compat_4_1[] = {
+    { "Snowridge" "-" TYPE_X86_CPU, "mpx", "on" },
+};
 const size_t pc_compat_4_1_len = G_N_ELEMENTS(pc_compat_4_1);
 
 GlobalProperty pc_compat_4_0[] = {};
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 44f1bbdcac76..885bea76205d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2762,7 +2762,6 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_7_0_EBX_FSGSBASE |
             CPUID_7_0_EBX_SMEP |
             CPUID_7_0_EBX_ERMS |
-            CPUID_7_0_EBX_MPX |  /* missing bits 13, 15 */
             CPUID_7_0_EBX_RDSEED |
             CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLFLUSHOPT |
             CPUID_7_0_EBX_CLWB |
-- 
2.19.1


