Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E42CB80D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:03:40 +0100 (CET)
Received: from localhost ([::1]:52532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkO31-0001gM-8X
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCq-0003PU-VG
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCO-0003l5-VQ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXlx77nAu/WTPjVpsK5XPof+OySlzhG7W+nrmLVlxGg=;
 b=GmgBIDeCIuTbUi7V8aRhKmTs8mlpwrPUJTj49KMy2kmD4+Ao3Wb/w331xRUfTEd8VRmJ/U
 ER2qSwua+lHPaqygyoT/viOw1QNSlbOzNMIxZQn6rx/3MzIYgEFSOHjzkP8ccrankma4z4
 E+7JuwGLJxpJCYGrmXZFo2B9WhbK2Fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-jsJ0p7pdPmmR1Rl7tR3mWA-1; Wed, 02 Dec 2020 03:09:14 -0500
X-MC-Unique: jsJ0p7pdPmmR1Rl7tR3mWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76C59803657
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A92110013BD
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:13 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 063/113] vl: load plugins as late as possible
Date: Wed,  2 Dec 2020 03:07:59 -0500
Message-Id: <20201202080849.4125477-64-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no need to load plugins in the middle of default device processing,
move -plugin handling just before preconfig is entered.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index a4b87ae742..cb4b870f09 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -125,6 +125,7 @@ static const char *boot_order;
 static const char *boot_once;
 static const char *incoming;
 static const char *loadvm;
+static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 static int mem_prealloc; /* force preallocation of physical target memory */
 int display_opengl;
@@ -3078,6 +3079,11 @@ static void qemu_init_board(void)
         create_default_memdev(current_machine, mem_path);
     }
 
+    /* process plugin before CPUs are created, but once -smp has been parsed */
+    if (qemu_plugin_load_list(&plugin_list)) {
+        exit(1);
+    }
+
     machine_run_board_init(current_machine);
 
     /*
@@ -3212,7 +3218,6 @@ void qemu_init(int argc, char **argv, char **envp)
     Error *err = NULL;
     bool have_custom_ram_size;
     BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
-    QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
 
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
@@ -4182,11 +4187,6 @@ void qemu_init(int argc, char **argv, char **envp)
                                machine_class->default_machine_opts, 0);
     }
 
-    /* process plugin before CPUs are created, but once -smp has been parsed */
-    if (qemu_plugin_load_list(&plugin_list)) {
-        exit(1);
-    }
-
     qemu_opts_foreach(qemu_find_opts("device"),
                       default_driver_check, NULL, NULL);
     qemu_opts_foreach(qemu_find_opts("global"),
-- 
2.26.2



