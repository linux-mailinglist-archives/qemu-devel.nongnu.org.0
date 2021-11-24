Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350B45B541
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:20:54 +0100 (CET)
Received: from localhost ([::1]:59094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmaL-00084M-Cz
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:20:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3K-0005Pd-RP
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:46:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3J-0005Bc-C1
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdcAPbgEkrEfQWk3868wWkAC6AxcfZlphXdju4XwYEs=;
 b=Mpo4QzOiMBZ21EMIJiBu1Afaq2bq1yDBeEJEw0h0NeaQTxhGejUPykQg4dxWDn3sNhMije
 PdJFTp2n4/kWDuGMW8fyfJOAKsTQZYbcdkde6plPDJrwzIAc5NV0aEL5XwGeupfE9Ubv3X
 J5s9jpdrOAQZQOOVqAFo832NVFqigVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-oYrY6LfdMBeaxFlu9pz4rQ-1; Wed, 24 Nov 2021 01:46:43 -0500
X-MC-Unique: oYrY6LfdMBeaxFlu9pz4rQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 495AE1DDE6;
 Wed, 24 Nov 2021 06:46:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1544C60843;
 Wed, 24 Nov 2021 06:46:41 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 19/31] block/copy-before-write.h: global state API +
 assertions
Date: Wed, 24 Nov 2021 01:44:06 -0500
Message-Id: <20211124064418.3120601-20-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

copy-before-write functions always run under BQL lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/copy-before-write.h | 7 +++++++
 block/copy-before-write.c | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index 51847e711a..9a45de2fce 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -29,6 +29,13 @@
 #include "block/block_int.h"
 #include "block/block-copy.h"
 
+/*
+ * Global state (GS) API. These functions run under the BQL lock.
+ *
+ * See include/block/block-global-state.h for more information about
+ * the GS API.
+ */
+
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c30a5ff8de..36a8d7ba52 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -223,6 +223,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
+    assert(qemu_in_main_thread());
 
     opts = qdict_new();
     qdict_put_str(opts, "driver", "copy-before-write");
@@ -245,6 +246,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
 
 void bdrv_cbw_drop(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     bdrv_drop_filter(bs, &error_abort);
     bdrv_unref(bs);
 }
-- 
2.27.0


