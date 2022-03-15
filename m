Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30934D9E14
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:50:40 +0100 (CET)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU8VT-0000Ya-SN
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:50:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU8MT-0007g1-8D
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU8MQ-0001FM-0n
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647355277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GpLAuFA5vT75sGSG5OQ8FPkF5tQT2epJyXCoizc7WTE=;
 b=fV5jRXxx8VxZ0KIawocFmUMegjTA0uPjTaTqb/1GJDvHcGjBjhG2UYa9l5Gn++8Nko7eJi
 i6IIAuA/Ee2+6635Fy57uwTjS1gqzG5LNpREkZVopc1Ul4cIsjFlKY+ombHvVzrFBljxA6
 8eTmGm+9kSWZbgMDTk0YSaFefyTBx6k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-pxtGn3DQPo-c7JCbB1OG1A-1; Tue, 15 Mar 2022 10:41:12 -0400
X-MC-Unique: pxtGn3DQPo-c7JCbB1OG1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3C983C16503;
 Tue, 15 Mar 2022 14:41:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87B3EC202C9;
 Tue, 15 Mar 2022 14:41:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Don't include sysemu/tcg.h if it is not necessary
Date: Tue, 15 Mar 2022 15:41:07 +0100
Message-Id: <20220315144107.1012530-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This header only defines the tcg_allowed variable and the tcg_enabled()
function - which are not required in many files that include this
header. Drop the #include statement there.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 accel/tcg/hmp.c                  | 1 -
 accel/tcg/tcg-accel-ops-icount.c | 1 -
 bsd-user/main.c                  | 1 -
 hw/virtio/vhost.c                | 1 -
 linux-user/main.c                | 1 -
 monitor/misc.c                   | 1 -
 target/arm/helper.c              | 1 -
 target/s390x/cpu_models_sysemu.c | 1 -
 target/s390x/helper.c            | 1 -
 9 files changed, 9 deletions(-)

diff --git a/accel/tcg/hmp.c b/accel/tcg/hmp.c
index d2ea352655..bb67941420 100644
--- a/accel/tcg/hmp.c
+++ b/accel/tcg/hmp.c
@@ -4,7 +4,6 @@
 #include "qapi/qapi-commands-machine.h"
 #include "exec/exec-all.h"
 #include "monitor/monitor.h"
-#include "sysemu/tcg.h"
 
 static void hmp_tcg_register(void)
 {
diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index bdaf2c943b..8827e1d2cc 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -25,7 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
-#include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 88d347d05e..e274dd92d7 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -27,7 +27,6 @@
 #include "qemu-common.h"
 #include "qemu/units.h"
 #include "qemu/accel.h"
-#include "sysemu/tcg.h"
 #include "qemu-version.h"
 #include <machine/trap.h>
 
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index b643f42ea4..c9bf01a424 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -26,7 +26,6 @@
 #include "migration/blocker.h"
 #include "migration/qemu-file-types.h"
 #include "sysemu/dma.h"
-#include "sysemu/tcg.h"
 #include "trace.h"
 
 /* enabled until disconnected backend stabilizes */
diff --git a/linux-user/main.c b/linux-user/main.c
index fbc9bcfd5f..f1711b82ec 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -21,7 +21,6 @@
 #include "qemu-common.h"
 #include "qemu/units.h"
 #include "qemu/accel.h"
-#include "sysemu/tcg.h"
 #include "qemu-version.h"
 #include <sys/syscall.h>
 #include <sys/resource.h>
diff --git a/monitor/misc.c b/monitor/misc.c
index b1839cb8ee..b5ca141e1d 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -48,7 +48,6 @@
 #include "qapi/util.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/tcg.h"
 #include "sysemu/tpm.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 088956eecf..94221a3e8d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -27,7 +27,6 @@
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
-#include "sysemu/tcg.h"
 #include "qemu/range.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
diff --git a/target/s390x/cpu_models_sysemu.c b/target/s390x/cpu_models_sysemu.c
index 05c3ccaaff..d8a141a023 100644
--- a/target/s390x/cpu_models_sysemu.c
+++ b/target/s390x/cpu_models_sysemu.c
@@ -15,7 +15,6 @@
 #include "s390x-internal.h"
 #include "kvm/kvm_s390x.h"
 #include "sysemu/kvm.h"
-#include "sysemu/tcg.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qapi/qmp/qerror.h"
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 6e35473c7f..473c8e51b0 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -27,7 +27,6 @@
 #include "hw/s390x/pv.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#include "sysemu/tcg.h"
 
 void s390x_tod_timer(void *opaque)
 {
-- 
2.27.0


