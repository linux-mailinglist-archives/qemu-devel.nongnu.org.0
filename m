Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CDC36F99C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:50:54 +0200 (CEST)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRfZ-00047S-As
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQmB-0005kW-G9
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm8-00037h-Mr
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/Hfpk9n5o/01CqY7WdhXjp2a2FZal1YOgL2uFIRms8=;
 b=bfMjwr9T/uA2P2DtfWHUQMdq9svqtRPds6g4agFyMIKbffn0Y29nKH4RtVWbmu44ro0n4O
 Pr1SDdLLcVD6OwxChVVlvG4Jn1SCv9dGYHhLy3hi9KU8A0oSIlcWXfkMCS/cdjRyle441q
 hc7v2g21uR3vYGldAxEjDJmHeO8xzIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-LlJx7rfTN8aldKlhEd29Ow-1; Fri, 30 Apr 2021 06:53:32 -0400
X-MC-Unique: LlJx7rfTN8aldKlhEd29Ow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD0AF8BAF4A;
 Fri, 30 Apr 2021 10:53:19 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA14017177;
 Fri, 30 Apr 2021 10:53:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 32/39] block: inline bdrv_check_perm_common()
Date: Fri, 30 Apr 2021 12:51:40 +0200
Message-Id: <20210430105147.125840-33-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

bdrv_check_perm_common() has only one caller, so no more sense in
"common".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-33-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/block.c b/block.c
index bf7c187435..38bd2ea32e 100644
--- a/block.c
+++ b/block.c
@@ -2373,33 +2373,13 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     return 0;
 }
 
-/*
- * If use_cumulative_perms is true, use cumulative_perms and
- * cumulative_shared_perms for first element of the list. Otherwise just refresh
- * all permissions.
- */
-static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
-                                  bool use_cumulative_perms,
-                                  uint64_t cumulative_perms,
-                                  uint64_t cumulative_shared_perms,
-                                  Transaction *tran, Error **errp)
+static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                                   Transaction *tran, Error **errp)
 {
     int ret;
+    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriverState *bs;
 
-    if (use_cumulative_perms) {
-        bs = list->data;
-
-        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
-                                   cumulative_shared_perms,
-                                   tran, errp);
-        if (ret < 0) {
-            return ret;
-        }
-
-        list = list->next;
-    }
-
     for ( ; list; list = list->next) {
         bs = list->data;
 
@@ -2421,12 +2401,6 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
-static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
-                                   Transaction *tran, Error **errp)
-{
-    return bdrv_check_perm_common(list, q, false, 0, 0, tran, errp);
-}
-
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
-- 
2.30.2


