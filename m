Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03E02C0D2F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:25:58 +0100 (CET)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCmz-0001da-Sb
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcE-0002zl-OZ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcB-0007jz-3L
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+4b/gxmOxkePzojbW9XT0AhSQo5i8jpL0dQ4zDtFFQ=;
 b=IpNLCn/XBifbJqzj/aQQMRIlHgsiu6wvZ1aqSxOIpaK76uy13wN3nuoR29BCGwe9rqBWST
 2SzeyXqb2bh0ZcoE581ceiTQawcDvyRVqa60lifgeEbeGH/XuU+BaY19ehbu/rE0cAm3H+
 stTanA4hkI2BTrBHNjz5N+Jh2hVN/fM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-ipO9VHy-MCKywd0f1iGvRg-1; Mon, 23 Nov 2020 09:14:44 -0500
X-MC-Unique: ipO9VHy-MCKywd0f1iGvRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A83B018B9ED7
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 681C15D9E2;
 Mon, 23 Nov 2020 14:14:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/36] vl: load plugins as late as possible
Date: Mon, 23 Nov 2020 09:14:11 -0500
Message-Id: <20201123141435.2726558-13-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no need to load plugins in the middle of default device processing,
move -plugin handling just before preconfig is entered.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 87c10f625c..ab08a0290c 100644
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
@@ -3074,6 +3075,11 @@ static void qemu_init_board(void)
         create_default_memdev(current_machine, mem_path);
     }
 
+    /* process plugin before CPUs are created, but once -smp has been parsed */
+    if (qemu_plugin_load_list(&plugin_list)) {
+        exit(1);
+    }
+
     machine_run_board_init(current_machine);
 
     /*
@@ -3208,7 +3214,6 @@ void qemu_init(int argc, char **argv, char **envp)
     Error *err = NULL;
     bool have_custom_ram_size;
     BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
-    QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
 
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
@@ -4178,11 +4183,6 @@ void qemu_init(int argc, char **argv, char **envp)
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



