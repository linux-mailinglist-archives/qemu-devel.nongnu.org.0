Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D43C22D5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:28:40 +0200 (CEST)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ogG-0005sY-W0
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oUH-0001Gy-Jm
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:16:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:37173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oUC-0005A9-G2
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:16:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800853"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800853"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730328"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:15:06 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/33] hmp: Add 'info sgx' command
Date: Fri,  9 Jul 2021 19:09:49 +0800
Message-Id: <20210709110955.73256-28-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210709110955.73256-1-yang.zhong@intel.com>
References: <20210709110955.73256-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The command can be used to show the SGX information in the monitor
when SGX is enabled on intel platform.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hmp-commands-info.hx  | 15 +++++++++++++++
 include/monitor/hmp.h |  1 +
 monitor/hmp-cmds.c    |  6 ++++++
 3 files changed, 22 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index fb59c27200..bf207fe941 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -880,3 +880,18 @@ SRST
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
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 3baa1058e2..eba5eda996 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -131,5 +131,6 @@ void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_seek(Monitor *mon, const QDict *qdict);
 void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
+void hmp_info_sgx(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 0942027208..9ebc86190f 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2230,3 +2230,9 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+void hmp_info_sgx(Monitor *mon, const QDict *qdict)
+{
+    error_setg(errp, QERR_FEATURE_DISABLED, "query-sgx");
+    return NULL;
+}
-- 
2.29.2.334.gfaefdd61ec


