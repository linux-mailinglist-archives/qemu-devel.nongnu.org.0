Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818A020F124
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 11:07:33 +0200 (CEST)
Received: from localhost ([::1]:59012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqCEm-0008GD-DN
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 05:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBW-0002jQ-3B
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:10 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42629
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBN-0002vv-N1
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593507841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wP+XNnwqu0IBtgmmzqj18duZMA+PcoSN5axx/GTulTw=;
 b=UqOmNoh3MPoYRbK9O7CxpKv6+jP36zVOldjykOYS0ts45RGBJ6tFm2qieY3YK0K0D5C8RI
 UwdnsqbViFVxuVJujiT4/P7jzuGIJt1rgCCXtgqfWZqSMyw6/GkYnd1QlJX0C8Q/3QJp2J
 k80U6Kl5A4ENLaDshGsnCO/d+ppCpSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-Ce6Zhxs5Nt65ijkQTWLbrg-1; Tue, 30 Jun 2020 05:03:59 -0400
X-MC-Unique: Ce6Zhxs5Nt65ijkQTWLbrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A31BBFC9
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 09:03:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48D4D60E1C;
 Tue, 30 Jun 2020 09:03:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4407B1138486; Tue, 30 Jun 2020 11:03:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/26] migration/rdma: Plug memory leaks in
 qemu_rdma_registration_stop()
Date: Tue, 30 Jun 2020 11:03:51 +0200
Message-Id: <20200630090351.1247703-27-armbru@redhat.com>
In-Reply-To: <20200630090351.1247703-1-armbru@redhat.com>
References: <20200630090351.1247703-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 01:11:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_rdma_registration_stop() uses the ERROR() macro to create, report
to stderr, and store an Error object.  The stored Error object is
never used, and its memory is leaked.

Even where ERROR() doesn't leak, it is ill-advised.  The whole point
of passing an Error to the caller is letting the caller handle the
error.  Error handling may report to stderr, to somewhere else, or not
at all.  Also reporting in the callee mixes up concerns that should be
kept separate.  Since I don't know what reporting to stderr is
supposed to accomplish, I'm not touching it.

Commit 2a1bc8bde7 "migration/rdma: rdma_accept_incoming_migration fix
error handling" plugged the same leak in
rdma_accept_incoming_migration().

Plug the memory leak the same way: keep the report part, delete the
store part.

The report part uses fprintf().  If it's truly an error, it should use
error_report() instead.  But I don't know, so I leave it alone, just
like commit 2a1bc8bde7 did.

Fixes: 2da776db4846eadcb808598a5d3484d149773c05
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 migration/rdma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index ec45d33ba3..3b18823268 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3787,7 +3787,6 @@ static int qemu_rdma_registration_start(QEMUFile *f, void *opaque,
 static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
                                        uint64_t flags, void *data)
 {
-    Error *local_err = NULL, **errp = &local_err;
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(opaque);
     RDMAContext *rdma;
     RDMAControlHeader head = { .len = 0, .repeat = 1 };
@@ -3832,7 +3831,7 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
                     &reg_result_idx, rdma->pin_all ?
                     qemu_rdma_reg_whole_ram_blocks : NULL);
         if (ret < 0) {
-            ERROR(errp, "receiving remote info!");
+            fprintf(stderr, "receiving remote info!");
             return ret;
         }
 
@@ -3851,10 +3850,10 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
          */
 
         if (local->nb_blocks != nb_dest_blocks) {
-            ERROR(errp, "ram blocks mismatch (Number of blocks %d vs %d) "
-                        "Your QEMU command line parameters are probably "
-                        "not identical on both the source and destination.",
-                        local->nb_blocks, nb_dest_blocks);
+            fprintf(stderr, "ram blocks mismatch (Number of blocks %d vs %d) "
+                    "Your QEMU command line parameters are probably "
+                    "not identical on both the source and destination.",
+                    local->nb_blocks, nb_dest_blocks);
             rdma->error_state = -EINVAL;
             return -EINVAL;
         }
@@ -3867,10 +3866,10 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
 
             /* We require that the blocks are in the same order */
             if (rdma->dest_blocks[i].length != local->block[i].length) {
-                ERROR(errp, "Block %s/%d has a different length %" PRIu64
-                            "vs %" PRIu64, local->block[i].block_name, i,
-                            local->block[i].length,
-                            rdma->dest_blocks[i].length);
+                fprintf(stderr, "Block %s/%d has a different length %" PRIu64
+                        "vs %" PRIu64, local->block[i].block_name, i,
+                        local->block[i].length,
+                        rdma->dest_blocks[i].length);
                 rdma->error_state = -EINVAL;
                 return -EINVAL;
             }
-- 
2.26.2


