Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55D4C106F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:38:54 +0100 (CET)
Received: from localhost ([::1]:55660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMp2r-0007t2-Bs
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:38:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nMoJ9-0002cx-6U
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:51:39 -0500
Received: from mga09.intel.com ([134.134.136.24]:56602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nMoJ7-0000aN-4M
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645609897; x=1677145897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jrwa7L/2E6GJxxtQDX4sp3DMpANFgG3ADhR5QgTC2zI=;
 b=DaT3Xqlz4Wb+RIFXju8mst5/tSV5/lrX+lq9eVdTl4kFY64oAHvO0+6N
 x0fGWhG0qPOr+KlFFpZv7ITBgdm+FtnKLmTDltC3AN4yy+9TWgOtd8tnW
 9xDhfUv7P8bzYNilsD++CaZYc8uR/nd55ItdSs6/iqUqXi59+6PegfmGK
 lszvMLYzCOxWYMxezwnKRf4luB2tD2i0K1DU2t1R43m63/CBjHGcAiYOI
 A3WTBzHfAItj7/0Yimmf2dugCAeD4SqHTOz8/179nW2XhRWEGt4ZwoF1r
 lx6DJdxW/NfdXwrkS0Y4hMg4+qmGCAm4tJPolHU+d/zXNOE8xzXJOWeBc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="251663357"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="251663357"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 01:51:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="548170363"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 01:51:34 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qdev: move legacy cli device creation after JSON syntax ones
Date: Wed, 23 Feb 2022 17:46:49 +0800
Message-Id: <20220223094649.64566-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=zhenzhong.duan@intel.com; helo=mga09.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While libvirt does not support all the qemu parameters in standand
xml syntax, such as hostfwd. We have to use <qemu:commandline> to
passthrough the parameters. E.x:

<qemu:commandline>
  <qemu:arg value='-netdev'/>
    <qemu:arg value='user,id=mynet0,hostfwd=tcp::44483-:22'/>
    <qemu:arg value='-device'/>
  <qemu:arg value='virtio-net-pci,netdev=mynet0,mac=00:16:3E:68:00:10,romfile='/>
</qemu:commandline>

Then we got below error:

qemu-system-x86_64: -device {"driver":"pcie-root-port","port":8,"chassis":1,"id":"pci.1","bus":"pcie.0","multifunction":true,"addr":"0x1"}: PCI: slot 1 function 0 not available for pcie-root-port, in use by virtio-net-pci

Libvirt generates qemu "-device" in JSON syntax followed by the
passthroughed "-device" in legacy syntax. But legacy syntax
described devices are assigned BDF first, this leads to conflict
with the pci devices in JSON syntax with fixed BDF.

Move legacy syntax described device creation after JSON syntax
described ones so we can start that kind of VM successfully in
libvirt.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 softmmu/vl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1fe028800fdf..5cf90e279fe9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2682,8 +2682,6 @@ static void qemu_create_cli_devices(void)
 
     /* init generic devices */
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
-    qemu_opts_foreach(qemu_find_opts("device"),
-                      device_init_func, NULL, &error_fatal);
     QTAILQ_FOREACH(opt, &device_opts, next) {
         DeviceState *dev;
         loc_push_restore(&opt->loc);
@@ -2698,6 +2696,8 @@ static void qemu_create_cli_devices(void)
         object_unref(OBJECT(dev));
         loc_pop(&opt->loc);
     }
+    qemu_opts_foreach(qemu_find_opts("device"),
+                      device_init_func, NULL, &error_fatal);
     rom_reset_order_override();
 }
 
-- 
2.25.1


