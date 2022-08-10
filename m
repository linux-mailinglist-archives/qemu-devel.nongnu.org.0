Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8E558ED21
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:26:53 +0200 (CEST)
Received: from localhost ([::1]:34384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLljY-0007xE-4u
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oLj7t-0007mt-4K
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 06:39:50 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:58420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oLj7q-0006T9-GY
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 06:39:48 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 34B09371AB;
 Wed, 10 Aug 2022 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1660127984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UCkJ7yySUg6YGvhIA6XI6MAo1fIwAUPY4sF/1p3bo6k=;
 b=JzNB0UoK09sOFS7nO62gEThSbN1CqzUOhn1hx2OHhbK4vvXDyNiGwdZZ+y0yNVpWHGPKkQ
 hD/57LIVVNgOB/XwwZRUJhDl6CQEhP/6P4EjgAKxPctGplCRvUryo4FiqEZYSPTIdvP4kl
 BpcsqeGEXJQ20Fc9eoakP++bEWDKdpo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE3FF13A7E;
 Wed, 10 Aug 2022 10:39:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1/3VNu+K82K2QAAAMHmgww
 (envelope-from <nborisov@suse.com>); Wed, 10 Aug 2022 10:39:43 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: qemu-devel@nongnu.org
Cc: Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH] migration/multifd: Remove redundant copy of page offsets
 during send
Date: Wed, 10 Aug 2022 13:39:42 +0300
Message-Id: <20220810103942.580784-1-nborisov@suse.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=nborisov@suse.com;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Aug 2022 09:09:25 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All pages which are going to be migrated are first added to
MultiFDSendParams::MultiFDPages_t::offset array by the main migration
thread and are subsequently copied to MultiFDSendParams::normal by the
multifd thread. This is really unnecessary as the MultiFDPages_t is
guaranteed to be stable since its mutex is being held. Additionally,
this somewhat simplifies the code as the migration pages are now kept
in only 1 place during send, also the name 'offset' coupled with the
context it's being used - usually added to the host pages makes it
obvious that this is an offset.

With this change normal/normal_num are no longer used in the multifd
send path.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 migration/multifd-zlib.c |  6 +++---
 migration/multifd-zstd.c |  6 +++---
 migration/multifd.c      | 25 ++++++++++---------------
 3 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 18213a951302..363b64e95922 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -122,11 +122,11 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
     int ret;
     uint32_t i;

-    for (i = 0; i < p->normal_num; i++) {
+    for (i = 0; i < p->pages->num; i++) {
         uint32_t available = z->zbuff_len - out_size;
         int flush = Z_NO_FLUSH;

-        if (i == p->normal_num - 1) {
+        if (i == p->pages->num - 1) {
             flush = Z_SYNC_FLUSH;
         }

@@ -135,7 +135,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
          * with compression. zlib does not guarantee that this is safe,
          * therefore copy the page before calling deflate().
          */
-        memcpy(z->buf, p->pages->block->host + p->normal[i], page_size);
+        memcpy(z->buf, p->pages->block->host + p->pages->offset[i], page_size);
         zs->avail_in = page_size;
         zs->next_in = z->buf;

diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index d788d309f22e..4daec8366727 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -121,13 +121,13 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
     z->out.size = z->zbuff_len;
     z->out.pos = 0;

-    for (i = 0; i < p->normal_num; i++) {
+    for (i = 0; i < p->pages->num; i++) {
         ZSTD_EndDirective flush = ZSTD_e_continue;

-        if (i == p->normal_num - 1) {
+        if (i == p->pages->num - 1) {
             flush = ZSTD_e_flush;
         }
-        z->in.src = p->pages->block->host + p->normal[i];
+        z->in.src = p->pages->block->host + p->pages->offset[i];
         z->in.size = page_size;
         z->in.pos = 0;

diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d657a..d70662406490 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -89,13 +89,13 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
     MultiFDPages_t *pages = p->pages;
     size_t page_size = qemu_target_page_size();

-    for (int i = 0; i < p->normal_num; i++) {
-        p->iov[p->iovs_num].iov_base = pages->block->host + p->normal[i];
+    for (int i = 0; i < pages->num; i++) {
+        p->iov[p->iovs_num].iov_base = pages->block->host + pages->offset[i];
         p->iov[p->iovs_num].iov_len = page_size;
         p->iovs_num++;
     }

-    p->next_packet_size = p->normal_num * page_size;
+    p->next_packet_size = pages->num * page_size;
     p->flags |= MULTIFD_FLAG_NOCOMP;
     return 0;
 }
@@ -262,7 +262,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)

     packet->flags = cpu_to_be32(p->flags);
     packet->pages_alloc = cpu_to_be32(p->pages->allocated);
-    packet->normal_pages = cpu_to_be32(p->normal_num);
+    packet->normal_pages = cpu_to_be32(p->pages->num);
     packet->next_packet_size = cpu_to_be32(p->next_packet_size);
     packet->packet_num = cpu_to_be64(p->packet_num);

@@ -270,9 +270,9 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
         strncpy(packet->ramblock, p->pages->block->idstr, 256);
     }

-    for (i = 0; i < p->normal_num; i++) {
+    for (i = 0; i < p->pages->num; i++) {
         /* there are architectures where ram_addr_t is 32 bit */
-        uint64_t temp = p->normal[i];
+        uint64_t temp = p->pages->offset[i];

         packet->offset[i] = cpu_to_be64(temp);
     }
@@ -668,7 +668,7 @@ static void *multifd_send_thread(void *opaque)
         if (p->pending_job) {
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
-            p->normal_num = 0;
+            uint32_t num_pages = p->pages->num;

             if (use_zero_copy_send) {
                 p->iovs_num = 0;
@@ -676,12 +676,7 @@ static void *multifd_send_thread(void *opaque)
                 p->iovs_num = 1;
             }

-            for (int i = 0; i < p->pages->num; i++) {
-                p->normal[p->normal_num] = p->pages->offset[i];
-                p->normal_num++;
-            }
-
-            if (p->normal_num) {
+            if (num_pages) {
                 ret = multifd_send_state->ops->send_prepare(p, &local_err);
                 if (ret != 0) {
                     qemu_mutex_unlock(&p->mutex);
@@ -691,12 +686,12 @@ static void *multifd_send_thread(void *opaque)
             multifd_send_fill_packet(p);
             p->flags = 0;
             p->num_packets++;
-            p->total_normal_pages += p->normal_num;
+            p->total_normal_pages += num_pages;
             p->pages->num = 0;
             p->pages->block = NULL;
             qemu_mutex_unlock(&p->mutex);

-            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
+            trace_multifd_send(p->id, packet_num, num_pages, flags,
                                p->next_packet_size);

             if (use_zero_copy_send) {
--
2.25.1


