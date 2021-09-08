Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723EB403613
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:27:08 +0200 (CEST)
Received: from localhost ([::1]:52998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNsvD-0005ZX-Fq
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstZ-0002qQ-AW
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:25 -0400
Received: from mga14.intel.com ([192.55.52.115]:13021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstS-0003sa-O2
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220102694"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="220102694"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 01:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="538450871"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2021 01:25:15 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] hmp: Add 'info sgx' command
Date: Wed,  8 Sep 2021 16:19:32 +0800
Message-Id: <20210908081937.77254-3-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210908081937.77254-1-yang.zhong@intel.com>
References: <20210908081937.77254-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The command can be used to show the SGX information in the monitor
when SGX is enabled on intel platform.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hmp-commands-info.hx         | 15 +++++++++++++++
 include/monitor/hmp-target.h |  1 +
 target/i386/monitor.c        |  6 ++++++
 3 files changed, 22 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 27206ac049..4c966e8a6b 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -877,3 +877,18 @@ SRST
   ``info dirty_rate``
     Display the vcpu dirty rate information.
 ERST
+
+#if defined(TARGET_I386)
+    {
+        .name       = "sgx",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show intel SGX information",
+        .cmd        = hmp_info_sgx,
+    },
+#endif
+
+SRST
+  ``info sgx``
+    Show intel SGX information.
+ERST
diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index 60fc92722a..dc53add7ee 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -49,5 +49,6 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
 void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
+void hmp_info_sgx(Monitor *mon, const QDict *qdict);
 
 #endif /* MONITOR_HMP_TARGET_H */
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 942274c1c2..f1861fe6c2 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -769,3 +769,9 @@ SGXInfo *qmp_query_sgx(Error **errp)
     error_setg(errp, QERR_FEATURE_DISABLED, "query-sgx");
     return NULL;
 }
+
+void hmp_info_sgx(Monitor *mon, const QDict *qdict)
+{
+    error_setg(errp, QERR_FEATURE_DISABLED, "query-sgx");
+    return NULL;
+}

