Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5344716A767
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 14:41:35 +0100 (CET)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6DzK-0003HA-CW
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 08:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42268)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luwei.kang@intel.com>) id 1j6Dxv-0001pb-R8
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 08:40:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luwei.kang@intel.com>) id 1j6Dxs-0004IZ-2Q
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 08:40:07 -0500
Received: from mga04.intel.com ([192.55.52.120]:21084)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <luwei.kang@intel.com>)
 id 1j6Dxr-0004HT-QP
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 08:40:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 05:39:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; d="scan'208";a="284354727"
Received: from snr.bj.intel.com ([10.240.193.90])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2020 05:39:55 -0800
From: Luwei Kang <luwei.kang@intel.com>
To: pbonzini@redhat.com,
	rth@twiddle.net,
	ehabkost@redhat.com
Subject: [PATCH v1 1/3] i386: Remove the limitation of IP payloads for Intel PT
Date: Tue, 25 Feb 2020 05:38:30 +0800
Message-Id: <1582580312-19864-2-git-send-email-luwei.kang@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582580312-19864-1-git-send-email-luwei.kang@intel.com>
References: <1582580312-19864-1-git-send-email-luwei.kang@intel.com>
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
Cc: Luwei Kang <luwei.kang@intel.com>, qemu-devel@nongnu.org,
 beeman.strong@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Intel PT packets which contain IP payloads will have LIP values, and it
will include the CS base component if the CPUID.(EAX=14H,ECX=0H).ECX.[bit31]
is set. But it will disabled the Intel PT in kvm guest because of the need
of live migration safe(c078ca9 i386: Disable Intel PT if packets IP payloads
have LIP values).

This patch will revert the previous limitation because the Intel new hardware
will set this bit and LIP == RIP for most/all real code.

Signed-off-by: Luwei Kang <luwei.kang@intel.com>
---
 target/i386/cpu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 69f518a..8c0d1e4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -688,8 +688,6 @@ static CPUCacheInfo legacy_l3_cache = {
  * bit[02]: Support Single-Range Output scheme;
  */
 #define INTEL_PT_MINIMAL_ECX     0x7
-/* generated packets which contain IP payloads have LIP values */
-#define INTEL_PT_IP_LIP          (1 << 31)
 #define INTEL_PT_ADDR_RANGES_NUM 0x2 /* Number of configurable address ranges */
 #define INTEL_PT_ADDR_RANGES_NUM_MASK 0x3
 #define INTEL_PT_MTC_BITMAP      (0x0249 << 16) /* Support ART(0,3,6,9) */
@@ -6281,8 +6279,7 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
            ((eax_1 & INTEL_PT_ADDR_RANGES_NUM_MASK) <
                                            INTEL_PT_ADDR_RANGES_NUM) ||
            ((ebx_1 & (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) !=
-                (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) ||
-           (ecx_0 & INTEL_PT_IP_LIP)) {
+                (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP))) {
             /*
              * Processor Trace capabilities aren't configurable, so if the
              * host can't emulate the capabilities we report on
-- 
1.8.3.1


