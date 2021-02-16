Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728D931C55D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:17:47 +0100 (CET)
Received: from localhost ([::1]:60822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBpvu-0007lB-C8
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptC-0005uM-1d
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:14:58 -0500
Received: from mga17.intel.com ([192.55.52.151]:25639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptA-0001Zp-80
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:14:57 -0500
IronPort-SDR: NqRHzaknoMs2Q/g8sy6WWZ3nGfDFCYwrqTA1qbc4bJMbtrOJUJYL+7RjKE3xPelWotCJ21vaaQ
 TKCGDLcL9XOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558746"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558746"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:50 -0800
IronPort-SDR: 88S/oG2rYJg2xdPWaXvCFlX3HqKmlM8Ss/MBBUfayAfAiDqClhEX847js5vB1fRc+BXgEGdm2j
 lwoBExg6gACQ==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705386"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:50 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 02/23] kvm: Switch KVM_CAP_READONLY_MEM to a per-VM ioctl()
Date: Mon, 15 Feb 2021 18:12:58 -0800
Message-Id: <1c93f5dabe2ef573302ff362c0c6c525bbe8af43.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to making a VM ioctl() call for KVM_CAP_READONLY_MEM, which may
be conditional on VM type in recent versions of KVM, e.g. when TDX is
supported.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 accel/kvm/kvm-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 47516913b7..351c25a5cb 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2164,7 +2164,7 @@ static int kvm_init(MachineState *ms)
     }
 
     kvm_readonly_mem_allowed =
-        (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
+        (kvm_vm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
 
     kvm_eventfds_allowed =
         (kvm_check_extension(s, KVM_CAP_IOEVENTFD) > 0);
-- 
2.17.1


