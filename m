Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D672C0D7F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:31:04 +0100 (CET)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCrv-0000Cr-UM
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcL-00034c-U2
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcG-0007n5-BO
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgCzhc2Hpg0p6QXTCSufcMxAwLK2IBX/853ecUDZTe4=;
 b=QDyur1g5l+705DDfToHnT1o3RPtGEUxoKxXRgafpJKU8zus9W3HLp/ASDxj9HEx27e1ArS
 Yow4WPQbL2mbFnkZDfWA1MLYE5s7lmuFNaRzP8VhufAUCNqDZyJxnBbAwo/GicOet6GGJI
 qRhueTKnTPKxDEqcw1UE0aebd6qf2LA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-0KAVjmp2PcOoq0A9pkNPnA-1; Mon, 23 Nov 2020 09:14:48 -0500
X-MC-Unique: 0KAVjmp2PcOoq0A9pkNPnA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B575381CBF5
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:47 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 654DD5D9E2;
 Mon, 23 Nov 2020 14:14:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/36] vl: move CHECKPOINT_INIT after preconfig
Date: Mon, 23 Nov 2020 09:14:14 -0500
Message-Id: <20201123141435.2726558-16-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move CHECKPOINT_INIT right before the machine initialization is
completed.  Everything before is essentially an extension of
command line parsing.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 5 +++++
 softmmu/vl.c      | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 7ef3de5ce5..a5cfbcc7cb 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1107,6 +1107,11 @@ void machine_run_board_init(MachineState *machine)
     ObjectClass *oc = object_class_by_name(machine->cpu_type);
     CPUClass *cc;
 
+    /* This checkpoint is required by replay to separate prior clock
+       reading from the other reads, because timer polling functions query
+       clock values from the log. */
+    replay_checkpoint(CHECKPOINT_INIT);
+
     if (machine->ram_memdev_id) {
         Object *o;
         o = object_resolve_path_type(machine->ram_memdev_id,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b6c62e1e4f..dc0cdc3417 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4437,11 +4437,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_semihosting_connect_chardevs();
     qemu_semihosting_console_init();
 
-    /* This checkpoint is required by replay to separate prior clock
-       reading from the other reads, because timer polling functions query
-       clock values from the log. */
-    replay_checkpoint(CHECKPOINT_INIT);
-
     current_machine->boot_order = boot_order;
 
     /* parse features once if machine provides default cpu_type */
-- 
2.26.2



