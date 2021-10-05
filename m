Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0424422B9D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:59:05 +0200 (CEST)
Received: from localhost ([::1]:41772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXluK-0002od-MG
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXj-0003tk-4V
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXg-0005IS-QY
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5fyn6RQ+3EvC4o0reBAtVtl8JEqzgXqbdXqGyAKnIo=;
 b=FetxKt3LO2OwuWg321zo/FAfhLoQLI1jxOUmV1MtoexRgK8C9YNMERlvf4mogLjRyWw95C
 ktqrySd2M9sWjpkzvqQ6GzKHCrPts9oWskDF7R74tgD5MPAaA1bhmoM78YZaOBy2Mti7TF
 oVm91F6+WGhU3W3XaQORuXWLnAhRVnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-2YPHD7_hNbqVnhassJ005g-1; Tue, 05 Oct 2021 10:35:38 -0400
X-MC-Unique: 2YPHD7_hNbqVnhassJ005g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21F8D802935;
 Tue,  5 Oct 2021 14:35:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E55281042AAA;
 Tue,  5 Oct 2021 14:35:35 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 16/25] block/backup-top.h: global state API + assertions
Date: Tue,  5 Oct 2021 10:32:06 -0400
Message-Id: <20211005143215.29500-17-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

backup-top functions always run under BQL lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/backup-top.c |  2 ++
 block/backup-top.h | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/block/backup-top.c b/block/backup-top.c
index 425e3778be..8b58a909f7 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -182,6 +182,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
     bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
+    g_assert(qemu_in_main_thread());
 
     top = bdrv_new_open_driver(&bdrv_backup_top_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
@@ -244,6 +245,7 @@ fail:
 void bdrv_backup_top_drop(BlockDriverState *bs)
 {
     BDRVBackupTopState *s = bs->opaque;
+    g_assert(qemu_in_main_thread());
 
     bdrv_drop_filter(bs, &error_abort);
 
diff --git a/block/backup-top.h b/block/backup-top.h
index b28b0031c4..8cb6f62869 100644
--- a/block/backup-top.h
+++ b/block/backup-top.h
@@ -29,6 +29,17 @@
 #include "block/block_int.h"
 #include "block/block-copy.h"
 
+/*
+ * Graph API. These functions run under the BQL lock.
+ *
+ * If a function modifies the graph, it uses drain and/or
+ * aio_context_acquire/release to be sure it has unique access.
+ *
+ * All functions in this header must use this assertion:
+ * g_assert(qemu_in_main_thread());
+ * to be sure they belong here.
+ */
+
 BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
                                          BlockDriverState *target,
                                          const char *filter_node_name,
-- 
2.27.0


