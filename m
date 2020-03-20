Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF018D682
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 19:05:26 +0100 (CET)
Received: from localhost ([::1]:57346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFM1N-0007uW-Fc
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 14:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <765dc71935420b8f517ffb72100e8b3fec8e4c9b@lizzy.crudebyte.com>)
 id 1jFLzy-0006bZ-IO
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 14:03:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <765dc71935420b8f517ffb72100e8b3fec8e4c9b@lizzy.crudebyte.com>)
 id 1jFLzx-00048O-6z
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 14:03:58 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:35947)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <765dc71935420b8f517ffb72100e8b3fec8e4c9b@lizzy.crudebyte.com>)
 id 1jFLzx-0002qd-0B
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 14:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=waLIntpzbDuSwKzCLHhytuC1f3yRX6jYMW8l3WUmV68=; b=po4vQ
 8SdSuDFGht0NckrRMVXhFLITe49upClW+dFzkyLTvk/34VMic/VBk5B7pe7RAn0/O56n8jSeSOnGB
 ubKtRsGOUdDEQ5P0S4OK7J/Guj89J8rj9dw4SWZ9K/KTeIPcJoCVRhm9COJGVnG50uDZIxXIlUUa6
 Daz2of6+FF87hFEmKSZqINot09uktUGHEmzRpgt3TI4RbG9K2aN5aQ59BGz4e+1cXAbqvhMmhc6kh
 GORpGUDGuj7iUQ9S/JzpxkvIceiK/1war7p9vjnsqNPE8GCrL1tVdGY+AC5GxpssrxzmeXakULMiw
 /tE3ynUlP7dgCYRyqX8tbrZPkLx5g==;
Message-Id: <765dc71935420b8f517ffb72100e8b3fec8e4c9b.1584723662.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1584723662.git.qemu_oss@crudebyte.com>
References: <cover.1584723662.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 20 Mar 2020 17:48:53 +0100
Subject: [PATCH v2 2/4] qemu: capabilities: add QEMU_CAPS_VIRTFS_MULTIDEVS
To: libvir-list@redhat.com
Cc: qemu-devel@nongnu.org,
    Greg Kurz <groug@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.194.90.13
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU 9pfs 'multidevs' option exists since QEMU 4.2, so just
set this capability based on that QEMU version.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 src/qemu/qemu_capabilities.c                      | 5 +++++
 src/qemu/qemu_capabilities.h                      | 1 +
 tests/qemucapabilitiesdata/caps_4.2.0.x86_64.xml  | 1 +
 tests/qemucapabilitiesdata/caps_5.0.0.aarch64.xml | 1 +
 tests/qemucapabilitiesdata/caps_5.0.0.x86_64.xml  | 1 +
 5 files changed, 9 insertions(+)

diff --git a/src/qemu/qemu_capabilities.c b/src/qemu/qemu_capabilities.c
index a95a60c36a..68b6e166e9 100644
--- a/src/qemu/qemu_capabilities.c
+++ b/src/qemu/qemu_capabilities.c
@@ -567,6 +567,7 @@ VIR_ENUM_IMPL(virQEMUCaps,
               "query-named-block-nodes.flat",
               "blockdev-snapshot.allow-write-only-overlay",
               "blockdev-reopen",
+              "virtfs-multidevs",
     );
 
 
@@ -4837,6 +4838,10 @@ virQEMUCapsInitQMPVersionCaps(virQEMUCapsPtr qemuCaps)
         ARCH_IS_PPC64(qemuCaps->arch)) {
         virQEMUCapsSet(qemuCaps, QEMU_CAPS_MACHINE_PSERIES_MAX_CPU_COMPAT);
     }
+
+    /* -virtfs multidevs option is supported since QEMU 4.2 */
+    if (qemuCaps->version >= 4002000)
+        virQEMUCapsSet(qemuCaps, QEMU_CAPS_VIRTFS_MULTIDEVS);
 }
 
 
diff --git a/src/qemu/qemu_capabilities.h b/src/qemu/qemu_capabilities.h
index f0961e273c..a6025312be 100644
--- a/src/qemu/qemu_capabilities.h
+++ b/src/qemu/qemu_capabilities.h
@@ -548,6 +548,7 @@ typedef enum { /* virQEMUCapsFlags grouping marker for syntax-check */
     QEMU_CAPS_QMP_QUERY_NAMED_BLOCK_NODES_FLAT, /* query-named-block-nodes supports the 'flat' option */
     QEMU_CAPS_BLOCKDEV_SNAPSHOT_ALLOW_WRITE_ONLY, /* blockdev-snapshot has the 'allow-write-only-overlay' feature */
     QEMU_CAPS_BLOCKDEV_REOPEN, /* 'blockdev-reopen' qmp command is supported */
+    QEMU_CAPS_VIRTFS_MULTIDEVS, /* -virtfs multidevs supported by virtio-9p */
 
     QEMU_CAPS_LAST /* this must always be the last item */
 } virQEMUCapsFlags;
diff --git a/tests/qemucapabilitiesdata/caps_4.2.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_4.2.0.x86_64.xml
index 83e804ea36..d8b0de46cd 100644
--- a/tests/qemucapabilitiesdata/caps_4.2.0.x86_64.xml
+++ b/tests/qemucapabilitiesdata/caps_4.2.0.x86_64.xml
@@ -223,6 +223,7 @@
   <flag name='rng-builtin'/>
   <flag name='virtio-net.failover'/>
   <flag name='vhost-user-fs'/>
+  <flag name='virtfs-multidevs'/>
   <version>4002000</version>
   <kvmVersion>0</kvmVersion>
   <microcodeVersion>43100242</microcodeVersion>
diff --git a/tests/qemucapabilitiesdata/caps_5.0.0.aarch64.xml b/tests/qemucapabilitiesdata/caps_5.0.0.aarch64.xml
index e52c60607d..3a695fbe79 100644
--- a/tests/qemucapabilitiesdata/caps_5.0.0.aarch64.xml
+++ b/tests/qemucapabilitiesdata/caps_5.0.0.aarch64.xml
@@ -181,6 +181,7 @@
   <flag name='virtio-net.failover'/>
   <flag name='cpu.kvm-no-adjvtime'/>
   <flag name='vhost-user-fs'/>
+  <flag name='virtfs-multidevs'/>
   <version>4002050</version>
   <kvmVersion>0</kvmVersion>
   <microcodeVersion>61700241</microcodeVersion>
diff --git a/tests/qemucapabilitiesdata/caps_5.0.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_5.0.0.x86_64.xml
index d773f7e356..95fa0813dd 100644
--- a/tests/qemucapabilitiesdata/caps_5.0.0.x86_64.xml
+++ b/tests/qemucapabilitiesdata/caps_5.0.0.x86_64.xml
@@ -226,6 +226,7 @@
   <flag name='vhost-user-fs'/>
   <flag name='query-named-block-nodes.flat'/>
   <flag name='blockdev-snapshot.allow-write-only-overlay'/>
+  <flag name='virtfs-multidevs'/>
   <version>4002050</version>
   <kvmVersion>0</kvmVersion>
   <microcodeVersion>43100241</microcodeVersion>
-- 
2.20.1


