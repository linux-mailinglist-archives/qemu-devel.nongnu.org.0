Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B483BF32B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 02:58:46 +0200 (CEST)
Received: from localhost ([::1]:41836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1INJ-0005EW-93
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 20:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKg-0001lk-Ey
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:02 -0400
Received: from mga03.intel.com ([134.134.136.65]:19084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKd-0007Kl-FC
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="209461993"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="209461993"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423769985"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:52 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 02/44] kvm: Switch KVM_CAP_READONLY_MEM to a per-VM
 ioctl()
Date: Wed,  7 Jul 2021 17:54:32 -0700
Message-Id: <20f5a78e8c704adcf4e96dac4aa160b9b6a7c17c.1625704980.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=isaku.yamahata@intel.com; helo=mga03.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Switch to making a VM ioctl() call for KVM_CAP_READONLY_MEM, which may
be conditional on VM type in recent versions of KVM, e.g. when TDX is
supported.

kvm_vm_check_extension() has fallback from kvm_vm_ioctl() to
kvm_check_extension(). fallback from VM ioctl to System ioctl for
compatibility for old kernel.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 accel/kvm/kvm-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e5b10dd129..fdbe24bf59 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2531,7 +2531,7 @@ static int kvm_init(MachineState *ms)
     }
 
     kvm_readonly_mem_allowed =
-        (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
+        (kvm_vm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
 
     kvm_eventfds_allowed =
         (kvm_check_extension(s, KVM_CAP_IOEVENTFD) > 0);
-- 
2.25.1


