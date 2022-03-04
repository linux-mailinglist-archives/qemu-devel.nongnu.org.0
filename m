Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DEA4CD9C0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:08:52 +0100 (CET)
Received: from localhost ([::1]:48420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBQB-0007Mt-JS
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:08:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6A-0005l7-Sv
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB67-0007XG-6w
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9KnCuoqq3C12Qg64nZPYs1rFTQUoE9WLiclz6LrEE24=;
 b=CbjQ0H9ieoZtOIv4WWDdLafkLMuit6WQ6jt9mIJ8I+DZBYUl8GRviSEmNFW3AqwRT5E1es
 33SDMTkHj6yeN/WXW4ZEvyWgPiDDw0intCisBGBIrPdzhcMFhDTF66rcDtorpaivKv3/ul
 p5te6oAklPWu4ykfl0iC3Tvw0KEktb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-UfhJ1oY4N96CBwmj8ABwFA-1; Fri, 04 Mar 2022 11:48:05 -0500
X-MC-Unique: UfhJ1oY4N96CBwmj8ABwFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82AE38015BA;
 Fri,  4 Mar 2022 16:48:04 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87BAA8547C;
 Fri,  4 Mar 2022 16:48:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 36/50] block/copy-before-write.h: global state API + assertions
Date: Fri,  4 Mar 2022 17:46:57 +0100
Message-Id: <20220304164711.474713-37-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

copy-before-write functions always run under BQL.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220303151616.325444-24-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/copy-before-write.h | 7 +++++++
 block/copy-before-write.c | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index 51847e711a..6e72bb25e9 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -29,6 +29,13 @@
 #include "block/block_int.h"
 #include "block/block-copy.h"
 
+/*
+ * Global state (GS) API. These functions run under the BQL.
+ *
+ * See include/block/block-global-state.h for more information about
+ * the GS API.
+ */
+
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c30a5ff8de..80b7684dba 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -223,6 +223,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
+    GLOBAL_STATE_CODE();
 
     opts = qdict_new();
     qdict_put_str(opts, "driver", "copy-before-write");
@@ -245,6 +246,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
 
 void bdrv_cbw_drop(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     bdrv_drop_filter(bs, &error_abort);
     bdrv_unref(bs);
 }
-- 
2.35.1


