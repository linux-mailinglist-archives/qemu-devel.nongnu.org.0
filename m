Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EC444D828
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:20:59 +0100 (CET)
Received: from localhost ([::1]:53796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlAwk-00007o-Gp
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:20:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlAsT-0002Q1-Ns
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:16:33 -0500
Received: from mga12.intel.com ([192.55.52.136]:9363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlAsR-0006fp-EZ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:16:33 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="212952190"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="212952190"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 06:16:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="492556049"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2021 06:16:18 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 09/13] qmp: Include "guest-private" property for memory
 backends
Date: Thu, 11 Nov 2021 22:13:48 +0800
Message-Id: <20211111141352.26311-10-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
References: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 david@redhat.com, "J . Bruce Fields" <bfields@fieldses.org>,
 dave.hansen@intel.com, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 hw/core/machine-hmp-cmds.c | 3 +++
 hw/core/machine-qmp-cmds.c | 1 +
 qapi/machine.json          | 3 +++
 qapi/qom.json              | 3 +++
 4 files changed, 10 insertions(+)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 76b22b00d6..6bd66c25b7 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -112,6 +112,9 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
                        m->value->prealloc ? "true" : "false");
         monitor_printf(mon, "  share: %s\n",
                        m->value->share ? "true" : "false");
+        monitor_printf(mon, "  guest private: %s\n",
+                       m->value->guest_private ? "true" : "false");
+
         if (m->value->has_reserve) {
             monitor_printf(mon, "  reserve: %s\n",
                            m->value->reserve ? "true" : "false");
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 216fdfaf3a..2c1c1de73f 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -174,6 +174,7 @@ static int query_memdev(Object *obj, void *opaque)
         m->dump = object_property_get_bool(obj, "dump", &error_abort);
         m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
         m->share = object_property_get_bool(obj, "share", &error_abort);
+        m->guest_private = object_property_get_bool(obj, "guest-private", &error_abort);
         m->reserve = object_property_get_bool(obj, "reserve", &err);
         if (err) {
             error_free_or_abort(&err);
diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..f568a6a0bf 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -798,6 +798,8 @@
 #
 # @share: whether memory is private to QEMU or shared (since 6.1)
 #
+# @guest-private: whether memory is private to guest (since X.X)
+#
 # @reserve: whether swap space (or huge pages) was reserved if applicable.
 #           This corresponds to the user configuration and not the actual
 #           behavior implemented in the OS to perform the reservation.
@@ -818,6 +820,7 @@
     'dump':       'bool',
     'prealloc':   'bool',
     'share':      'bool',
+    'guest-private':      'bool',
     '*reserve':    'bool',
     'host-nodes': ['uint16'],
     'policy':     'HostMemPolicy' }}
diff --git a/qapi/qom.json b/qapi/qom.json
index a25616bc7a..93af9b106e 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -550,6 +550,8 @@
 # @share: if false, the memory is private to QEMU; if true, it is shared
 #         (default: false)
 #
+# @guest-private: if true, the memory is guest private memory (default: false)
+#
 # @reserve: if true, reserve swap space (or huge pages) if applicable
 #           (default: true) (since 6.1)
 #
@@ -580,6 +582,7 @@
             '*prealloc': 'bool',
             '*prealloc-threads': 'uint32',
             '*share': 'bool',
+            '*guest-private': 'bool',
             '*reserve': 'bool',
             'size': 'size',
             '*x-use-canonical-path-for-ramblock-id': 'bool' } }
-- 
2.17.1


