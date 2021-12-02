Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21494465EB8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:29:58 +0100 (CET)
Received: from localhost ([::1]:39802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgXU-0006HY-KU
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9N-0005Ui-QY
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9K-0006Ej-5d
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KgSnAE2gxmi6RnKB1xvL8y2e29aE0v3OXGqSPwiqoTA=;
 b=birsOThi/E+wylEBsVGN4y1yhH8Z8C+wyERw/glmJ5MmNsbuHM0eGBFRNoQijH12+XFbIY
 zo1MfAKKsHkbPVshUXnSImwD00fDQIF5XPVuNpV6dh2JWBWuv5FoX0+NozgggzHbzeXh6e
 dmUGYhqBxK2mwSqnFyrKXMVMkJbSX9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-QHQWZsf9PgKVxYJgFSpA7w-1; Thu, 02 Dec 2021 02:04:54 -0500
X-MC-Unique: QHQWZsf9PgKVxYJgFSpA7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 629E883DD20;
 Thu,  2 Dec 2021 07:04:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F23B10013D6;
 Thu,  2 Dec 2021 07:04:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25A2B1138220; Thu,  2 Dec 2021 08:04:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 07/11] vl: Implement qemu_until_phase() running from
 arbitrary phase
Date: Thu,  2 Dec 2021 08:04:46 +0100
Message-Id: <20211202070450.264743-8-armbru@redhat.com>
In-Reply-To: <20211202070450.264743-1-armbru@redhat.com>
References: <20211202070450.264743-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

A later patch will want to use qemu_until_phase() to advance from one
arbitrary phase to another.  Implement advancing from arbitrary phase
to PHASE_MACHINE_READY.

Indentation is intentionally off to minimize diffs.  It's RFC :)

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/vl.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index e340475986..b7f15d9f86 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1043,7 +1043,8 @@ void qemu_until_phase(void)
     MachineClass *machine_class;
     FILE *vmstate_dump_file = NULL;
 
-    assert(phase_get() == PHASE_NO_MACHINE);
+    switch (phase_get()) {
+    case PHASE_NO_MACHINE:
 
     qemu_process_early_options();
 
@@ -1077,6 +1078,9 @@ void qemu_until_phase(void)
     qemu_apply_machine_options(NULL);
     phase_advance(PHASE_MACHINE_CREATED);
 
+    /* fall through */
+    case PHASE_MACHINE_CREATED:
+
     /*
      * Note: uses machine properties such as kernel-irqchip, must run
      * after qemu_apply_machine_options.
@@ -1084,6 +1088,9 @@ void qemu_until_phase(void)
     configure_accelerators("FIXME");
     phase_advance(PHASE_ACCEL_CREATED);
 
+    /* fall through */
+    case PHASE_ACCEL_CREATED:
+
     /*
      * Beware, QOM objects created before this point miss global and
      * compat properties.
@@ -1128,7 +1135,13 @@ void qemu_until_phase(void)
     }
 
     qemu_init_board();
+    assert(phase_get() == PHASE_MACHINE_INITIALIZED);
+
+    /* fall through */
+    case PHASE_MACHINE_INITIALIZED:
+
     qemu_machine_creation_done();
+    assert(phase_get() == PHASE_MACHINE_READY);
 
     if (replay_mode != REPLAY_MODE_NONE) {
         replay_vmstate_init();
@@ -1151,4 +1164,8 @@ void qemu_until_phase(void)
     accel_setup_post(current_machine);
     os_setup_post();
     resume_mux_open();
+
+    case PHASE_MACHINE_READY:
+        break;
+    }
 }
-- 
2.31.1


