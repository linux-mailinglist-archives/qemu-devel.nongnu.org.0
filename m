Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D69F6FE532
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 22:37:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwqYC-0005Ez-Fc; Wed, 10 May 2023 16:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwqY7-0005EC-GK
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwqY5-0003Ma-BC
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683750992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EcIuTYtOPwDAHB/h3j6Y0xZc3CIugRqzwgLuAKQ13KY=;
 b=VLqx2Si7LSmWtQyhXQRKzezIUo9AQ+9HghQjpRHnrtvW+zb+Ljucaf70A7toSV70W8knGp
 ztgkjEIbWVoQdnaJBdrE4wpTx3UPbXPlcB4cklLYWf7cAXTPTU+g+xJCEuyt8st+4mHcXV
 brVDMi501ipUwtCVO2BfYcrYoA8vaUs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-szlSdqGOOx-haVsgKAOWuw-1; Wed, 10 May 2023 16:36:26 -0400
X-MC-Unique: szlSdqGOOx-haVsgKAOWuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D0E2381D1EA;
 Wed, 10 May 2023 20:36:26 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF3261121314;
 Wed, 10 May 2023 20:36:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 f.ebner@proxmox.com, qemu-devel@nongnu.org
Subject: [PATCH 3/8] qcow2: Unlock the graph in qcow2_do_open() where necessary
Date: Wed, 10 May 2023 22:35:56 +0200
Message-Id: <20230510203601.418015-4-kwolf@redhat.com>
In-Reply-To: <20230510203601.418015-1-kwolf@redhat.com>
References: <20230510203601.418015-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

qcow2_do_open() calls a few no_co_wrappers that wrap functions taking
the graph lock internally as a writer. Therefore, it can't hold the
reader lock across these calls, it causes deadlocks. Drop the lock
temporarily around the calls.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index 73f36447f9..b00b4e7575 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1619,9 +1619,11 @@ qcow2_do_open(BlockDriverState *bs, QDict *options, int flags,
 
     if (open_data_file) {
         /* Open external data file */
+        bdrv_graph_co_rdunlock();
         s->data_file = bdrv_co_open_child(NULL, options, "data-file", bs,
                                           &child_of_bds, BDRV_CHILD_DATA,
                                           true, errp);
+        bdrv_graph_co_rdlock();
         if (*errp) {
             ret = -EINVAL;
             goto fail;
@@ -1629,10 +1631,12 @@ qcow2_do_open(BlockDriverState *bs, QDict *options, int flags,
 
         if (s->incompatible_features & QCOW2_INCOMPAT_DATA_FILE) {
             if (!s->data_file && s->image_data_file) {
+                bdrv_graph_co_rdunlock();
                 s->data_file = bdrv_co_open_child(s->image_data_file, options,
                                                   "data-file", bs,
                                                   &child_of_bds,
                                                   BDRV_CHILD_DATA, false, errp);
+                bdrv_graph_co_rdlock();
                 if (!s->data_file) {
                     ret = -EINVAL;
                     goto fail;
@@ -1857,7 +1861,9 @@ qcow2_do_open(BlockDriverState *bs, QDict *options, int flags,
  fail:
     g_free(s->image_data_file);
     if (open_data_file && has_data_file(bs)) {
+        bdrv_graph_co_rdunlock();
         bdrv_unref_child(bs, s->data_file);
+        bdrv_graph_co_rdlock();
         s->data_file = NULL;
     }
     g_free(s->unknown_header_fields);
-- 
2.40.1


