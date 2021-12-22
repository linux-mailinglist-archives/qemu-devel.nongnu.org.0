Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4CC47D109
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:33:49 +0100 (CET)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzzsR-0007VL-PF
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:33:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mzzqE-0005WL-Rv
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:31:30 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:38540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mzzqD-0006hd-4i
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:31:30 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 75EB91F37E;
 Wed, 22 Dec 2021 11:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1640172686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsJccoOb4GzceYvdnqjDwKtFeMMlxoj3PAXUgjIThlY=;
 b=wl6hKqFC29kJpnuyRxpdgq9hqGCP5po88jK5um1naEC2yOU9mvkwwIATSGZAK+ZJ9UTx/X
 ElIzcjX54F2PxVyZ9TVUxQ02jUhfI7YjXuutDWLMf5o0uLmlGTF076lRLSTiMcSI5/yDDZ
 IAPKy6z54hpJd2P96FdzK9+0ZQxq92E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1640172686;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsJccoOb4GzceYvdnqjDwKtFeMMlxoj3PAXUgjIThlY=;
 b=iub8TqQQZ3e+wcPlBjudnzh++cmM30husjVd/EJCFnqjcLDKkWuCAbCrLSw6Tque6IEUCg
 dhvDE5ahDqUr44Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4024E13D10;
 Wed, 22 Dec 2021 11:31:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iLoiDo4Mw2HBFQAAMHmgww
 (envelope-from <lizhang@suse.de>); Wed, 22 Dec 2021 11:31:26 +0000
From: Li Zhang <lizhang@suse.de>
To: quintela@redhat.com, dgilbert@redhat.com, cfontana@suse.de,
 qemu-devel@nongnu.org
Subject: [PATCH 2/2] multifd: cleanup the function multifd_send_thread
Date: Wed, 22 Dec 2021 12:30:49 +0100
Message-Id: <20211222113049.9326-3-lizhang@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222113049.9326-1-lizhang@suse.de>
References: <20211222113049.9326-1-lizhang@suse.de>
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

Cleanup multifd_send_thread

Signed-off-by: Li Zhang <lizhang@suse.de>
---
 migration/multifd.c | 82 ++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 4ec40739e0..7888d71bfe 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -649,58 +649,58 @@ static void *multifd_send_thread(void *opaque)
             break;
         }
         qemu_mutex_lock(&p->mutex);
-
-        if (p->pending_job) {
-            uint32_t used = p->pages->num;
-            uint64_t packet_num = p->packet_num;
-            uint32_t flags = p->flags;
-
-            if (used) {
-                ret = multifd_send_state->ops->send_prepare(p, &local_err);
-                if (ret != 0) {
-                    qemu_mutex_unlock(&p->mutex);
-                    break;
-                }
-            }
-            multifd_send_fill_packet(p);
-            p->flags = 0;
-            p->num_packets++;
-            p->num_pages += used;
-            p->pages->num = 0;
-            p->pages->block = NULL;
+        if (!p->quit && !p->pending_job) {
+            /* sometimes there are spurious wakeups */
+            qemu_mutex_unlock(&p->mutex);
+            continue;
+        } else if (!p->pending_job) {
             qemu_mutex_unlock(&p->mutex);
+            break;
+        }
 
-            trace_multifd_send(p->id, packet_num, used, flags,
-                               p->next_packet_size);
+        uint32_t used = p->pages->num;
+        uint64_t packet_num = p->packet_num;
+        uint32_t flags = p->flags;
 
-            ret = qio_channel_write_all(p->c, (void *)p->packet,
-                                        p->packet_len, &local_err);
+        if (used) {
+            ret = multifd_send_state->ops->send_prepare(p, &local_err);
             if (ret != 0) {
+                qemu_mutex_unlock(&p->mutex);
                 break;
             }
+        }
+        multifd_send_fill_packet(p);
+        p->flags = 0;
+        p->num_packets++;
+        p->num_pages += used;
+        p->pages->num = 0;
+        p->pages->block = NULL;
+        qemu_mutex_unlock(&p->mutex);
 
-            if (used) {
-                ret = multifd_send_state->ops->send_write(p, used, &local_err);
-                if (ret != 0) {
-                    break;
-                }
-            }
+        trace_multifd_send(p->id, packet_num, used, flags,
+                           p->next_packet_size);
 
-            qemu_mutex_lock(&p->mutex);
-            p->pending_job--;
-            qemu_mutex_unlock(&p->mutex);
+        ret = qio_channel_write_all(p->c, (void *)p->packet,
+                                    p->packet_len, &local_err);
+        if (ret != 0) {
+            break;
+        }
 
-            if (flags & MULTIFD_FLAG_SYNC) {
-                qemu_sem_post(&p->sem_sync);
+        if (used) {
+            ret = multifd_send_state->ops->send_write(p, used, &local_err);
+            if (ret != 0) {
+                break;
             }
-            qemu_sem_post(&multifd_send_state->channels_ready);
-        } else if (p->quit) {
-            qemu_mutex_unlock(&p->mutex);
-            break;
-        } else {
-            qemu_mutex_unlock(&p->mutex);
-            /* sometimes there are spurious wakeups */
         }
+
+        qemu_mutex_lock(&p->mutex);
+        p->pending_job--;
+        qemu_mutex_unlock(&p->mutex);
+
+        if (flags & MULTIFD_FLAG_SYNC) {
+            qemu_sem_post(&p->sem_sync);
+        }
+        qemu_sem_post(&multifd_send_state->channels_ready);
     }
 
 out:
-- 
2.31.1


