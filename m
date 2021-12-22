Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C600947D10B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:33:51 +0100 (CET)
Received: from localhost ([::1]:52466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzzsU-0007ed-TA
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mzzqE-0005WR-Ud
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:31:30 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:57234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mzzqD-0006hb-4h
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:31:30 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38F5F212BD;
 Wed, 22 Dec 2021 11:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1640172686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p23BND77yA3C1MNnRUW5sOkWOwYsyt+qJoxOhu7Dyl8=;
 b=g3TxDq4EN8IDxfaT6yhQKRpfo/eHbby5QSkTR8QnDUM5kLXzkCC/N8ZwWO7X4OWrqRpcwe
 oIqKTwTqwlXfRr5DFtUEQlslUS/5vl1isAsY1R/njHIHbeoLkJG5WDmmbeAf1ZqIajfAEC
 OfkuKmp83ytHsVMTtpwBh6z/S8XyRIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1640172686;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p23BND77yA3C1MNnRUW5sOkWOwYsyt+qJoxOhu7Dyl8=;
 b=lwdCnoVmJSnE9ql8tT09nQqp+BcAr9gNtmSk24xZoEsm9Wome7tDq6I0951tWCi2EpGLO0
 nJRi73+UT0rHVlCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0545913D10;
 Wed, 22 Dec 2021 11:31:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KGZyO40Mw2HBFQAAMHmgww
 (envelope-from <lizhang@suse.de>); Wed, 22 Dec 2021 11:31:25 +0000
From: Li Zhang <lizhang@suse.de>
To: quintela@redhat.com, dgilbert@redhat.com, cfontana@suse.de,
 qemu-devel@nongnu.org
Subject: [PATCH 1/2] multifd: cleanup the function multifd_channel_connect
Date: Wed, 22 Dec 2021 12:30:48 +0100
Message-Id: <20211222113049.9326-2-lizhang@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222113049.9326-1-lizhang@suse.de>
References: <20211222113049.9326-1-lizhang@suse.de>
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

Cleanup multifd_channel_connect

Signed-off-by: Li Zhang <lizhang@suse.de>
---
 migration/multifd.c | 49 ++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 212be1ed04..4ec40739e0 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -801,33 +801,32 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
     trace_multifd_set_outgoing_channel(
         ioc, object_get_typename(OBJECT(ioc)), p->tls_hostname, error);
 
-    if (!error) {
-        if (s->parameters.tls_creds &&
-            *s->parameters.tls_creds &&
-            !object_dynamic_cast(OBJECT(ioc),
-                                 TYPE_QIO_CHANNEL_TLS)) {
-            multifd_tls_channel_connect(p, ioc, &error);
-            if (!error) {
-                /*
-                 * tls_channel_connect will call back to this
-                 * function after the TLS handshake,
-                 * so we mustn't call multifd_send_thread until then
-                 */
-                return true;
-            } else {
-                return false;
-            }
-        } else {
-            migration_ioc_register_yank(ioc);
-            p->registered_yank = true;
-            p->c = ioc;
-            qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
-                                   QEMU_THREAD_JOINABLE);
-       }
-       return true;
+    if (error) {
+        return false;
     }
 
-    return false;
+    if (s->parameters.tls_creds &&
+        *s->parameters.tls_creds &&
+        !object_dynamic_cast(OBJECT(ioc),
+                             TYPE_QIO_CHANNEL_TLS)) {
+        multifd_tls_channel_connect(p, ioc, &error);
+        if (error) {
+            return false;
+        }
+        /*
+         * tls_channel_connect will call back to this
+         * function after the TLS handshake,
+         * so we mustn't call multifd_send_thread until then
+         */
+        return true;
+    } else {
+        migration_ioc_register_yank(ioc);
+        p->registered_yank = true;
+        p->c = ioc;
+        qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
+                               QEMU_THREAD_JOINABLE);
+    }
+    return true;
 }
 
 static void multifd_new_send_channel_cleanup(MultiFDSendParams *p,
-- 
2.31.1


