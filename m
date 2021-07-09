Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481253C2417
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:16:18 +0200 (CEST)
Received: from localhost ([::1]:50146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qMb-0005Sd-18
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pzI-00055z-7f
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pzG-0003k6-HU
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QxRwftzqyfTQy1eYSzuxJVJfqV4RQxmj77YtVCNirRQ=;
 b=jWpCpSWGlnlDg45lkCcHv1qEem8Sh2ZjImIDpevNonXmjQkqnqexJfPYCJ1khty7u2pePo
 JkCioFJR0axjE+nEUs1kv72vIt48N6PQTkdZD8xBf63XQA8mzqCKQay8NO2stW8lvKLOC6
 UjCW8pbC19E3vLMe8xgJXiP9YA7VNwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-njW0bZlaO4e8RXXjVr1pIQ-1; Fri, 09 Jul 2021 08:52:07 -0400
X-MC-Unique: njW0bZlaO4e8RXXjVr1pIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9519C801107;
 Fri,  9 Jul 2021 12:52:06 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B550360843;
 Fri,  9 Jul 2021 12:52:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 23/28] qcow2: Fix dangling pointer after reopen for 'file'
Date: Fri,  9 Jul 2021 14:50:30 +0200
Message-Id: <20210709125035.191321-24-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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

Without an external data file, s->data_file is a second pointer with the
same value as bs->file. When changing bs->file to a different BdrvChild
and freeing the old BdrvChild, s->data_file must also be updated,
otherwise it points to freed memory and causes crashes.

This problem was caught by iotests case 245.

Fixes: df2b7086f169239ebad5d150efa29c9bb6d4f820
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210708114709.206487-2-kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index 0cac2eda36..9f1b6461c8 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1926,6 +1926,7 @@ static void qcow2_refresh_limits(BlockDriverState *bs, Error **errp)
 static int qcow2_reopen_prepare(BDRVReopenState *state,
                                 BlockReopenQueue *queue, Error **errp)
 {
+    BDRVQcow2State *s = state->bs->opaque;
     Qcow2ReopenState *r;
     int ret;
 
@@ -1956,6 +1957,16 @@ static int qcow2_reopen_prepare(BDRVReopenState *state,
         }
     }
 
+    /*
+     * Without an external data file, s->data_file points to the same BdrvChild
+     * as bs->file. It needs to be resynced after reopen because bs->file may
+     * be changed. We can't use it in the meantime.
+     */
+    if (!has_data_file(state->bs)) {
+        assert(s->data_file == state->bs->file);
+        s->data_file = NULL;
+    }
+
     return 0;
 
 fail:
@@ -1966,7 +1977,16 @@ fail:
 
 static void qcow2_reopen_commit(BDRVReopenState *state)
 {
+    BDRVQcow2State *s = state->bs->opaque;
+
     qcow2_update_options_commit(state->bs, state->opaque);
+    if (!s->data_file) {
+        /*
+         * If we don't have an external data file, s->data_file was cleared by
+         * qcow2_reopen_prepare() and needs to be updated.
+         */
+        s->data_file = state->bs->file;
+    }
     g_free(state->opaque);
 }
 
@@ -1990,6 +2010,15 @@ static void qcow2_reopen_commit_post(BDRVReopenState *state)
 
 static void qcow2_reopen_abort(BDRVReopenState *state)
 {
+    BDRVQcow2State *s = state->bs->opaque;
+
+    if (!s->data_file) {
+        /*
+         * If we don't have an external data file, s->data_file was cleared by
+         * qcow2_reopen_prepare() and needs to be restored.
+         */
+        s->data_file = state->bs->file;
+    }
     qcow2_update_options_abort(state->bs, state->opaque);
     g_free(state->opaque);
 }
-- 
2.31.1


