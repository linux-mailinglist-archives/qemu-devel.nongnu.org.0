Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D301C478895
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 11:15:14 +0100 (CET)
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myAGg-0003id-0B
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 05:15:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1myAEP-0002N2-Mm
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 05:12:53 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:57756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1myAEO-00034l-0q
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 05:12:53 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6451E1F38A;
 Fri, 17 Dec 2021 10:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639735970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RusMWCU56GcqfkE4ifCtyqPOYAzbaY9kacNl6qzzxEo=;
 b=rfelxWaJajOhzDoC2NFj9m8j/1aAjCuvitGE92Az8usSdgTo+UhWckHiGCwUYsFwAdWVSm
 PNMLHxWCG2wupPC74vhYMIDFM/oP5hIH0Uiw5BHplxppDQIMYQTEkgOOG1BR9v++L0t1xq
 2jKGdUUkA5oRpkUSZZ8L+k8cXrUfY7g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639735970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RusMWCU56GcqfkE4ifCtyqPOYAzbaY9kacNl6qzzxEo=;
 b=FogaT4FbLwAvQi87NLZ2KrA06QBdd3HJ2FBJt9KXd/3IVEhQ1ryDPyPxfSVVbaZa3EXdPm
 l2e6Q2Kc/GJgagBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2970E13DD4;
 Fri, 17 Dec 2021 10:12:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C5maCKJivGH0JAAAMHmgww
 (envelope-from <lizhang@suse.de>); Fri, 17 Dec 2021 10:12:50 +0000
From: Li Zhang <lizhang@suse.de>
To: quintela@redhat.com, dgilbert@redhat.com, cfontana@suse.de,
 qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] multifd: Remove some redundant code
Date: Fri, 17 Dec 2021 11:12:28 +0100
Message-Id: <20211217101228.9512-1-lizhang@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lizhang@suse.de;
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
Cc: Li Zhang <lizhang@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up some unnecessary code

Signed-off-by: Li Zhang <lizhang@suse.de>
---
 migration/multifd.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 3242f688e5..212be1ed04 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -854,19 +854,16 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
     Error *local_err = NULL;
 
     trace_multifd_new_send_channel_async(p->id);
-    if (qio_task_propagate_error(task, &local_err)) {
-        goto cleanup;
-    } else {
+    if (!qio_task_propagate_error(task, &local_err)) {
         p->c = QIO_CHANNEL(sioc);
         qio_channel_set_delay(p->c, false);
         p->running = true;
         if (!multifd_channel_connect(p, sioc, local_err)) {
-            goto cleanup;
+            multifd_new_send_channel_cleanup(p, sioc, local_err);
         }
         return;
     }
 
-cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
@@ -1078,10 +1075,7 @@ static void *multifd_recv_thread(void *opaque)
 
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


