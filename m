Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D674E465EBA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:30:00 +0100 (CET)
Received: from localhost ([::1]:39938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgXX-0006N2-TE
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:29:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9M-0005Ss-A2
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9I-0006ET-Sh
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=poZ4keuJsaFlfWFahPlHeadvzzt0eBAV11mSciMhoqY=;
 b=I7xhhMaYiclC+xYgPy1SEQ1Jn7Srhki2H9ZFiXB7nu/l7DfclgwLGuq1t9f9nSQZBTirMX
 R7Nqt3S/xlm7Z7MqfaVn8vL7Lz27Z1Tor/ecghyXRcyVBnWhkm+jKrrYQj8ugAVwZHt7YJ
 F70VNBY/VEcmIR3Nb/x7zFj8pCqenVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-JwdojFj8Nf2bBSjexq73Jg-1; Thu, 02 Dec 2021 02:04:53 -0500
X-MC-Unique: JwdojFj8Nf2bBSjexq73Jg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06F65100CCC3;
 Thu,  2 Dec 2021 07:04:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 960F910016F4;
 Thu,  2 Dec 2021 07:04:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 188351138611; Thu,  2 Dec 2021 08:04:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 03/11] vl: Hardcode a QMP monitor on stdio for now
Date: Thu,  2 Dec 2021 08:04:42 +0100
Message-Id: <20211202070450.264743-4-armbru@redhat.com>
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

We bootstrap QMP with the CLI, but the CLI is (temporarily) gone.
Hardcode a QMP monitor on stdio until we get it back.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/vl.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 39c67b91c4..b14db0f47f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -129,6 +129,9 @@
 
 #include "config-host.h"
 
+#include "qapi/qapi-commands-char.h"
+#include "qapi/qapi-types-control.h"
+
 static const char *incoming;
 static const char *accelerators;
 static ram_addr_t maxram_size;
@@ -617,6 +620,14 @@ static void qemu_create_early_backends(void)
     /* spice must initialize before audio as it changes the default auiodev */
     /* spice must initialize before chardevs (for spicevmc and spiceport) */
     qemu_spice.init();
+
+    /* HACK: hardcoded monitor chardev */
+    qmp_chardev_add("compat_monitor0", &(ChardevBackend){
+            .type = CHARDEV_BACKEND_KIND_STDIO,
+            .u.stdio = {
+                .data = &(ChardevStdio){},
+            },
+        }, &error_abort);
 }
 
 
@@ -628,6 +639,11 @@ static void qemu_create_late_backends(void)
         exit(1);
     }
 
+    /* HACK: hardcoded monitor */
+    monitor_init(&(MonitorOptions){
+            .chardev = (char *)"compat_monitor0",
+        }, false, &error_abort);
+
     /* now chardevs have been created we may have semihosting to connect */
     qemu_semihosting_connect_chardevs();
     qemu_semihosting_console_init();
-- 
2.31.1


