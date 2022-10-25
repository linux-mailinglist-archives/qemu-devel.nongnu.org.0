Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C5F60C2D5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 06:52:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onBsJ-0005fF-Lt; Tue, 25 Oct 2022 00:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onBsG-0005eP-JD
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:49:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1onBsE-0002s3-EW
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666673349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShYCbEPXlE5IcxeK+9rwcqdlJwAqQqfQitYWqDLUAoA=;
 b=QH4tsPqtFlMuEvg2Q91DC4JEM9XMVaojzjSEnK4fJKf6Zg+OcJcWHxTL/kLpx7s5+AupcN
 RTokIANDH5cBpQOjicAM/u+nDIkHsNbZuf0yf9sZZz0TxBpp+3il+LdUeby52Wzdr+aWi2
 D+1sUG3L7kwNuMg9lCxveXWzzAsfsC8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-bPBts3VzMxqAp5_zFr4iZg-1; Tue, 25 Oct 2022 00:47:53 -0400
X-MC-Unique: bPBts3VzMxqAp5_zFr4iZg-1
Received: by mail-qt1-f200.google.com with SMTP id
 cb19-20020a05622a1f9300b0039cc64d84edso8337134qtb.15
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 21:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ShYCbEPXlE5IcxeK+9rwcqdlJwAqQqfQitYWqDLUAoA=;
 b=tZZ0++vmWlxW0S5UBXppp7cEmXOsFMWu6cTC26h0hkjdVsWPLY22x805j6DTczME9s
 NnuWyfzPgARCa+EbVXYWuuIgdHKs0dQB86nHRoYSUpwBU+5R32OBHuAaBrzqiBxdHnAU
 /3dHymNNSn8IElSagkCiooZv/t+fs88Fo2Bd24IV9uhbkLYTdMjuSUbX8NKR/55TYCyT
 F17Ue+73dC6ofyEKnk2BiFPU0kxctkfr4cybgWmoo+rxG4XTmtGR64uAJn7EpjcMzPDN
 ka6GkkiIqelrl3pwRarEnH2uSVXGcrMuB0hJIOL+1bbij/f3iatXY2vQrTCLt7TEULyw
 7F6w==
X-Gm-Message-State: ACrzQf3WA0LCNfcGYnsRMyzXrZnleu/HOWhLSguwOuoeEI1MKE2TdrOZ
 E7IT5Tsh+AohdTrfoOTmjC9YbS4yULxEysXfGZ5bWG11FJYQl9lHqzDRuLhMKQtw9eIsyeZyv1s
 aQ+H9YNQqmvCxclE=
X-Received: by 2002:a05:620a:2496:b0:6ee:76ce:4b3e with SMTP id
 i22-20020a05620a249600b006ee76ce4b3emr25427921qkn.370.1666673273371; 
 Mon, 24 Oct 2022 21:47:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM62NlvKwNQGH+HIWebXckLNC9TfVyadiRFTJ4yyahZa0ak2o7tX2qpQy+2guswsIJe8xOPUxg==
X-Received: by 2002:a05:620a:2496:b0:6ee:76ce:4b3e with SMTP id
 i22-20020a05620a249600b006ee76ce4b3emr25427916qkn.370.1666673273141; 
 Mon, 24 Oct 2022 21:47:53 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:1b3:a801:de5e:6447:4a67:eb7c:b690])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a05620a141700b006cbcdc6efedsm1350968qkj.41.2022.10.24.21.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 21:47:52 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 2/4] migration/multifd/zero-copy: Merge header & pages
 send in a single write
Date: Tue, 25 Oct 2022 01:47:29 -0300
Message-Id: <20221025044730.319941-3-leobras@redhat.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221025044730.319941-1-leobras@redhat.com>
References: <20221025044730.319941-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When zero-copy-send is enabled, each loop iteration of the
multifd_send_thread will calls for qio_channel_write_*() twice: The first
one for sending the header without zero-copy flag and the second one for
sending the memory pages, with zero-copy flag enabled.

This ends up calling two syscalls per loop iteration, where one should be
enough.

Also, since the behavior for non-zero-copy write is synchronous, and the
behavior for zero-copy write is asynchronous, it ends up interleaving
synchronous and asynchronous writes, hurting performance that could
otherwise be improved.

The choice of sending the header without the zero-copy flag in a separated
write happened because the header memory area would be reused in the next
write, so it was almost certain to have changed before the kernel could
send the packet.

To send the packet with zero-copy, create an array of header area instead
of a single one, and use a different header area after each write. Also,
flush the sending queue after all the headers have been used.

To avoid adding a zero-copy conditional in multifd_send_fill_packet(),
add a packet parameter (the packet that should be filled). This way it's
simpler to pick which element of the array will be used as a header.

