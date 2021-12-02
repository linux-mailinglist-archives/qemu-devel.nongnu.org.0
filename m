Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C431B465E97
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:18:50 +0100 (CET)
Received: from localhost ([::1]:59736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgMj-0000GU-8y
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:18:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9N-0005Ul-S6
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9K-0006Ei-4Y
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgOQImmELR5gZTjk61q9HwrQaUNRwQHpb81Id/yHJpg=;
 b=BkJzX0/dLDeb71/BDJzvQY4e44r0x/1fusaumHKrhLuRBgKzEjaLCB7ojEgLsrlu30WrWf
 ktbXrq4ikslbBZp6ZTQvGJoShcAIO15c0zTCNTMijGGPEi7VQS6/8gBc44PDEVqgwgj+4K
 r18t+TxAUHAbeV12refSBEukIqbx25Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-zdT1qTnXPK-sQIav3ywPzA-1; Thu, 02 Dec 2021 02:04:54 -0500
X-MC-Unique: zdT1qTnXPK-sQIav3ywPzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64322100CCC0;
 Thu,  2 Dec 2021 07:04:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E3E55D6BA;
 Thu,  2 Dec 2021 07:04:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2231F11384A5; Thu,  2 Dec 2021 08:04:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 06/11] vl: Factor qemu_until_phase() out of qemu_init()
Date: Thu,  2 Dec 2021 08:04:45 +0100
Message-Id: <20211202070450.264743-7-armbru@redhat.com>
In-Reply-To: <20211202070450.264743-1-armbru@redhat.com>
References: <20211202070450.264743-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com,
 edgar.iglesias@gmail.co, mirela.grujic@greensocs.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This loses a hidden bit of CLI that evaded the axe murderer: picking
the default accelerator based on argv[0].

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/qdev-core.h |  1 +
 hw/core/qdev.c         |  5 +++++
 softmmu/vl.c           | 16 ++++++++++++----
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 20d3066595..2a3a3b0118 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -876,6 +876,7 @@ typedef enum MachineInitPhase {
 } MachineInitPhase;
 
 extern bool phase_check(MachineInitPhase phase);
+extern MachineInitPhase phase_get(void);
 extern void phase_advance(MachineInitPhase phase);
 
 #endif
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..287eb81ff8 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -915,6 +915,11 @@ bool phase_check(MachineInitPhase phase)
     return machine_phase >= phase;
 }
 
+MachineInitPhase phase_get(void)
+{
+    return machine_phase;
+}
+
 void phase_advance(MachineInitPhase phase)
 {
     assert(machine_phase == phase - 1);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 916cba35b7..e340475986 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -963,12 +963,10 @@ static void qemu_machine_creation_done(void)
         assert(machine->cgs->ready);
     }
 }
+static void qemu_until_phase(void);
 
 void qemu_init(int argc, char **argv, char **envp)
 {
-    MachineClass *machine_class;
-    FILE *vmstate_dump_file = NULL;
-
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
     qemu_add_drive_opts(&qemu_common_drive_opts);
@@ -1037,6 +1035,16 @@ void qemu_init(int argc, char **argv, char **envp)
         }
     }
 
+    qemu_until_phase();
+}
+
+void qemu_until_phase(void)
+{
+    MachineClass *machine_class;
+    FILE *vmstate_dump_file = NULL;
+
+    assert(phase_get() == PHASE_NO_MACHINE);
+
     qemu_process_early_options();
 
     qemu_maybe_daemonize(pid_file);
@@ -1073,7 +1081,7 @@ void qemu_init(int argc, char **argv, char **envp)
      * Note: uses machine properties such as kernel-irqchip, must run
      * after qemu_apply_machine_options.
      */
-    configure_accelerators(argv[0]);
+    configure_accelerators("FIXME");
     phase_advance(PHASE_ACCEL_CREATED);
 
     /*
-- 
2.31.1


