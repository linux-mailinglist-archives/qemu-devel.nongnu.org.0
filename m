Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F7F29928C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 17:34:50 +0100 (CET)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX5SL-0006UN-3W
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 12:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5Eq-00053v-L6
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:20:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5Eo-0000Kv-HM
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603729249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y02Z/CC8OZHxarIgsqkohNKx5yggt0q6ZHCms91H9aM=;
 b=ey1jqs7dWWfmE0ReJsY/bZ3G+yi3SmOuXlRtHavFyYsSaQ7yUZy46z+S40pCE8JCc8hw7I
 VOxd8lpWZTBWvf17smLj9GeiPBGcqLDT0KiW9iOuGiu+Mbdm+c46rQdNcDE+cZYhU7KwIm
 VP/W1hVftX0/H/UcbtOtt6lFD7DcVD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-GKjkGkJTOf2Hhft2b1_Z3w-1; Mon, 26 Oct 2020 12:20:46 -0400
X-MC-Unique: GKjkGkJTOf2Hhft2b1_Z3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3598EC502;
 Mon, 26 Oct 2020 16:20:44 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-208.ams2.redhat.com
 [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B68FB5D9E4;
 Mon, 26 Oct 2020 16:20:43 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, yubihong@huawei.com, peterx@redhat.com,
 peter.maydell@linaro.org
Subject: [PULL 12/16] migration: Introduce migrate_send_rp_message_req_pages()
Date: Mon, 26 Oct 2020 16:19:48 +0000
Message-Id: <20201026161952.149188-13-dgilbert@redhat.com>
In-Reply-To: <20201026161952.149188-1-dgilbert@redhat.com>
References: <20201026161952.149188-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

This is another layer wrapper for sending a page request to the source VM.  The
new migrate_send_rp_message_req_pages() will be used elsewhere in coming
patches.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20201021212721.440373-3-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 10 ++++++++--
 migration/migration.h |  2 ++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index e050f5726b..ed122ff8d9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -316,8 +316,8 @@ error:
  *   Start: Address offset within the RB
  *   Len: Length in bytes required - must be a multiple of pagesize
  */
-int migrate_send_rp_req_pages(MigrationIncomingState *mis, RAMBlock *rb,
-                              ram_addr_t start)
+int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
+                                      RAMBlock *rb, ram_addr_t start)
 {
     uint8_t bufc[12 + 1 + 255]; /* start (8), len (4), rbname up to 256 */
     size_t msglen = 12; /* start + len */
@@ -353,6 +353,12 @@ int migrate_send_rp_req_pages(MigrationIncomingState *mis, RAMBlock *rb,
     return migrate_send_rp_message(mis, msg_type, msglen, bufc);
 }
 
+int migrate_send_rp_req_pages(MigrationIncomingState *mis,
+                              RAMBlock *rb, ram_addr_t start)
+{
+    return migrate_send_rp_message_req_pages(mis, rb, start);
+}
+
 static bool migration_colo_enabled;
 bool migration_incoming_colo_enabled(void)
 {
diff --git a/migration/migration.h b/migration/migration.h
index 99784b44bd..9c1cba98d6 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -332,6 +332,8 @@ void migrate_send_rp_pong(MigrationIncomingState *mis,
                           uint32_t value);
 int migrate_send_rp_req_pages(MigrationIncomingState *mis, RAMBlock *rb,
                               ram_addr_t start);
+int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
+                                      RAMBlock *rb, ram_addr_t start);
 void migrate_send_rp_recv_bitmap(MigrationIncomingState *mis,
                                  char *block_name);
 void migrate_send_rp_resume_ack(MigrationIncomingState *mis, uint32_t value);
-- 
2.28.0


