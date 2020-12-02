Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197CA2CB812
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:07:01 +0100 (CET)
Received: from localhost ([::1]:60446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkO6G-0005RM-50
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkND2-0003T6-0D
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCQ-0003lW-7B
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bI5QmuHOd6rGXtDKNlB/F7CiIBhyGEFj5Yhm9bPi2Eg=;
 b=S4lnZrMTzurZ902G/acYUgceIDMZN8JXSP4M2VNeldcw4qa6OMQZzyXB3PMRC/C/ni5OHV
 cMB2UhXxxGUCHdu7SRsnpHv0+6ERHmbIUcQbWvJsTqxkHQO/IJSjOcAPCYAEO1drBsSgC0
 V+BD4dtWTGzGQunb1WMb1VB59j2u7mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-ACG2gtFFO5e90y6GPQDayQ-1; Wed, 02 Dec 2020 03:09:15 -0500
X-MC-Unique: ACG2gtFFO5e90y6GPQDayQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C4E91074641
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:14 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 006E210013BD
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:13 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 065/113] vl: move CHECKPOINT_INIT after preconfig
Date: Wed,  2 Dec 2020 03:08:01 -0500
Message-Id: <20201202080849.4125477-66-pbonzini@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Move CHECKPOINT_INIT right before the machine initialization is
completed.  Everything before is essentially an extension of
command line parsing.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
index 1a80a9a68d..91ef21833b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4443,11 +4443,6 @@ void qemu_init(int argc, char **argv, char **envp)
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



