Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA0A3B86E9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:14:28 +0200 (CEST)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycr5-0007Cz-R8
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfT-0002nQ-PF
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfR-00070v-Um
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfadbdrKuNm1bxZma0g4JjkhulrWWXUAUO0RTqrHdrA=;
 b=S04DsJ3985EXvpC1nzTMbxv4eaqry8EryfT49HOfFjFLHMMCOYYL6bk7c+c0eaB/Pk8ckb
 M9SF2UyxZFkDrYBZdTz1svoF8LF7WbgptcWb91AvdBxc8GLNRIgF+5iQMacb/bWJ/S2xJT
 EDrTxotabcVE9dkmMwEaAo07XePi0XA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-iKeXfzxgORmHFBFwfnIS_Q-1; Wed, 30 Jun 2021 12:02:23 -0400
X-MC-Unique: iKeXfzxgORmHFBFwfnIS_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67D29100C660;
 Wed, 30 Jun 2021 16:02:21 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72F11604CD;
 Wed, 30 Jun 2021 16:02:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/24] block: bdrv_reopen_parse_backing(): don't check aio
 context
Date: Wed, 30 Jun 2021 18:01:50 +0200
Message-Id: <20210630160206.276439-9-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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

We don't need this check: bdrv_set_backing_noperm() will do it anyway
(actually in bdrv_attach_child_common()).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610120537.196183-4-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/block.c b/block.c
index 14711ce7ab..69dc9d188d 100644
--- a/block.c
+++ b/block.c
@@ -4215,29 +4215,6 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
     return ret;
 }
 
-static bool bdrv_reopen_can_attach(BlockDriverState *parent,
-                                   BdrvChild *child,
-                                   BlockDriverState *new_child,
-                                   Error **errp)
-{
-    AioContext *parent_ctx = bdrv_get_aio_context(parent);
-    AioContext *child_ctx = bdrv_get_aio_context(new_child);
-    GSList *ignore;
-    bool ret;
-
-    ignore = g_slist_prepend(NULL, child);
-    ret = bdrv_can_set_aio_context(new_child, parent_ctx, &ignore, NULL);
-    g_slist_free(ignore);
-    if (ret) {
-        return ret;
-    }
-
-    ignore = g_slist_prepend(NULL, child);
-    ret = bdrv_can_set_aio_context(parent, child_ctx, &ignore, errp);
-    g_slist_free(ignore);
-    return ret;
-}
-
 /*
  * Take a BDRVReopenState and check if the value of 'backing' in the
  * reopen_state->options QDict is valid or not.
@@ -4289,16 +4266,6 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         g_assert_not_reached();
     }
 
-    /*
-     * Check AioContext compatibility so that the bdrv_set_backing_hd() call in
-     * bdrv_reopen_commit() won't fail.
-     */
-    if (new_backing_bs) {
-        if (!bdrv_reopen_can_attach(bs, bs->backing, new_backing_bs, errp)) {
-            return -EINVAL;
-        }
-    }
-
     /*
      * Ensure that @bs can really handle backing files, because we are
      * about to give it one (or swap the existing one)
-- 
2.31.1


