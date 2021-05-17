Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E45E382B3E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:38:13 +0200 (CEST)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libZc-00023T-NI
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIO-00064F-I0
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIK-0006OU-Bn
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0w9XmRrvke7YqDZpY/G2uoomq560PGMLttE6Iw2dKKs=;
 b=eCKIqJ/a4kJ1U9d2L9xs6wzTGU/5avn8Kt9i5DK0C/K9g/0UjKBl98f1WSfvZO9yWvC+TO
 YydnnSM1uaUH6yQjqpX7xUhmIzWQRQt7b3lCHcFQ+83iMfxT9cqhDW3hjpxTqNCp4RPfaW
 xlMxDytha4McVQFtPhiHLNgajI9JbHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-oB9gv4lDM6ylx-3WfH1dmQ-1; Mon, 17 May 2021 07:20:17 -0400
X-MC-Unique: oB9gv4lDM6ylx-3WfH1dmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9DA71868339;
 Mon, 17 May 2021 11:20:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D71719726;
 Mon, 17 May 2021 11:20:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/20] backends/tpm: Replace qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date: Mon, 17 May 2021 07:19:46 -0400
Message-Id: <20210517112001.2564006-6-pbonzini@redhat.com>
In-Reply-To: <20210517112001.2564006-1-pbonzini@redhat.com>
References: <20210517112001.2564006-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Christophe de Dinechin <dinechin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
macro.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210512070713.3286188-1-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/tpm/tpm_emulator.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index a012adc193..e5f1063ab6 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -30,6 +30,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/sockets.h"
+#include "qemu/lockable.h"
 #include "io/channel-socket.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
@@ -124,31 +125,26 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
     uint8_t *buf = NULL;
-    int ret = -1;
 
-    qemu_mutex_lock(&tpm->mutex);
+    WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
+        buf = g_alloca(n);
+        memcpy(buf, &cmd_no, sizeof(cmd_no));
+        memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
 
-    buf = g_alloca(n);
-    memcpy(buf, &cmd_no, sizeof(cmd_no));
-    memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
-
-    n = qemu_chr_fe_write_all(dev, buf, n);
-    if (n <= 0) {
-        goto end;
-    }
-
-    if (msg_len_out != 0) {
-        n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+        n = qemu_chr_fe_write_all(dev, buf, n);
         if (n <= 0) {
-            goto end;
+            return -1;
         }
-    }
 
-    ret = 0;
+        if (msg_len_out != 0) {
+            n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+            if (n <= 0) {
+                return -1;
+            }
+        }
+    }
 
-end:
-    qemu_mutex_unlock(&tpm->mutex);
-    return ret;
+    return 0;
 }
 
 static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
-- 
2.27.0



