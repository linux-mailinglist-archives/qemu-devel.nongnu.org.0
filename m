Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049DE2953D9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 23:07:35 +0200 (CEST)
Received: from localhost ([::1]:57640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVLKY-0007rV-2F
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 17:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVLB3-0005lc-H1
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 16:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVLAx-0006fK-CB
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 16:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603313846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=joMLROSh5hWNvzYW2mRufD5bQKbfXZEfJ+2cbsoVqIk=;
 b=GrGtn2yeGPQck0cr+D3ojOAWGFPM/DVmzp0nHhdUujp3KYcX6tLaiv76jkr4IULMi0sshb
 i/buDz9vJyx3CpNxleod6va94tbFI+Q/OvBZEHW8HXuNZeGe+MOMkAIHADeSloVAiNKNmP
 1KciPK/Oryx0/ZmcVfV98keA8/vv3Hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-evHRjnNqOKq-TFnj-vvSAQ-1; Wed, 21 Oct 2020 16:57:24 -0400
X-MC-Unique: evHRjnNqOKq-TFnj-vvSAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 398B35F9C6
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 20:57:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C04CA6EF62;
 Wed, 21 Oct 2020 20:57:22 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/22] vl: move various initialization routines out of
 qemu_init
Date: Wed, 21 Oct 2020 16:57:03 -0400
Message-Id: <20201021205716.2359430-10-pbonzini@redhat.com>
In-Reply-To: <20201021205716.2359430-1-pbonzini@redhat.com>
References: <20201021205716.2359430-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some very simple initialization routines can be nested in existing
subsystem-level functions, do that to simplify qemu_init.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c      | 3 +++
 include/hw/qdev-core.h | 8 --------
 migration/migration.c  | 4 ++++
 softmmu/qdev-monitor.c | 6 ------
 softmmu/vl.c           | 5 -----
 5 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 70b1e5e8e8..3c674bb05e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -873,6 +873,9 @@ static void machine_initfn(Object *obj)
     MachineState *ms = MACHINE(obj);
     MachineClass *mc = MACHINE_GET_CLASS(obj);
 
+    container_get(obj, "/peripheral");
+    container_get(obj, "/peripheral-anon");
+
     ms->dump_guest_core = true;
     ms->mem_merge = true;
     ms->enable_graphics = true;
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 868973319e..56ce7f2d7f 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -769,14 +769,6 @@ BusState *sysbus_get_default(void);
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
index deb6005b8d..f48b03cac2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -169,6 +169,10 @@ void migration_object_init(void)
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
index bcfb90a08f..bcfcbac181 100644
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
index 2e1714d7a4..a9f69a7d11 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4269,10 +4269,6 @@ void qemu_init(int argc, char **argv, char **envp)
         exit(1);
     }
 
-    blk_mig_init();
-    ram_mig_init();
-    dirty_bitmap_mig_init();
-
     qemu_opts_foreach(qemu_find_opts("mon"),
                       mon_init_func, NULL, &error_fatal);
 
@@ -4305,7 +4301,6 @@ void qemu_init(int argc, char **argv, char **envp)
        reading from the other reads, because timer polling functions query
        clock values from the log. */
     replay_checkpoint(CHECKPOINT_INIT);
-    qdev_machine_init();
 
     current_machine->boot_order = boot_order;
 
-- 
2.26.2



