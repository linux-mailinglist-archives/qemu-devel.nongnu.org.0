Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A713BF359
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:12:19 +0200 (CEST)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IaQ-0000sN-M1
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKn-0001xj-5l
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:09 -0400
Received: from mga12.intel.com ([192.55.52.136]:57600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKk-0007Kk-KI
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189101727"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="189101727"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770101"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:58 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 34/44] target/i386/tdx: set reboot action to shutdown
 when tdx
Date: Wed,  7 Jul 2021 17:55:04 -0700
Message-Id: <d1afced8a92c01367d0aed7c6f82659c9bf79956.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=isaku.yamahata@intel.com; helo=mga12.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

In TDX CPU state is also protected, thus vcpu state can't be reset by VMM.
It assumes -action reboot=shutdown instead of silently ignoring vcpu reset.

TDX module spec version 344425-002US doesn't support vcpu reset by VMM.  VM
needs to be destroyed and created again to emulate REBOOT_ACTION_RESET.
For simplicity, put its responsibility to management system like libvirt
because it's difficult for the current qemu implementation to destroy and
re-create KVM VM resources with keeping other resources.

If management system wants reboot behavior for its users, it needs to
 - set reboot_action to REBOOT_ACTION_SHUTDOWN,
 - set shutdown_action to SHUTDOWN_ACTION_PAUSE optionally and,
 - subscribe VM state change and on reboot, (destroy qemu if
   SHUTDOWN_ACTION_PAUSE and) start new qemu.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 target/i386/kvm/tdx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 1316d95209..0621317b0a 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -25,6 +25,7 @@
 #include "qapi/qapi-types-misc-target.h"
 #include "standard-headers/asm-x86/kvm_para.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/runstate-action.h"
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_int.h"
 #include "sysemu/tdx.h"
@@ -363,6 +364,19 @@ static void tdx_guest_init(Object *obj)
 
     qemu_mutex_init(&tdx->lock);
 
+    /*
+     * TDX module spec version 344425-002US doesn't support reset of vcpu by
+     * VMM.  VM needs to be destroyed and created again to emulate
+     * REBOOT_ACTION_RESET.  For simplicity, put its responsibility to
+     * management system like libvirt.
+     *
+     * Management system should
+     *  - set reboot_action to REBOOT_ACTION_SHUTDOWN
+     *  - set shutdown_action to SHUTDOWN_ACTION_PAUSE
+     *  - subscribe VM state and on reboot, destroy qemu and start new qemu
+     */
+    reboot_action = REBOOT_ACTION_SHUTDOWN;
+
     tdx->debug = false;
     object_property_add_bool(obj, "debug", tdx_guest_get_debug,
                              tdx_guest_set_debug);
-- 
2.25.1


