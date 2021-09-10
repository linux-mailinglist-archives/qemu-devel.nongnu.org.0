Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ABE406A28
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 12:32:11 +0200 (CEST)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdpK-000052-Sz
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 06:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOdmO-000633-Rf
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:29:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:47087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOdmN-0002NF-6u
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:29:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="201241634"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="201241634"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 03:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="540545527"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Sep 2021 03:28:54 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] pc: Cleanup the SGX definitions
Date: Fri, 10 Sep 2021 18:22:58 +0800
Message-Id: <20210910102258.46648-4-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210910102258.46648-1-yang.zhong@intel.com>
References: <20210910102258.46648-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, philmd@redhat.com,
 eblake@redhat.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch only cleanup SGX definitions in the the pc.h file.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 include/hw/i386/pc.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index a5ae380b4b..4c77489961 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -195,17 +195,18 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
 
+/* sgx.c */
+void pc_machine_init_sgx_epc(PCMachineState *pcms);
+/* hostmem-epc.c */
+void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
+                              Error **errp);
+
 extern GlobalProperty pc_compat_6_1[];
 extern const size_t pc_compat_6_1_len;
 
 extern GlobalProperty pc_compat_6_0[];
 extern const size_t pc_compat_6_0_len;
 
-/* sgx-epc.c */
-void pc_machine_init_sgx_epc(PCMachineState *pcms);
-void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
-                              Error **errp);
-
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
 

