Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB514C23F4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 07:13:49 +0100 (CET)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN7Nr-00030k-S4
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 01:13:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nN7MI-0002E5-RD
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 01:12:10 -0500
Received: from mga01.intel.com ([192.55.52.88]:54147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nN7MF-0001lN-CJ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 01:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645683127; x=1677219127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ajz0t7TjE2NXbXhSkbD13mhzzoqMwB3n9oDcXjMkoMQ=;
 b=ZMl9/81P+lbY5P+PcSn3doNiC2zncG5iAdtZ64TzrM7RiMHuWcVLRZ8e
 loBptGxqJWgGnC2ca82b7avL8EhsikvCtoFtRz7bJCeMP8sPXArsHCImU
 HJsFoZhw6+smOdoTgmcOtb3CRDj5bHMyF+lNn0HDJq13WRmsU7qXVqR4w
 O2zrudnuAT6BR8uXZLrkP22pzoDgrbaAFOXLQpYxFa/a4N+ZulaYxxyQ+
 bm+NNacUjBBsglclNPHHoxPtRNn+yTJbHGoXXA7lKTrqRiRbn/rHVjRj2
 QbIWobD7ysKF6GsUjssuzNnqilbl9pfuzGAJOaJcKRsZCocMI7jsc5Cpj g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="276785084"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="276785084"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 22:12:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="548597322"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 22:12:01 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vl: transform QemuOpts device to JSON syntax device
Date: Thu, 24 Feb 2022 14:06:53 +0800
Message-Id: <20220224060653.74229-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=zhenzhong.duan@intel.com; helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, mst@redhat.com, lersek@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While there are mixed use of traditional -device option and JSON
syntax option, QEMU reports conflict, e.x:

/usr/libexec/qemu-kvm -nodefaults \
  -device '{"driver":"virtio-scsi-pci","id":"scsi0","bus":"pci.0","addr":"0x02.0"}' \
  -device virtio-scsi-pci,id=scsi1,bus=pci.0

It breaks with:

qemu-kvm: -device {"driver":"virtio-scsi-pci","id":"scsi0","bus":"pci.0","addr":"0x02.0"}: PCI: slot 2 function 0 not available for virtio-scsi-pci, in use by virtio-scsi-pci

But if we reformat first -device same as the second, so only same kind
of option for all the devices, it succeeds, vice versa. e.x:

/usr/libexec/qemu-kvm -nodefaults \
  -device virtio-scsi-pci,id=scsi0,bus=pci.0,addr=02.0 \
  -device virtio-scsi-pci,id=scsi1,bus=pci.0

Succeed!

Because both kind of options are inserted into their own list and
break the order in QEMU command line during BDF auto assign. Fix it
by transform QemuOpts into JSON syntax and insert in JSON device
list, so the order in QEMU command line kept.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 softmmu/vl.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1fe028800fdf..3def40b5405e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3394,21 +3394,26 @@ void qemu_init(int argc, char **argv, char **envp)
                 qdict_put_str(machine_opts_dict, "usb", "on");
                 add_device_config(DEV_USB, optarg);
                 break;
-            case QEMU_OPTION_device:
+            case QEMU_OPTION_device: {
+                QObject *obj;
                 if (optarg[0] == '{') {
-                    QObject *obj = qobject_from_json(optarg, &error_fatal);
-                    DeviceOption *opt = g_new0(DeviceOption, 1);
-                    opt->opts = qobject_to(QDict, obj);
-                    loc_save(&opt->loc);
-                    assert(opt->opts != NULL);
-                    QTAILQ_INSERT_TAIL(&device_opts, opt, next);
+                    obj = qobject_from_json(optarg, &error_fatal);
                 } else {
-                    if (!qemu_opts_parse_noisily(qemu_find_opts("device"),
-                                                 optarg, true)) {
+                    opts = qemu_opts_parse_noisily(qemu_find_opts("device"),
+                                                   optarg, true);
+                    if (!opts) {
                         exit(1);
                     }
+                    obj = QOBJECT(qemu_opts_to_qdict(opts, NULL));
+                    qemu_opts_del(opts);
                 }
+                DeviceOption *opt = g_new0(DeviceOption, 1);
+                opt->opts = qobject_to(QDict, obj);
+                loc_save(&opt->loc);
+                assert(opt->opts != NULL);
+                QTAILQ_INSERT_TAIL(&device_opts, opt, next);
                 break;
+            }
             case QEMU_OPTION_smp:
                 machine_parse_property_opt(qemu_find_opts("smp-opts"),
                                            "smp", optarg);
-- 
2.25.1


