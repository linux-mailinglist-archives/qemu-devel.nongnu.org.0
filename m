Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90D7428BE7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 13:24:54 +0200 (CEST)
Received: from localhost ([::1]:48442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZtQK-000497-SF
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 07:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNE-0001TH-Ln
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:28240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNB-0008Kp-1g
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="225624851"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="225624851"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 04:21:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="490432152"
Received: from icx-2s.bj.intel.com ([10.240.193.41])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2021 04:21:30 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] monitor: Support 'info numa' command
Date: Mon, 11 Oct 2021 19:15:50 +0800
Message-Id: <20211011111554.12403-3-yang.zhong@intel.com>
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

