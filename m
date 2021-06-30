Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CAF3B86ED
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:16:20 +0200 (CEST)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycst-0001rA-Lr
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfo-0002wE-9f
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfX-000746-3a
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fu1fJvLMjQVman1pVaxRT/tGA4ZJ0E7xnvhdnOGg5nM=;
 b=OvxTeh92PQMQzaz63+67MWfKlnCHewum037iJEs2MasroUpJRZ5mLJvcn2uMFVL0iRsYTE
 nb/K5QeKNS4ngeUWRnKRzNMN8HEG0ivB4g9NPc8ffjwUfl4vKg8ZZlYMmIBYhZdXhFHfjB
 fzCbSTAywjH7I9z4qjEeonoZAGTZ6qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-YfJMixDfMO24UwQATGkm3A-1; Wed, 30 Jun 2021 12:02:27 -0400
X-MC-Unique: YfJMixDfMO24UwQATGkm3A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79BE6100C661;
 Wed, 30 Jun 2021 16:02:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AA62604CD;
 Wed, 30 Jun 2021 16:02:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/24] block: BDRVReopenState: drop replace_backing_bs field
Date: Wed, 30 Jun 2021 18:01:54 +0200
Message-Id: <20210630160206.276439-13-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

It's used only in bdrv_reopen_commit(). "backing" is covered by the
loop through all children except for case when we removed backing child
during reopen.

Make it more obvious and drop extra boolean field: qdict_del will not
fail if there is no such entry.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610120537.196183-8-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  1 -
 block.c               | 10 ++++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 8e707a83b7..d28022e761 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -208,7 +208,6 @@ typedef struct BDRVReopenState {
     int flags;
     BlockdevDetectZeroesOptions detect_zeroes;
     bool backing_missing;
-    bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
     BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
     QDict *options;
     QDict *explicit_options;
diff --git a/block.c b/block.c
index 0a73335380..ca11078cd2 100644
--- a/block.c
+++ b/block.c
@@ -4296,7 +4296,6 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         return -EINVAL;
     }
 
-    reopen_state->replace_backing_bs = true;
     reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
     return bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran, errp);
 }
@@ -4550,17 +4549,16 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     bs->open_flags         = reopen_state->flags;
     bs->detect_zeroes      = reopen_state->detect_zeroes;
 
-    if (reopen_state->replace_backing_bs) {
-        qdict_del(bs->explicit_options, "backing");
-        qdict_del(bs->options, "backing");
-    }
-
     /* Remove child references from bs->options and bs->explicit_options.
      * Child options were already removed in bdrv_reopen_queue_child() */
     QLIST_FOREACH(child, &bs->children, next) {
         qdict_del(bs->explicit_options, child->name);
         qdict_del(bs->options, child->name);
     }
+    /* backing is probably removed, so it's not handled by previous loop */
+    qdict_del(bs->explicit_options, "backing");
+    qdict_del(bs->options, "backing");
+
     bdrv_refresh_limits(bs, NULL, NULL);
 }
 
-- 
2.31.1


