Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E872B428BEA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 13:25:03 +0200 (CEST)
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZtQV-0004SI-06
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 07:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNM-0001bU-Mc
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:48 -0400
Received: from mga04.intel.com ([192.55.52.120]:28240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNK-0008Kp-54
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="225624872"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="225624872"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 04:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="490432226"
Received: from icx-2s.bj.intel.com ([10.240.193.41])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2021 04:21:36 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] numa: Enable numa for libvirt interface
Date: Mon, 11 Oct 2021 19:15:53 +0800
Message-Id: <20211011111554.12403-6-yang.zhong@intel.com>
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

Libvirt need get the detailed host SGX EPC capabilities to support
numa function. Libvirt can decide how to allocate host EPC sections
to guest numa from host numa info.

(QEMU) query-sgx-capabilities
{"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
[{"index": 0, "size": 17070817280}, {"index": 1, "size": 17079205888}], "flc": true}}

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 8af45925c6..fe3034060d 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -74,11 +74,13 @@ static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
            ((high & MAKE_64BIT_MASK(0, 20)) << 32);
 }
 
-static uint64_t sgx_calc_host_epc_section_size(void)
+static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
 {
+    SGXEPCSectionList *head = NULL, **tail = &head;
+    SGXEPCSection *section;
     uint32_t i, type;
     uint32_t eax, ebx, ecx, edx;
-    uint64_t size = 0;
+    uint32_t j = 0;
 
     for (i = 0; i < SGX_MAX_EPC_SECTIONS; i++) {
         host_cpuid(0x12, i + 2, &eax, &ebx, &ecx, &edx);
@@ -92,10 +94,13 @@ static uint64_t sgx_calc_host_epc_section_size(void)
             break;
         }
 
-        size += sgx_calc_section_metric(ecx, edx);
+        section = g_new0(SGXEPCSection, 1);
+        section->index = j++;
+        section->size = sgx_calc_section_metric(ecx, edx);
+        QAPI_LIST_APPEND(tail, section);
     }
 
-    return size;
+    return head;
 }
 
 SGXInfo *sgx_get_capabilities(Error **errp)
@@ -119,7 +124,7 @@ SGXInfo *sgx_get_capabilities(Error **errp)
     info->sgx1 = eax & (1U << 0) ? true : false;
     info->sgx2 = eax & (1U << 1) ? true : false;
 
-    info->section_size = sgx_calc_host_epc_section_size();
+    info->sections = sgx_calc_host_epc_sections();
 
     close(fd);
 