Suggested-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.h |  5 ++++-
 migration/multifd.c | 52 ++++++++++++++++++++++++---------------------
 2 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 519f498643..7f200c0286 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -90,6 +90,7 @@ typedef struct {
 
     /* this mutex protects the following parameters */
     QemuMutex mutex;
+
     /* is this channel thread running */
     bool running;
     /* should this thread finish */
@@ -109,8 +110,10 @@ typedef struct {
 
     /* thread local variables. No locking required */
 
-    /* pointer to the packet */
+    /* pointer to the packet array */
     MultiFDPacket_t *packet;
+    /* index of the packet array */
+    uint32_t packet_idx;
     /* size of the next packet that contains pages */
     uint32_t next_packet_size;
     /* packets sent through this channel */
diff --git a/migration/multifd.c b/migration/multifd.c
index 509bbbe3bf..aa18c47141 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -34,6 +34,8 @@
 #define MULTIFD_MAGIC 0x11223344U
 #define MULTIFD_VERSION 1
 
+#define HEADER_ARR_SZ 1024
+
 typedef struct {
     uint32_t magic;
     uint32_t version;
@@ -255,9 +257,9 @@ static void multifd_pages_clear(MultiFDPages_t *pages)
     g_free(pages);
 }
 
-static void multifd_send_fill_packet(MultiFDSendParams *p)
+static void multifd_send_fill_packet(MultiFDSendParams *p,
+                                     MultiFDPacket_t *packet)
 {
-    MultiFDPacket_t *packet = p->packet;
     int i;
 
     packet->flags = cpu_to_be32(p->flags);
@@ -547,6 +549,7 @@ void multifd_save_cleanup(void)
         p->packet_len = 0;
         g_free(p->packet);
         p->packet = NULL;
+        p->packet_idx = 0;
         g_free(p->iov);
         p->iov = NULL;
         g_free(p->normal);
@@ -651,6 +654,7 @@ int multifd_send_sync_main(QEMUFile *f)
 static void *multifd_send_thread(void *opaque)
 {
     MultiFDSendParams *p = opaque;
+    MultiFDPacket_t *header = p->packet;
     Error *local_err = NULL;
     int ret = 0;
     bool use_zero_copy_send = migrate_use_zero_copy_send();
@@ -676,13 +680,9 @@ static void *multifd_send_thread(void *opaque)
         if (p->pending_job) {
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
-            p->normal_num = 0;
 
-            if (use_zero_copy_send) {
-                p->iovs_num = 0;
-            } else {
-                p->iovs_num = 1;
-            }
+            p->normal_num = 0;
+            p->iovs_num = 1;
 
             for (int i = 0; i < p->pages->num; i++) {
                 p->normal[p->normal_num] = p->pages->offset[i];
@@ -696,7 +696,8 @@ static void *multifd_send_thread(void *opaque)
                     break;
                 }
             }
-            multifd_send_fill_packet(p);
+
+            multifd_send_fill_packet(p, header);
             p->flags = 0;
             p->num_packets++;
             p->total_normal_pages += p->normal_num;
@@ -707,18 +708,8 @@ static void *multifd_send_thread(void *opaque)
             trace_multifd_send(p->id, packet_num, p->normal_num, flags,
                                p->next_packet_size);
 
-            if (use_zero_copy_send) {
-                /* Send header first, without zerocopy */
-                ret = qio_channel_write_all(p->c, (void *)p->packet,
-                                            p->packet_len, &local_err);
-                if (ret != 0) {
-                    break;
-                }
-            } else {
-                /* Send header using the same writev call */
-                p->iov[0].iov_len = p->packet_len;
-                p->iov[0].iov_base = p->packet;
-            }
+            p->iov[0].iov_len = p->packet_len;
+            p->iov[0].iov_base = header;
 
             ret = qio_channel_writev_full_all(p->c, p->iov, p->iovs_num, NULL,
                                               0, p->write_flags, &local_err);
@@ -726,6 +717,14 @@ static void *multifd_send_thread(void *opaque)
                 break;
             }
 
+            if (use_zero_copy_send) {
+                p->packet_idx = (p->packet_idx + 1) % HEADER_ARR_SZ;
+
+                if (!p->packet_idx && (multifd_zero_copy_flush(p->c) < 0)) {
+                    break;
+                }
+                header = (void *)p->packet + p->packet_idx * p->packet_len;
+            }
             qemu_mutex_lock(&p->mutex);
             p->pending_job--;
             qemu_mutex_unlock(&p->mutex);
@@ -930,6 +929,7 @@ int multifd_save_setup(Error **errp)
 
     for (i = 0; i < thread_count; i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
+        int j;
 
         qemu_mutex_init(&p->mutex);
         qemu_sem_init(&p->sem, 0);
@@ -940,9 +940,13 @@ int multifd_save_setup(Error **errp)
         p->pages = multifd_pages_init(page_count);
         p->packet_len = sizeof(MultiFDPacket_t)
                       + sizeof(uint64_t) * page_count;
-        p->packet = g_malloc0(p->packet_len);
-        p->packet->magic = cpu_to_be32(MULTIFD_MAGIC);
-        p->packet->version = cpu_to_be32(MULTIFD_VERSION);
+        p->packet = g_malloc0_n(HEADER_ARR_SZ, p->packet_len);
+        for (j = 0; j < HEADER_ARR_SZ ; j++) {
+            MultiFDPacket_t *packet = (void *)p->packet + j * p->packet_len;
+            packet->magic = cpu_to_be32(MULTIFD_MAGIC);
+            packet->version = cpu_to_be32(MULTIFD_VERSION);
+        }
+        p->packet_idx = 0;
         p->name = g_strdup_printf("multifdsend_%d", i);
         /* We need one extra place for the packet header */
         p->iov = g_new0(struct iovec, page_count + 1);
-- 
2.38.0


