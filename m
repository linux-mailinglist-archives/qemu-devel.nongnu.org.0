Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B81B5362
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 06:22:26 +0200 (CEST)
Received: from localhost ([::1]:35502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRTNZ-0003sU-1O
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 00:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1jRTIx-0004O6-UL
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:17:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1jRTIw-0003kz-VT
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:17:39 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:43268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1jRTIw-0003fG-EO
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:17:38 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03N4Cmqp131642;
 Thu, 23 Apr 2020 04:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=lUkrROy7G3Nfb1ZNm3Ai6LRb+eyRRel1HxyhrcjaEEU=;
 b=y1AZ9dpz9/PNWw7WKho+2OzlF6Z77en0ORnLpDNWj31MOdk+KFDl/SYRR1lP1aJ+04i0
 WqNCE3ST94vw4qQglvrn+w7dAbPWZQYHQ/N9n2BoH0CK+X5FY10vqegsJI6tB98k96kM
 hSlQK1/8g2A6RiJU9YK7OfpUWHIJ+T1ZRmeTfsX9TWr12QWX9pAjfeFil9M/BViNvw3h
 cBwULkNH6LdSBySLC+TnCvh8k1gfHL5+Y6jqy9kQxxvZ7iC/u/0pkb9xNIeK4I7vBysS
 r7MuuUltLlV2D3gyRHbrsJuu255g6sPc16plFvZDy4QsqUHpz/eRaRFZtGeUsKyxSsaH Cw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 30jvq4s962-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 04:17:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03N4CIO6089331;
 Thu, 23 Apr 2020 04:15:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 30gb1ku8wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 04:15:28 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03N4FRNi020414;
 Thu, 23 Apr 2020 04:15:27 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 Apr 2020 21:15:26 -0700
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v6 33/36] multi-process/mon: enable QMP module support
 in the remote process
Date: Wed, 22 Apr 2020 21:14:08 -0700
Message-Id: <bd1ca82040570898ce0a894f32cdf842ac16ba34.1587614626.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1587614626.git.elena.ufimtseva@oracle.com>
References: <cover.1587614626.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9599
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=1 spamscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004230027
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9599
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004230027
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 00:14:28
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.78
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Build system changes to enable QMP module in the remote process

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 Makefile.objs               | 10 ++++++++++
 Makefile.target             | 35 +++++++++++++++++++++++++++++++++--
 block/Makefile.objs         |  3 +++
 block/monitor/Makefile.objs |  2 ++
 hmp-commands.hx             |  1 +
 hw/core/Makefile.objs       |  1 +
 monitor/Makefile.objs       |  4 ++++
 monitor/misc.c              |  8 ++++++++
 qapi/Makefile.objs          |  2 ++
 qom/Makefile.objs           |  1 +
 stubs/monitor.c             |  1 +
 ui/Makefile.objs            |  2 ++
 12 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index ff3f06b146..cdb55b2f82 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -32,6 +32,7 @@ remote-pci-obj-$(CONFIG_MPQEMU) += migration/
 remote-pci-obj-$(CONFIG_MPQEMU) += remote/
 remote-pci-obj-$(CONFIG_MPQEMU) += accel/
 remote-pci-obj-$(CONFIG_MPQEMU) += util/
+remote-pci-obj-$(CONFIG_MPQEMU) += monitor/
 
 remote-pci-obj-$(CONFIG_MPQEMU) += cpus-common.o
 remote-pci-obj-$(CONFIG_MPQEMU) += dma-helpers.o
@@ -45,6 +46,10 @@ remote-pci-obj-$(CONFIG_MPQEMU) += qemu-parse.o
 # remote-lsi-obj-y is code used to implement remote LSI device
 
 remote-lsi-obj-$(CONFIG_MPQEMU) += hw/
+remote-lsi-obj-$(CONFIG_MPQEMU) += ui/
+remote-lsi-obj-$(CONFIG_MPQEMU) += block/
+
+#remote-lsi-obj-$(CONFIG_MPQEMU) += device-hotplug.o
 
 #######################################################################
 # crypto-obj-y is code used by both qemu system emulation and qemu-img
@@ -113,6 +118,11 @@ common-obj-y += util/machine-notify.o
 
 endif # CONFIG_SOFTMMU
 
