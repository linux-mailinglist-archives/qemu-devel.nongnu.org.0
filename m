Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51E363FB5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:40:13 +0200 (CEST)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRK8-0006jb-Cm
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR4Z-00066G-J7
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:24:07 -0400
Received: from mga17.intel.com ([192.55.52.151]:24096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR4X-000256-Oh
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:24:07 -0400
IronPort-SDR: 2LXc8IynUR/BDTx6isR6t6pP2dh7p/MA9W3c+k3t9qUHFG9yIluQ4mo6zTQmPgcsg+VhABWPnR
 d/CCLzcXDM0A==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="175409330"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="175409330"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:23:13 -0700
IronPort-SDR: renqvlWVlmf4Mu7gTuJGmJp0misrsehkHQwiV9vc8qLkdGKgqvfwDTU0KMitNJ8F4bcORTujDh
 /PdVe6nSH4Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="419947507"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 03:23:12 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/32] hmp: Add 'info sgx' command
Date: Mon, 19 Apr 2021 18:01:50 +0800
Message-Id: <20210419100156.53504-27-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210419100156.53504-1-yang.zhong@intel.com>
References: <20210419100156.53504-1-yang.zhong@intel.com>
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
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
index ab0c7aa5ee..20fbca18cd 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -880,3 +880,18 @@ SRST
   ``info replay``
     Display the record/replay information: mode and the current icount.
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
index 605d57287a..a65cf71100 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -129,5 +129,6 @@ void hmp_info_replay(Monitor *mon, const QDict *qdict);
 void hmp_replay_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
 void hmp_replay_seek(Monitor *mon, const QDict *qdict);
+void hmp_info_sgx(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 0ad5b77477..1d1efca713 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2226,3 +2226,9 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
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


