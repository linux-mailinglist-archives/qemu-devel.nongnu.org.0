Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF3731C577
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:23:25 +0100 (CET)
Received: from localhost ([::1]:49680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBq1M-0006Va-C1
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptH-00064k-HG
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:03 -0500
Received: from mga17.intel.com ([192.55.52.151]:25639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptF-0001Zp-Ng
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:03 -0500
IronPort-SDR: uD+2snnvicz/6NY9AzisANtIIdcNuTS7rDoGMfXqKjdoGQ/HO1toR3ez3H3mepQOOVRIkMgU4H
 Qb5h3m5jvUNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558760"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558760"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:51 -0800
IronPort-SDR: IMUUA3bKKiJ20NH1cCwy4eaJvgH448mUZ64kz7iauktw/bpJCLxiti5q80tCZBoM3DZVVp7iKB
 9PWCJJoT1mrg==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705407"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:51 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 09/23] target/i386: kvm: don't synchronize guest tsc for
 TD guest
Date: Mon, 15 Feb 2021 18:13:05 -0800
Message-Id: <eb49151c4b11fc934e1e845bedf5a6ebe1daf03b.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make kvm_synchronize_all_tsc() nop for TD-guest.

TDX module specification, 9.11.1 TSC Virtualization
"Virtual TSC values are consistent among all the TD;s VCPUs at the
level suppored by the CPU".
There is no need for qemu to synchronize tsc and VMM can't access
to guest TSC. Actually do_kvm_synchronize_tsc() hits assert due to
failure to write to guest tsc.

> qemu/target/i386/kvm.c:235: kvm_get_tsc: Assertion `ret == 1' failed.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 target/i386/kvm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index fb94cdd370..beb768a7d3 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -247,7 +247,7 @@ void kvm_synchronize_all_tsc(void)
 {
     CPUState *cpu;
 
-    if (kvm_enabled()) {
+    if (kvm_enabled() && vm_type != KVM_X86_TDX_VM) {
         CPU_FOREACH(cpu) {
             run_on_cpu(cpu, do_kvm_synchronize_tsc, RUN_ON_CPU_NULL);
         }
-- 
2.17.1