+remote-pci-obj-$(CONFIG_MPQEMU) += qapi/
+remote-pci-obj-$(CONFIG_MPQEMU) += blockdev-nbd.o
+remote-pci-obj-$(CONFIG_MPQEMU) += job-qmp.o
+remote-pci-obj-$(CONFIG_MPQEMU) += balloon.o
+
 #######################################################################
 # Target-independent parts used in system and user emulation
 common-obj-y += cpus-common.o
diff --git a/Makefile.target b/Makefile.target
index adc76886f8..1e9e102df8 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -142,13 +142,32 @@ remote-pci-tgt-obj-$(CONFIG_MPQEMU) += accel/stubs/hax-stub.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += accel/stubs/whpx-stub.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/vl-stub.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/net-stub.o
-remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/monitor.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/replay.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/xen-mapcache.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/audio.o
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/monitor.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/migration.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/ui-stub.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/gdbstub.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/qapi-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += stubs/qapi-misc.o
 
 remote-pci-tgt-obj-$(CONFIG_MPQEMU) += remote/memory.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += arch_init.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += monitor/misc.o
+
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-introspect.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands-block-core.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands-block.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands-misc.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands-machine-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-commands-misc-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-visit-machine-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-visit-misc-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-types-machine-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-types-misc-target.o
+remote-pci-tgt-obj-$(CONFIG_MPQEMU) += qapi/qapi-init-commands.o
 endif
 
 #########################################################
@@ -204,6 +223,10 @@ endif
 generated-files-y += hmp-commands.h hmp-commands-info.h
 generated-files-y += config-devices.h
 
+ifdef CONFIG_MPQEMU
+generated-files-y += hmp-scsi-commands.h hmp-scsi-commands-info.h
+endif
+
 endif # CONFIG_SOFTMMU
 
 dummy := $(call unnest-vars,,obj-y)
@@ -289,10 +312,18 @@ hmp-commands.h: $(SRC_PATH)/hmp-commands.hx $(SRC_PATH)/scripts/hxtool
 hmp-commands-info.h: $(SRC_PATH)/hmp-commands-info.hx $(SRC_PATH)/scripts/hxtool
 	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -h < $< > $@,"GEN","$(TARGET_DIR)$@")
 
+ifdef CONFIG_MPQEMU
+hmp-scsi-commands.h: $(SRC_PATH)/hmp-commands.hx $(SRC_PATH)/scripts/hxtool
+	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -tgt scsi < $< > $@)
+
+hmp-scsi-commands-info.h: $(SRC_PATH)/hmp-commands-info.hx $(SRC_PATH)/scripts/hxtool
+	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -tgt scsi < $< > $@)
+endif
+
 clean: clean-target
 	rm -f *.a *~ $(PROGS)
 	rm -f $(shell find . -name '*.[od]')
-	rm -f hmp-commands.h gdbstub-xml.c
+	rm -f hmp-commands.h gdbstub-xml.c hmp-scsi-commands.h hmp-scsi-commands-info.h
 	rm -f trace/generated-helpers.c trace/generated-helpers.c-timestamp
 ifdef CONFIG_TRACE_SYSTEMTAP
 	rm -f *.stp
diff --git a/block/Makefile.objs b/block/Makefile.objs
index 3e7513967c..734548d48f 100644
--- a/block/Makefile.objs
+++ b/block/Makefile.objs
@@ -76,3 +76,6 @@ parallels.o-cflags := $(LIBXML2_CFLAGS)
 parallels.o-libs   := $(LIBXML2_LIBS)
 
 remote-pci-obj-$(CONFIG_MPQEMU) += stream.o
+remote-pci-obj-$(CONFIG_MPQEMU) += qapi-sysemu.o
+
+remote-lsi-obj-$(CONFIG_MPQEMU) += monitor/
diff --git a/block/monitor/Makefile.objs b/block/monitor/Makefile.objs
index 0a74f9a8b5..a0c898711f 100644
--- a/block/monitor/Makefile.objs
+++ b/block/monitor/Makefile.objs
@@ -1 +1,3 @@
 common-obj-y += block-hmp-cmds.o
+
+remote-lsi-obj-$(CONFIG_MPQEMU) += block-hmp-cmds.o
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 1b60676d7c..54d01a055f 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -12,6 +12,7 @@ HXCOMM HXCOMM can be used for comments, discarded from both rST and C.
         .params     = "[cmd]",
         .help       = "show the help",
         .cmd        = hmp_do_help_cmd,
