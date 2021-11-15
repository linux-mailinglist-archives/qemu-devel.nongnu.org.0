Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA174517B4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:41:28 +0100 (CET)
Received: from localhost ([::1]:39436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkfH-0000Ar-CD
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:41:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mmkdk-0007Io-Qw
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:39:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mmkdj-00034E-2J
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637015990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/A6PQvKS7Qjxo0EjasRHuFb0dkWFWTM912+tsj8k/+0=;
 b=TLt7qdUzfA8jflrN8o2N+mvPzguuybop6pobRLmrgqna+lsm1ABSDDXi0E3CBC3lZPDv35
 0jii+fad3fXCscv5aP89TNG1guEW1uQlkLi90FqXRIJiIIxo5zlzhNuAzfPQW894OaAqQW
 JlPwhI/t3OZlSKk75QpE7zM2ikGdVyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-xDHcbEpiPfmBACP06ivkPw-1; Mon, 15 Nov 2021 17:39:47 -0500
X-MC-Unique: xDHcbEpiPfmBACP06ivkPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C2D61006AA0;
 Mon, 15 Nov 2021 22:39:46 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4D82ADCD;
 Mon, 15 Nov 2021 22:39:45 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2] nbd/server: Silence clang sanitizer warning
Date: Mon, 15 Nov 2021 16:39:43 -0600
Message-Id: <20211115223943.626416-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

clang's sanitizer is picky: memset(NULL, x, 0) is technically
undefined behavior, even though no sane implementation of memset()
deferences the NULL.  Caught by the nbd-qemu-allocation iotest.

The alternative to checking before each memset is to instead force an
allocation of 1 element instead of g_new0(type, 0)'s behavior of
returning NULL for a 0-length array.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 3b1f244c59 (nbd: Allow export of multiple bitmaps for one device)
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 6d03e8a4b436..d9164ee6d0da 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2020 Red Hat, Inc.
+ *  Copyright (C) 2016-2021 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device Server Side
@@ -879,7 +879,9 @@ static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
     if (!*query) {
         if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
             meta->allocation_depth = meta->exp->allocation_depth;
-            memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
+            if (meta->exp->nr_export_bitmaps) {
+                memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
+            }
         }
         trace_nbd_negotiate_meta_query_parse("empty");
         return true;
@@ -894,7 +896,8 @@ static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
     if (nbd_strshift(&query, "dirty-bitmap:")) {
         trace_nbd_negotiate_meta_query_parse("dirty-bitmap:");
         if (!*query) {
-            if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
+            if (client->opt == NBD_OPT_LIST_META_CONTEXT &&
+                meta->exp->nr_export_bitmaps) {
                 memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
             }
             trace_nbd_negotiate_meta_query_parse("empty");
@@ -1024,7 +1027,9 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         /* enable all known contexts */
         meta->base_allocation = true;
         meta->allocation_depth = meta->exp->allocation_depth;
-        memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
+        if (meta->exp->nr_export_bitmaps) {
+            memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
+        }
     } else {
         for (i = 0; i < nb_queries; ++i) {
             ret = nbd_negotiate_meta_query(client, meta, errp);
-- 
2.33.1


