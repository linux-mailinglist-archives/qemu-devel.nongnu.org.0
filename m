Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA2465EB9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:29:58 +0100 (CET)
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgXV-0006OJ-Cd
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:29:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9R-0005Uv-OR
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9P-0006Fq-7V
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8EqVkmzqmqCQWqBVGCOG6CginlB03sF2CtaIT4y6+NA=;
 b=PkUpoRr9p4w+fEDcHX7pSf3pSElyyv0Y7WGCiwFRFEUf6x9a3GdFNP/fsKCwbdAS5VovgW
 kUWbBESHksMqo6EiBo4ZUyDe9AZ7pNS+L9mtYUWvi3vejkEbazHawp9T/H5IvfsKUxscy0
 OfIIsdCWdQ3w2oxGr3aGa3fYMdRiqKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-GUVZfxhiPumTd57Y42XruQ-1; Thu, 02 Dec 2021 02:04:59 -0500
X-MC-Unique: GUVZfxhiPumTd57Y42XruQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72489100CCC0;
 Thu,  2 Dec 2021 07:04:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 341A25C232;
 Thu,  2 Dec 2021 07:04:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2B0EC1138221; Thu,  2 Dec 2021 08:04:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 08/11] vl: Implement qemu_until_phase() running to
 arbitrary phase
Date: Thu,  2 Dec 2021 08:04:47 +0100
Message-Id: <20211202070450.264743-9-armbru@redhat.com>
In-Reply-To: <20211202070450.264743-1-armbru@redhat.com>
References: <20211202070450.264743-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

A later patch will want to use qemu_until_phase() to advance from one
arbitrary phase to another.  The previous commit implement advancing
from arbitrary phase to PHASE_MACHINE_READY.  This one implements
advancing to a phase given as argument.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/vl.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b7f15d9f86..148c39e22c 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -963,7 +963,8 @@ static void qemu_machine_creation_done(void)
         assert(machine->cgs->ready);
     }
 }
-static void qemu_until_phase(void);
+
+static void qemu_until_phase(MachineInitPhase phase);
 
 void qemu_init(int argc, char **argv, char **envp)
 {
@@ -1035,16 +1036,21 @@ void qemu_init(int argc, char **argv, char **envp)
         }
     }
 
-    qemu_until_phase();
+    qemu_until_phase(PHASE_MACHINE_READY);
 }
 
-void qemu_until_phase(void)
+void qemu_until_phase(MachineInitPhase phase)
 {
     MachineClass *machine_class;
     FILE *vmstate_dump_file = NULL;
 
+    assert(phase >= phase_get());
+
     switch (phase_get()) {
     case PHASE_NO_MACHINE:
+    if (phase == PHASE_NO_MACHINE) {
+        break;
+    }
 
     qemu_process_early_options();
 
@@ -1080,6 +1086,9 @@ void qemu_until_phase(void)
 
     /* fall through */
     case PHASE_MACHINE_CREATED:
+    if (phase == PHASE_MACHINE_CREATED) {
+        break;
+    }
 
     /*
      * Note: uses machine properties such as kernel-irqchip, must run
@@ -1090,6 +1099,9 @@ void qemu_until_phase(void)
 
     /* fall through */
     case PHASE_ACCEL_CREATED:
+    if (phase == PHASE_ACCEL_CREATED) {
+        break;
+    }
 
     /*
      * Beware, QOM objects created before this point miss global and
@@ -1139,6 +1151,9 @@ void qemu_until_phase(void)
 
     /* fall through */
     case PHASE_MACHINE_INITIALIZED:
+    if (phase == PHASE_MACHINE_INITIALIZED) {
+        break;
+    }
 
     qemu_machine_creation_done();
     assert(phase_get() == PHASE_MACHINE_READY);
-- 
2.31.1


