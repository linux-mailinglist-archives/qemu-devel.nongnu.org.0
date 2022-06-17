Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601B354F255
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 09:59:24 +0200 (CEST)
Received: from localhost ([::1]:59702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o26t1-0005c8-EG
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 03:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lI-0005EB-9o
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:24 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28798 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lG-000779-LG
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452282; x=1686988282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MfsDDohzwVJoLUtP3NNLreffjaePujHfV6sS1Be7igQ=;
 b=ArmUmNj/6jC+7ETTDQ4P1QCsB3xFyKnEDUpnEQJ9Gy5uKwB5hEyxCI7b
 8hTPCUxD1Zjjzc71nltdsPEYexxHeEkO9gYvDwOh0j+G+4Mb8+oWZmkZY
 BFLh5enm84jWwwlcjyhM8bfza3ASzlKic9/1dCOLMX/H3P6R/T0ChJBtN
 osLpmnGxturqL7UCOMOkfZY2A1gWVjnIFJ/ziV0FQ+pVmvXZEx8GQJTQo
 OqgJ4mfgfwH81/ckBa9/+TOuT8K4R5rvB4WxEtxsait1/manmMRgfWLhB
 ySeMiI0U4v7nEei4SsYtELmErcLUG6H2vizYr6bHU0Kt2qDkZhxl9CJck A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102155"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102155"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:21 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936736"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:19 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Zhang Chen <chen.zhang@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
Subject: [RFC PATCH 06/12] ebpf/uBPF: Add qemu_ubpf_run_once excute real ebpf
 program
Date: Fri, 17 Jun 2022 15:36:24 +0800
Message-Id: <20220617073630.535914-7-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617073630.535914-1-chen.zhang@intel.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before running this function, we need to ensure that the
userspace ebpf program has been loaded correctly.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 ebpf/ubpf-stub.c |  6 ++++++
 ebpf/ubpf.c      | 16 ++++++++++++++++
 ebpf/ubpf.h      |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/ebpf/ubpf-stub.c b/ebpf/ubpf-stub.c
index 885bd954b7..70da421629 100644
--- a/ebpf/ubpf-stub.c
+++ b/ebpf/ubpf-stub.c
@@ -27,3 +27,9 @@ int qemu_ubpf_prepare(UbpfState *u_ebpf, char *code_path)
 {
     return 0;
 }
+
+uint64_t qemu_ubpf_run_once(UbpfState *u_ebpf, void *target,
+                            size_t target_len)
+{
+    return 0;
+}
diff --git a/ebpf/ubpf.c b/ebpf/ubpf.c
index d65fffeda3..8ac513c7ed 100644
--- a/ebpf/ubpf.c
+++ b/ebpf/ubpf.c
@@ -199,3 +199,19 @@ int qemu_ubpf_prepare(UbpfState *u_ebpf, char *code_path)
 
     return 0;
 }
+
+uint64_t qemu_ubpf_run_once(UbpfState *u_ebpf, void *target,
+                            size_t target_len)
+{
+    uint64_t result;
+
+    if (u_ebpf->jit) {
+        result = u_ebpf->fn(target, target_len);
+    } else {
+        if (ubpf_exec(u_ebpf->vm, target, target_len, &result) < 0) {
+            result = UINT64_MAX;
+        }
+    }
+
+    return result;
+}
diff --git a/ebpf/ubpf.h b/ebpf/ubpf.h
index 9a35efbeb6..fc40e84e51 100644
--- a/ebpf/ubpf.h
+++ b/ebpf/ubpf.h
@@ -38,5 +38,7 @@ bool qemu_ubpf_read_code(UbpfState *u_ebpf, char *path);
 bool qemu_ubpf_read_target(UbpfState *u_ebpf, char *path);
 void qemu_ubpf_init_jit(UbpfState *u_ebpf, bool jit);
 int qemu_ubpf_prepare(UbpfState *u_ebpf, char *code_path);
+uint64_t qemu_ubpf_run_once(UbpfState *u_ebpf, void *target,
+                            size_t target_len);
 
 #endif /* QEMU_UBPF_H */
-- 
2.25.1


