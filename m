Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C714995C52
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 12:33:19 +0200 (CEST)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i01S2-0007nh-U3
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 06:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhenyuw@linux.intel.com>) id 1i01Qh-0006lz-78
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 06:31:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhenyuw@linux.intel.com>) id 1i01Qg-0002B4-3R
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 06:31:54 -0400
Received: from mga14.intel.com ([192.55.52.115]:36847)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhenyuw@linux.intel.com>)
 id 1i01Qf-0001NX-QO
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 06:31:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 03:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="202635579"
Received: from ubuntu-nuc.bj.intel.com ([10.238.154.61])
 by fmsmga004.fm.intel.com with ESMTP; 20 Aug 2019 03:30:46 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 18:30:30 +0800
Message-Id: <20190820103030.12515-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-devel] [PATCH] i386/kvm: fix FEATURE_HYPERV_EDX value in
 hyperv_passthrough case
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix typo to use correct edx value for FEATURE_HYPERV_EDX when
hyperv_passthrough is enabled.

Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 target/i386/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 2abc881324..101229bce4 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1152,7 +1152,7 @@ static int hyperv_handle_properties(CPUState *cs,
         if (c) {
             env->features[FEAT_HYPERV_EAX] = c->eax;
             env->features[FEAT_HYPERV_EBX] = c->ebx;
-            env->features[FEAT_HYPERV_EDX] = c->eax;
+            env->features[FEAT_HYPERV_EDX] = c->edx;
         }
         c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
         if (c) {
-- 
2.20.1


