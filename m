Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D59637656E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:45:24 +0200 (CEST)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezr3-0005nN-Vp
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbW-0000mP-NY
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:14 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbT-0001Wi-HW
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:14 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CEjao126849;
 Fri, 7 May 2021 12:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=cbDIMfiCiERpNImnUSmmcFyFlWEeyMB25WzXlcFBRdw=;
 b=h1cjDF9fRie+Q718EtxYMYTgoV5GcpxUQzLKaBmd+7o0LqV5wN2dUVbi8N4kmU5NiV2U
 BbqkMuT4YeKSdVdmkO8is/Sh+SeY3hibUECHI4/LGKnXk4szC1pcxQwq22ZNpwOt+ADD
 s1D/yzwhQrpEACnJTMrtbktzvCm+CzYXTHefmrRmAzcr/WbWlAp+BJMerXxzKC+RTk8Z
 CQejag7caL/R4xhFVuIg1fBVi4s4Wc0uEn3qfrbmn7qDxBHVJnlqt+gyxAP2LprR5tlB
 lbaev2FBYWtpHcNJVxChLVI+gTqIqETSpPG2HNFqVks8JDuoAnMwvfymJYk9XfbJ4FNE Dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 38ctjv1cby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFYXB068860;
 Fri, 7 May 2021 12:29:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38csrev2p0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:08 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CSLF4108458;
 Fri, 7 May 2021 12:29:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 38csrev2np-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:07 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 147CT632019336;
 Fri, 7 May 2021 12:29:06 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:29:06 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 20/22] cpr: only-cpr-capable option
Date: Fri,  7 May 2021 05:25:18 -0700
Message-Id: <1620390320-301716-21-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: tKHRfDxyIQ_GI-ll602rYEALVdJDJhq8
X-Proofpoint-GUID: tKHRfDxyIQ_GI-ll602rYEALVdJDJhq8
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=steven.sistare@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the only-cpr-capable option, which causes qemu to exit with an error
if any devices that are not capable of cpr are added.  This guarantees that
a cprsave operation will not fail with an unsupported device error.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-socket.c   |  4 ++++
 hw/vfio/common.c        |  5 +++++
 hw/vfio/pci.c           |  3 +++
 include/sysemu/sysemu.h |  1 +
 migration/migration.c   |  5 +++++
 qemu-options.hx         |  8 ++++++++
 softmmu/globals.c       |  1 +
 softmmu/physmem.c       |  4 ++++
 softmmu/vl.c            | 14 +++++++++++++-
 stubs/cpr.c             |  3 +++
 stubs/meson.build       |  1 +
 11 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 stubs/cpr.c

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 110f263..b8c75ff 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -40,6 +40,7 @@
 
 #include "chardev/char-io.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 
 /***********************************************************/
 /* TCP Net console */
@@ -1468,6 +1469,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
 
     if (!s->tls_creds && !s->is_websock) {
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    } else if (only_cpr_capable) {
+        error_setg(errp, "error: socket %s is not cpr capable due to %s option",
+                   chr->label, (s->tls_creds ? "TLS" : "websocket"));
     }
 
     /* be isn't opened until we get a connection */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 00d07b2..f2f1926 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -37,6 +37,7 @@
 #include "qemu/range.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
+#include "sysemu/sysemu.h"
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
@@ -1601,6 +1602,10 @@ static int vfio_get_iommu_type(VFIOContainer *container,
 
     for (i = 0; i < ARRAY_SIZE(iommu_types); i++) {
         if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) {
+            if (only_cpr_capable && !vfio_cpr_capable(container, errp)) {
+                error_prepend(errp, "only-cpr-capable is specified: ");
+                return -EINVAL;
+            }
             return iommu_types[i];
         }
     }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e983db4..908b0e5 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -266,6 +266,9 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
 
     if (!pin) {
         return 0;
+    } else if (only_cpr_capable) {
+        error_setg(errp, "INTX is not compatible with -only-cpr-capable");
+        return -1;
     }
 
     vfio_disable_interrupts(vdev);
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index f56058e..05c2d8e 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -9,6 +9,7 @@
 /* vl.c */
 
 extern int only_migratable;
+extern bool only_cpr_capable;
 extern char **argv_main;
 extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
diff --git a/migration/migration.c b/migration/migration.c
index 8ca0341..181c8d5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1262,6 +1262,11 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_X_COLO] && only_cpr_capable) {
+        error_setg(errp, "x-colo is not compatible with -only-cpr-capable");
+        return false;
+    }
+
     return true;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index ef2d24a..f1b372b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4257,6 +4257,14 @@ SRST
     an unmigratable state.
 ERST
 
+DEF("only-cpr-capable", 0, QEMU_OPTION_only_cpr_capable, \
+    "-only-cpr-capable    allow only cpr capable devices\n", QEMU_ARCH_ALL)
+SRST
+``-only-cpr-capable``
+    Only allow cpr capable devices, which guarantees that cprsave will not
+    fail with an unsupported device error.
+ERST
+
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
     "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 2bb630d..752f119 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -59,6 +59,7 @@ int boot_menu;
 bool boot_strict;
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
+bool only_cpr_capable;
 int icount_align_option;
 char **argv_main;
 
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index b79f408..04e3603 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1973,6 +1973,10 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
                 addr = file_ram_alloc(new_block, maxlen, mfd,
                                       false, false, 0, errp);
                 trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else if (only_cpr_capable) {
+                error_setg(errp,
+                    "only-cpr-capable requires -machine memfd-alloc=on");
+                return;
             } else {
                 addr = qemu_anon_ram_alloc(maxlen, &mr->align, shared);
             }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4654693..76a14a0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2589,6 +2589,10 @@ void qmp_x_exit_preconfig(Error **errp)
     qemu_create_cli_devices();
     qemu_machine_creation_done();
 
+    if (only_cpr_capable && !qemu_chr_cpr_capable(errp)) {
+        ;    /* not reached due to error_fatal */
+    }
+
     if (loadvm) {
         Error *local_err = NULL;
         if (!load_snapshot(loadvm, NULL, false, NULL, &local_err)) {
@@ -2598,7 +2602,12 @@ void qmp_x_exit_preconfig(Error **errp)
         }
     }
     if (replay_mode != REPLAY_MODE_NONE) {
-        replay_vmstate_init();
+        if (only_cpr_capable) {
+            error_setg(errp, "replay is not compatible with -only-cpr-capable");
+            /* not reached due to error_fatal */
+        } else {
+            replay_vmstate_init();
+        }
     }
 
     if (incoming) {
@@ -3340,6 +3349,9 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
+            case QEMU_OPTION_only_cpr_capable:
+                only_cpr_capable = true;
+                break;
             case QEMU_OPTION_nodefaults:
                 has_defaults = 0;
                 break;
diff --git a/stubs/cpr.c b/stubs/cpr.c
new file mode 100644
index 0000000..aaa189e
--- /dev/null
+++ b/stubs/cpr.c
@@ -0,0 +1,3 @@
+#include "qemu/osdep.h"
+
+bool only_cpr_capable;
diff --git a/stubs/meson.build b/stubs/meson.build
index be6f6d6..2003c77 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -5,6 +5,7 @@ stub_ss.add(files('blk-exp-close-all.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
+stub_ss.add(files('cpr.c'))
 stub_ss.add(files('cpu-get-clock.c'))
 stub_ss.add(files('cpus-get-virtual-clock.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
-- 
1.8.3.1


