Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8B14CADC9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:45:20 +0100 (CET)
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTyR-0003q2-ED
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:45:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkb-0001Pm-Uf
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTka-0000Jc-6v
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXjz+2MNLnroPE3ihHyOxtiNfZ6IF9g6NN6aDSYvBR8=;
 b=BbmIe/80m8mgjpvt6/LicZChwTnrrGGkcrt2ZPArApUvm9FM2Xjx5u98bKjKm48eemKl1x
 z3KlmpojvvCRR+KJSDcW8tKFI66VFicM//cyXxLFW47EZ/PGsYDSfosK7N54QoQgvgnwN+
 khcj7KDC4C2iTBwyvuYO2ZuLGXy/G58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-rlFvXiEFOLKhDb4lWD_6dg-1; Wed, 02 Mar 2022 13:30:57 -0500
X-MC-Unique: rlFvXiEFOLKhDb4lWD_6dg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A10C01019982;
 Wed,  2 Mar 2022 18:30:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D5531059170;
 Wed,  2 Mar 2022 18:30:52 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 13/18] migration: Move static var in ram_block_from_stream()
 into global
Date: Wed,  2 Mar 2022 18:29:31 +0000
Message-Id: <20220302182936.227719-14-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Static variable is very unfriendly to threading of ram_block_from_stream().
Move it into MigrationIncomingState.

Make the incoming state pointer to be passed over to ram_block_from_stream() on
both caller sites.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220301083925.33483-8-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.h |  3 ++-
 migration/ram.c       | 13 +++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 8445e1d14a..d8b9850eae 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -66,7 +66,8 @@ typedef struct {
 /* State for the incoming migration */
 struct MigrationIncomingState {
     QEMUFile *from_src_file;
-
+    /* Previously received RAM's RAMBlock pointer */
+    RAMBlock *last_recv_block;
     /* A hook to allow cleanup at the end of incoming migration */
     void *transport_data;
     void (*transport_cleanup)(void *data);
diff --git a/migration/ram.c b/migration/ram.c
index a9d0d100bd..170e522a1f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3185,12 +3185,14 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
  *
  * Returns a pointer from within the RCU-protected ram_list.
  *
+ * @mis: the migration incoming state pointer
  * @f: QEMUFile where to read the data from
  * @flags: Page flags (mostly to see if it's a continuation of previous block)
  */
-static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
+static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
+                                              QEMUFile *f, int flags)
 {
-    static RAMBlock *block;
+    RAMBlock *block = mis->last_recv_block;
     char id[256];
     uint8_t len;
 
@@ -3217,6 +3219,8 @@ static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
         return NULL;
     }
 
+    mis->last_recv_block = block;
+
     return block;
 }
 
@@ -3669,7 +3673,7 @@ static int ram_load_postcopy(QEMUFile *f)
         trace_ram_load_postcopy_loop((uint64_t)addr, flags);
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE)) {
-            block = ram_block_from_stream(f, flags);
+            block = ram_block_from_stream(mis, f, flags);
             if (!block) {
                 ret = -EINVAL;
                 break;
@@ -3881,6 +3885,7 @@ void colo_flush_ram_cache(void)
  */
 static int ram_load_precopy(QEMUFile *f)
 {
+    MigrationIncomingState *mis = migration_incoming_get_current();
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
     /* ADVISE is earlier, it shows the source has the postcopy capability on */
     bool postcopy_advised = postcopy_is_advised();
@@ -3919,7 +3924,7 @@ static int ram_load_precopy(QEMUFile *f)
 
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
-            RAMBlock *block = ram_block_from_stream(f, flags);
+            RAMBlock *block = ram_block_from_stream(mis, f, flags);
 
             host = host_from_ram_block_offset(block, addr);
             /*
-- 
2.35.1