+        .targets    = "scsi",
         .flags      = "p",
     },
 
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index e3e80848c8..251b77bc4c 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -49,3 +49,4 @@ remote-pci-obj-$(CONFIG_MPQEMU) += numa.o
 remote-pci-obj-$(CONFIG_MPQEMU) += cpu.o
 remote-pci-obj-$(CONFIG_MPQEMU) += vmstate-if.o
 remote-pci-obj-$(CONFIG_MPQEMU) += resettable.o
+remote-pci-obj-$(CONFIG_MPQEMU) += machine-qmp-cmds.o
diff --git a/monitor/Makefile.objs b/monitor/Makefile.objs
index a8533c9dd7..b6949be297 100644
--- a/monitor/Makefile.objs
+++ b/monitor/Makefile.objs
@@ -4,3 +4,7 @@ common-obj-y += qmp-cmds.o qmp-cmds-control.o
 common-obj-y += hmp-cmds.o
 
 storage-daemon-obj-y += monitor.o qmp.o qmp-cmds-control.o
+
+remote-pci-obj-$(CONFIG_MPQEMU) += monitor.o qmp.o hmp.o
+remote-pci-obj-$(CONFIG_MPQEMU) += qmp-cmds.o qmp-cmds-control.o
+remote-pci-obj-$(CONFIG_MPQEMU) += hmp-cmds.o
diff --git a/monitor/misc.c b/monitor/misc.c
index c0eee6f4ab..edda4cce17 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1679,13 +1679,21 @@ int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
 
 /* Please update hmp-commands.hx when adding or changing commands */
 static HMPCommand hmp_info_cmds[] = {
+#if defined(SCSI_PROCESS)
+#include "hmp-scsi-commands-info.h"
+#else
 #include "hmp-commands-info.h"
+#endif
     { NULL, NULL, },
 };
 
 /* hmp_cmds and hmp_info_cmds would be sorted at runtime */
 HMPCommand hmp_cmds[] = {
+#if defined(SCSI_PROCESS)
+#include "hmp-scsi-commands.h"
+#else
 #include "hmp-commands.h"
+#endif
     { NULL, NULL, },
 };
 
diff --git a/qapi/Makefile.objs b/qapi/Makefile.objs
index 4673ab7490..f7433d6a73 100644
--- a/qapi/Makefile.objs
+++ b/qapi/Makefile.objs
@@ -36,3 +36,5 @@ QAPI_MODULES_STORAGE_DAEMON = block-core char common control crypto
 QAPI_MODULES_STORAGE_DAEMON += introspect job qom sockets pragma transaction
 
 storage-daemon-obj-y += $(QAPI_MODULES_STORAGE_DAEMON:%=qapi-commands-%.o)
+
+remote-pci-obj-$(CONFIG_MPQEMU) += $(QAPI_COMMON_MODULES:%=qapi-commands-%.o)
diff --git a/qom/Makefile.objs b/qom/Makefile.objs
index 7e9455db90..546f9fbde6 100644
--- a/qom/Makefile.objs
+++ b/qom/Makefile.objs
@@ -6,3 +6,4 @@ storage-daemon-obj-y += qom-qmp-cmds.o
 
 remote-pci-obj-$(CONFIG_MPQEMU) += object.o qom-qobject.o container.o
 remote-pci-obj-$(CONFIG_MPQEMU) += object_interfaces.o
+remote-pci-obj-$(CONFIG_MPQEMU) += qom-qmp-cmds.o qom-hmp-cmds.o
diff --git a/stubs/monitor.c b/stubs/monitor.c
index 79c5571b2d..b845a95d5c 100644
--- a/stubs/monitor.c
+++ b/stubs/monitor.c
@@ -37,6 +37,7 @@
 #pragma weak monitor_printf
 #pragma weak monitor_cur_is_qmp
 #pragma weak qmp_device_list_properties
+#pragma weak monitor_fdsets_cleanup
 
 __thread Monitor *cur_mon;
 
diff --git a/ui/Makefile.objs b/ui/Makefile.objs
index e6da6ff047..c3ac572d6b 100644
--- a/ui/Makefile.objs
+++ b/ui/Makefile.objs
@@ -68,3 +68,5 @@ console-gl.o-libs += $(OPENGL_LIBS)
 egl-helpers.o-libs += $(OPENGL_LIBS)
 egl-context.o-libs += $(OPENGL_LIBS)
 egl-headless.o-libs += $(OPENGL_LIBS)
+
+remote-lsi-obj-$(CONFIG_MPQEMU) += vnc-stubs.o
-- 
2.25.GIT


