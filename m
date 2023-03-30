Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2C66D0D6B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:07:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwdY-0003Jz-LR; Thu, 30 Mar 2023 14:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdS-0003J9-HO
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:30 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdR-00026O-1i
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:30 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 42A4D1F8AA;
 Thu, 30 Mar 2023 18:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9uAvRgIhFG02HKMriEQRRbGKMKeihMxDlDshlT9D8E=;
 b=Tll7eXHRt6kN0tiniG0XME1K99M9E9UFaaPL/iDPnf5kJ6mXE1EnFfGE/FjHJ9iiF8CqF0
 iW3c/iIpY603rt23+HZLk8s6BdHQ91SEYKbEB5INdp4TbsVUZjQdOWUO6q3rgJ930CCaWT
 i2LuUUQn4nnKzAl7t6qENzfBML0eZqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199466;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u9uAvRgIhFG02HKMriEQRRbGKMKeihMxDlDshlT9D8E=;
 b=JowCqT4vq1E9c78DKupvRnFAstmbU2zd33dsXbUdzbGV0Fv3bxZkk/EaG5w2WpuH1tNOG3
 O6Pv0kBcFEF3AnCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 288401348E;
 Thu, 30 Mar 2023 18:04:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EIvDNyfPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:23 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH v1 15/26] migration/multifd: Remove direct "socket"
 references
Date: Thu, 30 Mar 2023 15:03:25 -0300
Message-Id: <20230330180336.2791-16-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We're about to enable support for other transports in multifd, so
remove direct references to sockets.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 migration/multifd.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index cbc0dfe39b..e613d85e24 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -512,6 +512,11 @@ static void multifd_send_terminate_threads(Error *err)
     }
 }
 
+static int multifd_send_channel_destroy(QIOChannel *send)
+{
+    return socket_send_channel_destroy(send);
+}
+
 void multifd_save_cleanup(void)
 {
     int i;
@@ -534,7 +539,7 @@ void multifd_save_cleanup(void)
         if (p->registered_yank) {
             migration_ioc_unregister_yank(p->c);
         }
-        socket_send_channel_destroy(p->c);
+        multifd_send_channel_destroy(p->c);
         p->c = NULL;
         qemu_mutex_destroy(&p->mutex);
         qemu_sem_destroy(&p->sem);
@@ -889,20 +894,25 @@ static void multifd_new_send_channel_cleanup(MultiFDSendParams *p,
 static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
 {
     MultiFDSendParams *p = opaque;
-    QIOChannel *sioc = QIO_CHANNEL(qio_task_get_source(task));
+    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
     Error *local_err = NULL;
 
     trace_multifd_new_send_channel_async(p->id);
     if (!qio_task_propagate_error(task, &local_err)) {
-        p->c = QIO_CHANNEL(sioc);
+        p->c = QIO_CHANNEL(ioc);
         qio_channel_set_delay(p->c, false);
         p->running = true;
-        if (multifd_channel_connect(p, sioc, local_err)) {
+        if (multifd_channel_connect(p, ioc, local_err)) {
             return;
         }
     }
 
-    multifd_new_send_channel_cleanup(p, sioc, local_err);
+    multifd_new_send_channel_cleanup(p, ioc, local_err);
+}
+
+static void multifd_new_send_channel_create(gpointer opaque)
+{
+    socket_send_channel_create(multifd_new_send_channel_async, opaque);
 }
 
 int multifd_save_setup(Error **errp)
@@ -951,7 +961,7 @@ int multifd_save_setup(Error **errp)
             p->write_flags = 0;
         }
 
-        socket_send_channel_create(multifd_new_send_channel_async, p);
+        multifd_new_send_channel_create(p);
     }
 
     for (i = 0; i < thread_count; i++) {
-- 
2.35.3


