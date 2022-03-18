Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2D4DD949
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 12:57:21 +0100 (CET)
Received: from localhost ([::1]:35934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVBEO-0002UG-JL
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 07:57:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nVBCj-0001ME-1X
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:55:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:49605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nVBCg-0002lb-8u
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647604534; x=1679140534;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F764auwYFVZErB2yzIux3JIw4zIGbwLG0sp96TPuiu8=;
 b=DJqDTGfrVI0aR97hu3JUQIzpqJZQ5SlBquPJl8Lne2Mk/YlftYEgmGFX
 Yh4y1fkGPHMR7eCs1KwGQQ937/AplxJpVY0+pENJ2PGVx2Ayy3Xj3OKiM
 kLpx224jTa+9Jpb+xJXHlZHwFg7axRLPQ243fB79W6TX1VKjVBtOo9Uv/
 LXKCKDzpS3L8jHkVDs9g/eZ5N+RQLzgGJfzslVX+QGkIN8UPRyN1qgCbZ
 JmayzhJmNzG6DA6WnxdSFEMRHgugoXJYOD8bNkXD4G7hbU5d3GuW6pi1r
 v6ScjQgG6kpRoqWmpK1guoF90JYrgpahNTZfGhqJj+RL9bsYNVd7FoG9l Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="317837838"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="317837838"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 04:55:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="691291743"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2022 04:55:29 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] x86/amx: compatible with older kernel release
Date: Fri, 18 Mar 2022 04:55:29 -0700
Message-Id: <20220318115529.4850-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, pbonzini@redhat.com, pkrempa@redhat.com,
 mprivozn@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AMX KVM introduced one new ARCH_GET_XCOMP_SUPP system attribute
API to get host side supported_xcr0 and latest Qemu can decide if it
can request dynamically enabled XSAVE features permission. But this
implementation(19db68ca68) did not consider older kernel release.
This patch can avoid to read this new KVM_GET_DEVICE_ATTR ioctl.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/kvm/kvm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ef2c68a6f4..cda95e7ba6 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -420,14 +420,14 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         bool sys_attr = kvm_check_extension(s, KVM_CAP_SYS_ATTRIBUTES);
         if (!sys_attr) {
             warn_report("cannot get sys attribute capabilities %d", sys_attr);
-        }
-
-        int rc = kvm_ioctl(s, KVM_GET_DEVICE_ATTR, &attr);
-        if (rc == -1 && (errno == ENXIO || errno == EINVAL)) {
-            warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
-                        "error: %d", rc);
-        }
-        ret = (reg == R_EAX) ? bitmask : bitmask >> 32;
+        } else {
+            int rc = kvm_ioctl(s, KVM_GET_DEVICE_ATTR, &attr);
+            if (rc == -1 && (errno == ENXIO || errno == EINVAL)) {
+                warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
+                            "error: %d", rc);
+            }
+            ret = (reg == R_EAX) ? bitmask : bitmask >> 32;
+       }
     } else if (function == 0x80000001 && reg == R_ECX) {
         /*
          * It's safe to enable TOPOEXT even if it's not returned by
-- 
2.25.1


