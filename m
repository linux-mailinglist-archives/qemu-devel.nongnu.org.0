Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F9F428C13
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 13:29:16 +0200 (CEST)
Received: from localhost ([::1]:60404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZtUZ-0003nh-N8
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 07:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNL-0001Ya-Sy
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:47 -0400
Received: from mga04.intel.com ([192.55.52.120]:28238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNK-00080y-56
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="225624876"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="225624876"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 04:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="490432244"
Received: from icx-2s.bj.intel.com ([10.240.193.41])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2021 04:21:37 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] doc: Add the SGX numa description
Date: Mon, 11 Oct 2021 19:15:54 +0800
Message-Id: <20211011111554.12403-7-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20211011111554.12403-1-yang.zhong@intel.com>
References: <20211011111554.12403-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yang.zhong@intel.com;
 helo=mga04.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the SGX numa reference command and how to check if
SGX numa is support or not with multiple EPC sections.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 docs/system/i386/sgx.rst | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/docs/system/i386/sgx.rst b/docs/system/i386/sgx.rst
index f103ae2a2f..9e4ada761f 100644
--- a/docs/system/i386/sgx.rst
+++ b/docs/system/i386/sgx.rst
@@ -141,8 +141,7 @@ To launch a SGX guest:
   |qemu_system_x86| \\
    -cpu host,+sgx-provisionkey \\
    -object memory-backend-epc,id=mem1,size=64M,prealloc=on \\
-   -object memory-backend-epc,id=mem2,size=28M \\
-   -M sgx-epc.0.memdev=mem1,sgx-epc.1.memdev=mem2
+   -M sgx-epc.0.memdev=mem1,sgx-epc.0.node=0
 
 Utilizing SGX in the guest requires a kernel/OS with SGX support.
 The support can be determined in guest by::
@@ -152,8 +151,32 @@ The support can be determined in guest by::
 and SGX epc info by::
 
   $ dmesg | grep sgx
-  [    1.242142] sgx: EPC section 0x180000000-0x181bfffff
-  [    1.242319] sgx: EPC section 0x181c00000-0x1837fffff
+  [    0.182807] sgx: EPC section 0x140000000-0x143ffffff
+  [    0.183695] sgx: [Firmware Bug]: Unable to map EPC section to online node. Fallback to the NUMA node 0.
+
+To launch a SGX numa guest:
+
+.. parsed-literal::
+
+  |qemu_system_x86| \\
+   -cpu host,+sgx-provisionkey \\
+   -object memory-backend-ram,size=2G,host-nodes=0,policy=bind,id=node0 \\
+   -object memory-backend-epc,id=mem0,size=64M,prealloc=on,host-nodes=0,policy=bind \\
+   -numa node,nodeid=0,cpus=0-1,memdev=node0 \\
+   -object memory-backend-ram,size=2G,host-nodes=1,policy=bind,id=node1 \\
+   -object memory-backend-epc,id=mem1,size=28M,prealloc=on,host-nodes=1,policy=bind \\
+   -numa node,nodeid=1,cpus=2-3,memdev=node1 \\
+   -M sgx-epc.0.memdev=mem0,sgx-epc.0.node=0,sgx-epc.1.memdev=mem1,sgx-epc.1.node=1
+
+and SGX epc numa info by::
+
+  $ dmesg | grep sgx
+  [    0.369937] sgx: EPC section 0x180000000-0x183ffffff
+  [    0.370259] sgx: EPC section 0x184000000-0x185bfffff
+
+  $ dmesg | grep SRAT
+  [    0.009981] ACPI: SRAT: Node 0 PXM 0 [mem 0x180000000-0x183ffffff]
+  [    0.009982] ACPI: SRAT: Node 1 PXM 1 [mem 0x184000000-0x185bfffff]
 
 References
 ----------

