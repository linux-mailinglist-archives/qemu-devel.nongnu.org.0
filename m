Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588114393E7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:41:08 +0200 (CEST)
Received: from localhost ([::1]:52400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexPf-0001Ip-Dr
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4H-0005TR-Vf
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4G-00072g-4d
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2UmTb/mBF8aPIoeBYqxIReiGrA8sGYEVY32f/GM3T4=;
 b=am2NfWTrzarw9P0bziaS1veh1vv/tp8hl6TaPHnv1dpNXZN2LAZxbm9BLZM60uPo3VEQfX
 0TlRn1q1hXjU7K5clEUYV7JSq00LCz49GDAChOkbnlHTSw/9qV2p2lsIF/6m30tm2HRIKc
 3iOJEDZbLFYuF7Fi3NYuhsTzy71QVlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-XpnihTBaMKa4iRt_dPhV6w-1; Mon, 25 Oct 2021 06:18:55 -0400
X-MC-Unique: XpnihTBaMKa4iRt_dPhV6w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A33F18125C0;
 Mon, 25 Oct 2021 10:18:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BD7017CE1;
 Mon, 25 Oct 2021 10:18:53 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 17/25] block/copy-before-write.h: global state API +
 assertions
Date: Mon, 25 Oct 2021 06:17:27 -0400
Message-Id: <20211025101735.2060852-18-eesposit@redhat.com>
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
References: <20211025101735.2060852-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

copy-before-write functions always run under BQL lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/copy-before-write.c | 2 ++
 block/copy-before-write.h | 7 +++++++
 2 files changed, 9 insertions(+)

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
-- 
2.27.0


