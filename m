Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB620E968D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Oct 2019 07:43:37 +0100 (CET)
Received: from localhost ([::1]:37304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPhhg-0000of-8o
	for lists+qemu-devel@lfdr.de; Wed, 30 Oct 2019 02:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luwei.kang@intel.com>) id 1iPhgM-0000NW-Jw
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 02:42:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luwei.kang@intel.com>) id 1iPhgJ-0002BD-QO
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 02:42:12 -0400
Received: from mga14.intel.com ([192.55.52.115]:49181)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <luwei.kang@intel.com>)
 id 1iPhgJ-0001Vo-GP
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 02:42:11 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 23:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; d="scan'208";a="205704396"
Received: from icl-2s.bj.intel.com ([10.240.193.48])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2019 23:41:58 -0700
From: Luwei Kang <luwei.kang@intel.com>
To: pbonzini@redhat.com,
	rth@twiddle.net,
	ehabkost@redhat.com
Subject: [PATCH v1] target/i386: set the CPUID level to 0x14 on old
 machine-type
Date: Wed, 30 Oct 2019 13:27:13 +0800
Message-Id: <1572413233-27015-1-git-send-email-luwei.kang@intel.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
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
Cc: Luwei Kang <luwei.kang@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CPUID level need to be set to 0x14 manually on old
machine-type if Intel PT is enabled in guest. e.g. in Qemu 3.1
-machine pc-i440fx-3.1 -cpu qemu64,+intel-pt
will be CPUID[0].EAX(level)=7 and CPUID[7].EBX[25](intel-pt)=1.

Some Intel PT capabilities are exposed by leaf 0x14 and the
missing capabilities will cause some MSRs access failed.
This patch add a warning message to inform the user to extend
the CPUID level.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Luwei Kang <luwei.kang@intel.com>
---
 target/i386/cpu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 47200b4..9abbd30 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5393,8 +5393,12 @@ static void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
 
         /* Intel Processor Trace requires CPUID[0x14] */
         if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) &&
-             kvm_enabled() && cpu->intel_pt_auto_level) {
-            x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x14);
+             kvm_enabled()) {
+            if (cpu->intel_pt_auto_level)
+                x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x14);
+            else
+                warn_report("Intel PT need CPUID leaf 0x14, please set "
+                            "by \"-cpu ...,+intel-pt,level=0x14\"\n");
         }
 
         /* CPU topology with multi-dies support requires CPUID[0x1F] */
-- 
1.8.3.1


