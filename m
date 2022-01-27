Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1743149EC14
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 21:03:51 +0100 (CET)
Received: from localhost ([::1]:49982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDAzl-0003Rz-3K
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 15:03:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nDAyZ-0002k7-D8
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:02:35 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:48466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nDAyX-0005oI-Ra
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:02:35 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58049210FE;
 Thu, 27 Jan 2022 20:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643313752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T+bXvtTyQAeVq+R2kwMP8UtBjF5cxJ4Xzq+kJ3lUQYw=;
 b=Cv0bhmJkhHacy3x4kY8OTeYCozHi71YykNv9ygYlDzlxysgsyGWKmaornLJuoZPMW/zN/h
 d0ijM26MSQZVPYdtB/DYQCcIcHIRQOY7TwUXVOD4SWrk3VZZrkaXlV8Kz+9CmRNOFyuE0P
 cjD8uGJ5mr4cNkGfYr9Om4lXJqnqZas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643313752;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=T+bXvtTyQAeVq+R2kwMP8UtBjF5cxJ4Xzq+kJ3lUQYw=;
 b=saJPE9BZrc+i9pSJnYyaVMktD7DhUO3GagRnibb8Vm2UhgMi2lunsNAzgyXHh2pb0tjOIT
 5rnNNo2A5JlQlXCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F35F13C79;
 Thu, 27 Jan 2022 20:02:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PdZ/BVj68mEiXQAAMHmgww
 (envelope-from <lizhang@suse.de>); Thu, 27 Jan 2022 20:02:32 +0000
From: Li Zhang <lizhang@suse.de>
To: quintela@redhat.com,
	dgilbert@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v3 1/1] multifd: Remove some redundant code
Date: Thu, 27 Jan 2022 21:02:01 +0100
Message-Id: <20220127200201.26092-1-lizhang@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Li Zhang <lizhang@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up some unnecessary code

Signed-off-by: Li Zhang <lizhang@suse.de>
---
 migration/multifd.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 3242f688e5..d44cc6670f 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -854,19 +854,15 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
     Error *local_err = NULL;
 
     trace_multifd_new_send_channel_async(p->id);
-    if (qio_task_propagate_error(task, &local_err)) {
-        goto cleanup;
-    } else {
+    if (!qio_task_propagate_error(task, &local_err)) {
         p->c = QIO_CHANNEL(sioc);
         qio_channel_set_delay(p->c, false);
         p->running = true;
-        if (!multifd_channel_connect(p, sioc, local_err)) {
-            goto cleanup;
+        if (multifd_channel_connect(p, sioc, local_err)) {
+            return;
         }
-        return;
     }
 
-cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
@@ -1078,10 +1074,7 @@ static void *multifd_recv_thread(void *opaque)
 
         ret = qio_channel_read_all_eof(p->c, (void *)p->packet,
                                        p->packet_len, &local_err);
-        if (ret == 0) {   /* EOF */
-            break;
-        }
-        if (ret == -1) {   /* Error */
+        if (ret == 0 || ret == -1) {   /* 0: EOF  -1: Error */
             break;
         }
 
-- 
2.31.1


