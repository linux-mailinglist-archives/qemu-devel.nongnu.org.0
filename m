Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F772C0D13
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:19:08 +0100 (CET)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCgN-00082C-45
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCc7-0002ol-KV
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCc5-0007hR-W6
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Usp35wofMlITjnrgSzeqe5CcA89RmTwA6lUe1JlMnA=;
 b=UtSmHfbDoBjuhW1KLx31mg+xD06yKXeq22w5g/D6FRc01uUIMFZNYTifSlUK95Dcm5q2rP
 JJ6NWMiMm9Q5Us4Bpa644A63Zylb2Ab/o94TLXSeLHKukrCE+I1eL92huhHWYALDrXbNZ5
 hcVCl+3/4juhOKvoR6huJkoc7U3y9qE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-0W7oF2XVOQOlQ0btYxGxIQ-1; Mon, 23 Nov 2020 09:14:38 -0500
X-MC-Unique: 0W7oF2XVOQOlQ0btYxGxIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1C51100C606
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6330C5D6D3;
 Mon, 23 Nov 2020 14:14:37 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/36] vl: move various initialization routines out of
 qemu_init
Date: Mon, 23 Nov 2020 09:14:03 -0500
Message-Id: <20201123141435.2726558-5-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some very simple initialization routines can be nested in existing
subsystem-level functions, do that to simplify qemu_init.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c      | 3 +++
 include/hw/qdev-core.h | 8 --------
 migration/migration.c  | 4 ++++
 softmmu/qdev-monitor.c | 6 ------
 softmmu/vl.c           | 5 -----
 5 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index cd298fac13..5260155962 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -874,6 +874,9 @@ static void machine_initfn(Object *obj)
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
 
+    container_get(obj, "/peripheral");
+    container_get(obj, "/peripheral-anon");
+
     ms->dump_guest_core = true;
     ms->mem_merge = true;
     ms->enable_graphics = true;
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 5e737195b5..b77a2f1da7 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -785,14 +785,6 @@ BusState *sysbus_get_default(void);
 char *qdev_get_fw_dev_path(DeviceState *dev);
 char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev);
 
-/**
- * @qdev_machine_init
- *
- * Initialize platform devices before machine init.  This is a hack until full
- * support for composition is added.
- */
-void qdev_machine_init(void);
-
 /**
  * device_legacy_reset:
  *
diff --git a/migration/migration.c b/migration/migration.c
index 87a9b59f83..d9e94f4080 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -182,6 +182,10 @@ void migration_object_init(void)
         error_report_err(err);
         exit(1);
     }
+
+    blk_mig_init();
+    ram_mig_init();
+    dirty_bitmap_mig_init();
 }
 
 void migration_shutdown(void)
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index bf79d0bbcd..d060e765da 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -943,12 +943,6 @@ BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
     return blk;
 }
 
-void qdev_machine_init(void)
-{
-    qdev_get_peripheral_anon();
-    qdev_get_peripheral();
-}
-
 QemuOptsList qemu_device_opts = {
     .name = "device",
     .implied_opt_name = "driver",
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 07378301d5..b8d65ac532 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4276,10 +4276,6 @@ void qemu_init(int argc, char **argv, char **envp)
         exit(1);
     }
 
-    blk_mig_init();
-    ram_mig_init();
-    dirty_bitmap_mig_init();
-
     qemu_opts_foreach(qemu_find_opts("mon"),
                       mon_init_func, NULL, &error_fatal);
 
@@ -4312,7 +4308,6 @@ void qemu_init(int argc, char **argv, char **envp)
        reading from the other reads, because timer polling functions query
        clock values from the log. */
     replay_checkpoint(CHECKPOINT_INIT);
-    qdev_machine_init();
 
     current_machine->boot_order = boot_order;
 
-- 
2.26.2



