Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A363BCE87
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 13:26:14 +0200 (CEST)
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0jDR-00068x-V6
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 07:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0jBW-0003Jk-4c
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 07:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0jBM-0000fs-NR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 07:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625570644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmg7NdZ8n9UDUL99RDPfnI1r25/UyjiLO+BorYSDbps=;
 b=VKq9UZuGs2aFS4LGyBFzyRxvL95QJC1qqr1vf90qHdDOSW3Ty6+5nFKbpLXAr1IK/PTA4R
 z8agOGdnT3oMXdB1BPMkb9Y8nI3fBCG03si4glYsT+Qb6GbR+OKn46RFIIZj4YJBkysg3L
 ZbtI20AJoPVflcWPuKuE5mL5jWO2Dlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-OibjECFeNvyem_PdF4ntJQ-1; Tue, 06 Jul 2021 07:24:03 -0400
X-MC-Unique: OibjECFeNvyem_PdF4ntJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41C59C740A;
 Tue,  6 Jul 2021 11:23:46 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01B5660E3A;
 Tue,  6 Jul 2021 11:23:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 1/6] qcow2: Fix dangling pointer after reopen for 'file'
Date: Tue,  6 Jul 2021 13:23:35 +0200
Message-Id: <20210706112340.223334-2-kwolf@redhat.com>
In-Reply-To: <20210706112340.223334-1-kwolf@redhat.com>
References: <20210706112340.223334-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without an external data file, s->data_file is a second pointer with the
same value as bs->file. When changing bs->file to a different BdrvChild
and freeing the old BdrvChild, s->data_file must also be updated,
otherwise it points to freed memory and causes crashes.

This problem was caught by iotests case 245.

Fixes: df2b7086f169239ebad5d150efa29c9bb6d4f820
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index ee4530cdbd..cb459ef6a6 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -962,6 +962,7 @@ static bool read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
 }
 
 typedef struct Qcow2ReopenState {
+    bool had_data_file;
     Qcow2Cache *l2_table_cache;
     Qcow2Cache *refcount_block_cache;
     int l2_slice_size; /* Number of entries in a slice of the L2 table */
@@ -1932,6 +1933,8 @@ static int qcow2_reopen_prepare(BDRVReopenState *state,
     r = g_new0(Qcow2ReopenState, 1);
     state->opaque = r;
 
+    r->had_data_file = has_data_file(state->bs);
+
     ret = qcow2_update_options_prepare(state->bs, r, state->options,
                                        state->flags, errp);
     if (ret < 0) {
@@ -1966,7 +1969,18 @@ fail:
 
 static void qcow2_reopen_commit(BDRVReopenState *state)
 {
+    BDRVQcow2State *s = state->bs->opaque;
+    Qcow2ReopenState *r = state->opaque;
+
     qcow2_update_options_commit(state->bs, state->opaque);
+    if (!r->had_data_file && s->data_file != state->bs->file) {
+        /*
+         * If s->data_file is just a second pointer to bs->file (which is the
+         * case without an external data file), it may need to be updated.
+         */
+        s->data_file = state->bs->file;
+        assert(!has_data_file(state->bs));
+    }
     g_free(state->opaque);
 }
 
-- 
2.31.1


