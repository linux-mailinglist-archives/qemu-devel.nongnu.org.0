Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E631437593
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:34:22 +0200 (CEST)
Received: from localhost ([::1]:40440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrsT-0003cK-4w
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mdrqH-000157-Si
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:32:05 -0400
Received: from mga06.intel.com ([134.134.136.31]:5677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mdrqF-0000Dj-AD
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:32:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="290113945"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="290113945"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 03:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="595506378"
Received: from icx.bj.intel.com ([10.240.192.117])
 by orsmga004.jf.intel.com with ESMTP; 22 Oct 2021 03:31:59 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] monitor: Support 'info numa' command
Date: Fri, 22 Oct 2021 15:27:51 -0400
Message-Id: <20211022192754.58196-3-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211022192754.58196-1-yang.zhong@intel.com>
References: <20211022192754.58196-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, jarkko@kernel.org,
 eblake@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the MEMORY_DEVICE_INFO_KIND_SGX_EPC case for SGX numa info
with 'info numa' command in the monitor.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/core/numa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 510d096a88..1aa05dcf42 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -756,6 +756,7 @@ static void numa_stat_memory_devices(NumaNodeMem node_mem[])
     PCDIMMDeviceInfo     *pcdimm_info;
     VirtioPMEMDeviceInfo *vpi;
     VirtioMEMDeviceInfo *vmi;
+    SgxEPCDeviceInfo *se;
 
     for (info = info_list; info; info = info->next) {
         MemoryDeviceInfo *value = info->value;
@@ -781,6 +782,11 @@ static void numa_stat_memory_devices(NumaNodeMem node_mem[])
                 node_mem[vmi->node].node_mem += vmi->size;
                 node_mem[vmi->node].node_plugged_mem += vmi->size;
                 break;
+            case MEMORY_DEVICE_INFO_KIND_SGX_EPC:
+                se = value->u.sgx_epc.data;
+                node_mem[se->node].node_mem += se->size;
+                node_mem[se->node].node_plugged_mem = 0;
+                break;
             default:
                 g_assert_not_reached();
             }

